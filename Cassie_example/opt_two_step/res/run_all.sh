#!/bin/bash
# Run multiple optimizations in parallel
NUM_OPT=1331
echo "Starting parallel optimization:"
parallel ./program --initial 'res/init.json' --options '../ipopt.opt' --data 'res/data.json' --bounds "res/bounds_{}.json" --solution "data/sol_{}.json" ">" "log/log_{}.txt" ::: {1..$NUM_OPT}
echo "Done!"
