import util.reconstruction.post_processing.jets   as jets
import util.particle_selection.particle_selection as parsel
import util.particle_selection.selection_algos    as algos
import util.pileup.pileup                         as pu

config = {
    #Generation configuration (Pythia-8)
    'generation': {
        'process'      : 'ggFHH4b',
        'hadronization': True,
        'mpi'          : False,
        'isr'          : True,
        'fsr'          : True,
        'rng'          : 1,
        'verbose'      : False,
        'hepmc_format' : 'root' },
    #Pile-Up Adapter (adding min-bias 200)
    'pileup': {
        'handler': pu.PileupMixer('/vols/drive1/ixiotidi/minbias/events_*.hepmc.root',
                                  rng_seed = 0) },
    #Running the detector simulation
    'simulation': {
        'type'            : 'delphes',
        'delphes_card'    : 'util/delphes/cards/delphes_card_ATLAS_custom.tcl',
        'delphes_output'  : ['EFlowPhoton', 'EFlowNeutralHadron', 'EFlowTrack', 'Electron', 'Muon', 'Photon', 'GenMissingET', 'MissingET', 'GenVertex', 'Vertex', 'Tower'],
        'delphes_rng_seed': 0 },
    #Run reconstruction
    'reconstruction': {
        'n_stable'          : 200,
        'n_delphes'         : [200],
        'fastjet_dir'       : None,
        'n_truth'           : 200,
        'event_filter'      : None,
        'event_filter_flag' : None,
        'particle_selection': {
            'TruthHiggsAndChildren': parsel.MultiSelection([
                parsel.FirstSelector(22, 25), 
                parsel.AlgoSelection(algos.SelectFinalStateDaughters(parsel.FirstSelector(22, 25)), n=200),
                parsel.FirstSelector(23, 5 ),
                parsel.FirstSelector(23, -5), ]),
        },
        'signal_flag'    : 1,
        'split_seed'     : 1,
        'post_processing': [
            jets.JetFinder(['EFlowPhoton', 'EFlowNeutralHadron', 'EFlowTrack'], jet_algorithm='anti_kt', radius=1.0, jet_name='AntiKt10RecoJets').PtFilter(200.).EtaFilter(4.0),
            jets.JetFinder(['EFlowPhoton', 'EFlowNeutralHadron', 'EFlowTrack'], jet_algorithm='anti_kt', radius=0.4, jet_name='AntiKt04RecoJets').PtFilter(20.) .EtaFilter(4.0).GhostAssociation('TruthHiggsAndChildren', 0, mode='filter'), ],
    }
}
