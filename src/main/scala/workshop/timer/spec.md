## Introduction
This lab will be in 2 phases :

- The implementation of a Timer component
- The implementation of a function which allow to use an memory bus to control that timer

This lab will introduce :
- How to define an register bank by an abstract way (BusSlaveFactory)
- Meta-hardware description possibilities

## Part 1 : Timer

The Timer module will have a single construction parameter :

| Parameter Name  |  Type  | Description |
| ------- | ---- | ---- |
| width | Int | Specify the width of the timer counter |

And also some inputs/outputs :

| IO Name  | Direction | Type  | Description |
| ------- | ---- | ---- | ---- |
| tick | in | Bool | When `tick` is True, the timer count up until `limit`. |
| clear | in | Bool | When `clear` is True, the timer is set to zero. `clear` has the priority over `tick`. |
| limit | in |  UInt(width bits) | When the timer value is equals to `limit`, the `tick` input is inhibited. |
| full | out | Bool | full is high when the timer value is equals to `limit`  |
| value | out | UInt(width bits)  | Wire out the timer counter value. |


## Part 2 : Memory mapping function
Now we can start with the main purpose of this lab => Defining a memory mapping function. To do that we will use two techniques :

- Using the BusSlaveFactory tool
- Defining a function inside the Timer component which can be called from the parent component to drive Timer's IO by an abstract ways.

This memory mapping function will take followings parameters :

| Parameter Name  |  Type  | Description |
| ------- | ---- | ---- |
| busCtrl | BusSlaveFactory | The BusSlaveFactory instance that will be used by the function to create the bridging logic |
| baseAddress | BigInt | The base address where the bridging logic should be mapped |
| ticks | Seq[Bool] | A list of Bool sources which can be used as a tick signal |
| clears | Seq[Bool] | A list of Bool sources which can be used as a clear signal|

The register mapping will make the assumption that the bus system is 32 bits width :

| Register Name | Access | Width | Address offset | Bit offset |  Description |
| ------- | ---- | --- | --- | --- | --- |
| ticksEnable | RW | len(ticks) | 0 | 0 | Each ticks bool can be actived if the corresponding ticksEnable bit is high. |
| clearsEnable | RW | len(clears) | 0 | 16 | Each clears bool can be actived if the corresponding clearsEnable bit is high. |
| limit | RW | width | 4  | 0 | Access the limit value of the timer component.<br> When this register is written, the timer is cleared. |
| value | R | width | 8  | 0 | Access the value of the timer. |
| clear | W | - | 8  | - | When this register is written, it clear the timer. |

Note : You can see an usage of this memory mapping function in Apb3Timer

There is a list of some usefull function of the BusSlaveFactory :

| Function  |  Description |
| ------- | ---- | 
| createReadAndWrite(dataType, address, bitOffset) | Return a new readable and writeable register mapped were specified |
| driveAndRead(that, address, bitOffset) | Drive `that` from a new readable and writeable register mapped were specified|
| read(that, address, bitOffset)  | Make that readable on the specified mapping  |
| isWriting(address) | Return True when the specified address is written |

 