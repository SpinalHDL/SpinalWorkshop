
module MemorySumming
( 
  input   io_wr_en,
  input  [7:0] io_wr_addr,
  input  [15:0] io_wr_data,
  input   io_sum_start,
  output reg  io_sum_done,
  output [15:0] io_sum_value,
  input   io_wr_clk,
  input   io_sum_clk,
  input   io_sum_reset 
);

  reg [7:0] sumArea_counter;
  wire  zz_1;
  reg  sumArea_active;
  wire  zz_2;
  wire  zz_3;
  wire [7:0] zz_4;
  wire [7:0] zz_5;
  wire  zz_6;
  wire  zz_7;
  reg  sumArea_readDataValid;
  wire  zz_8;
  reg [15:0] sumArea_sum;
  wire [15:0] zz_9;
  wire [15:0] zz_10;
  wire  zz_11;
  wire  zz_12;
  wire  zz_13;
  reg  zz_14;
  wire  zz_15;
  wire  zz_16;
  wire [15:0] ram_io_rd_data;
  Ram_1w_1r_2c #( 
    .wordCount(256),
    .wordWidth(16) 
) ram ( 
    .io_wr_clk(io_wr_clk),
    .io_wr_en(io_wr_en),
    .io_wr_addr(io_wr_addr),
    .io_wr_data(io_wr_data),
    .io_rd_clk(io_sum_clk),
    .io_rd_en(sumArea_active),
    .io_rd_addr(sumArea_counter),
    .io_rd_data(ram_io_rd_data) 
  );
  assign io_sum_value = sumArea_sum;
  assign zz_1 = 1'b0;
  assign zz_2 = (! sumArea_active);
  assign zz_3 = 1'b1;
  assign zz_4 = (sumArea_counter + (8'b00000001));
  assign zz_5 = (8'b11111111);
  assign zz_6 = (sumArea_counter == zz_5);
  assign zz_7 = 1'b0;
  assign zz_8 = 1'b0;
  assign zz_9 = ram_io_rd_data;
  assign zz_10 = (sumArea_sum + zz_9);
  assign zz_11 = 1'b0;
  assign zz_12 = 1'b0;
  assign zz_13 = (! sumArea_readDataValid);
  assign zz_15 = (zz_13 && zz_14);
  assign zz_16 = 1'b1;
  always @ (zz_11 or zz_15 or zz_16)
  begin
    io_sum_done <= zz_11;
    if(zz_15)begin
      io_sum_done <= zz_16;
    end
  end

  always @ (posedge io_sum_clk or posedge io_sum_reset)
  begin
    if (io_sum_reset) begin
      sumArea_active <= zz_1;
      sumArea_readDataValid <= zz_8;
      zz_14 <= zz_12;
    end else begin
      if(zz_2)begin
        sumArea_active <= zz_3;
      end else begin
        if(zz_6)begin
          sumArea_active <= zz_7;
        end
      end
      sumArea_readDataValid <= sumArea_active;
      zz_14 <= sumArea_readDataValid;
    end
  end

  always @ (posedge io_sum_clk)
  begin
    if(zz_2)begin
      sumArea_counter <= (8'b00000000);
    end else begin
      sumArea_counter <= zz_4;
    end
    if(sumArea_readDataValid)begin
      sumArea_sum <= zz_10;
    end else begin
      sumArea_sum <= (16'b0000000000000000);
    end
  end

endmodule

