#!/bin/bash

for i in {0..100};
do
    offset=$(( i * 10000 ))
    rng_seed=$(( i+1 ))
    python run.py -n 10000 -O /vols/drive1/ixiotidi/minbias -p_gen "$offset" -p 1,-1 -pb 1 -sp 0 -rng "$rng_seed" -index_offset 0 -config jetnet_config/minbias_config.py --steps "generation"
done
