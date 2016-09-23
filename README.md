## RTL labs
There is the list of RTL labs :

- Counter : src/main/scala/workshop/counter
- PWM with APB : src/main/scala/workshop/pwm
- UART : src/main/scala/workshop/uart
- Function : src/main/scala/workshop/function
- Timer with BusSlaveFactory : src/main/scala/workshop/timer
- Blackbox and Clockdomain : src/main/scala/workshop/blackboxAndClock
- Stream : src/main/scala/workshop/stream
- Mandelbrot : src/main/scala/workshop/mandelbrot
- UDP : src/main/scala/workshop/udp

In each labs, there is an assets folder which contain a starting template and a solution.<br>
In each labs, there is an spec.html which give basics of the lab.

### Minimum requirements

- GHDL
- Cocotb (commit 4fdd89339222759d57e9cc3d741ca04b3cdebe4f)
- Cocotb path in the PYTHONPATH and in the COCOTB environment variable

### Generate your RTL
For each labs, you will find an scala main which will generate your RTL.

For example, to run the `CounterMain` by using SBT, you can do as following in the root folder of this repository :

```sh
sbt
run-main workshop.counter.CounterMain

# Run again
run-main workshop.counter.CounterMain

# Run again
run-main workshop.counter.CounterMain
```

Or in a single (But slower) command :

```sh
sbt "run-main workshop.counter.CounterMain"
```

All generated RTL will be in root_of_this_repository/rtl.

### Test your RTL
For each labs, you will find an automated regression suite in src/test/scala/workshop/xxx

For example, to run the `CounterTester` regression by using SBT, you can do as following in the root folder of this repository :

```sh
sbt
test-only *CounterTester

# To test again
test-only *CounterTester

# To test again
test-only *CounterTester
```

Or in a single (But slower) command :

```sh
sbt "test-only *CounterTester"
```

Note : Each tester regenerate the hardware, you don't need to do it manualy.

All simulation waves files will be written in root_of_this_repository/waves in the VCD format.

## Verification labs
There is the list of verification labs :

- Counter with cocotb : src/test/python/workshop/counter
- FIFO with cocotb : src/test/python/workshop/fifo

To run cocotb labs, you have to run `make` in the testbench folder.