
## SpinalHDL labs
There is the list of RTL labs :

- Counter : workshop/src/counter
- PWM with APB : workshop/src/pwm
- UART : workshop/src/uart
- Prime : workshop/src/prime
- Function : workshop/src/function
- Apb3Decoder : workshop/src/apb3decoder
- Timer with BusSlaveFactory : workshop/src/timer
- Blackbox and Clockdomain : workshop/src/blackboxAndClock
- Stream : workshop/src/stream
- Mandelbrot : workshop/src/mandelbrot
- UDP : workshop/src/udp
- WavePlayer : workshop/src/waveplayer

In each labs, there is an assets folder which contain a starting template and a solution.<br>
In each labs, there is an spec.md which give basics of the lab. (You can get the Intellij plugin to read it in the IDE)<br>
In the case a lab specification isn't clear, you can find in waves.tar.gz the corresponding working waves.<br>
Those labs make the assumption that you are already comfortable with standards HDL.


### Generate your RTL
For each labs, you will find a scala main which will generate your RTL.

For example, to run the `CounterMain` by using Mill, you can do as following in the root folder of this repository :

```sh
mill -i
@ workshop.runMain("workshop.counter.CounterMain")()

# Run again
@ workshop.runMain("workshop.counter.CounterMain")()

# Run again
@ workshop.runMain("workshop.counter.CounterMain")()
```

Or in a single (But slower) command :

```sh
mill workshop.runMain workshop.counter.CounterMain
```

All generated RTL will be in root_of_this_repository/rtl.

### Test your RTL
For each labs, you will find an automated regression suite in workshop/test/src/workshop/xxx

For example, to run the `CounterTester` regression by using Mill, you can do as following in the root folder of this repository :

```sh
mill -i
@ workshop.test.testOnly("workshop.counter.CounterTester")()

# To test again
@ workshop.test.testOnly("workshop.counter.CounterTester")()

# To test again
@ workshop.test.testOnly("workshop.counter.CounterTester")()
```

Or in a single (But slower) command :

```sh
mill workshop.test.testOnly workshop.counter.CounterTester
```

Note : Each tester regenerate the hardware, you don't need to do it manualy.

All simulation waves files will be written in root_of_this_repository/waves in the VCD format.



## SpinalSim labs
There is the list of SpinalSim labs :

- SimCounter : workshop/test/resources/python/workshop/simCounter
- SimStreamJoinFork : workshop/test/resources/python/workshop/simStreamJoinFork


In each labs, there is an assets folder which contain a starting template and a solution.<br>
In each labs, there is an spec.md which give basics of the lab. (You can get the Intellij plugin to read it in the IDE)<br>
For SpinalSim, the simulation waves are located in the simWorkspace folder.

## Cocotb labs
There is the list of Cocotb labs :

- Counter with cocotb : workshop/test/resources/python/workshop/counter
- FIFO with cocotb : workshop/test/resources/python/workshop/fifo

To run cocotb labs, you have to run `make` in the testbench folder.


## Minimum requirements
Those labs use various tools to generate and verify the hardware :

- java 11
- Mill (https://www.lihaoyi.com/mill/)
- Verilator
- Icarus Verilog
- Cocotb (http://cocotb.readthedocs.io/en/latest/quickstart.html)
- Python3-tk
- GTKwave to open simulation waves (./waves/*.vcd)

For the first row of labs, you don't need cocotb/python stuff.


There is how to setup by command line a Debian distribution :

```sh
# JAVA 8
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk -y
sudo update-alternatives --config java
sudo update-alternatives --config javac

# Mill
curl -L 'https://github.com/lihaoyi/mill/releases/download/0.7.3/0.7.3' | install /dev/stdin /usr/local/bin/mill

# Verilator
sudo apt-get install git make autoconf g++ flex bison -y  # First time prerequisites
git clone http://git.veripool.org/git/verilator   # Only first time

unsetenv VERILATOR_ROOT  # For csh; ignore error if on bash
unset VERILATOR_ROOT  # For bash
cd verilator
git pull        # Make sure we're up-to-date
git tag         # See what versions exist
#git checkout HEAD                 # Use HEAD development version
#git checkout verilator_{version}  # Switch to specified version
autoconf        # Create ./configure script
./configure
make -j$(nproc)
sudo make install
cd ..

# iverilog (debian package 9.7 contain bugs)
sudo apt-get install -y gperf readline-common bison flex autoconf
wget https://github.com/steveicarus/iverilog/archive/v10_0.tar.gz
tar -xvf v10_0.tar.gz
cd iverilog-10_0
autoconf
./configure
make -j4
sudo make install
cd ..

# COCOTB
sudo pip3 install cocotb

# GTKwave
sudo apt-get install gtkwave -y

# Python3-tk: Used for the mandelbrot lab
sudo apt-get install -y python3-tk

# Clone this repo
git clone --recursive https://github.com/SpinalHDL/SpinalWorkshop.git SpinalWorkshop
cd SpinalWorkshop
mill workshop.compile
```
