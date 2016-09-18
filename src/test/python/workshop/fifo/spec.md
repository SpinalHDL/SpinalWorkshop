## Description
The goal of this lab is to implement the testbench of on single clock Stream FIFO by using Cocotb. 

This lab will introduce :

- How to structure the testbench with multiple coroutines
- How to use Python stuff to help your verification (Queue)
- How to wait the end of one coroutine execution

## FIFO interface 

| name | direction | type |
| ------ | ----------- | ------ |
| io_push_valid   | in  | Bool         |
| io_push_ready   | out | Bool         |
| io_push_payload | in  | Bits(8 bits) |
| io_pop_valid    | out | Bool         |
| io_pop_ready    | in  | Bool         |
| io_pop_payload  | out | Bool(8 bits) |





