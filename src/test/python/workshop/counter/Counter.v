
module Counter
( 
  input   io_clear,
  output [3:0] io_value,
  output  io_full,
  input   clk,
  input   reset 
);

  reg [3:0] counter;
  wire [3:0] zz_1;
  wire [3:0] zz_2;
  wire [3:0] zz_3;
  wire  zz_4;
  assign io_value = counter;
  assign io_full = zz_4;
  assign zz_1 = (counter + (4'b0001));
  assign zz_2[3 : 0] = zz_3;
  assign zz_3 = (4'b1111);
  assign zz_4 = (counter == zz_2);
  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      counter <= (4'b0000);
    end else begin
      counter <= zz_1;
      if(io_clear)begin
        counter <= (4'b0000);
      end
    end
  end

  initial begin
    $dumpfile("../../../../../waves/Counter.vcd");
    $dumpvars(0, Counter);
  end

endmodule

