# Calculate the sizes of original, obfuscated and deobfuscated binaries
# run this script from the metrics folder
files[0]=$(ls ../samples/sample{4,5,8,10,11,12,13,14,15}-unprotected.bin) #original
names[0]=original
files[1]=$(find ../virtualization -perm -u+x -type f | grep -v CMakeFiles) #obfuscated
names[1]=obfuscated
files[2]=$(ls ../deobfuscated_binaries/sample{4,5,8,10,11,12,13,14,15}*.deobfuscated) #deobfuscated
names[2]=deobfuscated
for i in {0..2}; do
    min=10000000
    max=0
    count=0
    total=0
    echo ${names[i]}
    for file in ${files[i]}; do
        ((count++))
        size=$(objdump -d $file | grep "^ " | wc -l)
        total=$(echo "$total+$size" | bc)
        if [[ $(echo "if ($size < $min) 1 else 0" | bc) -eq 1 ]]; then
            min=$size
        fi
        if [[ $(echo "if ($size > $max) 1 else 0" | bc) -eq 1 ]]; then
            max=$size
        fi
    done
    echo count: $count total: $total min: $min max: $max avg: $(echo "$total/$count" | bc -l)
done
