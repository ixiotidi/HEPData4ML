import util.reconstruction.post_processing.jets   as jets
import util.particle_selection.particle_selection as parsel
import util.particle_selection.selection_algos    as algos
import util.pileup.pileup                         as pu

config = {
    'generation': {
        'process'      : 'HardQCD',
        'hadronization': True,
        'mpi'          : False,
        'isr'          : True,
        'fsr'          : True,
        'rng'          : 1,
        'verbose'      : False,
        'hepmc_format' : 'root'},
    'pileup': {
        'handler': pu.PileupMixer('/vols/drive1/ixiotidi/minbias/events_*.hepmc.root',
                                  rng_seed = 0) },
    'simulation': {
        'type'            : 'delphes',
        'delphes_card'    : 'util/delphes/cards/delphes_card_ATLAS_custom.tcl',
        'delphes_output'  : ['EFlowPhoton', 'EFlowNeutralHadron', 'EFlowTrack', 'Electron', 'Muon', 'Photon', 'GenMissingET', 'MissingET', 'GenVertex', 'Vertex', 'Tower', 'Jet', 'GenJet'],
        'delphes_rng_seed': 0 }
}
