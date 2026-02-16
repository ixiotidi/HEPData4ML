import util.reconstruction.post_processing.jets   as jets
import util.particle_selection.particle_selection as parsel
import util.particle_selection.selection_algos    as algos
import util.pileup.pileup                         as pu

config = {
    'generation': {
        'process'      : 'SoftQCD',
        'hadronization': True,
        'mpi'          : True,
        'isr'          : True,
        'fsr'          : True,
        'rng'          : 1,
        'verbose'      : True,
        'hepmc_format' : 'root'},
    'pileup': {
        'handler': None},
    'simulation': {
        'type'            : 'delphes',
        'delphes_card'    : 'util/delphes/cards/delphes_card_ATLAS_custom.tcl',
        'delphes_output'  : ['EFlowPhoton', 'EFlowNeutralHadron', 'EFlowTrack', 'Electron', 'Muon', 'Photon', 'GenMissingET', 'MissingET', 'GenVertex', 'Vertex', 'Tower', 'Jet', 'GenJet', 'Tower'],
        'delphes_rng_seed': 0
        }    
    }
