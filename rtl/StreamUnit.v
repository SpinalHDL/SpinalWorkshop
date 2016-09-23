
module StreamUnit
( 
  input   io_memWrite_valid,
  input  [7:0] io_memWrite_payload_address,
  input  [31:0] io_memWrite_payload_data,
  input   io_cmdA_valid,
  output  io_cmdA_ready,
  input  [7:0] io_cmdA_payload,
  input   io_cmdB_valid,
  output  io_cmdB_ready,
  input  [31:0] io_cmdB_payload,
  output  io_rsp_valid,
  input   io_rsp_ready,
  output [31:0] io_rsp_payload,
  input   clk,
  input   reset 
);

  reg [31:0] mem [0:255];
  wire [7:0] mem_port0_address;
  wire [31:0] mem_port0_data;
  wire  mem_port0_enable;
  wire  zz_1;
  reg  memReadValid;
  wire  memReadReady;
  wire  zz_2;
  wire  zz_3;
  wire  zz_4;
  wire  zz_5;
  wire  zz_6;
  wire  zz_7;
  wire [31:0] memReadData;
  reg [31:0] mem_port1_data;
  wire [7:0] mem_port1_address;
  wire  mem_port1_enable;
  wire  zz_8;
  wire  zz_9;
  wire  zz_10;
  wire [31:0] zz_11;
  wire  zz_12;
  wire  zz_13;

initial begin
  $dumpfile("../../../../../waves/StreamUnitTester.vcd");
  $dumpvars(0, StreamUnit);
end
  assign io_cmdA_ready = zz_13;
  assign io_cmdB_ready = zz_10;
  assign io_rsp_valid = zz_12;
  assign io_rsp_payload = zz_11;
  assign mem_port0_address = io_memWrite_payload_address;
  assign mem_port0_data = io_memWrite_payload_data;
  assign mem_port0_enable = io_memWrite_valid;
  assign zz_1 = 1'b0;
  assign memReadReady = zz_9;
  assign zz_2 = 1'b0;
  assign zz_3 = (! memReadValid);
  assign zz_4 = (zz_3 || memReadReady);
  assign zz_5 = (! memReadValid);
  assign zz_6 = (zz_5 || memReadReady);
  assign zz_7 = (io_cmdA_valid && zz_13);
  assign memReadData = mem_port1_data;
  assign mem_port1_address = io_cmdA_payload;
  assign mem_port1_enable = zz_7;
  assign zz_8 = (memReadValid && io_cmdB_valid);
  assign zz_9 = (zz_12 && io_rsp_ready);
  assign zz_10 = (zz_12 && io_rsp_ready);
  assign zz_11 = (memReadData ^ io_cmdB_payload);
  assign zz_12 = zz_8;
  assign zz_13 = zz_6;
  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      memReadValid <= zz_1;
    end else begin
      if(memReadReady)begin
        memReadValid <= zz_2;
      end
      if(zz_4)begin
        memReadValid <= io_cmdA_valid;
      end
    end
  end

  always @ (posedge clk)
  begin
    if(mem_port0_enable)begin
      mem[mem_port0_address] <= mem_port0_data;
    end
    if(mem_port1_enable)begin
      mem_port1_data <= mem[mem_port1_address];
    end
  end

endmodule

