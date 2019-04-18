# Test for all samples and tigress challenges whether they are correct
# run from the deobfuscated_binaries folder

for f in sample*.deobfuscated; do
    filename=$(sed -r "s/(sample[[:digit:]]+).*/\1/g" <<< $f)
    output=$(../scripts/testing_equality.py ../samples/$filename-unprotected.bin ./$f | tail -n 1)
    echo $f: ${output#*Success\:}
done

for f in tigress*.deobfuscated; do
    output=$(../scripts/testing_equality.py ../tigress-challenges/${f%\.*} ./$f | tail -n 1)
    echo $f: ${output#*Success\:}
done
