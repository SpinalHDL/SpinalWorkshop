
module MyTopLevel
(
  input  io_cond0,
  input  io_cond1,
  output  io_flag,
  output [7:0] io_state,
  input  clk,
  input  reset 
);

  reg [7:0] counter;
  wire [7:0] zz_1;
  wire  zz_2;
  wire  zz_3;
  assign io_flag = zz_3;
  assign io_state = counter;
  assign zz_1 = (counter + (8'b00000001));
  assign zz_2 = (counter == (8'b00000000));
  assign zz_3 = (zz_2 || io_cond1);
  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      counter <= (8'b00000000);
    end else begin
      if(io_cond0)begin
        counter <= zz_1;
      end
    end
  end

endmodule

