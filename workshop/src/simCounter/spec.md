## Introduction
To goal of this lab is to practice basics of SpinalSim by verifying a simple counter DUT.

The DUT is contained in SimCounterDut.scala and contains some faults-injection mechanism to check that your test bench is checking things.

#### Tasks 

1) Fill the SimCounterTestbench
2) Run it and fix it until it pass.
3) Run the SimCounterTester (contains in the src/test/scala/workshop/simCounter folder) to check if your testbench catch the injected faults. 

## DUT specification

| name | type | description |
| ------ | ----------- | ------ | 
| dut.clockDomain | ClockDomain | Clock domain which trigger the counter sampling |
| dut.io.enable | in Bool | When True, increment the counter value |
| dut.io.value | out UInt(8 bits) | Counter value, initialized to 0 when a reset occur |

