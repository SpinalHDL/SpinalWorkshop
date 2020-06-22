
module StreamFifo
(
  input        clk,
  input        reset,
  input        io_push_valid,
  output       io_push_ready,
  input  [7:0] io_push_payload,
  output       io_pop_valid,
  input        io_pop_ready,
  output [7:0] io_pop_payload,
  input        io_flush,
  output [4:0] io_occupancy
);

  reg [7:0] ram [0:15];
  reg  pushPtr_willIncrement;
  reg  pushPtr_willClear;
  reg [3:0] pushPtr_valueNext;
  reg [3:0] pushPtr_value;
  wire [0:0] zz_1;
  wire [0:0] zz_2;
  wire [3:0] zz_3;
  wire [3:0] zz_4;
  reg  popPtr_willIncrement;
  reg  popPtr_willClear;
  reg [3:0] popPtr_valueNext;
  reg [3:0] popPtr_value;
  wire [0:0] zz_5;
  wire [0:0] zz_6;
  wire [3:0] zz_7;
  wire [3:0] zz_8;
  wire  ptrMatch;
  wire  zz_9;
  reg  risingOccupancy;
  wire  pushing;
  wire  popping;
  wire  zz_10;
  wire  empty;
  wire  full;
  wire  zz_11;
  wire  zz_12;
  wire  zz_13;
  wire  zz_14;
  reg  zz_15;
  wire  zz_16;
  wire  zz_17;
  wire  zz_18;
  wire  zz_19;
  reg [7:0] ram_port0_data;
  wire [3:0] ram_port0_address;
  wire  ram_port0_enable;
  wire  zz_20;
  wire  zz_21;
  wire [3:0] ram_port2_address;
  wire [7:0] ram_port2_data;
  wire  ram_port2_enable;
  wire  zz_22;
  wire  zz_23;
  wire  zz_24;
  wire  zz_25;
  wire [3:0] ptrDif;
  wire  zz_26;
  wire [0:0] zz_27;
  wire [3:0] zz_28;
  wire [4:0] zz_29;
  wire [4:0] zz_30;
  wire  zz_31;
  wire  zz_32;
  wire  zz_33;
  wire  zz_34;
  wire  zz_35;
  wire  io_push_ready_readableBuffer;
  wire  io_pop_valid_readableBuffer;
  wire [3:0] zz_36;
  wire [3:0] zz_37;
  assign io_push_ready = io_push_ready_readableBuffer;
  assign io_pop_valid = io_pop_valid_readableBuffer;
  assign io_pop_payload = ram_port0_data;
  assign io_occupancy = zz_30;
  assign zz_1 = pushPtr_willIncrement;
  assign zz_2 = zz_1;
  assign zz_3 = (pushPtr_value + zz_36);
  assign zz_4 = zz_3;
  assign zz_5 = popPtr_willIncrement;
  assign zz_6 = zz_5;
  assign zz_7 = (popPtr_value + zz_37);
  assign zz_8 = zz_7;
  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign zz_9 = 1'b0;
  assign pushing = (io_push_valid && io_push_ready_readableBuffer);
  assign popping = (io_pop_valid_readableBuffer && io_pop_ready);
  assign zz_10 = (! risingOccupancy);
  assign empty = (ptrMatch && zz_10);
  assign full = (ptrMatch && risingOccupancy);
  assign zz_11 = (! full);
  assign zz_12 = (! empty);
  assign zz_13 = (popPtr_valueNext == pushPtr_value);
  assign zz_14 = 1'b0;
  assign zz_16 = (! full);
  assign zz_17 = (zz_15 && zz_16);
  assign zz_18 = (! zz_17);
  assign zz_19 = (zz_12 && zz_18);
  assign ram_port0_address = popPtr_valueNext;
  assign ram_port0_enable = zz_20;
  assign zz_20 = 1'b1;
  assign zz_21 = (pushing != popping);
  assign ram_port2_address = pushPtr_value;
  assign ram_port2_data = io_push_payload;
  assign ram_port2_enable = pushing;
  assign zz_22 = 1'b1;
  assign zz_23 = 1'b0;
  assign zz_24 = 1'b1;
  assign zz_25 = 1'b0;
  assign ptrDif = (pushPtr_value - popPtr_value);
  assign zz_26 = (risingOccupancy && ptrMatch);
  assign zz_27 = zz_26;
  assign zz_28 = ptrDif;
  assign zz_29 = {zz_27,zz_28};
  assign zz_30 = zz_29;
  assign zz_31 = 1'b1;
  assign zz_32 = 1'b0;
  assign zz_33 = 1'b1;
  assign zz_34 = 1'b0;
  assign zz_35 = 1'b0;
  assign io_push_ready_readableBuffer = zz_11;
  assign io_pop_valid_readableBuffer = zz_19;
  assign zz_36 = zz_2;
  assign zz_37 = zz_6;
  always @ (pushing or zz_22 or zz_23)
  begin
    pushPtr_willIncrement <= zz_23;
    if(pushing)begin
      pushPtr_willIncrement <= zz_22;
    end
  end

  always @ (io_flush or zz_31 or zz_32)
  begin
    pushPtr_willClear <= zz_32;
    if(io_flush)begin
      pushPtr_willClear <= zz_31;
    end
  end

  always @ (pushPtr_willClear or zz_4)
  begin
    pushPtr_valueNext <= zz_4;
    if(pushPtr_willClear)begin
      pushPtr_valueNext <= (4'b0000);
    end
  end

  always @ (popping or zz_24 or zz_25)
  begin
    popPtr_willIncrement <= zz_25;
    if(popping)begin
      popPtr_willIncrement <= zz_24;
    end
  end

  always @ (io_flush or zz_33 or zz_34)
  begin
    popPtr_willClear <= zz_34;
    if(io_flush)begin
      popPtr_willClear <= zz_33;
    end
  end

  always @ (popPtr_willClear or zz_8)
  begin
    popPtr_valueNext <= zz_8;
    if(popPtr_willClear)begin
      popPtr_valueNext <= (4'b0000);
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      pushPtr_value <= (4'b0000);
      popPtr_value <= (4'b0000);
      risingOccupancy <= zz_9;
      zz_15 <= zz_14;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if(zz_21)begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= zz_35;
      end
      zz_15 <= zz_13;
    end
  end

  always @ (posedge clk)
  begin
    ram_port0_data <= ram[ram_port0_address];
    if(ram_port2_enable)begin
      ram[ram_port2_address] <= ram_port2_data;
    end
  end

  initial begin
    $dumpfile("../../../../../waves/StreamFifo.vcd");
    $dumpvars(0, StreamFifo);
  end


endmodule

