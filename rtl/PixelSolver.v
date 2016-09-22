
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

initial begin
  $dumpfile("../../../../../../waves/PixelSolverTester.vcd");
  $dumpvars(0, PixelSolver);
end
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

