
`define discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type [1:0]
`define discoveringRspTxDataFsm_enumDefinition_binary_sequancial_e0 'b00
`define discoveringRspTxDataFsm_enumDefinition_binary_sequancial_e1 'b01
`define discoveringRspTxDataFsm_enumDefinition_binary_sequancial_boot 'b10

`define fsm_enumDefinition_binary_sequancial_type [1:0]
`define fsm_enumDefinition_binary_sequancial_fsm_idle 'b00
`define fsm_enumDefinition_binary_sequancial_fsm_helloHeader 'b01
`define fsm_enumDefinition_binary_sequancial_fsm_discoveringRspTx 'b10
`define fsm_enumDefinition_binary_sequancial_boot 'b11

`define discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_type [0:0]
`define discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_e0 'b0
`define discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_boot 'b1

module UdpApp
( 
  input   io_rx_cmd_valid,
  output reg  io_rx_cmd_ready,
  input  [31:0] io_rx_cmd_payload_ip,
  input  [15:0] io_rx_cmd_payload_srcPort,
  input  [15:0] io_rx_cmd_payload_dstPort,
  input  [15:0] io_rx_cmd_payload_length,
  input   io_rx_data_valid,
  output reg  io_rx_data_ready,
  input   io_rx_data_payload_last,
  input  [7:0] io_rx_data_payload_fragment,
  output reg  io_tx_cmd_valid,
  input   io_tx_cmd_ready,
  output [31:0] io_tx_cmd_payload_ip,
  output [15:0] io_tx_cmd_payload_srcPort,
  output [15:0] io_tx_cmd_payload_dstPort,
  output [15:0] io_tx_cmd_payload_length,
  output reg  io_tx_data_valid,
  input   io_tx_data_ready,
  output  io_tx_data_payload_last,
  output reg [7:0] io_tx_data_payload_fragment,
  input   clk,
  input   reset 
);

  wire  zz_1;
  wire  zz_2;
  wire  zz_3;
  wire  zz_4;
  wire  zz_5;
  wire  zz_6;
  reg  flushRx_active;
  wire  zz_7;
  wire  zz_8;
  wire  zz_9;
  wire  zz_10;
  reg  discoveringRspTxCmdFsm_wantExit;
  reg  discoveringRspTxDataFsm_wantExit;
  reg [2:0] discoveringRspTxDataFsm_sendMessage_counter;
  reg `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type discoveringRspTxDataFsm_stateReg;
  reg `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type discoveringRspTxDataFsm_stateNext;
  wire `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type zz_11;
  wire `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type zz_12;
  wire  zz_13;
  wire `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type zz_14;
  wire  zz_15;
  wire `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type zz_16;
  wire  zz_17;
  wire  zz_18;
  wire `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type zz_19;
  wire `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type zz_20;
  wire  zz_21;
  wire  zz_22;
  wire [7:0] zz_23;
  wire [7:0] zz_24;
  wire [7:0] zz_25;
  wire [7:0] zz_26;
  wire [7:0] zz_27;
  wire [7:0] zz_28;
  wire [7:0] zz_29;
  wire [7:0] zz_30;
  wire  zz_31;
  wire [7:0] zz_32;
  wire  zz_33;
  wire [7:0] zz_34;
  wire  zz_35;
  wire [7:0] zz_36;
  wire  zz_37;
  wire [7:0] zz_38;
  wire  zz_39;
  wire [7:0] zz_40;
  wire  zz_41;
  wire [7:0] zz_42;
  wire  zz_43;
  wire [7:0] zz_44;
  wire [2:0] zz_45;
  wire  zz_46;
  wire [2:0] zz_47;
  wire  zz_48;
  wire  zz_49;
  wire `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type zz_50;
  wire  zz_51;
  wire  zz_52;
  reg `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_type discoveringRspTxCmdFsm_stateReg;
  reg `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_type discoveringRspTxCmdFsm_stateNext;
  wire `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_type zz_53;
  wire `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_type zz_54;
  wire  zz_55;
  wire  zz_56;
  wire  zz_57;
  wire  zz_58;
  wire `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_type zz_59;
  reg `fsm_enumDefinition_binary_sequancial_type fsm_stateReg;
  reg `fsm_enumDefinition_binary_sequancial_type fsm_stateNext;
  wire `fsm_enumDefinition_binary_sequancial_type zz_60;
  wire `fsm_enumDefinition_binary_sequancial_type zz_61;
  wire  zz_62;
  wire `fsm_enumDefinition_binary_sequancial_type zz_63;
  wire  zz_64;
  wire `fsm_enumDefinition_binary_sequancial_type zz_65;
  wire  zz_66;
  wire  zz_67;
  wire  zz_68;
  wire [15:0] zz_69;
  wire  zz_70;
  wire `fsm_enumDefinition_binary_sequancial_type zz_71;
  wire  zz_72;
  wire `fsm_enumDefinition_binary_sequancial_type zz_73;
  wire  zz_74;
  wire  zz_75;
  wire `fsm_enumDefinition_binary_sequancial_type zz_76;
  wire  zz_77;
  wire `fsm_enumDefinition_binary_sequancial_type zz_78;
  wire `fsm_enumDefinition_binary_sequancial_type zz_79;
  wire  zz_80;
  wire `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_type zz_81;
  wire  zz_82;
  wire  zz_83;
  wire `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type zz_84;
  wire  zz_85;
  wire  zz_86;
  wire  zz_87;
  wire  zz_88;
  wire `fsm_enumDefinition_binary_sequancial_type zz_89;
  wire `fsm_enumDefinition_binary_sequancial_type zz_90;
  wire  zz_91;
  wire  zz_92;
  wire `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_type zz_93;
  wire `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_type zz_94;
  reg  io_tx_data_payload_last_readableBuffer;

initial begin
  $dumpfile("../../../../../../waves/UdpAppSelfTester.vcd");
  $dumpvars(0, UdpApp);
end
  assign io_tx_cmd_payload_ip = io_rx_cmd_payload_ip;
  assign io_tx_cmd_payload_srcPort = io_rx_cmd_payload_dstPort;
  assign io_tx_cmd_payload_dstPort = io_rx_cmd_payload_srcPort;
  assign io_tx_cmd_payload_length = (16'b0000000000001001);
  assign io_tx_data_payload_last = io_tx_data_payload_last_readableBuffer;
  assign zz_1 = 1'b0;
  assign zz_2 = 1'b0;
  assign zz_3 = 1'b0;
  assign zz_4 = 1'b0;
  assign zz_5 = 1'b0;
  assign zz_6 = 1'b0;
  assign zz_7 = 1'b1;
  assign zz_8 = (io_rx_data_valid && io_rx_data_payload_last);
  assign zz_9 = 1'b1;
  assign zz_10 = 1'b0;
  assign zz_11 = `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_boot;
  assign zz_12 = `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_e1;
  assign zz_13 = (discoveringRspTxDataFsm_stateReg == zz_12);
  assign zz_14 = `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_e1;
  assign zz_15 = (discoveringRspTxDataFsm_stateNext == zz_14);
  assign zz_16 = `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_e0;
  assign zz_17 = (discoveringRspTxDataFsm_stateReg == zz_16);
  assign zz_18 = 1'b1;
  assign zz_19 = `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_e1;
  assign zz_20 = `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_e1;
  assign zz_21 = (discoveringRspTxDataFsm_stateReg == zz_20);
  assign zz_22 = 1'b1;
  assign zz_23 = (8'b01110100);
  assign zz_24 = (8'b01100101);
  assign zz_25 = (8'b01110011);
  assign zz_26 = (8'b01110100);
  assign zz_27 = (8'b00110001);
  assign zz_28 = (8'b00110010);
  assign zz_29 = (8'b00110011);
  assign zz_30 = (8'b00110100);
  assign zz_31 = discoveringRspTxDataFsm_sendMessage_counter[0];
  assign zz_32 = (zz_31 ? zz_24 : zz_23);
  assign zz_33 = discoveringRspTxDataFsm_sendMessage_counter[0];
  assign zz_34 = (zz_33 ? zz_26 : zz_25);
  assign zz_35 = discoveringRspTxDataFsm_sendMessage_counter[0];
  assign zz_36 = (zz_35 ? zz_28 : zz_27);
  assign zz_37 = discoveringRspTxDataFsm_sendMessage_counter[0];
  assign zz_38 = (zz_37 ? zz_30 : zz_29);
  assign zz_39 = discoveringRspTxDataFsm_sendMessage_counter[1];
  assign zz_40 = (zz_39 ? zz_34 : zz_32);
  assign zz_41 = discoveringRspTxDataFsm_sendMessage_counter[1];
  assign zz_42 = (zz_41 ? zz_38 : zz_36);
  assign zz_43 = discoveringRspTxDataFsm_sendMessage_counter[2];
  assign zz_44 = (zz_43 ? zz_42 : zz_40);
  assign zz_45 = (3'b111);
  assign zz_46 = (discoveringRspTxDataFsm_sendMessage_counter == zz_45);
  assign zz_47 = (discoveringRspTxDataFsm_sendMessage_counter + (3'b001));
  assign zz_48 = 1'b1;
  assign zz_49 = 1'b0;
  assign zz_50 = `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_boot;
  assign zz_51 = (! zz_13);
  assign zz_52 = (zz_51 && zz_15);
  assign zz_53 = `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_boot;
  assign zz_54 = `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_e0;
  assign zz_55 = (discoveringRspTxCmdFsm_stateReg == zz_54);
  assign zz_56 = 1'b1;
  assign zz_57 = 1'b1;
  assign zz_58 = 1'b0;
  assign zz_59 = `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_boot;
  assign zz_60 = `fsm_enumDefinition_binary_sequancial_boot;
  assign zz_61 = `fsm_enumDefinition_binary_sequancial_fsm_discoveringRspTx;
  assign zz_62 = (fsm_stateReg == zz_61);
  assign zz_63 = `fsm_enumDefinition_binary_sequancial_fsm_discoveringRspTx;
  assign zz_64 = (fsm_stateNext == zz_63);
  assign zz_65 = `fsm_enumDefinition_binary_sequancial_fsm_idle;
  assign zz_66 = (fsm_stateReg == zz_65);
  assign zz_67 = (! flushRx_active);
  assign zz_68 = (io_rx_cmd_valid && zz_67);
  assign zz_69 = (16'b1001010001100000);
  assign zz_70 = (io_rx_cmd_payload_dstPort == zz_69);
  assign zz_71 = `fsm_enumDefinition_binary_sequancial_fsm_helloHeader;
  assign zz_72 = 1'b1;
  assign zz_73 = `fsm_enumDefinition_binary_sequancial_fsm_helloHeader;
  assign zz_74 = (fsm_stateReg == zz_73);
  assign zz_75 = (io_rx_data_payload_fragment == (8'b00010001));
  assign zz_76 = `fsm_enumDefinition_binary_sequancial_fsm_discoveringRspTx;
  assign zz_77 = 1'b1;
  assign zz_78 = `fsm_enumDefinition_binary_sequancial_fsm_idle;
  assign zz_79 = `fsm_enumDefinition_binary_sequancial_fsm_discoveringRspTx;
  assign zz_80 = (fsm_stateReg == zz_79);
  assign zz_81 = `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_boot;
  assign zz_82 = (discoveringRspTxCmdFsm_stateReg == zz_81);
  assign zz_83 = (zz_82 || discoveringRspTxCmdFsm_wantExit);
  assign zz_84 = `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_boot;
  assign zz_85 = (discoveringRspTxDataFsm_stateReg == zz_84);
  assign zz_86 = (zz_85 || discoveringRspTxDataFsm_wantExit);
  assign zz_87 = (zz_83 && zz_86);
  assign zz_88 = 1'b1;
  assign zz_89 = `fsm_enumDefinition_binary_sequancial_fsm_idle;
  assign zz_90 = `fsm_enumDefinition_binary_sequancial_fsm_idle;
  assign zz_91 = (! zz_62);
  assign zz_92 = (zz_91 && zz_64);
  assign zz_93 = `discoveringRspTxCmdFsm_enumDefinition_binary_sequancial_e0;
  assign zz_94 = `discoveringRspTxDataFsm_enumDefinition_binary_sequancial_e0;
  always @ (zz_1 or flushRx_active or zz_8 or zz_9)
  begin
    io_rx_cmd_ready <= zz_1;
    if(flushRx_active)begin
      if(zz_8)begin
        io_rx_cmd_ready <= zz_9;
      end
    end
  end

  always @ (zz_2 or flushRx_active or zz_7)
  begin
    io_rx_data_ready <= zz_2;
    if(flushRx_active)begin
      io_rx_data_ready <= zz_7;
    end
  end

  always @ (zz_3 or zz_55 or zz_56)
  begin
    io_tx_cmd_valid <= zz_3;
    if(zz_55)begin
      io_tx_cmd_valid <= zz_56;
    end
  end

  always @ (zz_4 or zz_17 or zz_18 or zz_21 or zz_22)
  begin
    io_tx_data_valid <= zz_4;
    if(zz_17)begin
      io_tx_data_valid <= zz_18;
    end else if(zz_21)begin
      io_tx_data_valid <= zz_22;
    end
  end

  always @ (zz_17 or zz_21 or zz_44)
  begin
    io_tx_data_payload_fragment <= (8'b00000000);
    if(zz_17)begin
      io_tx_data_payload_fragment <= (8'b00100010);
    end else if(zz_21)begin
      io_tx_data_payload_fragment <= zz_44;
    end
  end

  always @ (io_tx_cmd_ready or zz_55 or zz_57 or zz_58)
  begin
    discoveringRspTxCmdFsm_wantExit <= zz_58;
    if(zz_55)begin
      if(io_tx_cmd_ready)begin
        discoveringRspTxCmdFsm_wantExit <= zz_57;
      end
    end
  end

  always @ (io_tx_data_ready or zz_17 or zz_21 or zz_48 or zz_49 or io_tx_data_payload_last_readableBuffer)
  begin
    discoveringRspTxDataFsm_wantExit <= zz_49;
    if(zz_17)begin
    end else if(zz_21)begin
      if(io_tx_data_ready)begin
        if(io_tx_data_payload_last_readableBuffer)begin
          discoveringRspTxDataFsm_wantExit <= zz_48;
        end
      end
    end
  end

  always @ (io_tx_data_ready or discoveringRspTxDataFsm_stateReg or zz_17 or zz_19 or zz_21 or zz_50 or zz_92 or zz_94 or io_tx_data_payload_last_readableBuffer)
  begin
    discoveringRspTxDataFsm_stateNext <= discoveringRspTxDataFsm_stateReg;
    if(zz_17)begin
      if(io_tx_data_ready)begin
        discoveringRspTxDataFsm_stateNext <= zz_19;
      end
    end else if(zz_21)begin
      if(io_tx_data_ready)begin
        if(io_tx_data_payload_last_readableBuffer)begin
          discoveringRspTxDataFsm_stateNext <= zz_50;
        end
      end
    end
    if(zz_92)begin
      discoveringRspTxDataFsm_stateNext <= zz_94;
    end
  end

  always @ (io_tx_cmd_ready or discoveringRspTxCmdFsm_stateReg or zz_55 or zz_59 or zz_92 or zz_93)
  begin
    discoveringRspTxCmdFsm_stateNext <= discoveringRspTxCmdFsm_stateReg;
    if(zz_55)begin
      if(io_tx_cmd_ready)begin
        discoveringRspTxCmdFsm_stateNext <= zz_59;
      end
    end
    if(zz_92)begin
      discoveringRspTxCmdFsm_stateNext <= zz_93;
    end
  end

  always @ (io_rx_data_valid or fsm_stateReg or zz_66 or zz_68 or zz_70 or zz_71 or zz_74 or zz_75 or zz_76 or zz_78 or zz_80 or zz_87 or zz_89 or zz_90)
  begin
    fsm_stateNext <= fsm_stateReg;
    if(zz_66)begin
      if(zz_68)begin
        if(zz_70)begin
          fsm_stateNext <= zz_71;
        end
      end
    end else if(zz_74)begin
      if(io_rx_data_valid)begin
        if(zz_75)begin
          fsm_stateNext <= zz_76;
        end else begin
          fsm_stateNext <= zz_78;
        end
      end
    end else if(zz_80)begin
      if(zz_87)begin
        fsm_stateNext <= zz_89;
      end
    end else begin
      fsm_stateNext <= zz_90;
    end
  end

  always @ (zz_5 or zz_17 or zz_21 or zz_46)
  begin
    io_tx_data_payload_last_readableBuffer <= zz_5;
    if(zz_17)begin
    end else if(zz_21)begin
      io_tx_data_payload_last_readableBuffer <= zz_46;
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      flushRx_active <= zz_6;
      discoveringRspTxDataFsm_stateReg <= zz_11;
      discoveringRspTxCmdFsm_stateReg <= zz_53;
      fsm_stateReg <= zz_60;
    end else begin
      if(flushRx_active)begin
        if(zz_8)begin
          flushRx_active <= zz_10;
        end
      end
      if(zz_66)begin
        if(zz_68)begin
          if(zz_70)begin
          end else begin
            flushRx_active <= zz_72;
          end
        end
      end else if(zz_74)begin
        if(io_rx_data_valid)begin
          if(zz_75)begin
          end else begin
            flushRx_active <= zz_77;
          end
        end
      end else if(zz_80)begin
        if(zz_87)begin
          flushRx_active <= zz_88;
        end
      end
      discoveringRspTxDataFsm_stateReg <= discoveringRspTxDataFsm_stateNext;
      discoveringRspTxCmdFsm_stateReg <= discoveringRspTxCmdFsm_stateNext;
      fsm_stateReg <= fsm_stateNext;
    end
  end

  always @ (posedge clk)
  begin
    if(zz_17)begin
    end else if(zz_21)begin
      if(io_tx_data_ready)begin
        discoveringRspTxDataFsm_sendMessage_counter <= zz_47;
      end
    end
    if(zz_52)begin
      discoveringRspTxDataFsm_sendMessage_counter <= (3'b000);
    end
  end

endmodule

