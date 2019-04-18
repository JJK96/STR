#!/bin/sh
# solve all sample files
# Execute from root directory of Tigress_protection

for i in $(find virtualization | grep sample4  | grep -v CMakeFiles); do echo $i; /usr/bin/time -v ./solve-vm.py $i &>> metrics/adler32.data; done

for i in $(find virtualization | grep sample5  | grep -v CMakeFiles); do echo $i; /usr/bin/time -v ./solve-vm.py $i &>> metrics/jenkins.data; done

for i in $(find virtualization | grep sample8  | grep -v CMakeFiles); do echo $i; /usr/bin/time -v ./solve-vm.py $i &>> metrics/spiHash.data; done

for i in $(find virtualization | grep sample10 | grep -v CMakeFiles); do echo $i; /usr/bin/time -v ./solve-vm.py $i &>> metrics/xxhash.data; done

for i in $(find virtualization | grep sample11 | grep -v CMakeFiles); do echo $i; /usr/bin/time -v ./solve-vm.py $i &>> metrics/superFastHash.data; done

for i in $(find virtualization | grep sample12 | grep -v CMakeFiles); do echo $i; /usr/bin/time -v ./solve-vm.py $i &>> metrics/FNV1a.data; done

for i in $(find virtualization | grep sample13 | grep -v CMakeFiles); do echo $i; /usr/bin/time -v ./solve-vm.py $i &>> metrics/spookyHash.data; done

for i in $(find virtualization | grep sample14 | grep -v CMakeFiles); do echo $i; /usr/bin/time -v ./solve-vm.py $i &>> metrics/cityHash.data; done

for i in $(find virtualization | grep sample15 | grep -v CMakeFiles); do echo $i; /usr/bin/time -v ./solve-vm.py $i &>> metrics/jodyHash.data; done
