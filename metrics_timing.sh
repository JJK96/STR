#!/bin/bash
# Calculate the times that solving the scripts has taken
# Run this script from the metrics folder
for file in *.data; do
    failed=$(grep "non-zero" $file | wc -l)
    echo $file failed: $failed
    count=0;
    total=0;
    min=500;
    max=0;
    for t in $(grep "Time of analysis" $file | awk '{print $4}'); do
        ((count++))
        total=$(echo $total+$t | bc)
        if [[ $(echo "if ($t < $min) 1 else 0" | bc) -eq 1 ]]; then
            min=$t
        fi
        if [[ $(echo "if ($t > $max) 1 else 0" | bc) -eq 1 ]]; then
            max=$t
        fi
    done
    echo count: $count, total: $total, max: $max, min: $min, avg: $(echo "$total / $count.0" | bc -l)
done
