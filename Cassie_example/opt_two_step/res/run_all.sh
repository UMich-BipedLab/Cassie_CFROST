#!/bin/bash
# Run multiple optimizations in parallel
NUM_OPT=1331
MAX_CPU=99

echo "Running all optimizations"
for ((i=1; i<=$NUM_OPT; i++)); do
  # Wait until CPU usage is < MAX_CPU
  # CPU=$(mpstat 1 1 | awk '$2 ~"all" {print int($3)}')
  CPU=$(top -b -n1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')   
  while [ $CPU -ge $MAX_CPU ]; do                                  
    # CPU=$(mpstat 1 1 | awk '$2 ~"all" {print int($3)}')          
    CPU=$(top -b -n1 | grep "Cpu(s)" | awk '{print int($2 + $4)}') 
    echo "CPU usage is greater than ${MAX_CPU}%: ${CPU}%"          
  done       
  # Start next optimization
  echo "Starting optimization: $i"
  bounds="res/bounds_${i}.json"
  output="../local/output/output_${i}.json"
  log="../local/log/log_${i}.txt"
  ./program --initial 'res/init.json' --options '../ipopt.opt' --data 'res/data.json' --bounds "$bounds" --output "$output" > "${log}" & 
  pids[${i}]=$!
  sleep 0.1
done

# Wait for all optimizations to complete
echo "Waiting until optimizations finish..."
for pid in ${pids[*]}; do
  wait $pid
done 
echo "Done!"
