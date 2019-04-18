# Print table containing the size differences between obfuscated and deobfuscated files 
# tigress-x-challenges-y is in row x, column y
# 
# run this script from the folder deobfuscated_binaries
# 
declare -A matrix
num_rows=4
num_cols=5
for f in tigress*; do
    row=$(awk -v RS=[0-9] '{print RT;exit}' <<< $f)
    ((row++))
    col=$(echo $f | rev | awk -v RS=[0-9] '{print RT;exit}' )
    ((col++))
    deobfuscated=$(objdump -d $f | grep "^ " | wc -l)
    obfuscated=$(objdump -d ../tigress-challenges/${f%\.*} | grep "^ " | wc -l)
    output=$(echo $obfuscated "->" $deobfuscated)
    matrix[$row,$col]=$output
done

for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_cols;j++)) do
        echo -ne "${matrix[$i,$j]}\t"
    done
    echo ""
done
