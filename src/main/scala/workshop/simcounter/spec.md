## Introduction
To goal of this lab is to practice basics of SpinalSim by verifying a simple counter DUT.

## Component interfaces

| name | direction | type | description |
| ------ | ----------- | ------ | ------ |
| enable | in | Bool | When True, increment the counter value |
| value | out | UInt(8 bits) | Counter value, initialized to 0 when a reset occur |

