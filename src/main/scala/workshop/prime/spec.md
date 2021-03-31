## Introduction
The goal of this lab is to practice function to generate hardware and also to give a better feeling of the object oriented nature of SpinalHDL.

The function to implement should identify if the hardware number given as argument (UInt) is prime.

This lab will introduce :
- Basic functions
- How the scala can be mixed with SpinalHDL

As a hint, there is many ways to solve that lab, one of them would produce the following Verilog (5 bits UInt) : 

```verilog
module PrimeUsage (
  input      [4:0]    io_value,
  output              io_isPrime
);
  reg                 _zz_1;

  always @ (*) begin
    _zz_1 = 1'b0;
    if((io_value == 5'h0))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h01))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h02))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h03))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h05))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h07))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h0b))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h0d))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h11))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h13))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h17))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h1d))begin
      _zz_1 = 1'b1;
    end
    if((io_value == 5'h1f))begin
      _zz_1 = 1'b1;
    end
  end

  assign io_isPrime = _zz_1;

endmodule
```

So basically, you can use a scala for loop to "inline" as many SpinalHDL "when" statements as you want, which can result in the above netlist.