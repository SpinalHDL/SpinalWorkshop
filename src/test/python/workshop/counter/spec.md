## Description
The goal of this lab is to implement the testbench of the Counter lab by using Cocotb. 

This lab will introduce :

- How to read and write DUT signals from cocotb
- How to wait on triggers in cocotb (Yield, Timer)
- How to fork a simulation thread in Cocotb (coroutine)

## Verification
You can verify it as you want :

- Directed tests
- Full randomisation of inputs with outputs checking by using a reference model.

The starting template provided in this lab use the second method. 

Also, do not forget to check that your testbench check things by manually introducing bugs in the RTL (Counter.v)

## How to run it
Just run `make` in this directory