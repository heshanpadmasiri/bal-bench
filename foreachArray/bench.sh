#!/usr/bin/env bash

# build sources
# ../build.sh test.bal

avg_time() {
    JAR="$1"
    num_runs=10

    # Initialize total time variable
    total_time=0

    # Loop to run the program multiple times
    for ((i=0; i<$num_runs; i++)); do
        current_time=$(java -jar "$JAR")

        # Add the current running time to the total
        total_time=$(echo "$total_time + $current_time" | bc)
    done
    avg_time=$(echo "scale=4; $total_time / $num_runs" | bc)
    echo "$avg_time"
}

current_time=$(avg_time "current.jar")
new_time=$(avg_time "new.jar")
echo "current time: $current_time s new time: $new_time s"
