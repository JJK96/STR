Installing tools
================

Salwan's script
---------------

Download the script from [Jonathan Salwan's repository](https://github.com/JonathanSalwan/Tigress_protection)

Install the dependencies:

### LIEF

`pip2 install lief`

### Triton

Follow the [instructions](https://triton.quarkslab.com/documentation/doxygen/#install_sec) to install Triton and its dependencies.

### Arybo

Install from github repo to avoid [this issue](https://github.com/quarkslab/arybo/issues/6)

`python2 setup.py install`

Install llvmlite

Experiment

Troubleshooting
---------------

### solve-vm.py

In the script set `OPAQUE = False` if the script hangs like in [this issue](https://github.com/JonathanSalwan/Tigress_protection/issues/8#issuecomment-482799984)

Running the experiment
======================

### Build the docker container

Build the docker container
```
docker build -t image_tigress_protection .
```

Enter the container

```
docker run -v ./:/root/Tigress_protection -ti --name=tigress_protection --ulimit='stack=-1:-1' image_tigress_protection
```

### Compile the sample binaries

From within the docker container, `cd /root/Tigress_protection` and execute 

```
cmake .
make
```

### Solve the sample binaries

Obtain the scripts from [our repository](https://github.com/JJK96/STR)
Place `solve-vms.sh` in the root directory of Tigress_protection

```
./solve-vms.sh
```

### Obtain the metrics

Some of the metrics can be obtained by running the scripts in [our repository](https://github.com/JJK96/STR),
however, others have to be copied by hand.

### Test correctness of the scripts

Place the `testing_equality.sh` script in the `deobfuscated_binaries` folder and run it.
