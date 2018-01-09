## Introduction
To goal of this lab is to practice basics abstractions implemented on the top of SpinalSim to write better testbenches.

Those abstractions are in the SimStreamUtils.scala file and provide ways to drive/monitor hardware stream interfaces (valid/ready/payload).

The DUT is contained in SimStreamJoinFork.scala and contains some faults-injection mechanism to check that your test bench is checking things.

#### Tasks

1) Fill the SimStreamJoinForkTestbench
2) Run it and fix it until it pass.
3) Run the SimStreamJoinForkTester (contains in the src/test/scala/workshop/simStreamJoinFork folder) to check if your testbench catch the injected faults. 

#### Tips

In Scala, Int Long and BigInt are signed types, there is no unsigned counter parts. It's why if you want to read a UInt(32 bits) you can't use the toInt function. Instead you will have to use toLong or toBigInt. 

## DUT specification

The dut is a stream processing component. It has two command interface which are carrying 32 bits unsigned values which are then processed to produce two response interfaces.

![](assets/dut.png)

| name | type | description |
| ------ | ----------- | ------ | 
| dut.clockDomain | ClockDomain | Clock domain used by the component |
| dut.io.cmdA   | slave Stream(UInt(32 bits))  | Slave stream used to generate transactions on rsp streams |
| dut.io.cmdB   | slave Stream(UInt(32 bits))  | Same as cmdA |
| dut.io.rspMul | master Stream(UInt(64 bits)) | For each pair of cmdA and cmdB transactions, emit a transaction with as payload the cmdA.payload * cmdB.payload |
| dut.io.rspXor | master Stream(UInt(32 bits)) | Same as rspMul, but with cmdA.payload * cmdB.payload as payload|

The latencies from cmdA/cmdB to rspMul/rspXor are at least one cycle (Emiting a transaction on the cmd streams will not create a transaction on the rsp streams the same cycle) 

