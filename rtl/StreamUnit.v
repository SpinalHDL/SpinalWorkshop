
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
  reg  memReadStream_valid;
  wire  memReadStream_ready;
  wire  zz_1;
  wire  zz_2;
  wire  zz_3;
  wire  zz_4;
  wire  zz_5;
  wire  zz_6;
  wire [31:0] memReadData;
  reg [31:0] mem_port1_data;
  wire [7:0] mem_port1_address;
  wire  mem_port1_enable;
  wire  zz_7;
  wire  zz_8;
  wire  zz_9;
  wire [31:0] zz_10;
  wire  io_cmdA_ready_readableBuffer;

initial begin
  $dumpfile("../../../../../waves/StreamUnitTester.vcd");
  $dumpvars(0, StreamUnit);
end
  assign io_cmdA_ready = io_cmdA_ready_readableBuffer;
  assign io_cmdB_ready = zz_8;
  assign io_rsp_valid = zz_7;
  assign io_rsp_payload = zz_10;
  assign mem_port0_address = io_memWrite_payload_address;
  assign mem_port0_data = io_memWrite_payload_data;
  assign mem_port0_enable = io_memWrite_valid;
  assign memReadStream_ready = zz_8;
  assign zz_1 = 1'b0;
  assign zz_2 = 1'b1;
  assign zz_3 = (! memReadStream_valid);
  assign zz_4 = (zz_2 && zz_3);
  assign zz_5 = (zz_4 || memReadStream_ready);
  assign zz_6 = (io_cmdA_valid && io_cmdA_ready_readableBuffer);
  assign memReadData = mem_port1_data;
  assign mem_port1_address = io_cmdA_payload;
  assign mem_port1_enable = zz_6;
  assign zz_7 = zz_9;
  assign zz_8 = (zz_7 && io_rsp_ready);
  assign zz_9 = (memReadStream_valid && io_cmdB_valid);
  assign zz_10 = (memReadData ^ io_cmdB_payload);
  assign io_cmdA_ready_readableBuffer = zz_5;
  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      memReadStream_valid <= zz_1;
    end else begin
      if(io_cmdA_ready_readableBuffer)begin
        memReadStream_valid <= io_cmdA_valid;
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

