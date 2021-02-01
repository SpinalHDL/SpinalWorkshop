## Description
The goal of this lab is to implement the testbench of on single clock Stream FIFO by using Cocotb. 

This lab will introduce :

- How to structure the testbench with multiple coroutines
- How to use Python stuff to help your verification (Queue)
- How to wait the end of one coroutine execution

## FIFO interface 
The FIFO doesn't use the traditional full/empty arbitration, but the Stream one :

| name | direction | type |
| ------ | ----------- | ------ |
| io_push_valid   | in  | Bool         |
| io_push_ready   | out | Bool         |
| io_push_payload | in  | Bits(8 bits) |
| io_pop_valid    | out | Bool         |
| io_pop_ready    | in  | Bool         |
| io_pop_payload  | out | Bool(8 bits) |

## Verification
The verification should be done by using the starting template. <br>
The idea is to implement an driverAgent which constantly send random stimulus to the DUT and then implement an checkerAgent that check that the `pop` port of the fifo is correct by using a reference Queue.

## Python Queue
In python you can define Queue by the following way :

```python
from queue import Queue

queue = Queue()
```

Then you can use some Queue fonctions :

```python
// Push element into the queue
// Be carefull, don't forget to get the Int from the IO signal, else you will put an reference into the queue
queue.put(int(dut.io_push_payload))

// Get an element from the queue by an blocking way.
// Be carefull, if there is nothing in the queue you will stuck the simulation.
queue.get() 

// Get if the queue is empty
queue.empty()
```

## Cocotb fork

You can create on join a simulation thready by the following way :

```python
// Create the coroutine thread (and run it directly)
handle = cocotb.fork(myCoroutine(dut))

// Wait until the handle's coroutine finish
yield handle.join()
```

If you only have a single simulation thread to join, you can do as following :

```python
yield myCoroutine(dut)
```
