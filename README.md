
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
- GHDL
- Verilator
- Icarus Verilog
- Cocotb (http://cocotb.readthedocs.io/en/latest/quickstart.html)
- Python3-tk
- GTKwave to open simulation waves (./waves/*.vcd)

For the first row of labs, you don't need cocotb/python stuff.


There is how to setup by command line a Debian/Ubuntu distribution :

```sh
# Basics
sudo apt-get update
sudo apt-get install -y git curl

# JAVA 11
sudo apt-get install -y openjdk-11-jdk

# Mill
curl -L https://github.com/lihaoyi/mill/releases/download/0.7.3/0.7.3 | sudo install /dev/stdin /usr/local/bin/mill

# HDL tools: GHDL, Verilator & Icarus Verilog
sudo apt-get install -y make g++ ghdl verilator iverilog gtkwave

# Make python equal to python3. This is important for current releases of cocotb
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 100

# python3 stuff
sudo apt-get install -y python3-pip python3-tk

# COCOTB
pip3 install --user cocotb

# Clone this repo
git clone --recursive https://github.com/SpinalHDL/SpinalWorkshop.git SpinalWorkshop
cd SpinalWorkshop
mill workshop.compile
```
