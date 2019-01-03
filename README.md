
## SpinalHDL labs
There is the list of RTL labs :

- Counter : src/main/scala/workshop/counter
- PWM with APB : src/main/scala/workshop/pwm
- UART : src/main/scala/workshop/uart
- Prime : src/main/scala/workshop/prime
- Function : src/main/scala/workshop/function
- Apb3Decoder : src/main/scala/workshop/apb3decoder
- Timer with BusSlaveFactory : src/main/scala/workshop/timer
- Blackbox and Clockdomain : src/main/scala/workshop/blackboxAndClock
- Stream : src/main/scala/workshop/stream
- Mandelbrot : src/main/scala/workshop/mandelbrot
- UDP : src/main/scala/workshop/udp
- WavePlayer : src/main/scala/workshop/waveplayer

In each labs, there is an assets folder which contain a starting template and a solution.<br>
In each labs, there is an spec.md which give basics of the lab. (You can get the Intellij plugin to read it in the IDE)<br>
In the case a lab specification isn't clear, you can find in waves.tar.gz the corresponding working waves.<br>
Those labs make the assumption that you are already comfortable with standards HDL.


### Generate your RTL
For each labs, you will find a scala main which will generate your RTL.

For example, to run the `CounterMain` by using SBT, you can do as following in the root folder of this repository :

```sh
sbt
runMain workshop.counter.CounterMain

# Run again
runMain workshop.counter.CounterMain

# Run again
runMain workshop.counter.CounterMain
```

Or in a single (But slower) command :

```sh
sbt "runMain workshop.counter.CounterMain"
```

All generated RTL will be in root_of_this_repository/rtl.

### Test your RTL
For each labs, you will find an automated regression suite in src/test/scala/workshop/xxx

For example, to run the `CounterTester` regression by using SBT, you can do as following in the root folder of this repository :

```sh
sbt
testOnly *.CounterTester

# To test again
testOnly *.CounterTester

# To test again
testOnly *.CounterTester
```

Or in a single (But slower) command :

```sh
sbt "testOnly *.CounterTester"
```

Note : Each tester regenerate the hardware, you don't need to do it manualy.

All simulation waves files will be written in root_of_this_repository/waves in the VCD format.



## SpinalSim labs
There is the list of SpinalSim labs :

- SimCounter : src/main/python/workshop/simCounter
- SimStreamJoinFork : src/main/python/workshop/simStreamJoinFork


In each labs, there is an assets folder which contain a starting template and a solution.<br>
In each labs, there is an spec.md which give basics of the lab. (You can get the Intellij plugin to read it in the IDE)<br>
For SpinalSim, the simulation waves are located in the simWorkspace folder.

## Cocotb labs
There is the list of Cocotb labs :

- Counter with cocotb : src/test/python/workshop/counter
- FIFO with cocotb : src/test/python/workshop/fifo

To run cocotb labs, you have to run `make` in the testbench folder.


## Minimum requirements
Those labs use various tools to generate and verify the hardware :

- java 8
- SBT
- Verilator
- Icarus Verilog
- Cocotb (http://cocotb.readthedocs.io/en/latest/quickstart.html#installing-cocotb)
- Cocotb path in the 'COCOTB' environment variable
- GTKwave to open simulation waves (./waves/*.vcd)

For the first row of labs, you don't need cocotb/python stuffs.


There is how to setup by command line a Debian distribution :

```sh
# JAVA 8
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk -y
sudo update-alternatives --config java
sudo update-alternatives --config javac

# SBT
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt -y

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
sudo apt-get install -y git make gcc g++ swig python-dev
git clone https://github.com/potentialventures/cocotb
export COCOTB=$(pwd)/cocotb
echo export COCOTB=$(pwd)/cocotb >> ~/.bashrc 

# GTKwave
sudo apt-get install gtkwave -y

# Used for the mandelbrot lab
sudo apt-get install python-tk -y

# Clone this repo
git clone --recursive https://github.com/SpinalHDL/SpinalWorkshop.git SpinalWorkshop
cd SpinalWorkshop
sbt compile
```
