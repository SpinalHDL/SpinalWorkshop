## Description
The goal of this lab is to implement a component which instantiate a blackboxed dual port dual clock  ram (implemented in VHDL). Also the component should be able to sum all words of that ram.

This lab will introduce :

- How instanciate an VHDL/Verilog component inside the SpinalHDL hierarchy (BlackBox)
- How to manage different clock domains (ClockingArea)
- The possibility of inner bundles

## Setup
This lab is using GHDL to do the VHDL simulation of your design :  

```sh
# GHDL
sudo add-apt-repository -y ppa:pgavin/ghdl
sudo apt-get update
sudo apt-get install -y --force-yes ghdl
```

## Component interfaces

| name | direction | type | description |
| ------ | ----------- | ------ | ------ |
| wr.en | in | Bool | ram(wr.addr) is written with wr.data when wr.en is high |
| wr.addr | in | UInt(8 bits) | write address |
| wr.data | in | Bits(16 bits) | write data |
| sum.start  | in | Bool | When pulsed high, ask the component to calculate the sum of all ram's words |
| sum.done   | out | Bool | Pulsed high one cycle to notify that the sum is available on sum.value |
| sum.value  | out | UInt(16 bits) | Sum value of all ram's words, only valid when sum.done is high |

## Dual port dual clock memory blackbox

The memory is implemented in VHDL with the following entity :

```vhdl
entity Ram_1w_1r_2c is
  generic(
    wordCount : integer;
    wordWidth : integer
  );
  port(
    io_wr_clk : in std_logic;
    io_wr_en : in std_logic;
    io_wr_addr : in unsigned;
    io_wr_data : in std_logic_vector;
    io_rd_clk : in std_logic;
    io_rd_en : in std_logic;
    io_rd_addr : in unsigned;
    io_rd_data : out std_logic_vector
  );
end Ram_1w_1r_2c;
```

Some documentation about the SpinalHDL blackbox feature are present [here](http://spinalhdl.github.io/SpinalDoc/spinal/core/blackbox/)

## Notes about Clock crossing, not related to this lab
Clock crossing is something that should be done carefully because you can easily lose transactions or have metastability issues. There is many way to do clock crossing safely :

- Using two stages register separation to transmit value continuously, (be careful with transition)
- Using toggle protocol to transmit events and transactions
- Using a dual clock FIFO IP (Gray counter) to transmit transactions

Also, SpinalHDL check that all cross clock domains are done explicitly.
