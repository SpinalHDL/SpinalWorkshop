
module Dispatcher
( 
  input   io_input_valid,
  output  io_input_ready,
  input  [27:0] io_input_payload_x,
  input  [27:0] io_input_payload_y,
  output reg  io_outputs_0_valid,
  input   io_outputs_0_ready,
  output [27:0] io_outputs_0_payload_x,
  output [27:0] io_outputs_0_payload_y,
  output reg  io_outputs_1_valid,
  input   io_outputs_1_ready,
  output [27:0] io_outputs_1_payload_x,
  output [27:0] io_outputs_1_payload_y,
  output reg  io_outputs_2_valid,
  input   io_outputs_2_ready,
  output [27:0] io_outputs_2_payload_x,
  output [27:0] io_outputs_2_payload_y,
  output reg  io_outputs_3_valid,
  input   io_outputs_3_ready,
  output [27:0] io_outputs_3_payload_x,
  output [27:0] io_outputs_3_payload_y,
  output reg  io_outputs_4_valid,
  input   io_outputs_4_ready,
  output [27:0] io_outputs_4_payload_x,
  output [27:0] io_outputs_4_payload_y,
  output reg  io_outputs_5_valid,
  input   io_outputs_5_ready,
  output [27:0] io_outputs_5_payload_x,
  output [27:0] io_outputs_5_payload_y,
  output reg  io_outputs_6_valid,
  input   io_outputs_6_ready,
  output [27:0] io_outputs_6_payload_x,
  output [27:0] io_outputs_6_payload_y,
  output reg  io_outputs_7_valid,
  input   io_outputs_7_ready,
  output [27:0] io_outputs_7_payload_x,
  output [27:0] io_outputs_7_payload_y,
  input   clk,
  input   reset 
);

  reg  counter_willIncrement;
  wire  counter_willClear;
  reg [2:0] counter_valueNext;
  reg [2:0] counter_value;
  wire [0:0] zz_1;
  wire [0:0] zz_2;
  wire [2:0] zz_3;
  wire [2:0] zz_4;
  wire  zz_5;
  wire [27:0] zz_6;
  wire [27:0] zz_7;
  wire  zz_8;
  wire [27:0] zz_9;
  wire [27:0] zz_10;
  wire  zz_11;
  wire [27:0] zz_12;
  wire [27:0] zz_13;
  wire  zz_14;
  wire [27:0] zz_15;
  wire [27:0] zz_16;
  wire  zz_17;
  wire [27:0] zz_18;
  wire [27:0] zz_19;
  wire  zz_20;
  wire [27:0] zz_21;
  wire [27:0] zz_22;
  wire  zz_23;
  wire [27:0] zz_24;
  wire [27:0] zz_25;
  wire  zz_26;
  wire [27:0] zz_27;
  wire [27:0] zz_28;
  wire  zz_29;
  wire  zz_30;
  wire  zz_31;
  wire  zz_32;
  wire  zz_33;
  wire  zz_34;
  wire  zz_35;
  wire  zz_36;
  wire  zz_37;
  wire  zz_38;
  wire  zz_39;
  wire  zz_40;
  wire  zz_41;
  wire  zz_42;
  wire [0:0] zz_43;
  wire [7:0] zz_44;
  wire  zz_45;
  wire  zz_46;
  wire  zz_47;
  wire  zz_48;
  wire  zz_49;
  wire  zz_50;
  wire  zz_51;
  wire  zz_52;
  wire  zz_53;
  wire  zz_54;
  wire  zz_55;
  wire  io_input_ready_readableBuffer;
  wire [2:0] zz_56;
  assign io_input_ready = io_input_ready_readableBuffer;
  assign io_outputs_0_payload_x = zz_6;
  assign io_outputs_0_payload_y = zz_7;
  assign io_outputs_1_payload_x = zz_9;
  assign io_outputs_1_payload_y = zz_10;
  assign io_outputs_2_payload_x = zz_12;
  assign io_outputs_2_payload_y = zz_13;
  assign io_outputs_3_payload_x = zz_15;
  assign io_outputs_3_payload_y = zz_16;
  assign io_outputs_4_payload_x = zz_18;
  assign io_outputs_4_payload_y = zz_19;
  assign io_outputs_5_payload_x = zz_21;
  assign io_outputs_5_payload_y = zz_22;
  assign io_outputs_6_payload_x = zz_24;
  assign io_outputs_6_payload_y = zz_25;
  assign io_outputs_7_payload_x = zz_27;
  assign io_outputs_7_payload_y = zz_28;
  assign counter_willClear = 1'b0;
  assign zz_1 = counter_willIncrement;
  assign zz_2 = zz_1;
  assign zz_3 = (counter_value + zz_56);
  assign zz_4 = zz_3;
  assign zz_5 = 1'b0;
  assign zz_6 = io_input_payload_x;
  assign zz_7 = io_input_payload_y;
  assign zz_8 = 1'b0;
  assign zz_9 = io_input_payload_x;
  assign zz_10 = io_input_payload_y;
  assign zz_11 = 1'b0;
  assign zz_12 = io_input_payload_x;
  assign zz_13 = io_input_payload_y;
  assign zz_14 = 1'b0;
  assign zz_15 = io_input_payload_x;
  assign zz_16 = io_input_payload_y;
  assign zz_17 = 1'b0;
  assign zz_18 = io_input_payload_x;
  assign zz_19 = io_input_payload_y;
  assign zz_20 = 1'b0;
  assign zz_21 = io_input_payload_x;
  assign zz_22 = io_input_payload_y;
  assign zz_23 = 1'b0;
  assign zz_24 = io_input_payload_x;
  assign zz_25 = io_input_payload_y;
  assign zz_26 = 1'b0;
  assign zz_27 = io_input_payload_x;
  assign zz_28 = io_input_payload_y;
  assign zz_29 = counter_value[0];
  assign zz_30 = (zz_29 ? io_outputs_1_ready : io_outputs_0_ready);
  assign zz_31 = counter_value[0];
  assign zz_32 = (zz_31 ? io_outputs_3_ready : io_outputs_2_ready);
  assign zz_33 = counter_value[0];
  assign zz_34 = (zz_33 ? io_outputs_5_ready : io_outputs_4_ready);
  assign zz_35 = counter_value[0];
  assign zz_36 = (zz_35 ? io_outputs_7_ready : io_outputs_6_ready);
  assign zz_37 = counter_value[1];
  assign zz_38 = (zz_37 ? zz_32 : zz_30);
  assign zz_39 = counter_value[1];
  assign zz_40 = (zz_39 ? zz_36 : zz_34);
  assign zz_41 = counter_value[2];
  assign zz_42 = (zz_41 ? zz_40 : zz_38);
  assign zz_43 = (1'b1);
  assign zz_44 = (zz_43 <<< counter_value);
  assign zz_45 = zz_44[0];
  assign zz_46 = zz_44[1];
  assign zz_47 = zz_44[2];
  assign zz_48 = zz_44[3];
  assign zz_49 = zz_44[4];
  assign zz_50 = zz_44[5];
  assign zz_51 = zz_44[6];
  assign zz_52 = zz_44[7];
  assign zz_53 = (io_input_valid && io_input_ready_readableBuffer);
  assign zz_54 = 1'b1;
  assign zz_55 = 1'b0;
  assign io_input_ready_readableBuffer = zz_42;
  assign zz_56 = zz_2;
  always @ (io_input_valid or zz_5 or zz_45)
  begin
    io_outputs_0_valid <= zz_5;
    if(zz_45)begin
      io_outputs_0_valid <= io_input_valid;
    end
  end

  always @ (io_input_valid or zz_8 or zz_46)
  begin
    io_outputs_1_valid <= zz_8;
    if(zz_46)begin
      io_outputs_1_valid <= io_input_valid;
    end
  end

  always @ (io_input_valid or zz_11 or zz_47)
  begin
    io_outputs_2_valid <= zz_11;
    if(zz_47)begin
      io_outputs_2_valid <= io_input_valid;
    end
  end

  always @ (io_input_valid or zz_14 or zz_48)
  begin
    io_outputs_3_valid <= zz_14;
    if(zz_48)begin
      io_outputs_3_valid <= io_input_valid;
    end
  end

  always @ (io_input_valid or zz_17 or zz_49)
  begin
    io_outputs_4_valid <= zz_17;
    if(zz_49)begin
      io_outputs_4_valid <= io_input_valid;
    end
  end

  always @ (io_input_valid or zz_20 or zz_50)
  begin
    io_outputs_5_valid <= zz_20;
    if(zz_50)begin
      io_outputs_5_valid <= io_input_valid;
    end
  end

  always @ (io_input_valid or zz_23 or zz_51)
  begin
    io_outputs_6_valid <= zz_23;
    if(zz_51)begin
      io_outputs_6_valid <= io_input_valid;
    end
  end

  always @ (io_input_valid or zz_26 or zz_52)
  begin
    io_outputs_7_valid <= zz_26;
    if(zz_52)begin
      io_outputs_7_valid <= io_input_valid;
    end
  end

  always @ (zz_53 or zz_54 or zz_55)
  begin
    counter_willIncrement <= zz_55;
    if(zz_53)begin
      counter_willIncrement <= zz_54;
    end
  end

  always @ (counter_willClear or zz_4)
  begin
    counter_valueNext <= zz_4;
    if(counter_willClear)begin
      counter_valueNext <= (3'b000);
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      counter_value <= (3'b000);
    end else begin
      counter_value <= counter_valueNext;
    end
  end

endmodule

module PixelSolver
( 
  input   io_cmd_valid,
  output  io_cmd_ready,
  input  [27:0] io_cmd_payload_x,
  input  [27:0] io_cmd_payload_y,
  output  io_rsp_valid,
  input   io_rsp_ready,
  output [3:0] io_rsp_payload_iteration,
  input   clk,
  input   reset 
);

  wire  inserter_loopback_valid;
  wire [2:0] inserter_loopback_payload_id;
  wire [27:0] inserter_loopback_payload_x0;
  wire [27:0] inserter_loopback_payload_y0;
  wire [3:0] inserter_loopback_payload_iteration;
  wire  inserter_loopback_payload_done;
  wire [27:0] inserter_loopback_payload_x;
  wire [27:0] inserter_loopback_payload_y;
  wire  zz_1;
  reg  inserter_freeId_willIncrement;
  wire  inserter_freeId_willClear;
  reg [2:0] inserter_freeId_valueNext;
  reg [2:0] inserter_freeId_value;
  wire [0:0] zz_2;
  wire [0:0] zz_3;
  wire [2:0] zz_4;
  wire [2:0] zz_5;
  wire  zz_6;
  wire  zz_7;
  wire [2:0] inserter_cmdContext_id;
  wire [27:0] inserter_cmdContext_x0;
  wire [27:0] inserter_cmdContext_y0;
  wire [3:0] inserter_cmdContext_iteration;
  wire  inserter_cmdContext_done;
  wire [27:0] inserter_cmdContext_x;
  wire [27:0] inserter_cmdContext_y;
  wire [27:0] zz_8;
  wire [27:0] zz_9;
  wire  zz_10;
  wire  inserter_output_valid;
  reg [2:0] inserter_output_payload_id;
  reg [27:0] inserter_output_payload_x0;
  reg [27:0] inserter_output_payload_y0;
  reg [3:0] inserter_output_payload_iteration;
  reg  inserter_output_payload_done;
  reg [27:0] inserter_output_payload_x;
  reg [27:0] inserter_output_payload_y;
  wire  zz_11;
  wire [27:0] zz_12;
  wire [27:0] zz_13;
  wire [27:0] zz_14;
  wire [27:0] zz_15;
  wire [27:0] zz_16;
  wire [27:0] zz_17;
  wire [27:0] zz_18;
  wire [27:0] zz_19;
  wire  zz_20;
  reg  mulStage_input_valid;
  reg [2:0] mulStage_input_payload_id;
  reg [27:0] mulStage_input_payload_x0;
  reg [27:0] mulStage_input_payload_y0;
  reg [3:0] mulStage_input_payload_iteration;
  reg  mulStage_input_payload_done;
  reg [27:0] mulStage_input_payload_x;
  reg [27:0] mulStage_input_payload_y;
  wire [27:0] zz_21;
  wire [27:0] zz_22;
  wire [27:0] zz_23;
  wire [27:0] zz_24;
  wire  zz_25;
  wire  mulStage_output_valid;
  wire [2:0] mulStage_output_payload_id;
  wire [27:0] mulStage_output_payload_x0;
  wire [27:0] mulStage_output_payload_y0;
  wire [3:0] mulStage_output_payload_iteration;
  wire  mulStage_output_payload_done;
  wire [27:0] mulStage_output_payload_xx;
  wire [27:0] mulStage_output_payload_yy;
  wire [27:0] mulStage_output_payload_xy;
  wire [27:0] zz_26;
  wire [27:0] zz_27;
  wire [55:0] zz_28;
  wire [55:0] zz_29;
  wire [35:0] zz_30;
  wire [35:0] zz_31;
  wire [55:0] zz_32;
  wire [55:0] zz_33;
  wire [35:0] zz_34;
  wire [35:0] zz_35;
  wire [55:0] zz_36;
  wire [55:0] zz_37;
  wire [35:0] zz_38;
  wire [35:0] zz_39;
  reg  zz_40;
  reg [2:0] zz_41;
  reg [3:0] zz_42;
  reg  zz_43;
  wire [27:0] zz_44;
  wire [27:0] zz_45;
  wire [27:0] zz_46;
  wire [27:0] zz_47;
  wire [27:0] zz_48;
  wire  zz_49;
  reg  addStage_input_valid;
  reg [2:0] addStage_input_payload_id;
  reg [27:0] addStage_input_payload_x0;
  reg [27:0] addStage_input_payload_y0;
  reg [3:0] addStage_input_payload_iteration;
  reg  addStage_input_payload_done;
  reg [27:0] addStage_input_payload_xx;
  reg [27:0] addStage_input_payload_yy;
  reg [27:0] addStage_input_payload_xy;
  reg [27:0] zz_50;
  reg [27:0] zz_51;
  reg [27:0] zz_52;
  reg [27:0] zz_53;
  reg [27:0] zz_54;
  wire  zz_55;
  wire  addStage_output_valid;
  wire [2:0] addStage_output_payload_id;
  wire [27:0] addStage_output_payload_x0;
  wire [27:0] addStage_output_payload_y0;
  wire [3:0] addStage_output_payload_iteration;
  wire  addStage_output_payload_done;
  wire [27:0] addStage_output_payload_x;
  wire [27:0] addStage_output_payload_y;
  wire [27:0] zz_56;
  wire [27:0] zz_57;
  wire [27:0] zz_58;
  wire [27:0] zz_59;
  wire [27:0] zz_60;
  wire [27:0] zz_61;
  wire [28:0] zz_62;
  wire [28:0] zz_63;
  wire [28:0] zz_64;
  wire [28:0] zz_65;
  wire [27:0] zz_66;
  wire [27:0] zz_67;
  wire  zz_68;
  wire  zz_69;
  wire [3:0] zz_70;
  wire  zz_71;
  wire  zz_72;
  wire  zz_73;
  wire [0:0] zz_74;
  wire [0:0] zz_75;
  wire [3:0] zz_76;
  reg  router_input_valid;
  reg [2:0] router_input_payload_id;
  reg [27:0] router_input_payload_x0;
  reg [27:0] router_input_payload_y0;
  reg [3:0] router_input_payload_iteration;
  reg  router_input_payload_done;
  reg [27:0] router_input_payload_x;
  reg [27:0] router_input_payload_y;
  wire [27:0] zz_77;
  wire [27:0] zz_78;
  wire [27:0] zz_79;
  wire [27:0] zz_80;
  wire  zz_81;
  wire  zz_82;
  reg  router_wantedId_willIncrement;
  wire  router_wantedId_willClear;
  reg [2:0] router_wantedId_valueNext;
  reg [2:0] router_wantedId_value;
  wire [0:0] zz_83;
  wire [0:0] zz_84;
  wire [2:0] zz_85;
  wire [2:0] zz_86;
  wire  zz_87;
  wire  zz_88;
  wire  zz_89;
  wire  zz_90;
  wire  zz_91;
  wire  zz_92;
  wire  zz_93;
  wire  zz_94;
  wire  zz_95;
  wire  zz_96;
  wire  zz_97;
  wire [27:0] zz_98;
  wire [27:0] zz_99;
  wire [27:0] zz_100;
  wire [27:0] zz_101;
  wire  io_cmd_ready_readableBuffer;
  wire  io_rsp_valid_readableBuffer;
  wire [2:0] zz_102;
  wire [2:0] zz_103;
  wire [3:0] zz_104;
  wire [27:0] zz_105;
  wire [27:0] zz_106;
  wire [28:0] zz_107;
  wire [27:0] zz_108;
  wire [27:0] zz_109;
  assign io_cmd_ready = io_cmd_ready_readableBuffer;
  assign io_rsp_valid = io_rsp_valid_readableBuffer;
  assign io_rsp_payload_iteration = router_input_payload_iteration;
  assign inserter_loopback_valid = zz_97;
  assign inserter_loopback_payload_id = router_input_payload_id;
  assign inserter_loopback_payload_x0 = zz_98;
  assign inserter_loopback_payload_y0 = zz_99;
  assign inserter_loopback_payload_iteration = router_input_payload_iteration;
  assign inserter_loopback_payload_done = router_input_payload_done;
  assign inserter_loopback_payload_x = zz_100;
  assign inserter_loopback_payload_y = zz_101;
  assign zz_1 = (io_cmd_valid && io_cmd_ready_readableBuffer);
  assign inserter_freeId_willClear = 1'b0;
  assign zz_2 = inserter_freeId_willIncrement;
  assign zz_3 = zz_2;
  assign zz_4 = (inserter_freeId_value + zz_102);
  assign zz_5 = zz_4;
  assign zz_6 = 1'b1;
  assign zz_7 = 1'b0;
  assign inserter_cmdContext_id = inserter_freeId_value;
  assign inserter_cmdContext_x0 = zz_8;
  assign inserter_cmdContext_y0 = zz_9;
  assign inserter_cmdContext_iteration = (4'b0000);
  assign inserter_cmdContext_done = zz_10;
  assign inserter_cmdContext_x = (28'b0000000000000000000000000000);
  assign inserter_cmdContext_y = (28'b0000000000000000000000000000);
  assign zz_8 = io_cmd_payload_x;
  assign zz_9 = io_cmd_payload_y;
  assign zz_10 = 1'b0;
  assign inserter_output_valid = zz_11;
  assign zz_11 = (io_cmd_valid || inserter_loopback_valid);
  assign zz_12 = inserter_loopback_payload_x0;
  assign zz_13 = inserter_loopback_payload_y0;
  assign zz_14 = inserter_loopback_payload_x;
  assign zz_15 = inserter_loopback_payload_y;
  assign zz_16 = inserter_cmdContext_x0;
  assign zz_17 = inserter_cmdContext_y0;
  assign zz_18 = inserter_cmdContext_x;
  assign zz_19 = inserter_cmdContext_y;
  assign zz_20 = (! inserter_loopback_valid);
  assign zz_21 = inserter_output_payload_x0;
  assign zz_22 = inserter_output_payload_y0;
  assign zz_23 = inserter_output_payload_x;
  assign zz_24 = inserter_output_payload_y;
  assign zz_25 = 1'b0;
  assign mulStage_output_valid = mulStage_input_valid;
  assign mulStage_output_payload_id = mulStage_input_payload_id;
  assign mulStage_output_payload_x0 = zz_26;
  assign mulStage_output_payload_y0 = zz_27;
  assign mulStage_output_payload_iteration = mulStage_input_payload_iteration;
  assign mulStage_output_payload_done = mulStage_input_payload_done;
  assign mulStage_output_payload_xx = zz_109;
  assign mulStage_output_payload_yy = zz_105;
  assign mulStage_output_payload_xy = zz_108;
  assign zz_26 = mulStage_input_payload_x0;
  assign zz_27 = mulStage_input_payload_y0;
  assign zz_28 = ($signed(mulStage_input_payload_x) * $signed(mulStage_input_payload_x));
  assign zz_29 = zz_28;
  assign zz_30 = (zz_29 >>> 20);
  assign zz_31 = zz_30;
  assign zz_32 = ($signed(mulStage_input_payload_y) * $signed(mulStage_input_payload_y));
  assign zz_33 = zz_32;
  assign zz_34 = (zz_33 >>> 20);
  assign zz_35 = zz_34;
  assign zz_36 = ($signed(mulStage_input_payload_x) * $signed(mulStage_input_payload_y));
  assign zz_37 = zz_36;
  assign zz_38 = (zz_37 >>> 20);
  assign zz_39 = zz_38;
  assign zz_44 = mulStage_output_payload_x0;
  assign zz_45 = mulStage_output_payload_y0;
  assign zz_46 = mulStage_output_payload_xx;
  assign zz_47 = mulStage_output_payload_yy;
  assign zz_48 = mulStage_output_payload_xy;
  assign zz_49 = 1'b0;
  assign zz_55 = 1'b0;
  assign addStage_output_valid = addStage_input_valid;
  assign addStage_output_payload_id = addStage_input_payload_id;
  assign addStage_output_payload_x0 = zz_56;
  assign addStage_output_payload_y0 = zz_57;
  assign addStage_output_payload_iteration = zz_76;
  assign addStage_output_payload_done = zz_72;
  assign addStage_output_payload_x = zz_61;
  assign addStage_output_payload_y = zz_106;
  assign zz_56 = addStage_input_payload_x0;
  assign zz_57 = addStage_input_payload_y0;
  assign zz_58 = ($signed(addStage_input_payload_xx) - $signed(addStage_input_payload_yy));
  assign zz_59 = ($signed(zz_58) + $signed(addStage_input_payload_x0));
  assign zz_60 = zz_59;
  assign zz_61 = zz_60;
  assign zz_62 = (addStage_input_payload_xy <<< 1);
  assign zz_63 = ($signed(zz_62) + $signed(zz_107));
  assign zz_64 = zz_63;
  assign zz_65 = zz_64;
  assign zz_66 = ($signed(addStage_input_payload_xx) + $signed(addStage_input_payload_yy));
  assign zz_67 = (28'b0000010000000000000000000000);
  assign zz_68 = ($signed(zz_67) <= $signed(zz_66));
  assign zz_69 = (addStage_input_payload_done || zz_68);
  assign zz_70 = (4'b1111);
  assign zz_71 = (addStage_input_payload_iteration == zz_70);
  assign zz_72 = (zz_69 || zz_71);
  assign zz_73 = (! addStage_output_payload_done);
  assign zz_74 = zz_73;
  assign zz_75 = zz_74;
  assign zz_76 = (addStage_input_payload_iteration + zz_104);
  assign zz_77 = addStage_output_payload_x0;
  assign zz_78 = addStage_output_payload_y0;
  assign zz_79 = addStage_output_payload_x;
  assign zz_80 = addStage_output_payload_y;
  assign zz_81 = 1'b0;
  assign zz_82 = (io_rsp_valid_readableBuffer && io_rsp_ready);
  assign router_wantedId_willClear = 1'b0;
  assign zz_83 = router_wantedId_willIncrement;
  assign zz_84 = zz_83;
  assign zz_85 = (router_wantedId_value + zz_103);
  assign zz_86 = zz_85;
  assign zz_87 = 1'b1;
  assign zz_88 = 1'b0;
  assign zz_89 = (router_input_valid && router_input_payload_done);
  assign zz_90 = (router_wantedId_value == router_input_payload_id);
  assign zz_91 = (zz_89 && zz_90);
  assign zz_92 = (router_wantedId_value == router_input_payload_id);
  assign zz_93 = (router_input_payload_done && zz_92);
  assign zz_94 = (! zz_93);
  assign zz_95 = (! io_rsp_ready);
  assign zz_96 = (zz_94 || zz_95);
  assign zz_97 = (router_input_valid && zz_96);
  assign zz_98 = router_input_payload_x0;
  assign zz_99 = router_input_payload_y0;
  assign zz_100 = router_input_payload_x;
  assign zz_101 = router_input_payload_y;
  assign io_cmd_ready_readableBuffer = zz_20;
  assign io_rsp_valid_readableBuffer = zz_91;
  assign zz_102 = zz_3;
  assign zz_103 = zz_84;
  assign zz_104 = zz_75;
  assign zz_105 = $signed(zz_35);
  assign zz_106 = $signed(zz_65);
  assign zz_107 = $signed(addStage_input_payload_y0);
  assign zz_108 = $signed(zz_39);
  assign zz_109 = $signed(zz_31);
  always @ (zz_1 or zz_6 or zz_7)
  begin
    inserter_freeId_willIncrement <= zz_7;
    if(zz_1)begin
      inserter_freeId_willIncrement <= zz_6;
    end
  end

  always @ (inserter_freeId_willClear or zz_5)
  begin
    inserter_freeId_valueNext <= zz_5;
    if(inserter_freeId_willClear)begin
      inserter_freeId_valueNext <= (3'b000);
    end
  end

  always @ (inserter_loopback_valid or inserter_loopback_payload_id or inserter_cmdContext_id)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_id <= inserter_loopback_payload_id;
    end else begin
      inserter_output_payload_id <= inserter_cmdContext_id;
    end
  end

  always @ (inserter_loopback_valid or zz_12 or zz_16)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_x0 <= zz_12;
    end else begin
      inserter_output_payload_x0 <= zz_16;
    end
  end

  always @ (inserter_loopback_valid or zz_13 or zz_17)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_y0 <= zz_13;
    end else begin
      inserter_output_payload_y0 <= zz_17;
    end
  end

  always @ (inserter_loopback_valid or inserter_loopback_payload_iteration or inserter_cmdContext_iteration)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_iteration <= inserter_loopback_payload_iteration;
    end else begin
      inserter_output_payload_iteration <= inserter_cmdContext_iteration;
    end
  end

  always @ (inserter_loopback_valid or inserter_loopback_payload_done or inserter_cmdContext_done)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_done <= inserter_loopback_payload_done;
    end else begin
      inserter_output_payload_done <= inserter_cmdContext_done;
    end
  end

  always @ (inserter_loopback_valid or zz_14 or zz_18)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_x <= zz_14;
    end else begin
      inserter_output_payload_x <= zz_18;
    end
  end

  always @ (inserter_loopback_valid or zz_15 or zz_19)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_y <= zz_15;
    end else begin
      inserter_output_payload_y <= zz_19;
    end
  end

  always @ (zz_82 or zz_87 or zz_88)
  begin
    router_wantedId_willIncrement <= zz_88;
    if(zz_82)begin
      router_wantedId_willIncrement <= zz_87;
    end
  end

  always @ (router_wantedId_willClear or zz_86)
  begin
    router_wantedId_valueNext <= zz_86;
    if(router_wantedId_willClear)begin
      router_wantedId_valueNext <= (3'b000);
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      inserter_freeId_value <= (3'b000);
      mulStage_input_valid <= zz_25;
      zz_40 <= zz_49;
      addStage_input_valid <= zz_55;
      router_input_valid <= zz_81;
      router_wantedId_value <= (3'b000);
    end else begin
      inserter_freeId_value <= inserter_freeId_valueNext;
      mulStage_input_valid <= inserter_output_valid;
      zz_40 <= mulStage_output_valid;
      addStage_input_valid <= zz_40;
      router_input_valid <= addStage_output_valid;
      router_wantedId_value <= router_wantedId_valueNext;
    end
  end

  always @ (posedge clk)
  begin
    mulStage_input_payload_id <= inserter_output_payload_id;
    mulStage_input_payload_x0 <= zz_21;
    mulStage_input_payload_y0 <= zz_22;
    mulStage_input_payload_iteration <= inserter_output_payload_iteration;
    mulStage_input_payload_done <= inserter_output_payload_done;
    mulStage_input_payload_x <= zz_23;
    mulStage_input_payload_y <= zz_24;
    zz_41 <= mulStage_output_payload_id;
    zz_50 <= zz_44;
    zz_51 <= zz_45;
    zz_42 <= mulStage_output_payload_iteration;
    zz_43 <= mulStage_output_payload_done;
    zz_52 <= zz_46;
    zz_53 <= zz_47;
    zz_54 <= zz_48;
    addStage_input_payload_id <= zz_41;
    addStage_input_payload_x0 <= zz_50;
    addStage_input_payload_y0 <= zz_51;
    addStage_input_payload_iteration <= zz_42;
    addStage_input_payload_done <= zz_43;
    addStage_input_payload_xx <= zz_52;
    addStage_input_payload_yy <= zz_53;
    addStage_input_payload_xy <= zz_54;
    router_input_payload_id <= addStage_output_payload_id;
    router_input_payload_x0 <= zz_77;
    router_input_payload_y0 <= zz_78;
    router_input_payload_iteration <= addStage_output_payload_iteration;
    router_input_payload_done <= addStage_output_payload_done;
    router_input_payload_x <= zz_79;
    router_input_payload_y <= zz_80;
  end

endmodule

module PixelSolver_1
( 
  input   io_cmd_valid,
  output  io_cmd_ready,
  input  [27:0] io_cmd_payload_x,
  input  [27:0] io_cmd_payload_y,
  output  io_rsp_valid,
  input   io_rsp_ready,
  output [3:0] io_rsp_payload_iteration,
  input   clk,
  input   reset 
);

  wire  inserter_loopback_valid;
  wire [2:0] inserter_loopback_payload_id;
  wire [27:0] inserter_loopback_payload_x0;
  wire [27:0] inserter_loopback_payload_y0;
  wire [3:0] inserter_loopback_payload_iteration;
  wire  inserter_loopback_payload_done;
  wire [27:0] inserter_loopback_payload_x;
  wire [27:0] inserter_loopback_payload_y;
  wire  zz_1;
  reg  inserter_freeId_willIncrement;
  wire  inserter_freeId_willClear;
  reg [2:0] inserter_freeId_valueNext;
  reg [2:0] inserter_freeId_value;
  wire [0:0] zz_2;
  wire [0:0] zz_3;
  wire [2:0] zz_4;
  wire [2:0] zz_5;
  wire  zz_6;
  wire  zz_7;
  wire [2:0] inserter_cmdContext_id;
  wire [27:0] inserter_cmdContext_x0;
  wire [27:0] inserter_cmdContext_y0;
  wire [3:0] inserter_cmdContext_iteration;
  wire  inserter_cmdContext_done;
  wire [27:0] inserter_cmdContext_x;
  wire [27:0] inserter_cmdContext_y;
  wire [27:0] zz_8;
  wire [27:0] zz_9;
  wire  zz_10;
  wire  inserter_output_valid;
  reg [2:0] inserter_output_payload_id;
  reg [27:0] inserter_output_payload_x0;
  reg [27:0] inserter_output_payload_y0;
  reg [3:0] inserter_output_payload_iteration;
  reg  inserter_output_payload_done;
  reg [27:0] inserter_output_payload_x;
  reg [27:0] inserter_output_payload_y;
  wire  zz_11;
  wire [27:0] zz_12;
  wire [27:0] zz_13;
  wire [27:0] zz_14;
  wire [27:0] zz_15;
  wire [27:0] zz_16;
  wire [27:0] zz_17;
  wire [27:0] zz_18;
  wire [27:0] zz_19;
  wire  zz_20;
  reg  mulStage_input_valid;
  reg [2:0] mulStage_input_payload_id;
  reg [27:0] mulStage_input_payload_x0;
  reg [27:0] mulStage_input_payload_y0;
  reg [3:0] mulStage_input_payload_iteration;
  reg  mulStage_input_payload_done;
  reg [27:0] mulStage_input_payload_x;
  reg [27:0] mulStage_input_payload_y;
  wire [27:0] zz_21;
  wire [27:0] zz_22;
  wire [27:0] zz_23;
  wire [27:0] zz_24;
  wire  zz_25;
  wire  mulStage_output_valid;
  wire [2:0] mulStage_output_payload_id;
  wire [27:0] mulStage_output_payload_x0;
  wire [27:0] mulStage_output_payload_y0;
  wire [3:0] mulStage_output_payload_iteration;
  wire  mulStage_output_payload_done;
  wire [27:0] mulStage_output_payload_xx;
  wire [27:0] mulStage_output_payload_yy;
  wire [27:0] mulStage_output_payload_xy;
  wire [27:0] zz_26;
  wire [27:0] zz_27;
  wire [55:0] zz_28;
  wire [55:0] zz_29;
  wire [35:0] zz_30;
  wire [35:0] zz_31;
  wire [55:0] zz_32;
  wire [55:0] zz_33;
  wire [35:0] zz_34;
  wire [35:0] zz_35;
  wire [55:0] zz_36;
  wire [55:0] zz_37;
  wire [35:0] zz_38;
  wire [35:0] zz_39;
  reg  zz_40;
  reg [2:0] zz_41;
  reg [3:0] zz_42;
  reg  zz_43;
  wire [27:0] zz_44;
  wire [27:0] zz_45;
  wire [27:0] zz_46;
  wire [27:0] zz_47;
  wire [27:0] zz_48;
  wire  zz_49;
  reg  addStage_input_valid;
  reg [2:0] addStage_input_payload_id;
  reg [27:0] addStage_input_payload_x0;
  reg [27:0] addStage_input_payload_y0;
  reg [3:0] addStage_input_payload_iteration;
  reg  addStage_input_payload_done;
  reg [27:0] addStage_input_payload_xx;
  reg [27:0] addStage_input_payload_yy;
  reg [27:0] addStage_input_payload_xy;
  reg [27:0] zz_50;
  reg [27:0] zz_51;
  reg [27:0] zz_52;
  reg [27:0] zz_53;
  reg [27:0] zz_54;
  wire  zz_55;
  wire  addStage_output_valid;
  wire [2:0] addStage_output_payload_id;
  wire [27:0] addStage_output_payload_x0;
  wire [27:0] addStage_output_payload_y0;
  wire [3:0] addStage_output_payload_iteration;
  wire  addStage_output_payload_done;
  wire [27:0] addStage_output_payload_x;
  wire [27:0] addStage_output_payload_y;
  wire [27:0] zz_56;
  wire [27:0] zz_57;
  wire [27:0] zz_58;
  wire [27:0] zz_59;
  wire [27:0] zz_60;
  wire [27:0] zz_61;
  wire [28:0] zz_62;
  wire [28:0] zz_63;
  wire [28:0] zz_64;
  wire [28:0] zz_65;
  wire [27:0] zz_66;
  wire [27:0] zz_67;
  wire  zz_68;
  wire  zz_69;
  wire [3:0] zz_70;
  wire  zz_71;
  wire  zz_72;
  wire  zz_73;
  wire [0:0] zz_74;
  wire [0:0] zz_75;
  wire [3:0] zz_76;
  reg  router_input_valid;
  reg [2:0] router_input_payload_id;
  reg [27:0] router_input_payload_x0;
  reg [27:0] router_input_payload_y0;
  reg [3:0] router_input_payload_iteration;
  reg  router_input_payload_done;
  reg [27:0] router_input_payload_x;
  reg [27:0] router_input_payload_y;
  wire [27:0] zz_77;
  wire [27:0] zz_78;
  wire [27:0] zz_79;
  wire [27:0] zz_80;
  wire  zz_81;
  wire  zz_82;
  reg  router_wantedId_willIncrement;
  wire  router_wantedId_willClear;
  reg [2:0] router_wantedId_valueNext;
  reg [2:0] router_wantedId_value;
  wire [0:0] zz_83;
  wire [0:0] zz_84;
  wire [2:0] zz_85;
  wire [2:0] zz_86;
  wire  zz_87;
  wire  zz_88;
  wire  zz_89;
  wire  zz_90;
  wire  zz_91;
  wire  zz_92;
  wire  zz_93;
  wire  zz_94;
  wire  zz_95;
  wire  zz_96;
  wire  zz_97;
  wire [27:0] zz_98;
  wire [27:0] zz_99;
  wire [27:0] zz_100;
  wire [27:0] zz_101;
  wire  io_cmd_ready_readableBuffer;
  wire  io_rsp_valid_readableBuffer;
  wire [2:0] zz_102;
  wire [3:0] zz_103;
  wire [27:0] zz_104;
  wire [27:0] zz_105;
  wire [28:0] zz_106;
  wire [27:0] zz_107;
  wire [27:0] zz_108;
  wire [2:0] zz_109;
  assign io_cmd_ready = io_cmd_ready_readableBuffer;
  assign io_rsp_valid = io_rsp_valid_readableBuffer;
  assign io_rsp_payload_iteration = router_input_payload_iteration;
  assign inserter_loopback_valid = zz_97;
  assign inserter_loopback_payload_id = router_input_payload_id;
  assign inserter_loopback_payload_x0 = zz_98;
  assign inserter_loopback_payload_y0 = zz_99;
  assign inserter_loopback_payload_iteration = router_input_payload_iteration;
  assign inserter_loopback_payload_done = router_input_payload_done;
  assign inserter_loopback_payload_x = zz_100;
  assign inserter_loopback_payload_y = zz_101;
  assign zz_1 = (io_cmd_valid && io_cmd_ready_readableBuffer);
  assign inserter_freeId_willClear = 1'b0;
  assign zz_2 = inserter_freeId_willIncrement;
  assign zz_3 = zz_2;
  assign zz_4 = (inserter_freeId_value + zz_102);
  assign zz_5 = zz_4;
  assign zz_6 = 1'b1;
  assign zz_7 = 1'b0;
  assign inserter_cmdContext_id = inserter_freeId_value;
  assign inserter_cmdContext_x0 = zz_8;
  assign inserter_cmdContext_y0 = zz_9;
  assign inserter_cmdContext_iteration = (4'b0000);
  assign inserter_cmdContext_done = zz_10;
  assign inserter_cmdContext_x = (28'b0000000000000000000000000000);
  assign inserter_cmdContext_y = (28'b0000000000000000000000000000);
  assign zz_8 = io_cmd_payload_x;
  assign zz_9 = io_cmd_payload_y;
  assign zz_10 = 1'b0;
  assign inserter_output_valid = zz_11;
  assign zz_11 = (io_cmd_valid || inserter_loopback_valid);
  assign zz_12 = inserter_loopback_payload_x0;
  assign zz_13 = inserter_loopback_payload_y0;
  assign zz_14 = inserter_loopback_payload_x;
  assign zz_15 = inserter_loopback_payload_y;
  assign zz_16 = inserter_cmdContext_x0;
  assign zz_17 = inserter_cmdContext_y0;
  assign zz_18 = inserter_cmdContext_x;
  assign zz_19 = inserter_cmdContext_y;
  assign zz_20 = (! inserter_loopback_valid);
  assign zz_21 = inserter_output_payload_x0;
  assign zz_22 = inserter_output_payload_y0;
  assign zz_23 = inserter_output_payload_x;
  assign zz_24 = inserter_output_payload_y;
  assign zz_25 = 1'b0;
  assign mulStage_output_valid = mulStage_input_valid;
  assign mulStage_output_payload_id = mulStage_input_payload_id;
  assign mulStage_output_payload_x0 = zz_26;
  assign mulStage_output_payload_y0 = zz_27;
  assign mulStage_output_payload_iteration = mulStage_input_payload_iteration;
  assign mulStage_output_payload_done = mulStage_input_payload_done;
  assign mulStage_output_payload_xx = zz_108;
  assign mulStage_output_payload_yy = zz_104;
  assign mulStage_output_payload_xy = zz_107;
  assign zz_26 = mulStage_input_payload_x0;
  assign zz_27 = mulStage_input_payload_y0;
  assign zz_28 = ($signed(mulStage_input_payload_x) * $signed(mulStage_input_payload_x));
  assign zz_29 = zz_28;
  assign zz_30 = (zz_29 >>> 20);
  assign zz_31 = zz_30;
  assign zz_32 = ($signed(mulStage_input_payload_y) * $signed(mulStage_input_payload_y));
  assign zz_33 = zz_32;
  assign zz_34 = (zz_33 >>> 20);
  assign zz_35 = zz_34;
  assign zz_36 = ($signed(mulStage_input_payload_x) * $signed(mulStage_input_payload_y));
  assign zz_37 = zz_36;
  assign zz_38 = (zz_37 >>> 20);
  assign zz_39 = zz_38;
  assign zz_44 = mulStage_output_payload_x0;
  assign zz_45 = mulStage_output_payload_y0;
  assign zz_46 = mulStage_output_payload_xx;
  assign zz_47 = mulStage_output_payload_yy;
  assign zz_48 = mulStage_output_payload_xy;
  assign zz_49 = 1'b0;
  assign zz_55 = 1'b0;
  assign addStage_output_valid = addStage_input_valid;
  assign addStage_output_payload_id = addStage_input_payload_id;
  assign addStage_output_payload_x0 = zz_56;
  assign addStage_output_payload_y0 = zz_57;
  assign addStage_output_payload_iteration = zz_76;
  assign addStage_output_payload_done = zz_72;
  assign addStage_output_payload_x = zz_61;
  assign addStage_output_payload_y = zz_105;
  assign zz_56 = addStage_input_payload_x0;
  assign zz_57 = addStage_input_payload_y0;
  assign zz_58 = ($signed(addStage_input_payload_xx) - $signed(addStage_input_payload_yy));
  assign zz_59 = ($signed(zz_58) + $signed(addStage_input_payload_x0));
  assign zz_60 = zz_59;
  assign zz_61 = zz_60;
  assign zz_62 = (addStage_input_payload_xy <<< 1);
  assign zz_63 = ($signed(zz_62) + $signed(zz_106));
  assign zz_64 = zz_63;
  assign zz_65 = zz_64;
  assign zz_66 = ($signed(addStage_input_payload_xx) + $signed(addStage_input_payload_yy));
  assign zz_67 = (28'b0000010000000000000000000000);
  assign zz_68 = ($signed(zz_67) <= $signed(zz_66));
  assign zz_69 = (addStage_input_payload_done || zz_68);
  assign zz_70 = (4'b1111);
  assign zz_71 = (addStage_input_payload_iteration == zz_70);
  assign zz_72 = (zz_69 || zz_71);
  assign zz_73 = (! addStage_output_payload_done);
  assign zz_74 = zz_73;
  assign zz_75 = zz_74;
  assign zz_76 = (addStage_input_payload_iteration + zz_103);
  assign zz_77 = addStage_output_payload_x0;
  assign zz_78 = addStage_output_payload_y0;
  assign zz_79 = addStage_output_payload_x;
  assign zz_80 = addStage_output_payload_y;
  assign zz_81 = 1'b0;
  assign zz_82 = (io_rsp_valid_readableBuffer && io_rsp_ready);
  assign router_wantedId_willClear = 1'b0;
  assign zz_83 = router_wantedId_willIncrement;
  assign zz_84 = zz_83;
  assign zz_85 = (router_wantedId_value + zz_109);
  assign zz_86 = zz_85;
  assign zz_87 = 1'b1;
  assign zz_88 = 1'b0;
  assign zz_89 = (router_input_valid && router_input_payload_done);
  assign zz_90 = (router_wantedId_value == router_input_payload_id);
  assign zz_91 = (zz_89 && zz_90);
  assign zz_92 = (router_wantedId_value == router_input_payload_id);
  assign zz_93 = (router_input_payload_done && zz_92);
  assign zz_94 = (! zz_93);
  assign zz_95 = (! io_rsp_ready);
  assign zz_96 = (zz_94 || zz_95);
  assign zz_97 = (router_input_valid && zz_96);
  assign zz_98 = router_input_payload_x0;
  assign zz_99 = router_input_payload_y0;
  assign zz_100 = router_input_payload_x;
  assign zz_101 = router_input_payload_y;
  assign io_cmd_ready_readableBuffer = zz_20;
  assign io_rsp_valid_readableBuffer = zz_91;
  assign zz_102 = zz_3;
  assign zz_103 = zz_75;
  assign zz_104 = $signed(zz_35);
  assign zz_105 = $signed(zz_65);
  assign zz_106 = $signed(addStage_input_payload_y0);
  assign zz_107 = $signed(zz_39);
  assign zz_108 = $signed(zz_31);
  assign zz_109 = zz_84;
  always @ (zz_1 or zz_6 or zz_7)
  begin
    inserter_freeId_willIncrement <= zz_7;
    if(zz_1)begin
      inserter_freeId_willIncrement <= zz_6;
    end
  end

  always @ (inserter_freeId_willClear or zz_5)
  begin
    inserter_freeId_valueNext <= zz_5;
    if(inserter_freeId_willClear)begin
      inserter_freeId_valueNext <= (3'b000);
    end
  end

  always @ (inserter_loopback_valid or inserter_loopback_payload_id or inserter_cmdContext_id)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_id <= inserter_loopback_payload_id;
    end else begin
      inserter_output_payload_id <= inserter_cmdContext_id;
    end
  end

  always @ (inserter_loopback_valid or zz_12 or zz_16)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_x0 <= zz_12;
    end else begin
      inserter_output_payload_x0 <= zz_16;
    end
  end

  always @ (inserter_loopback_valid or zz_13 or zz_17)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_y0 <= zz_13;
    end else begin
      inserter_output_payload_y0 <= zz_17;
    end
  end

  always @ (inserter_loopback_valid or inserter_loopback_payload_iteration or inserter_cmdContext_iteration)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_iteration <= inserter_loopback_payload_iteration;
    end else begin
      inserter_output_payload_iteration <= inserter_cmdContext_iteration;
    end
  end

  always @ (inserter_loopback_valid or inserter_loopback_payload_done or inserter_cmdContext_done)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_done <= inserter_loopback_payload_done;
    end else begin
      inserter_output_payload_done <= inserter_cmdContext_done;
    end
  end

  always @ (inserter_loopback_valid or zz_14 or zz_18)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_x <= zz_14;
    end else begin
      inserter_output_payload_x <= zz_18;
    end
  end

  always @ (inserter_loopback_valid or zz_15 or zz_19)
  begin
    if(inserter_loopback_valid)begin
      inserter_output_payload_y <= zz_15;
    end else begin
      inserter_output_payload_y <= zz_19;
    end
  end

  always @ (zz_82 or zz_87 or zz_88)
  begin
    router_wantedId_willIncrement <= zz_88;
    if(zz_82)begin
      router_wantedId_willIncrement <= zz_87;
    end
  end

  always @ (router_wantedId_willClear or zz_86)
  begin
    router_wantedId_valueNext <= zz_86;
    if(router_wantedId_willClear)begin
      router_wantedId_valueNext <= (3'b000);
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      inserter_freeId_value <= (3'b000);
      mulStage_input_valid <= zz_25;
      zz_40 <= zz_49;
      addStage_input_valid <= zz_55;
      router_input_valid <= zz_81;
      router_wantedId_value <= (3'b000);
    end else begin
      inserter_freeId_value <= inserter_freeId_valueNext;
      mulStage_input_valid <= inserter_output_valid;
      zz_40 <= mulStage_output_valid;
      addStage_input_valid <= zz_40;
      router_input_valid <= addStage_output_valid;
      router_wantedId_value <= router_wantedId_valueNext;
    end
  end

  always @ (posedge clk)
  begin
    mulStage_input_payload_id <= inserter_output_payload_id;
    mulStage_input_payload_x0 <= zz_21;
    mulStage_input_payload_y0 <= zz_22;
    mulStage_input_payload_iteration <= inserter_output_payload_iteration;
    mulStage_input_payload_done <= inserter_output_payload_done;
    mulStage_input_payload_x <= zz_23;
    mulStage_input_payload_y <= zz_24;
    zz_41 <= mulStage_output_payload_id;
    zz_50 <= zz_44;
    zz_51 <= zz_45;
    zz_42 <= mulStage_output_payload_iteration;
    zz_43 <= mulStage_output_payload_done;
    zz_52 <= zz_46;
    zz_53 <= zz_47;
    zz_54 <= zz_48;
    addStage_input_payload_id <= zz_41;
    addStage_input_payload_x0 <= zz_50;
    addStage_input_payload_y0 <= zz_51;
    addStage_input_payload_iteration <= zz_42;
    addStage_input_payload_done <= zz_43;
    addStage_input_payload_xx <= zz_52;
    addStage_input_payload_yy <= zz_53;
    addStage_input_payload_xy <= zz_54;
    router_input_payload_id <= addStage_output_payload_id;
    router_input_payload_x0 <= zz_77;
    router_input_payload_y0 <= zz_78;
    router_input_payload_iteration <= addStage_output_payload_iteration;
    router_input_payload_done <= addStage_output_payload_done;
    router_input_payload_x <= zz_79;
    router_input_payload_y <= zz_80;
  end

endmodule


//PixelSolver_2 remplaced by PixelSolver_1


//PixelSolver_3 remplaced by PixelSolver_1


//PixelSolver_4 remplaced by PixelSolver_1


//PixelSolver_5 remplaced by PixelSolver_1


//PixelSolver_6 remplaced by PixelSolver_1


//PixelSolver_7 remplaced by PixelSolver_1

module Arbiter
( 
  input   io_inputs_0_valid,
  output reg  io_inputs_0_ready,
  input  [3:0] io_inputs_0_payload_iteration,
  input   io_inputs_1_valid,
  output reg  io_inputs_1_ready,
  input  [3:0] io_inputs_1_payload_iteration,
  input   io_inputs_2_valid,
  output reg  io_inputs_2_ready,
  input  [3:0] io_inputs_2_payload_iteration,
  input   io_inputs_3_valid,
  output reg  io_inputs_3_ready,
  input  [3:0] io_inputs_3_payload_iteration,
  input   io_inputs_4_valid,
  output reg  io_inputs_4_ready,
  input  [3:0] io_inputs_4_payload_iteration,
  input   io_inputs_5_valid,
  output reg  io_inputs_5_ready,
  input  [3:0] io_inputs_5_payload_iteration,
  input   io_inputs_6_valid,
  output reg  io_inputs_6_ready,
  input  [3:0] io_inputs_6_payload_iteration,
  input   io_inputs_7_valid,
  output reg  io_inputs_7_ready,
  input  [3:0] io_inputs_7_payload_iteration,
  output  io_output_valid,
  input   io_output_ready,
  output [3:0] io_output_payload_iteration,
  input   clk,
  input   reset 
);

  reg  counter_willIncrement;
  wire  counter_willClear;
  reg [2:0] counter_valueNext;
  reg [2:0] counter_value;
  wire [0:0] zz_1;
  wire [0:0] zz_2;
  wire [2:0] zz_3;
  wire [2:0] zz_4;
  wire  zz_5;
  wire  zz_6;
  wire  zz_7;
  wire  zz_8;
  wire  zz_9;
  wire  zz_10;
  wire  zz_11;
  wire  zz_12;
  wire  zz_13;
  wire  zz_14;
  wire [3:0] zz_15;
  wire  zz_16;
  wire  zz_17;
  wire [3:0] zz_18;
  wire  zz_19;
  wire  zz_20;
  wire [3:0] zz_21;
  wire  zz_22;
  wire  zz_23;
  wire [3:0] zz_24;
  wire  zz_25;
  wire  zz_26;
  wire [3:0] zz_27;
  wire  zz_28;
  wire  zz_29;
  wire [3:0] zz_30;
  wire  zz_31;
  wire  zz_32;
  wire [3:0] zz_33;
  wire [0:0] zz_34;
  wire [7:0] zz_35;
  wire  zz_36;
  wire  zz_37;
  wire  zz_38;
  wire  zz_39;
  wire  zz_40;
  wire  zz_41;
  wire  zz_42;
  wire  zz_43;
  wire  zz_44;
  wire  zz_45;
  wire  zz_46;
  wire  io_output_valid_readableBuffer;
  wire [2:0] zz_47;
  assign io_output_valid = io_output_valid_readableBuffer;
  assign io_output_payload_iteration = zz_33;
  assign counter_willClear = 1'b0;
  assign zz_1 = counter_willIncrement;
  assign zz_2 = zz_1;
  assign zz_3 = (counter_value + zz_47);
  assign zz_4 = zz_3;
  assign zz_5 = 1'b0;
  assign zz_6 = 1'b0;
  assign zz_7 = 1'b0;
  assign zz_8 = 1'b0;
  assign zz_9 = 1'b0;
  assign zz_10 = 1'b0;
  assign zz_11 = 1'b0;
  assign zz_12 = 1'b0;
  assign zz_13 = counter_value[0];
  assign zz_14 = (zz_13 ? io_inputs_1_valid : io_inputs_0_valid);
  assign zz_15 = (zz_13 ? io_inputs_1_payload_iteration : io_inputs_0_payload_iteration);
  assign zz_16 = counter_value[0];
  assign zz_17 = (zz_16 ? io_inputs_3_valid : io_inputs_2_valid);
  assign zz_18 = (zz_16 ? io_inputs_3_payload_iteration : io_inputs_2_payload_iteration);
  assign zz_19 = counter_value[0];
  assign zz_20 = (zz_19 ? io_inputs_5_valid : io_inputs_4_valid);
  assign zz_21 = (zz_19 ? io_inputs_5_payload_iteration : io_inputs_4_payload_iteration);
  assign zz_22 = counter_value[0];
  assign zz_23 = (zz_22 ? io_inputs_7_valid : io_inputs_6_valid);
  assign zz_24 = (zz_22 ? io_inputs_7_payload_iteration : io_inputs_6_payload_iteration);
  assign zz_25 = counter_value[1];
  assign zz_26 = (zz_25 ? zz_17 : zz_14);
  assign zz_27 = (zz_25 ? zz_18 : zz_15);
  assign zz_28 = counter_value[1];
  assign zz_29 = (zz_28 ? zz_23 : zz_20);
  assign zz_30 = (zz_28 ? zz_24 : zz_21);
  assign zz_31 = counter_value[2];
  assign zz_32 = (zz_31 ? zz_29 : zz_26);
  assign zz_33 = (zz_31 ? zz_30 : zz_27);
  assign zz_34 = (1'b1);
  assign zz_35 = (zz_34 <<< counter_value);
  assign zz_36 = zz_35[0];
  assign zz_37 = zz_35[1];
  assign zz_38 = zz_35[2];
  assign zz_39 = zz_35[3];
  assign zz_40 = zz_35[4];
  assign zz_41 = zz_35[5];
  assign zz_42 = zz_35[6];
  assign zz_43 = zz_35[7];
  assign zz_44 = (io_output_valid_readableBuffer && io_output_ready);
  assign zz_45 = 1'b1;
  assign zz_46 = 1'b0;
  assign io_output_valid_readableBuffer = zz_32;
  assign zz_47 = zz_2;
  always @ (io_output_ready or zz_5 or zz_36)
  begin
    io_inputs_0_ready <= zz_5;
    if(zz_36)begin
      io_inputs_0_ready <= io_output_ready;
    end
  end

  always @ (io_output_ready or zz_6 or zz_37)
  begin
    io_inputs_1_ready <= zz_6;
    if(zz_37)begin
      io_inputs_1_ready <= io_output_ready;
    end
  end

  always @ (io_output_ready or zz_7 or zz_38)
  begin
    io_inputs_2_ready <= zz_7;
    if(zz_38)begin
      io_inputs_2_ready <= io_output_ready;
    end
  end

  always @ (io_output_ready or zz_8 or zz_39)
  begin
    io_inputs_3_ready <= zz_8;
    if(zz_39)begin
      io_inputs_3_ready <= io_output_ready;
    end
  end

  always @ (io_output_ready or zz_9 or zz_40)
  begin
    io_inputs_4_ready <= zz_9;
    if(zz_40)begin
      io_inputs_4_ready <= io_output_ready;
    end
  end

  always @ (io_output_ready or zz_10 or zz_41)
  begin
    io_inputs_5_ready <= zz_10;
    if(zz_41)begin
      io_inputs_5_ready <= io_output_ready;
    end
  end

  always @ (io_output_ready or zz_11 or zz_42)
  begin
    io_inputs_6_ready <= zz_11;
    if(zz_42)begin
      io_inputs_6_ready <= io_output_ready;
    end
  end

  always @ (io_output_ready or zz_12 or zz_43)
  begin
    io_inputs_7_ready <= zz_12;
    if(zz_43)begin
      io_inputs_7_ready <= io_output_ready;
    end
  end

  always @ (zz_44 or zz_45 or zz_46)
  begin
    counter_willIncrement <= zz_46;
    if(zz_44)begin
      counter_willIncrement <= zz_45;
    end
  end

  always @ (counter_willClear or zz_4)
  begin
    counter_valueNext <= zz_4;
    if(counter_willClear)begin
      counter_valueNext <= (3'b000);
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      counter_value <= (3'b000);
    end else begin
      counter_value <= counter_valueNext;
    end
  end

endmodule

module PixelSolverMultiCore
( 
  input   io_cmd_valid,
  output  io_cmd_ready,
  input  [27:0] io_cmd_payload_x,
  input  [27:0] io_cmd_payload_y,
  output  io_rsp_valid,
  input   io_rsp_ready,
  output [3:0] io_rsp_payload_iteration,
  input   clk,
  input   reset 
);

  wire [27:0] zz_1;
  wire [27:0] zz_2;
  reg  zz_3;
  wire  zz_4;
  wire  zz_5;
  wire  zz_6;
  wire  zz_7;
  wire  zz_8;
  wire [27:0] zz_9;
  wire [27:0] zz_10;
  reg [27:0] zz_11;
  reg [27:0] zz_12;
  wire [27:0] zz_13;
  wire [27:0] zz_14;
  reg  zz_15;
  wire  zz_16;
  reg [3:0] zz_17;
  wire  zz_18;
  wire  zz_19;
  wire  zz_20;
  wire  zz_21;
  reg  zz_22;
  wire  zz_23;
  wire  zz_24;
  wire  zz_25;
  wire  zz_26;
  wire  zz_27;
  wire [27:0] zz_28;
  wire [27:0] zz_29;
  reg [27:0] zz_30;
  reg [27:0] zz_31;
  wire [27:0] zz_32;
  wire [27:0] zz_33;
  reg  zz_34;
  wire  zz_35;
  reg [3:0] zz_36;
  wire  zz_37;
  wire  zz_38;
  wire  zz_39;
  wire  zz_40;
  reg  zz_41;
  wire  zz_42;
  wire  zz_43;
  wire  zz_44;
  wire  zz_45;
  wire  zz_46;
  wire [27:0] zz_47;
  wire [27:0] zz_48;
  reg [27:0] zz_49;
  reg [27:0] zz_50;
  wire [27:0] zz_51;
  wire [27:0] zz_52;
  reg  zz_53;
  wire  zz_54;
  reg [3:0] zz_55;
  wire  zz_56;
  wire  zz_57;
  wire  zz_58;
  wire  zz_59;
  reg  zz_60;
  wire  zz_61;
  wire  zz_62;
  wire  zz_63;
  wire  zz_64;
  wire  zz_65;
  wire [27:0] zz_66;
  wire [27:0] zz_67;
  reg [27:0] zz_68;
  reg [27:0] zz_69;
  wire [27:0] zz_70;
  wire [27:0] zz_71;
  reg  zz_72;
  wire  zz_73;
  reg [3:0] zz_74;
  wire  zz_75;
  wire  zz_76;
  wire  zz_77;
  wire  zz_78;
  reg  zz_79;
  wire  zz_80;
  wire  zz_81;
  wire  zz_82;
  wire  zz_83;
  wire  zz_84;
  wire [27:0] zz_85;
  wire [27:0] zz_86;
  reg [27:0] zz_87;
  reg [27:0] zz_88;
  wire [27:0] zz_89;
  wire [27:0] zz_90;
  reg  zz_91;
  wire  zz_92;
  reg [3:0] zz_93;
  wire  zz_94;
  wire  zz_95;
  wire  zz_96;
  wire  zz_97;
  reg  zz_98;
  wire  zz_99;
  wire  zz_100;
  wire  zz_101;
  wire  zz_102;
  wire  zz_103;
  wire [27:0] zz_104;
  wire [27:0] zz_105;
  reg [27:0] zz_106;
  reg [27:0] zz_107;
  wire [27:0] zz_108;
  wire [27:0] zz_109;
  reg  zz_110;
  wire  zz_111;
  reg [3:0] zz_112;
  wire  zz_113;
  wire  zz_114;
  wire  zz_115;
  wire  zz_116;
  reg  zz_117;
  wire  zz_118;
  wire  zz_119;
  wire  zz_120;
  wire  zz_121;
  wire  zz_122;
  wire [27:0] zz_123;
  wire [27:0] zz_124;
  reg [27:0] zz_125;
  reg [27:0] zz_126;
  wire [27:0] zz_127;
  wire [27:0] zz_128;
  reg  zz_129;
  wire  zz_130;
  reg [3:0] zz_131;
  wire  zz_132;
  wire  zz_133;
  wire  zz_134;
  wire  zz_135;
  reg  zz_136;
  wire  zz_137;
  wire  zz_138;
  wire  zz_139;
  wire  zz_140;
  wire  zz_141;
  wire [27:0] zz_142;
  wire [27:0] zz_143;
  reg [27:0] zz_144;
  reg [27:0] zz_145;
  wire [27:0] zz_146;
  wire [27:0] zz_147;
  reg  zz_148;
  wire  zz_149;
  reg [3:0] zz_150;
  wire  zz_151;
  wire  zz_152;
  wire  zz_153;
  wire  zz_154;
  wire  pixelTaskDispatcher_io_outputs_0_ready;
  wire  pixelTaskSolver0_io_cmd_ready;
  wire  pixelTaskSolver0_io_rsp_ready;
  wire  pixelResultArbiter_io_inputs_0_ready;
  wire  pixelTaskSolver0_io_rsp_valid;
  wire  pixelTaskDispatcher_io_outputs_0_valid;
  wire  pixelTaskSolver1_io_rsp_valid;
  wire  pixelTaskDispatcher_io_outputs_1_valid;
  wire  pixelTaskDispatcher_io_outputs_1_ready;
  wire  pixelTaskSolver1_io_cmd_ready;
  wire  pixelTaskSolver1_io_rsp_ready;
  wire  pixelResultArbiter_io_inputs_1_ready;
  wire  pixelTaskSolver2_io_rsp_valid;
  wire  pixelTaskDispatcher_io_outputs_2_valid;
  wire  pixelTaskDispatcher_io_outputs_2_ready;
  wire  pixelTaskSolver2_io_cmd_ready;
  wire  pixelTaskSolver2_io_rsp_ready;
  wire  pixelResultArbiter_io_inputs_2_ready;
  wire  pixelTaskSolver3_io_rsp_valid;
  wire  pixelTaskDispatcher_io_outputs_3_valid;
  wire  pixelTaskDispatcher_io_outputs_3_ready;
  wire  pixelTaskSolver3_io_cmd_ready;
  wire  pixelTaskSolver3_io_rsp_ready;
  wire  pixelResultArbiter_io_inputs_3_ready;
  wire  pixelTaskSolver4_io_rsp_valid;
  wire  pixelTaskDispatcher_io_outputs_4_valid;
  wire  pixelTaskDispatcher_io_outputs_4_ready;
  wire  pixelTaskSolver4_io_cmd_ready;
  wire  pixelTaskSolver4_io_rsp_ready;
  wire  pixelResultArbiter_io_inputs_4_ready;
  wire  pixelTaskSolver5_io_rsp_valid;
  wire  pixelTaskDispatcher_io_outputs_5_valid;
  wire  pixelTaskDispatcher_io_outputs_5_ready;
  wire  pixelTaskSolver5_io_cmd_ready;
  wire  pixelTaskSolver5_io_rsp_ready;
  wire  pixelResultArbiter_io_inputs_5_ready;
  wire  pixelTaskSolver6_io_rsp_valid;
  wire  pixelTaskDispatcher_io_outputs_6_valid;
  wire  pixelTaskDispatcher_io_outputs_6_ready;
  wire  pixelTaskSolver6_io_cmd_ready;
  wire  pixelTaskSolver6_io_rsp_ready;
  wire  pixelResultArbiter_io_inputs_6_ready;
  wire  pixelTaskSolver7_io_rsp_valid;
  wire  pixelTaskDispatcher_io_outputs_7_valid;
  wire  pixelTaskDispatcher_io_outputs_7_ready;
  wire  pixelTaskSolver7_io_cmd_ready;
  wire  pixelTaskSolver7_io_rsp_ready;
  wire  pixelResultArbiter_io_inputs_7_ready;
  wire [3:0] pixelTaskSolver0_io_rsp_payload_iteration;
  wire [3:0] pixelTaskSolver1_io_rsp_payload_iteration;
  wire [3:0] pixelTaskSolver2_io_rsp_payload_iteration;
  wire [3:0] pixelTaskSolver3_io_rsp_payload_iteration;
  wire [3:0] pixelTaskSolver4_io_rsp_payload_iteration;
  wire [3:0] pixelTaskSolver5_io_rsp_payload_iteration;
  wire [3:0] pixelTaskSolver6_io_rsp_payload_iteration;
  wire [3:0] pixelTaskSolver7_io_rsp_payload_iteration;

initial begin
  $dumpfile("../../../../../../waves/PixelSolverMultiCoreTester.vcd");
  $dumpvars(0, PixelSolverMultiCore);
end
  Dispatcher pixelTaskDispatcher ( 
    .io_input_valid(io_cmd_valid),
    .io_input_ready(io_cmd_ready),
    .io_input_payload_x(zz_1),
    .io_input_payload_y(zz_2),
    .io_outputs_0_valid(pixelTaskDispatcher_io_outputs_0_valid),
    .io_outputs_0_ready(pixelTaskDispatcher_io_outputs_0_ready),
    .io_outputs_0_payload_x(zz_9),
    .io_outputs_0_payload_y(zz_10),
    .io_outputs_1_valid(pixelTaskDispatcher_io_outputs_1_valid),
    .io_outputs_1_ready(pixelTaskDispatcher_io_outputs_1_ready),
    .io_outputs_1_payload_x(zz_28),
    .io_outputs_1_payload_y(zz_29),
    .io_outputs_2_valid(pixelTaskDispatcher_io_outputs_2_valid),
    .io_outputs_2_ready(pixelTaskDispatcher_io_outputs_2_ready),
    .io_outputs_2_payload_x(zz_47),
    .io_outputs_2_payload_y(zz_48),
    .io_outputs_3_valid(pixelTaskDispatcher_io_outputs_3_valid),
    .io_outputs_3_ready(pixelTaskDispatcher_io_outputs_3_ready),
    .io_outputs_3_payload_x(zz_66),
    .io_outputs_3_payload_y(zz_67),
    .io_outputs_4_valid(pixelTaskDispatcher_io_outputs_4_valid),
    .io_outputs_4_ready(pixelTaskDispatcher_io_outputs_4_ready),
    .io_outputs_4_payload_x(zz_85),
    .io_outputs_4_payload_y(zz_86),
    .io_outputs_5_valid(pixelTaskDispatcher_io_outputs_5_valid),
    .io_outputs_5_ready(pixelTaskDispatcher_io_outputs_5_ready),
    .io_outputs_5_payload_x(zz_104),
    .io_outputs_5_payload_y(zz_105),
    .io_outputs_6_valid(pixelTaskDispatcher_io_outputs_6_valid),
    .io_outputs_6_ready(pixelTaskDispatcher_io_outputs_6_ready),
    .io_outputs_6_payload_x(zz_123),
    .io_outputs_6_payload_y(zz_124),
    .io_outputs_7_valid(pixelTaskDispatcher_io_outputs_7_valid),
    .io_outputs_7_ready(pixelTaskDispatcher_io_outputs_7_ready),
    .io_outputs_7_payload_x(zz_142),
    .io_outputs_7_payload_y(zz_143),
    .clk(clk),
    .reset(reset) 
  );
  PixelSolver_1 pixelTaskSolver0 ( 
    .io_cmd_valid(zz_3),
    .io_cmd_ready(pixelTaskSolver0_io_cmd_ready),
    .io_cmd_payload_x(zz_13),
    .io_cmd_payload_y(zz_14),
    .io_rsp_valid(pixelTaskSolver0_io_rsp_valid),
    .io_rsp_ready(pixelTaskSolver0_io_rsp_ready),
    .io_rsp_payload_iteration(pixelTaskSolver0_io_rsp_payload_iteration),
    .clk(clk),
    .reset(reset) 
  );
  PixelSolver_1 pixelTaskSolver1 ( 
    .io_cmd_valid(zz_22),
    .io_cmd_ready(pixelTaskSolver1_io_cmd_ready),
    .io_cmd_payload_x(zz_32),
    .io_cmd_payload_y(zz_33),
    .io_rsp_valid(pixelTaskSolver1_io_rsp_valid),
    .io_rsp_ready(pixelTaskSolver1_io_rsp_ready),
    .io_rsp_payload_iteration(pixelTaskSolver1_io_rsp_payload_iteration),
    .clk(clk),
    .reset(reset) 
  );
  PixelSolver_1 pixelTaskSolver2 ( 
    .io_cmd_valid(zz_41),
    .io_cmd_ready(pixelTaskSolver2_io_cmd_ready),
    .io_cmd_payload_x(zz_51),
    .io_cmd_payload_y(zz_52),
    .io_rsp_valid(pixelTaskSolver2_io_rsp_valid),
    .io_rsp_ready(pixelTaskSolver2_io_rsp_ready),
    .io_rsp_payload_iteration(pixelTaskSolver2_io_rsp_payload_iteration),
    .clk(clk),
    .reset(reset) 
  );
  PixelSolver_1 pixelTaskSolver3 ( 
    .io_cmd_valid(zz_60),
    .io_cmd_ready(pixelTaskSolver3_io_cmd_ready),
    .io_cmd_payload_x(zz_70),
    .io_cmd_payload_y(zz_71),
    .io_rsp_valid(pixelTaskSolver3_io_rsp_valid),
    .io_rsp_ready(pixelTaskSolver3_io_rsp_ready),
    .io_rsp_payload_iteration(pixelTaskSolver3_io_rsp_payload_iteration),
    .clk(clk),
    .reset(reset) 
  );
  PixelSolver_1 pixelTaskSolver4 ( 
    .io_cmd_valid(zz_79),
    .io_cmd_ready(pixelTaskSolver4_io_cmd_ready),
    .io_cmd_payload_x(zz_89),
    .io_cmd_payload_y(zz_90),
    .io_rsp_valid(pixelTaskSolver4_io_rsp_valid),
    .io_rsp_ready(pixelTaskSolver4_io_rsp_ready),
    .io_rsp_payload_iteration(pixelTaskSolver4_io_rsp_payload_iteration),
    .clk(clk),
    .reset(reset) 
  );
  PixelSolver_1 pixelTaskSolver5 ( 
    .io_cmd_valid(zz_98),
    .io_cmd_ready(pixelTaskSolver5_io_cmd_ready),
    .io_cmd_payload_x(zz_108),
    .io_cmd_payload_y(zz_109),
    .io_rsp_valid(pixelTaskSolver5_io_rsp_valid),
    .io_rsp_ready(pixelTaskSolver5_io_rsp_ready),
    .io_rsp_payload_iteration(pixelTaskSolver5_io_rsp_payload_iteration),
    .clk(clk),
    .reset(reset) 
  );
  PixelSolver_1 pixelTaskSolver6 ( 
    .io_cmd_valid(zz_117),
    .io_cmd_ready(pixelTaskSolver6_io_cmd_ready),
    .io_cmd_payload_x(zz_127),
    .io_cmd_payload_y(zz_128),
    .io_rsp_valid(pixelTaskSolver6_io_rsp_valid),
    .io_rsp_ready(pixelTaskSolver6_io_rsp_ready),
    .io_rsp_payload_iteration(pixelTaskSolver6_io_rsp_payload_iteration),
    .clk(clk),
    .reset(reset) 
  );
  PixelSolver_1 pixelTaskSolver7 ( 
    .io_cmd_valid(zz_136),
    .io_cmd_ready(pixelTaskSolver7_io_cmd_ready),
    .io_cmd_payload_x(zz_146),
    .io_cmd_payload_y(zz_147),
    .io_rsp_valid(pixelTaskSolver7_io_rsp_valid),
    .io_rsp_ready(pixelTaskSolver7_io_rsp_ready),
    .io_rsp_payload_iteration(pixelTaskSolver7_io_rsp_payload_iteration),
    .clk(clk),
    .reset(reset) 
  );
  Arbiter pixelResultArbiter ( 
    .io_inputs_0_valid(zz_15),
    .io_inputs_0_ready(pixelResultArbiter_io_inputs_0_ready),
    .io_inputs_0_payload_iteration(zz_17),
    .io_inputs_1_valid(zz_34),
    .io_inputs_1_ready(pixelResultArbiter_io_inputs_1_ready),
    .io_inputs_1_payload_iteration(zz_36),
    .io_inputs_2_valid(zz_53),
    .io_inputs_2_ready(pixelResultArbiter_io_inputs_2_ready),
    .io_inputs_2_payload_iteration(zz_55),
    .io_inputs_3_valid(zz_72),
    .io_inputs_3_ready(pixelResultArbiter_io_inputs_3_ready),
    .io_inputs_3_payload_iteration(zz_74),
    .io_inputs_4_valid(zz_91),
    .io_inputs_4_ready(pixelResultArbiter_io_inputs_4_ready),
    .io_inputs_4_payload_iteration(zz_93),
    .io_inputs_5_valid(zz_110),
    .io_inputs_5_ready(pixelResultArbiter_io_inputs_5_ready),
    .io_inputs_5_payload_iteration(zz_112),
    .io_inputs_6_valid(zz_129),
    .io_inputs_6_ready(pixelResultArbiter_io_inputs_6_ready),
    .io_inputs_6_payload_iteration(zz_131),
    .io_inputs_7_valid(zz_148),
    .io_inputs_7_ready(pixelResultArbiter_io_inputs_7_ready),
    .io_inputs_7_payload_iteration(zz_150),
    .io_output_valid(io_rsp_valid),
    .io_output_ready(io_rsp_ready),
    .io_output_payload_iteration(io_rsp_payload_iteration),
    .clk(clk),
    .reset(reset) 
  );
  assign zz_1 = io_cmd_payload_x;
  assign zz_2 = io_cmd_payload_y;
  assign zz_4 = 1'b0;
  assign zz_5 = 1'b1;
  assign zz_6 = (! zz_3);
  assign zz_7 = (zz_5 && zz_6);
  assign zz_8 = (zz_7 || pixelTaskSolver0_io_cmd_ready);
  assign zz_13 = zz_11;
  assign zz_14 = zz_12;
  assign zz_16 = 1'b0;
  assign zz_18 = 1'b1;
  assign zz_19 = (! zz_15);
  assign zz_20 = (zz_18 && zz_19);
  assign zz_21 = (zz_20 || pixelResultArbiter_io_inputs_0_ready);
  assign zz_23 = 1'b0;
  assign zz_24 = 1'b1;
  assign zz_25 = (! zz_22);
  assign zz_26 = (zz_24 && zz_25);
  assign zz_27 = (zz_26 || pixelTaskSolver1_io_cmd_ready);
  assign zz_32 = zz_30;
  assign zz_33 = zz_31;
  assign zz_35 = 1'b0;
  assign zz_37 = 1'b1;
  assign zz_38 = (! zz_34);
  assign zz_39 = (zz_37 && zz_38);
  assign zz_40 = (zz_39 || pixelResultArbiter_io_inputs_1_ready);
  assign zz_42 = 1'b0;
  assign zz_43 = 1'b1;
  assign zz_44 = (! zz_41);
  assign zz_45 = (zz_43 && zz_44);
  assign zz_46 = (zz_45 || pixelTaskSolver2_io_cmd_ready);
  assign zz_51 = zz_49;
  assign zz_52 = zz_50;
  assign zz_54 = 1'b0;
  assign zz_56 = 1'b1;
  assign zz_57 = (! zz_53);
  assign zz_58 = (zz_56 && zz_57);
  assign zz_59 = (zz_58 || pixelResultArbiter_io_inputs_2_ready);
  assign zz_61 = 1'b0;
  assign zz_62 = 1'b1;
  assign zz_63 = (! zz_60);
  assign zz_64 = (zz_62 && zz_63);
  assign zz_65 = (zz_64 || pixelTaskSolver3_io_cmd_ready);
  assign zz_70 = zz_68;
  assign zz_71 = zz_69;
  assign zz_73 = 1'b0;
  assign zz_75 = 1'b1;
  assign zz_76 = (! zz_72);
  assign zz_77 = (zz_75 && zz_76);
  assign zz_78 = (zz_77 || pixelResultArbiter_io_inputs_3_ready);
  assign zz_80 = 1'b0;
  assign zz_81 = 1'b1;
  assign zz_82 = (! zz_79);
  assign zz_83 = (zz_81 && zz_82);
  assign zz_84 = (zz_83 || pixelTaskSolver4_io_cmd_ready);
  assign zz_89 = zz_87;
  assign zz_90 = zz_88;
  assign zz_92 = 1'b0;
  assign zz_94 = 1'b1;
  assign zz_95 = (! zz_91);
  assign zz_96 = (zz_94 && zz_95);
  assign zz_97 = (zz_96 || pixelResultArbiter_io_inputs_4_ready);
  assign zz_99 = 1'b0;
  assign zz_100 = 1'b1;
  assign zz_101 = (! zz_98);
  assign zz_102 = (zz_100 && zz_101);
  assign zz_103 = (zz_102 || pixelTaskSolver5_io_cmd_ready);
  assign zz_108 = zz_106;
  assign zz_109 = zz_107;
  assign zz_111 = 1'b0;
  assign zz_113 = 1'b1;
  assign zz_114 = (! zz_110);
  assign zz_115 = (zz_113 && zz_114);
  assign zz_116 = (zz_115 || pixelResultArbiter_io_inputs_5_ready);
  assign zz_118 = 1'b0;
  assign zz_119 = 1'b1;
  assign zz_120 = (! zz_117);
  assign zz_121 = (zz_119 && zz_120);
  assign zz_122 = (zz_121 || pixelTaskSolver6_io_cmd_ready);
  assign zz_127 = zz_125;
  assign zz_128 = zz_126;
  assign zz_130 = 1'b0;
  assign zz_132 = 1'b1;
  assign zz_133 = (! zz_129);
  assign zz_134 = (zz_132 && zz_133);
  assign zz_135 = (zz_134 || pixelResultArbiter_io_inputs_6_ready);
  assign zz_137 = 1'b0;
  assign zz_138 = 1'b1;
  assign zz_139 = (! zz_136);
  assign zz_140 = (zz_138 && zz_139);
  assign zz_141 = (zz_140 || pixelTaskSolver7_io_cmd_ready);
  assign zz_146 = zz_144;
  assign zz_147 = zz_145;
  assign zz_149 = 1'b0;
  assign zz_151 = 1'b1;
  assign zz_152 = (! zz_148);
  assign zz_153 = (zz_151 && zz_152);
  assign zz_154 = (zz_153 || pixelResultArbiter_io_inputs_7_ready);
  assign pixelTaskDispatcher_io_outputs_0_ready = zz_8;
  assign pixelTaskSolver0_io_rsp_ready = zz_21;
  assign pixelTaskDispatcher_io_outputs_1_ready = zz_27;
  assign pixelTaskSolver1_io_rsp_ready = zz_40;
  assign pixelTaskDispatcher_io_outputs_2_ready = zz_46;
  assign pixelTaskSolver2_io_rsp_ready = zz_59;
  assign pixelTaskDispatcher_io_outputs_3_ready = zz_65;
  assign pixelTaskSolver3_io_rsp_ready = zz_78;
  assign pixelTaskDispatcher_io_outputs_4_ready = zz_84;
  assign pixelTaskSolver4_io_rsp_ready = zz_97;
  assign pixelTaskDispatcher_io_outputs_5_ready = zz_103;
  assign pixelTaskSolver5_io_rsp_ready = zz_116;
  assign pixelTaskDispatcher_io_outputs_6_ready = zz_122;
  assign pixelTaskSolver6_io_rsp_ready = zz_135;
  assign pixelTaskDispatcher_io_outputs_7_ready = zz_141;
  assign pixelTaskSolver7_io_rsp_ready = zz_154;
  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      zz_3 <= zz_4;
      zz_15 <= zz_16;
      zz_22 <= zz_23;
      zz_34 <= zz_35;
      zz_41 <= zz_42;
      zz_53 <= zz_54;
      zz_60 <= zz_61;
      zz_72 <= zz_73;
      zz_79 <= zz_80;
      zz_91 <= zz_92;
      zz_98 <= zz_99;
      zz_110 <= zz_111;
      zz_117 <= zz_118;
      zz_129 <= zz_130;
      zz_136 <= zz_137;
      zz_148 <= zz_149;
    end else begin
      if(pixelTaskDispatcher_io_outputs_0_ready)begin
        zz_3 <= pixelTaskDispatcher_io_outputs_0_valid;
      end
      if(pixelTaskSolver0_io_rsp_ready)begin
        zz_15 <= pixelTaskSolver0_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_1_ready)begin
        zz_22 <= pixelTaskDispatcher_io_outputs_1_valid;
      end
      if(pixelTaskSolver1_io_rsp_ready)begin
        zz_34 <= pixelTaskSolver1_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_2_ready)begin
        zz_41 <= pixelTaskDispatcher_io_outputs_2_valid;
      end
      if(pixelTaskSolver2_io_rsp_ready)begin
        zz_53 <= pixelTaskSolver2_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_3_ready)begin
        zz_60 <= pixelTaskDispatcher_io_outputs_3_valid;
      end
      if(pixelTaskSolver3_io_rsp_ready)begin
        zz_72 <= pixelTaskSolver3_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_4_ready)begin
        zz_79 <= pixelTaskDispatcher_io_outputs_4_valid;
      end
      if(pixelTaskSolver4_io_rsp_ready)begin
        zz_91 <= pixelTaskSolver4_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_5_ready)begin
        zz_98 <= pixelTaskDispatcher_io_outputs_5_valid;
      end
      if(pixelTaskSolver5_io_rsp_ready)begin
        zz_110 <= pixelTaskSolver5_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_6_ready)begin
        zz_117 <= pixelTaskDispatcher_io_outputs_6_valid;
      end
      if(pixelTaskSolver6_io_rsp_ready)begin
        zz_129 <= pixelTaskSolver6_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_7_ready)begin
        zz_136 <= pixelTaskDispatcher_io_outputs_7_valid;
      end
      if(pixelTaskSolver7_io_rsp_ready)begin
        zz_148 <= pixelTaskSolver7_io_rsp_valid;
      end
    end
  end

  always @ (posedge clk)
  begin
    if(pixelTaskDispatcher_io_outputs_0_ready)begin
      zz_11 <= zz_9;
      zz_12 <= zz_10;
    end
    if(pixelTaskSolver0_io_rsp_ready)begin
      zz_17 <= pixelTaskSolver0_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_1_ready)begin
      zz_30 <= zz_28;
      zz_31 <= zz_29;
    end
    if(pixelTaskSolver1_io_rsp_ready)begin
      zz_36 <= pixelTaskSolver1_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_2_ready)begin
      zz_49 <= zz_47;
      zz_50 <= zz_48;
    end
    if(pixelTaskSolver2_io_rsp_ready)begin
      zz_55 <= pixelTaskSolver2_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_3_ready)begin
      zz_68 <= zz_66;
      zz_69 <= zz_67;
    end
    if(pixelTaskSolver3_io_rsp_ready)begin
      zz_74 <= pixelTaskSolver3_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_4_ready)begin
      zz_87 <= zz_85;
      zz_88 <= zz_86;
    end
    if(pixelTaskSolver4_io_rsp_ready)begin
      zz_93 <= pixelTaskSolver4_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_5_ready)begin
      zz_106 <= zz_104;
      zz_107 <= zz_105;
    end
    if(pixelTaskSolver5_io_rsp_ready)begin
      zz_112 <= pixelTaskSolver5_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_6_ready)begin
      zz_125 <= zz_123;
      zz_126 <= zz_124;
    end
    if(pixelTaskSolver6_io_rsp_ready)begin
      zz_131 <= pixelTaskSolver6_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_7_ready)begin
      zz_144 <= zz_142;
      zz_145 <= zz_143;
    end
    if(pixelTaskSolver7_io_rsp_ready)begin
      zz_150 <= pixelTaskSolver7_io_rsp_payload_iteration;
    end
  end

endmodule

