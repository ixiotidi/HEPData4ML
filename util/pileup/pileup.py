import ROOT as rt
import numpy as np
import h5py as h5

import math
import glob,sys,os,pathlib,itertools
import subprocess as sub
from util.qol_utils.progress_bar import printProgressBarColor

import glob,sys,os,pathlib

from util.pileup.setup import PileupSetup

from util.qol_utils.pdg import DatabasePDG
from util.metadata.meta import MetaDataHandler
from util.config.config import Configurator
from util.hepmc.setup import HepMCSetup, prepend_to_pythonpath
from typing import Union, Optional, TYPE_CHECKING

if(TYPE_CHECKING):
    setup = HepMCSetup(verbose=False)
    setup.PrepHepMC() # will download/install if necessary
    python_dir = setup.GetPythonDirectory()
    if(python_dir not in sys.path):
        sys.path = [setup.GetPythonDirectory()] + sys.path # prepend, to make sure we pick this one up first
    from pyHepMC3 import HepMC3 as hm

class PileupMixer:
    """
    This class performs on-the-fly mixing, to mix in events from some pileup HepMC3 file(s)
    into full "pileup events". These are placed in a new file, to be used as a "sidecar"
    with the HepMC3 files containing the main process.

    """

    def __init__(self, pileup_files:Optional[Union[str,list]]=None,rng_seed:int=1,mu_input:str=None, add_stable_only=True):

        # Immediately handle setup.
        # Out of an excess of caution,
        # make sure that HepMC3 is set up.

        self.setup_hepmc3 = HepMCSetup() # automatically runs

        self.setup = PileupSetup()
        self.setup.FullPreparation()

        self.mixer = rt.Pileup.PileupMixer()

        self.verbosity = 1
        self.print_prefix = 'PileupMixer: '

        self.require_pileup_input = True
        self.files = None
        self.SetPileupFiles(pileup_files)

        self.SetAddStableOnly(add_stable_only)

        self.selected_indices = None # transient storage for indices selected for a particular event
        self.allow_reuse = True
        self.pileup_indices = {} # accumulate the pileup event indices per event -> for output. Dictionary keys are filename
        self.number_non_pileup_particles = {} # accumulate number of non-pileup particles per event -- can be used later for indexing purposes
        self.n_particles_event = None # transient storage

        self.SetRNGSeed(rng_seed)
        self.beam_spot_sigma = None # will store the beam spot size
        self.SetBeamSpotSigma() # sets some sensible defaults
        self.do_phi_rotations = True
        self.phi_rotations_transient = []
        self.phi_rotations = {} # accumulate the phi rotations per event -> for output. Dictionary keys are filename

        # Set up the distribution for # of interactions per crossing
        self.available_mu_values = None
        self.mu_probabilities = None
        self.mu_input = mu_input
        self._init_mu_distribution()
        self.mu = None # transient storage for the current value of mu
        self.mu_values = {} # will store a list of all used mu values

        self.pileup_events = None # transient storage for pileup events

        self.event_buffer_size = 10 # how many combined events to store in memory, before flushing to output file
        #TODO: Need to fix buffer behavior -- the HepMC writers overwrite the output_file each time they're initialized, as opposed to appending

        self.indir = None
        self.outdir = None

        # for particle charge lookup
        self.pdg_database = DatabasePDG()

        self.metadata_handler = None
        self.configurator = None

        self.condor_flag = False
        self.condor_job_number = None
        self.condor_njobs = None
        self.condor_warning = False

    def SetAddStableOnly(self,flag:bool):
        self.filter_stable = flag
        self.mixer.SetStableOnly(self.filter_stable)

    def SetHTCondorInfo(self,flag:bool, job_number:int, njobs:int):
        # TODO: Deprecated/unused
        self.condor_flag = flag
        self.condor_job_number = job_number
        self.condor_njobs = njobs # the total number of jobs in this batch; can be useful for divvying up pileup events

    def SetMetadataHandler(self,handler:'MetaDataHandler'):
        self.metadata_handler = handler

    def SetConfigurator(self,configurator:'Configurator'):
        self.configurator = configurator

    def GetRNGSeed(self):
        return self.rng_seed

    def SetRNGSeed(self,rng_seed:int):
        if(rng_seed < 0):
            rng_seed = 0
        self.rng_seed = rng_seed
        self.rng = np.random.default_rng(self.rng_seed)

    def SetVerbosity(self,val:int):
        self.verbosity = val

    def SetInputDirectory(self,val:str):
        self.indir = val

    def SetOutputDirectory(self,val:str):
        self.outdir = val

    def SetAllowReuse(self, val:bool):
        self.allow_reuse = val

    def SetUsePhiRotations(self, val:bool):
        self.do_phi_rotations = val

    def SetPileupFiles(self,files:Union[str,list]=None):

        self.mixer.ClearPileupFiles()

        if(files is None):
            return
        if(isinstance(files,str)):
            self.files = glob.glob(files)
            if(len(self.files) == 0): # maybe this was not an absolute path, but a relative one (w.r.t. cwd)
                self.files = glob.glob('{}/{}'.format(os.getcwd(),files))
        else:
            self.files = files
            for i,file in enumerate(self.files):
                if(not pathlib.Path(file).exists()):
                    self.files[i] = '{}/{}'.format(os.getcwd(),file)
        self.files = sorted([str(pathlib.Path(x).absolute()) for x in self.files if pathlib.Path(x).exists()])

        for file in self.files:
            self.mixer.AddPileupFile(file)

        return

    def SetBeamSpotSigma(self,dt:float=0.16,dx:float=0.01,dy:float=0.01,dz:float=35.):
        """
        Sets the size of the beamspot (standard deviation) in (t,x,y,z), in nanoseconds or millimeters (as appropriate).
        The default spatial values are based on ATLAS Run 2: https://twiki.cern.ch/twiki/bin/view/AtlasPublic/BeamSpotPublicResults#Run_2_25ns_pp_Collisions_s_13_Te .
        The default time value is based on the Delphes ATLAS detector card (with pileup).
        """
        self.beam_spot_sigma = (dt,dx,dy,dz)
        self.mixer.SetBeamSpotSigma(*self.beam_spot_sigma)

    def _init_mu_from_file(self,file_name, hist_name=None):
        if(hist_name is None):
            hist_name = 'PileupOverlay_mu'
        try:
            f = rt.TFile(file_name,"READ")
            self.mu_distribution = f.Get(hist_name).Clone()
            self.mu_distribution.SetDirectory(0)
            f.Close()
        except:
            self._print("Error: failed to read histogram {} from file {}.".format(hist_name,file_name))
            self._print("Falling back on default mu distribution.")
            self.mu_input = None
            self._init_mu_distribution()

    def _init_mu_distribution(self):

        # Multiple kinds of information to parse.

        # None: use default distribution
        if(self.mu_input is None):
            # very approximate for Run 2,
            # see https://atlas.web.cern.ch/Atlas/GROUPS/DATAPREPARATION/PublicPlots/2018/DataSummary/figs/mu_2015_2018.png
            self.mu_input = [33.7,11.5]
            self._init_mu_distribution()
            return

        # String: interpret as a filepath, optionally with histogram name after a colon
        elif(isinstance(self.mu_input,str)):
            file_name = self.mu_input.split(':')[0]
            hist_name = None
            if(':' in self.mu_input):
                hist_name = self.mu_input.split(':')[-1]
            self._init_mu_from_file(file_name,hist_name)
            self.mixer.InitMuDistribution(self.mu_distribution)
            return

        elif(isinstance(self.mu_input,list) or isinstance(self.mu_input,tuple) or isinstance(self.mu_input,np.ndarray)):
            if(len(self.mu_input) == 2):
                self.mixer.InitMuDistribution(*self.mu_input) # Gaussian
                return

        self._print("mu_input not understood.")
        self._print("Falling back on default mu distribution.")
        self.mu_input = None
        self._init_mu_distribution()
        return

    def __call__(self,input_file:str,output_file:Optional[str]=None):
        from pyHepMC3 import HepMC3 as hm

        if('.hepmc.root' in input_file):
            input_file_extension = 'hepmc.root'
        else:
            input_file_extension = input_file.split('.')[-1]

        if(self.indir is not None):
            input_file = '{}/{}'.format(self.indir,input_file)

        if(output_file is None):
            output_file = input_file.replace('.{}'.format(input_file_extension),'.pileup.{}'.format(input_file_extension))
        elif(self.outdir is not None):
            output_file = '{}/{}'.format(self.outdir,output_file)

        self.mixer(input_file,output_file) # produces output_file, based on # of events in input_file
        return output_file

    def _record_pileup_info(self,output_file):

        #TODO: Rework this, need to do stuff on C++ side

        key = output_file.split('/')[-1] # remove any leading directory, just use filename (this is generally our convention)
        if(key not in self.pileup_indices.keys()):
            self.pileup_indices[key] = []
            self.phi_rotations[key] = []
            self.mu_values[key] = []
            self.number_non_pileup_particles[key] = []
        self.pileup_indices[key].append(self.selected_indices)
        self.mu_values[key].append(self.mu)
        self.number_non_pileup_particles[key].append(self.n_particles_event)

        # only record phi rotations if they were used -- no point in recording lots of zeros
        if(self.do_phi_rotations):
            self.phi_rotations[key].append(self.phi_rotations_transient)
        return

    def _migrate_pileup_info(self,old_key,new_key):
        """
        A bit of a messy function, a consequence of some file naming & I/O options.
        Simply renames a key in the info dictionaries.
        """
        for d in [self.mu_values,self.pileup_indices,self.phi_rotations,self.number_non_pileup_particles]:
            if(old_key in d.keys()):
                d[new_key] = d[old_key]
                del d[old_key]

    def Process(self,inputs,outputs=None):
       if(outputs is None):
        outputs = len(inputs) * [None]

        output_files = []
        for (input,output) in zip(inputs,outputs):
            output_file = self.__call__(input,output)
            output_files.append(output_file)

        #self.AddPileupInfoToHepMC3ROOT()

        self._writeMetadata()

        return

    def _flush_to_file(self,events:List['hm.GenEvent'],output_file:str,buffername:str=None):
        from pyHepMC3                              import HepMC3 as hm
        #from pyHepMC3.rootIO.pyHepMC3rootIO.HepMC3 import WriterRootTree
        import pyHepMC3

        if(output_file.split('.')[-1].lower() == 'root'):
            writer = pyHepMC3.rootIO.pyHepMC3rootIO.HepMC3.WriterRootTree(output_file, True) # uses our custom HepMC3 functionality for "append mode"
        else:
            assert False # for now, we dont't support ASCII output since there isn't (yet) append functionality

        for evt in events:
            writer.write_event(evt)

        writer.close()
        events.clear()
        return output_files

    def _gaussian(self,x,mu,sig,A=None,require_positive=True):
        if(require_positive and x < 0.):
            return 0.
        if(A is None): A = 1. / (np.sqrt(2.0 * np.pi))
        return A * np.exp(-np.square((x - mu) / sig) / 2)

    def _poisson(self, x, mu, A = None, require_nonnegative=True):
        if require_nonnegative and x < 0:
            return 0.0
        if mu < 0:
            return 0.0
        if A is None:
            A = 1.0

        x_int = int(np.floor(x))

        if mu == 0.0:
            return A * (1.0 if k_int == 0 else 0.0)

        log_p = x_int * math.log(mu) - mu - math.lgamma(x_int + 1.0)
        return A * math.exp(log_p)

    def _sumpt2(self,evt:'hm.GenEvent'):
        """
        Compute the sum of pt2 of charged particles in the event.
        Used for scaling the x/y displacement of the primary vertex,
        see https://github.com/delphes/delphes/blob/d256775e652525b0c35929e72a8bf20252328696/modules/PileUpMerger.cc#L181.
        """

        sumpt2 = 0.
        for i,particle in enumerate(evt.particles()):
            if particle.status() > 1:
                continue
            charge = self.pdg_database.GetCharge(particle.pid()) # charge is in units of |e|/3
            if(np.abs(charge) > 1.0e-9): # abs might not be needed based on the above
                sumpt2 += np.square(particle.momentum().px()) + np.square(particle.momentum().py())
        return sumpt2

    def _combine_event_with_pileup(self,
        main_event: 'hm.GenEvent',
        pileup_events: Union['hm.GenEvent', List['hm.GenEvent']],
        pileup_displacements: Optional[Union[Tuple[float, float, float, float],
                                        List[Tuple[float, float, float, float]]]] = None,
        auto_displace: bool = True,
        beam_spot_sigma: Optional[Tuple[float,float,float,float]] = None
    ) -> 'hm.GenEvent':
        """
        Combine a main event with pileup events, applying vertex displacements.

        Parameters:
        -----------
        main_event : hm.GenEvent
            The primary hard-scatter event
        pileup_events : hm.GenEvent or List[hm.GenEvent]
            Single pileup event or list of pileup events to overlay
        pileup_displacements : tuple or list of tuples, optional
            (t, x, y, z) displacements for each pileup event in mm/ns units
            If None and auto_displace=True, random displacements are generated
        auto_displace : bool
            If True, automatically generate random displacements when none provided
        beam_spot_sigma : tuple, optional
            Standard deviation for random displacement generation (mm/ns), in (t,x,y,z).
            Defaults to self.beam_spot_sigma (preferred use).

        Returns:
        --------
        hm.GenEvent
            Combined event with displaced pileup vertices
        """

        from pyHepMC3 import HepMC3 as hm

        # Ensure pileup_events is a list
        if isinstance(pileup_events, hm.GenEvent):
            pileup_events = [pileup_events]

        # Generate or validate displacements
        if pileup_displacements is None:
            pileup_displacements = np.zeros((len(pileup_events),4))
            if auto_displace:
                if(beam_spot_sigma is None):
                    beam_spot_sigma = self.beam_spot_sigma
                beam_spot_sigma = list(beam_spot_sigma)
                beam_spot_sigma[0] *= 1.0e6 / rt.TMath.C() # convert from ns to mm/c
                pileup_displacements = np.random.normal(0,beam_spot_sigma,(len(pileup_events),4))

        if len(pileup_displacements) != len(pileup_events):
            raise ValueError("Number of displacements ({}) must match number of pileup events ({})".format(len(pileup_displacements),len(pileup_events)))

        # We displace the main event as well.
        # NOTE: Based on the approach taken in Delphes (https://github.com/delphes/delphes/blob/d256775e652525b0c35929e72a8bf20252328696/modules/PileUpMerger.cc#L181),
        # it looks like we should scale the x/y displacement by the sum of pT^2 of the event.
        # Note that there, the vertex position is basically some sort of pt2-weighted average of attached particles' "positions",
        # though it's not a perfect average since all particles contribute to the numerator (regardless of charge) but only
        # charged particles contribute to the denominator. I don't know how well-motivated this really is. - Jan
        combined_event = main_event

        main_event_displacement = np.random.normal(0,beam_spot_sigma,4)
        sumpt2 = self._sumpt2(main_event)
        if(sumpt2 > 0.):
            main_event_displacement[1:3] /= sumpt2 # adjust the x- and y-displacements, to make them smaller based on sum of pt2 of charged particles. A little unclear on units/scale here... #TODO: Check this? Based on some Delphes code
        combined_event.shift_position_by(hm.FourVector(*np.roll(main_event_displacement,-1))) # using np.roll to get from (t,x,y,z) to (x,y,z,t)
        # self._displace_event(combined_event,*main_event_displacement)

        # Add each pileup event with displacement
        self.phi_rotations_transient.clear()
        for pileup_event, (dt, dx, dy, dz) in zip(pileup_events, pileup_displacements):
            self._add_displaced_event(combined_event, pileup_event, dt, dx, dy, dz)

        return combined_event

    def _add_displaced_event(self,
                            target_event: 'hm.GenEvent',
                            pileup_event: 'hm.GenEvent',
                            dt: float, dx: float, dy: float, dz: float):
        """Add a pileup event to the target event with vertex displacement."""
        from pyHepMC3 import HepMC3 as hm

        # TODO: Consider using hm.GenEvent.shift_position_by() here? Maybe not possible if doing a phi rotation.

        # Add a random rotation in phi to the input pileup event.
        # (rotate, then translate)
        phi_rotation_angle = self.rng.uniform(0.,2 * np.pi)
        if(self.do_phi_rotations):
            self.phi_rotations_transient.append(phi_rotation_angle)

        # Create mapping from old vertex objects to new vertex objects using list index
        vertex_map = {}
        vertices_list = list(pileup_event.vertices())

        # Copy vertices with displacement
        for i, vertex in enumerate(vertices_list):
            # Apply displacement to vertex position

            old_position = np.array([getattr(vertex.position(),method)() for method in ['t','x','y','z']])
            if(self.do_phi_rotations):
                new_position = RotateVector(old_position,phi_rotation_angle,0.,0.)
            else:
                new_position = old_position
            new_position += np.array([dt,dx,dy,dz])
            new_position = hm.FourVector(*np.roll(new_position,-1)) # using np.roll to get from (t,x,y,z) to (x,y,z,t) for the constructor

            new_vertex = hm.GenVertex(new_position)
            new_vertex.set_status(vertex.status())
            # target_event.add_vertex(new_vertex)
            vertex_map[i] = new_vertex

        # Copy particles and establish relationships
        for particle in pileup_event.particles():

            if(self.filter_stable):
                if(particle.status() != 1):
                    continue

            old_momentum = np.array([getattr(particle.momentum(),method)() for method in ['e','px','py','pz']])
            if(self.do_phi_rotations):
                new_momentum = hm.FourVector(*np.roll(RotateVector(old_momentum,phi_rotation_angle,0.,0.),-1))
            else:
                new_momentum = hm.FourVector(*np.roll(old_momentum,-1)) # using np.roll to get from (e,px,py,pz) to (px,py,pz,e) for the constructor

            new_particle = hm.GenParticle(
                new_momentum,
                particle.pid(),
                particle.status()
            )
            new_particle.set_generated_mass(particle.generated_mass())

            # Set production vertex if it exists
            if particle.production_vertex():
                try:
                    vertex_idx = vertices_list.index(particle.production_vertex())
                    prod_vertex = vertex_map[vertex_idx]
                    prod_vertex.add_particle_out(new_particle)
                except ValueError:
                    pass # expected to be triggered, by beam particles

            # Set end vertex if it exists
            if particle.end_vertex():
                try:
                    vertex_idx = vertices_list.index(particle.end_vertex())
                    end_vertex = vertex_map[vertex_idx]
                    end_vertex.add_particle_in(new_particle)
                except ValueError:
                    print("Warning: Could not find end vertex for particle {}".format(particle.pid))

        for i,vtx in vertex_map.items():
            target_event.add_vertex(vtx)


    def _writeMetadata(self):
        """
        Writes metadata to the metadata handler.
        """
        pileup_metadata = {}
        if(self.metadata_handler is None):
            self._print('Unable to write metadata; no handler was provided.')
            return

        # Here, the metadata from the pileup files themselves will be fetched.
        if(self.files is not None):
            for pileup_file in self.files:
                pileup_file_extension = pileup_file.split('.')[-1]
                if(pileup_file_extension.lower() != 'root'):
                    self._print('Warning: Cannot read in metadata from pileup file {} .'.format(pileup_file))
                    continue
                key = pileup_file.split('/')[-1]
                pileup_metadata[key] = self.metadata_handler.ReadMetaDataFromROOTFile(pileup_file)
            self.metadata_handler.AddElement('Metadata.Pileup.InputMetadata',pileup_metadata)

        # Also add info on the mu distribution that was used
        self.mu_distribution = self.mixer.GetMuDistribution()
        mu_bins = np.array([self.mu_distribution.GetBinLowEdge(x+1) for x in range(self.mu_distribution.GetNbinsX())]) # left edges)
        mu_weights = np.array([self.mu_distribution.GetBinContent(x+1) for x in range(self.mu_distribution.GetNbinsX())])
        self.metadata_handler.AddElement('Metadata.Pileup.MuDistribution.BinEdgesLeft',mu_bins)
        self.metadata_handler.AddElement('Metadata.Pileup.MuDistribution.BinContents',mu_weights)
        return

    def GetMuValues(self):
        return self.mu_values

    def GetPileupInfo(self):
        data = {}
        data['Pileup.Mu'] = self.mu_values
        data['Pileup.Index'] = self.pileup_indices # index w.r.t. input pileup collection
        if(self.do_phi_rotations):
            data['Pileup.PhiRotation'] = self.phi_rotations
        return data

    def AddPileupInfoToHepMC3ROOT(self):
        """
        If producing output HepMC3/ROOT files, we actually add the
        pileup information (mu, indices etc.) to the HepMC3/ROOT file itself,
        in a separate tree. Note that we currently add this to the HDF5 files
        in an independent manner, but this may be helpful for debugging purposes
        and in the future could be the way to propagate the information to the
        final n-tuple.
        """

        # NOTE: With our current structure of GetPileupInfo() output, it would be
        # most natural to iterate over branches, and iterate over files in a nested loop.
        # However, for I/O reasons it's nicer to iterate over the files. Given how the
        # output is structured, it is safe to do this as we can assume each nested dict has
        # the same keys -- but this is generally kind of clunky code! -Jan
        data = self.GetPileupInfo()
        files = data[list(data.keys())[0]].keys() # NOTE: These are filenames *without* directories (as usual in this cocde).

        for i,file in enumerate(files):

            filename_full = '{}/{}'.format(self.outdir,file)

            f = rt.TFile(filename_full,'UPDATE')
            t = rt.TTree('PileupInfo','Pileup information from {}'.format(self.print_prefix.split(':')[0]))

            buffer_dict = {}

            for branch in data.keys():
                value = data[branch][file]

                is_nested_list = False
                if(isinstance(value[0],list)):
                    is_nested_list = True
                elif(isinstance(value[0],np.ndarray)):
                    is_nested_list = True

                if(is_nested_list):
                    #NOTE: Assuming dim=2

                    if(isinstance(value[0][0],int)): # NOTE: Would break if length==0. Would this ever happen?
                        buffer_dict[branch] = rt.std.vector('int')()
                    else:
                        buffer_dict[branch] = rt.std.vector('double')()
                    t.Branch(branch,buffer_dict[branch])

                else:
                    # simple 1D array
                    if(isinstance(value[0],int)):
                        buffer_dict[branch] = np.zeros(1,dtype=int)
                        t.Branch(branch,buffer_dict[branch],'{}/I'.format(branch))

                    else:
                        buffer_dict[branch] = np.zeros(1,dtype=float)
                        t.Branch(branch,buffer_dict[branch],'{}/D'.format(branch))

            # branch buffers are created, time to fill
            nentries = len(data[list(data.keys())[0]][file])
            for j in range(nentries):
                for branch in buffer_dict.keys():

                    if(isinstance(buffer_dict[branch], np.ndarray)):
                        buffer_dict[branch][0] = data[branch][file][j]
                    else:
                        for k,entry in enumerate(data[branch][file][j]):
                            buffer_dict[branch].push_back(entry)

                t.Fill()
            t.Write()
            f.Close()
        return

    def AddPileupInfoToH5(self,h5_file,file_key, cwd=None,copts=9):
        if(cwd is not None): h5_file = '{}/{}'.format(cwd,h5_file)

        f = h5.File(h5_file,'r+')
        keys = list(f.keys())
        # nevents = f[keys[0]].shape[0]
        data = self.GetPileupInfo()

        for key,value_dict in data.items():
            # for lists of (variable-length) arrays, need to embed these in some fixed length array

            value = value_dict[file_key]

            is_nested_list = False
            if(isinstance(value[0],list)):
                is_nested_list = True
            elif(isinstance(value[0],np.ndarray)):
                is_nested_list = True

            if(is_nested_list):
                # create an array
                max_length = np.max([len(x) for x in value])
                value_array = np.array([np.pad(row, (0, max_length-len(row))) for row in value])
                f.create_dataset(key,data=value_array,compression='gzip',compression_opts=copts)
            else:
                f.create_dataset(key,data=value,compression='gzip',compression_opts=copts)

        # With pileup information added, we can actually determine which entries in StableTruthParticles
        # came from pileup, so we can now do some post-processing to add that in
        particle_index_keys = [x for x in f.keys() if 'HepMC3Index' in x]

        for key in particle_index_keys:
            key_prefix = '.'.join(key.split('.')[:-1])
            pileup_flag_key = '{}.IsPileup'.format(key_prefix)
            is_pileup = np.array(f[key][:] > np.array(self.number_non_pileup_particles[file_key])[:,np.newaxis],dtype=bool) # indices use 1-indexing
            f.create_dataset(pileup_flag_key,data=is_pileup,dtype=bool,compression='gzip',compression_opts=copts)

        f.close()

    def _print(self,val):
        print('{}: {}'.format(self.print_prefix,val))
        return
