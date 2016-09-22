
module FunctionUnit
( 
  input   io_cmd_valid,
  input  [7:0] io_cmd_payload,
  output [7:0] io_valueA,
  output [31:0] io_valueB,
  output [47:0] io_valueC,
  input   clk,
  input   reset 
);

  reg [3:0] setA_counter;
  reg  setA_hit;
  wire  zz_1;
  wire  zz_2;
  wire  zz_3;
  wire  zz_4;
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
  wire  zz_15;
  wire  zz_16;
  wire  zz_17;
  wire  zz_18;
  wire  zz_19;
  wire  zz_20;
  wire  zz_21;
  wire  zz_22;
  wire  zz_23;
  wire  zz_24;
  wire [3:0] zz_25;
  wire  zz_26;
  wire  zz_27;
  wire  zz_28;
  wire [3:0] zz_29;
  wire  zz_30;
  reg  loadA_active;
  wire  zz_31;
  wire  loadA_counter_willOverflowIfInc;
  reg [7:0] loadA_buffer;
  wire  zz_32;
  wire  zz_33;
  wire [0:0] zz_34;
  wire  zz_35;
  reg [3:0] setB_counter;
  reg  setB_hit;
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
  wire  zz_47;
  wire  zz_48;
  wire  zz_49;
  wire  zz_50;
  wire  zz_51;
  wire  zz_52;
  wire [3:0] zz_53;
  wire  zz_54;
  wire  zz_55;
  wire  zz_56;
  wire [3:0] zz_57;
  wire  zz_58;
  reg  loadB_active;
  wire  zz_59;
  reg  loadB_counter_willIncrement;
  wire  loadB_counter_willClear;
  reg [1:0] loadB_counter_valueNext;
  reg [1:0] loadB_counter_value;
  wire [1:0] zz_60;
  wire  loadB_counter_willOverflowIfInc;
  wire [0:0] zz_61;
  wire [0:0] zz_62;
  wire [1:0] zz_63;
  wire [1:0] zz_64;
  reg [31:0] loadB_buffer;
  wire  zz_65;
  wire  zz_66;
  wire  zz_67;
  wire  zz_68;
  wire [0:0] zz_69;
  wire [3:0] zz_70;
  wire  zz_71;
  wire  zz_72;
  wire  zz_73;
  wire  zz_74;
  reg [3:0] setC_counter;
  reg  setC_hit;
  wire  zz_75;
  wire  zz_76;
  wire  zz_77;
  wire  zz_78;
  wire  zz_79;
  wire  zz_80;
  wire  zz_81;
  wire  zz_82;
  wire  zz_83;
  wire  zz_84;
  wire  zz_85;
  wire  zz_86;
  wire  zz_87;
  wire  zz_88;
  wire  zz_89;
  wire  zz_90;
  wire  zz_91;
  wire [3:0] zz_92;
  wire  zz_93;
  wire  zz_94;
  wire  zz_95;
  wire [3:0] zz_96;
  wire  zz_97;
  reg  loadC_active;
  wire  zz_98;
  reg  loadC_counter_willIncrement;
  wire  loadC_counter_willClear;
  reg [2:0] loadC_counter_valueNext;
  reg [2:0] loadC_counter_value;
  wire [2:0] zz_99;
  wire  loadC_counter_willOverflowIfInc;
  wire [2:0] zz_100;
  reg [47:0] loadC_buffer;
  wire  zz_101;
  wire  zz_102;
  wire  zz_103;
  wire  zz_104;
  wire [0:0] zz_105;
  wire [7:0] zz_106;
  wire  zz_107;
  wire  zz_108;
  wire  zz_109;
  wire  zz_110;
  wire  zz_111;
  wire  zz_112;
  wire  zz_113;
  wire [1:0] zz_114;

initial begin
  $dumpfile("../../../../../waves/FunctionUnitTester.vcd");
  $dumpvars(0, FunctionUnit);
end
  assign io_valueA = loadA_buffer;
  assign io_valueB = loadB_buffer;
  assign io_valueC = loadC_buffer;
  assign zz_1 = (io_cmd_payload == (8'b01110011));
  assign zz_2 = (io_cmd_payload == (8'b01100101));
  assign zz_3 = (io_cmd_payload == (8'b01110100));
  assign zz_4 = (io_cmd_payload == (8'b01010110));
  assign zz_5 = (io_cmd_payload == (8'b01100001));
  assign zz_6 = (io_cmd_payload == (8'b01101100));
  assign zz_7 = (io_cmd_payload == (8'b01110101));
  assign zz_8 = (io_cmd_payload == (8'b01000001));
  assign zz_9 = setA_counter[0];
  assign zz_10 = (zz_9 ? zz_2 : zz_1);
  assign zz_11 = setA_counter[0];
  assign zz_12 = (zz_11 ? zz_4 : zz_3);
  assign zz_13 = setA_counter[0];
  assign zz_14 = (zz_13 ? zz_6 : zz_5);
  assign zz_15 = setA_counter[0];
  assign zz_16 = (zz_15 ? zz_2 : zz_7);
  assign zz_17 = setA_counter[1];
  assign zz_18 = (zz_17 ? zz_12 : zz_10);
  assign zz_19 = setA_counter[1];
  assign zz_20 = (zz_19 ? zz_16 : zz_14);
  assign zz_21 = setA_counter[2];
  assign zz_22 = (zz_21 ? zz_20 : zz_18);
  assign zz_23 = setA_counter[3];
  assign zz_24 = (zz_23 ? zz_8 : zz_22);
  assign zz_25 = (4'b1000);
  assign zz_26 = (setA_counter == zz_25);
  assign zz_27 = 1'b1;
  assign zz_28 = 1'b0;
  assign zz_29 = (setA_counter + (4'b0001));
  assign zz_30 = 1'b0;
  assign zz_31 = 1'b1;
  assign loadA_counter_willOverflowIfInc = zz_113;
  assign zz_32 = (loadA_active && io_cmd_valid);
  assign zz_33 = 1'b0;
  assign zz_34 = (1'b1);
  assign zz_35 = zz_34[0];
  assign zz_36 = (io_cmd_payload == (8'b01000010));
  assign zz_37 = setB_counter[0];
  assign zz_38 = (zz_37 ? zz_2 : zz_1);
  assign zz_39 = setB_counter[0];
  assign zz_40 = (zz_39 ? zz_4 : zz_3);
  assign zz_41 = setB_counter[0];
  assign zz_42 = (zz_41 ? zz_6 : zz_5);
  assign zz_43 = setB_counter[0];
  assign zz_44 = (zz_43 ? zz_2 : zz_7);
  assign zz_45 = setB_counter[1];
  assign zz_46 = (zz_45 ? zz_40 : zz_38);
  assign zz_47 = setB_counter[1];
  assign zz_48 = (zz_47 ? zz_44 : zz_42);
  assign zz_49 = setB_counter[2];
  assign zz_50 = (zz_49 ? zz_48 : zz_46);
  assign zz_51 = setB_counter[3];
  assign zz_52 = (zz_51 ? zz_36 : zz_50);
  assign zz_53 = (4'b1000);
  assign zz_54 = (setB_counter == zz_53);
  assign zz_55 = 1'b1;
  assign zz_56 = 1'b0;
  assign zz_57 = (setB_counter + (4'b0001));
  assign zz_58 = 1'b0;
  assign zz_59 = 1'b1;
  assign loadB_counter_willClear = 1'b0;
  assign zz_60 = (2'b11);
  assign loadB_counter_willOverflowIfInc = (loadB_counter_value == zz_60);
  assign zz_61 = loadB_counter_willIncrement;
  assign zz_62 = zz_61;
  assign zz_63 = (loadB_counter_value + zz_114);
  assign zz_64 = zz_63;
  assign zz_65 = (loadB_active && io_cmd_valid);
  assign zz_66 = 1'b1;
  assign zz_67 = 1'b0;
  assign zz_68 = 1'b0;
  assign zz_69 = (1'b1);
  assign zz_70 = (zz_69 <<< loadB_counter_value);
  assign zz_71 = zz_70[0];
  assign zz_72 = zz_70[1];
  assign zz_73 = zz_70[2];
  assign zz_74 = zz_70[3];
  assign zz_75 = (io_cmd_payload == (8'b01000011));
  assign zz_76 = setC_counter[0];
  assign zz_77 = (zz_76 ? zz_2 : zz_1);
  assign zz_78 = setC_counter[0];
  assign zz_79 = (zz_78 ? zz_4 : zz_3);
  assign zz_80 = setC_counter[0];
  assign zz_81 = (zz_80 ? zz_6 : zz_5);
  assign zz_82 = setC_counter[0];
  assign zz_83 = (zz_82 ? zz_2 : zz_7);
  assign zz_84 = setC_counter[1];
  assign zz_85 = (zz_84 ? zz_79 : zz_77);
  assign zz_86 = setC_counter[1];
  assign zz_87 = (zz_86 ? zz_83 : zz_81);
  assign zz_88 = setC_counter[2];
  assign zz_89 = (zz_88 ? zz_87 : zz_85);
  assign zz_90 = setC_counter[3];
  assign zz_91 = (zz_90 ? zz_75 : zz_89);
  assign zz_92 = (4'b1000);
  assign zz_93 = (setC_counter == zz_92);
  assign zz_94 = 1'b1;
  assign zz_95 = 1'b0;
  assign zz_96 = (setC_counter + (4'b0001));
  assign zz_97 = 1'b0;
  assign zz_98 = 1'b1;
  assign loadC_counter_willClear = 1'b0;
  assign zz_99 = (3'b101);
  assign loadC_counter_willOverflowIfInc = (loadC_counter_value == zz_99);
  assign zz_100 = (loadC_counter_value + (3'b001));
  assign zz_101 = (loadC_active && io_cmd_valid);
  assign zz_102 = 1'b1;
  assign zz_103 = 1'b0;
  assign zz_104 = 1'b0;
  assign zz_105 = (1'b1);
  assign zz_106 = (zz_105 <<< loadC_counter_value);
  assign zz_107 = zz_106[0];
  assign zz_108 = zz_106[1];
  assign zz_109 = zz_106[2];
  assign zz_110 = zz_106[3];
  assign zz_111 = zz_106[4];
  assign zz_112 = zz_106[5];
  assign zz_113 = 1'b1;
  assign zz_114 = zz_62;
  always @ (io_cmd_valid or zz_24 or zz_26 or zz_27 or zz_28)
  begin
    setA_hit <= zz_28;
    if(io_cmd_valid)begin
      if(zz_24)begin
        if(zz_26)begin
          setA_hit <= zz_27;
        end
      end
    end
  end

  always @ (io_cmd_valid or zz_52 or zz_54 or zz_55 or zz_56)
  begin
    setB_hit <= zz_56;
    if(io_cmd_valid)begin
      if(zz_52)begin
        if(zz_54)begin
          setB_hit <= zz_55;
        end
      end
    end
  end

  always @ (zz_65 or zz_66 or zz_67)
  begin
    loadB_counter_willIncrement <= zz_67;
    if(zz_65)begin
      loadB_counter_willIncrement <= zz_66;
    end
  end

  always @ (loadB_counter_willClear or zz_64)
  begin
    loadB_counter_valueNext <= zz_64;
    if(loadB_counter_willClear)begin
      loadB_counter_valueNext <= (2'b00);
    end
  end

  always @ (io_cmd_valid or zz_91 or zz_93 or zz_94 or zz_95)
  begin
    setC_hit <= zz_95;
    if(io_cmd_valid)begin
      if(zz_91)begin
        if(zz_93)begin
          setC_hit <= zz_94;
        end
      end
    end
  end

  always @ (zz_101 or zz_102 or zz_103)
  begin
    loadC_counter_willIncrement <= zz_103;
    if(zz_101)begin
      loadC_counter_willIncrement <= zz_102;
    end
  end

  always @ (loadC_counter_willIncrement or loadC_counter_willClear or loadC_counter_value or loadC_counter_willOverflowIfInc or zz_100)
  begin
    if(loadC_counter_willIncrement)begin
      if(loadC_counter_willOverflowIfInc)begin
        loadC_counter_valueNext <= (3'b000);
      end else begin
        loadC_counter_valueNext <= zz_100;
      end
    end else begin
      loadC_counter_valueNext <= loadC_counter_value;
    end
    if(loadC_counter_willClear)begin
      loadC_counter_valueNext <= (3'b000);
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      setA_counter <= (4'b0000);
      loadA_active <= zz_30;
      setB_counter <= (4'b0000);
      loadB_active <= zz_58;
      loadB_counter_value <= (2'b00);
      setC_counter <= (4'b0000);
      loadC_active <= zz_97;
      loadC_counter_value <= (3'b000);
    end else begin
      if(io_cmd_valid)begin
        if(zz_24)begin
          if(zz_26)begin
            setA_counter <= (4'b0000);
          end else begin
            setA_counter <= zz_29;
          end
        end else begin
          setA_counter <= (4'b0000);
        end
      end
      if(setA_hit)begin
        loadA_active <= zz_31;
      end
      if(zz_32)begin
        if(loadA_counter_willOverflowIfInc)begin
          loadA_active <= zz_33;
        end
      end
      if(io_cmd_valid)begin
        if(zz_52)begin
          if(zz_54)begin
            setB_counter <= (4'b0000);
          end else begin
            setB_counter <= zz_57;
          end
        end else begin
          setB_counter <= (4'b0000);
        end
      end
      if(setB_hit)begin
        loadB_active <= zz_59;
      end
      if(zz_65)begin
        if(loadB_counter_willOverflowIfInc)begin
          loadB_active <= zz_68;
        end
      end
      loadB_counter_value <= loadB_counter_valueNext;
      if(io_cmd_valid)begin
        if(zz_91)begin
          if(zz_93)begin
            setC_counter <= (4'b0000);
          end else begin
            setC_counter <= zz_96;
          end
        end else begin
          setC_counter <= (4'b0000);
        end
      end
      if(setC_hit)begin
        loadC_active <= zz_98;
      end
      if(zz_101)begin
        if(loadC_counter_willOverflowIfInc)begin
          loadC_active <= zz_104;
        end
      end
      loadC_counter_value <= loadC_counter_valueNext;
    end
  end

  always @ (posedge clk)
  begin
    if(zz_32)begin
      if(zz_35)begin
        loadA_buffer[7 : 0] <= io_cmd_payload;
      end
    end
    if(zz_65)begin
      if(zz_71)begin
        loadB_buffer[7 : 0] <= io_cmd_payload;
      end
      if(zz_72)begin
        loadB_buffer[15 : 8] <= io_cmd_payload;
      end
      if(zz_73)begin
        loadB_buffer[23 : 16] <= io_cmd_payload;
      end
      if(zz_74)begin
        loadB_buffer[31 : 24] <= io_cmd_payload;
      end
    end
    if(zz_101)begin
      if(zz_107)begin
        loadC_buffer[7 : 0] <= io_cmd_payload;
      end
      if(zz_108)begin
        loadC_buffer[15 : 8] <= io_cmd_payload;
      end
      if(zz_109)begin
        loadC_buffer[23 : 16] <= io_cmd_payload;
      end
      if(zz_110)begin
        loadC_buffer[31 : 24] <= io_cmd_payload;
      end
      if(zz_111)begin
        loadC_buffer[39 : 32] <= io_cmd_payload;
      end
      if(zz_112)begin
        loadC_buffer[47 : 40] <= io_cmd_payload;
      end
    end
  end

endmodule

