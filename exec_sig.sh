#!/bin/bash

start=$1
end=$2

for ((i=start; i<=end; i++)); 
do
    offset=$(( i*10 ))
    rng_seed=$(( i+1 ))
    python run.py -n 10 -O /vols/drive1/ixiotidi/jz/job_$i -p_gen "$offset" -p 1,-1 -pb 1 -sp 0 -rng "$rng_seed" -index_offset 0 -config jetnet_config/jz_config.py --steps "generation,pileup,simulation"
done
