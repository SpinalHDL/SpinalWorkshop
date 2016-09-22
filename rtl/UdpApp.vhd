library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use ieee.math_real.all;

package pkg_enum is
  type fsm_enumDefinition is (fsm_idle,fsm_helloHeader,fsm_discoveringRspTx,boot);
  type fsm_enumDefinition_debug is (XXX,fsm_idle,fsm_helloHeader,fsm_discoveringRspTx,boot);
  type discoveringRspTxCmdFsm_enumDefinition is (e0,boot);
  type discoveringRspTxCmdFsm_enumDefinition_debug is (XXX,e0,boot);
  type discoveringRspTxDataFsm_enumDefinition is (e0,e1,boot);
  type discoveringRspTxDataFsm_enumDefinition_debug is (XXX,e0,e1,boot);

  function pkg_mux (sel : std_logic;one : fsm_enumDefinition;zero : fsm_enumDefinition) return fsm_enumDefinition;
  function pkg_toStdLogicVector_native (value : fsm_enumDefinition) return std_logic_vector;
  function pkg_tofsm_enumDefinition_native (value : std_logic_vector(1 downto 0)) return fsm_enumDefinition;
  function pkg_mux (sel : std_logic;one : discoveringRspTxCmdFsm_enumDefinition;zero : discoveringRspTxCmdFsm_enumDefinition) return discoveringRspTxCmdFsm_enumDefinition;
  function pkg_toStdLogicVector_native (value : discoveringRspTxCmdFsm_enumDefinition) return std_logic_vector;
  function pkg_todiscoveringRspTxCmdFsm_enumDefinition_native (value : std_logic_vector(0 downto 0)) return discoveringRspTxCmdFsm_enumDefinition;
  function pkg_mux (sel : std_logic;one : discoveringRspTxDataFsm_enumDefinition;zero : discoveringRspTxDataFsm_enumDefinition) return discoveringRspTxDataFsm_enumDefinition;
  function pkg_toStdLogicVector_native (value : discoveringRspTxDataFsm_enumDefinition) return std_logic_vector;
  function pkg_todiscoveringRspTxDataFsm_enumDefinition_native (value : std_logic_vector(1 downto 0)) return discoveringRspTxDataFsm_enumDefinition;
end pkg_enum;

package body pkg_enum is
  function pkg_mux (sel : std_logic;one : fsm_enumDefinition;zero : fsm_enumDefinition) return fsm_enumDefinition is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_tofsm_enumDefinition_native (value : std_logic_vector(1 downto 0)) return fsm_enumDefinition is
  begin
    case value is
      when "00" => return fsm_idle;
      when "01" => return fsm_helloHeader;
      when "10" => return fsm_discoveringRspTx;
      when "11" => return boot;
      when others => return fsm_idle;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : fsm_enumDefinition) return std_logic_vector is
  begin
    case value is
      when fsm_idle => return "00";
      when fsm_helloHeader => return "01";
      when fsm_discoveringRspTx => return "10";
      when boot => return "11";
      when others => return "00";
    end case;
  end;
  function pkg_mux (sel : std_logic;one : discoveringRspTxCmdFsm_enumDefinition;zero : discoveringRspTxCmdFsm_enumDefinition) return discoveringRspTxCmdFsm_enumDefinition is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_todiscoveringRspTxCmdFsm_enumDefinition_native (value : std_logic_vector(0 downto 0)) return discoveringRspTxCmdFsm_enumDefinition is
  begin
    case value is
      when "0" => return e0;
      when "1" => return boot;
      when others => return e0;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : discoveringRspTxCmdFsm_enumDefinition) return std_logic_vector is
  begin
    case value is
      when e0 => return "0";
      when boot => return "1";
      when others => return "0";
    end case;
  end;
  function pkg_mux (sel : std_logic;one : discoveringRspTxDataFsm_enumDefinition;zero : discoveringRspTxDataFsm_enumDefinition) return discoveringRspTxDataFsm_enumDefinition is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_todiscoveringRspTxDataFsm_enumDefinition_native (value : std_logic_vector(1 downto 0)) return discoveringRspTxDataFsm_enumDefinition is
  begin
    case value is
      when "00" => return e0;
      when "01" => return e1;
      when "10" => return boot;
      when others => return e0;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : discoveringRspTxDataFsm_enumDefinition) return std_logic_vector is
  begin
    case value is
      when e0 => return "00";
      when e1 => return "01";
      when boot => return "10";
      when others => return "00";
    end case;
  end;
end pkg_enum;


library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic;
  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector;
  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector;
  function pkg_extract (that : unsigned; bitId : integer) return std_logic;
  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned;
  function pkg_cat (a : unsigned; b : unsigned) return unsigned;
  function pkg_extract (that : signed; bitId : integer) return std_logic;
  function pkg_extract (that : signed; base : unsigned; size : integer) return signed;
  function pkg_cat (a : signed; b : signed) return signed;


  function pkg_mux (sel : std_logic;one : std_logic;zero : std_logic) return std_logic;
  function pkg_mux (sel : std_logic;one : std_logic_vector;zero : std_logic_vector) return std_logic_vector;
  function pkg_mux (sel : std_logic;one : unsigned;zero : unsigned) return unsigned;
  function pkg_mux (sel : std_logic;one : signed;zero : signed) return signed;


  function pkg_toStdLogic (value : boolean) return std_logic;
  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector;
  function pkg_toUnsigned(value : std_logic) return unsigned;
  function pkg_toSigned (value : std_logic) return signed;
  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector;
  function pkg_unsigned (lit : unsigned) return unsigned;
  function pkg_signed (lit : signed) return signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector;
  function pkg_resize (that : unsigned; width : integer) return unsigned;
  function pkg_resize (that : signed; width : integer) return signed;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector;
  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned;
  function pkg_extract (that : signed; high : integer; low : integer) return signed;

  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;

  function pkg_shiftRight (that : unsigned; size : natural) return unsigned;
  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned;

  function pkg_shiftRight (that : signed; size : natural) return signed;
  function pkg_shiftRight (that : signed; size : unsigned) return signed;
  function pkg_shiftLeft (that : signed; size : natural) return signed;
  function pkg_shiftLeft (that : signed; size : unsigned) return signed;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;
end  pkg_scala2hdl;

package body pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic is
  begin
    return that(bitId);
  end pkg_extract;


  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector is
   constant elementCount : integer := (that'length-size)+1;
   type tableType is array (0 to elementCount-1) of std_logic_vector(size-1 downto 0);
   variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := that(i + size - 1 downto i);
    end loop;
    return table(to_integer(base));
  end pkg_extract;


  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector is
    variable cat : std_logic_vector(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;


  function pkg_extract (that : unsigned; bitId : integer) return std_logic is
  begin
    return that(bitId);
  end pkg_extract;


  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned is
   constant elementCount : integer := (that'length-size)+1;
   type tableType is array (0 to elementCount-1) of unsigned(size-1 downto 0);
   variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := that(i + size - 1 downto i);
    end loop;
    return table(to_integer(base));
  end pkg_extract;


  function pkg_cat (a : unsigned; b : unsigned) return unsigned is
    variable cat : unsigned(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;


  function pkg_extract (that : signed; bitId : integer) return std_logic is
  begin
    return that(bitId);
  end pkg_extract;


  function pkg_extract (that : signed; base : unsigned; size : integer) return signed is
   constant elementCount : integer := (that'length-size)+1;
   type tableType is array (0 to elementCount-1) of signed(size-1 downto 0);
   variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := that(i + size - 1 downto i);
    end loop;
    return table(to_integer(base));
  end pkg_extract;


  function pkg_cat (a : signed; b : signed) return signed is
    variable cat : signed(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;



  -- unsigned shifts
  function pkg_shiftRight (that : unsigned; size : natural) return unsigned is
  begin
    if size >= that'length then
      return "";
    else
      return shift_right(that,size)(that'high-size downto 0);
    end if;
  end pkg_shiftRight;

  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned is
  begin
    return shift_right(that,to_integer(size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned is
  begin
    return shift_left(resize(that,that'length + size),size);
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned is
  begin
    return shift_left(resize(that,that'length + 2**size'length - 1),to_integer(size));
  end pkg_shiftLeft;


  -- std_logic_vector shifts
  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  -- signed shifts
  function pkg_shiftRight (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : signed; size : unsigned) return signed is
  begin
    return shift_right(that,to_integer(size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : signed; size : unsigned) return signed is
  begin
    return signed(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(rotate_left(unsigned(that),to_integer(size)));
  end pkg_rotateLeft;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector is
    variable temp : std_logic_vector(high-low downto 0);
  begin
    temp := that(high downto low);
    return temp;
  end pkg_extract;

  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned is
    variable temp : unsigned(high-low downto 0);
  begin
    temp := that(high downto low);
    return temp;
  end pkg_extract;

  function pkg_extract (that : signed; high : integer; low : integer) return signed is
    variable temp : signed(high-low downto 0);
  begin
    temp := that(high downto low);
    return temp;
  end pkg_extract;

  function pkg_mux (sel : std_logic;one : std_logic;zero : std_logic) return std_logic is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_mux (sel : std_logic;one : std_logic_vector;zero : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(zero'range);  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;  end pkg_mux;

  function pkg_mux (sel : std_logic;one : unsigned;zero : unsigned) return unsigned is
    variable ret : unsigned(zero'range);  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;  end pkg_mux;

  function pkg_mux (sel : std_logic;one : signed;zero : signed) return signed is
    variable ret : signed(zero'range);  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;  end pkg_mux;

  function pkg_toStdLogic (value : boolean) return std_logic is
  begin
    if value = true then
      return '1';
    else
      return '0';
    end if;
  end pkg_toStdLogic;

  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector is
    variable ret : std_logic_vector(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toStdLogicVector;

  function pkg_toUnsigned (value : std_logic) return unsigned is
    variable ret : unsigned(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toUnsigned;

  function pkg_toSigned (value : std_logic) return signed is
    variable ret : signed(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toSigned;

  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(lit'length-1 downto 0);
  begin
    ret := lit;    return ret;
  end pkg_stdLogicVector;

  function pkg_unsigned (lit : unsigned) return unsigned is
    variable ret : unsigned(lit'length-1 downto 0);
  begin
    ret := lit;    return ret;
  end pkg_unsigned;

  function pkg_signed (lit : signed) return signed is
    variable ret : signed(lit'length-1 downto 0);
  begin
    ret := lit;    return ret;
  end pkg_signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector is
  begin
    return std_logic_vector(resize(unsigned(that),width));
  end pkg_resize;


  function pkg_resize (that : unsigned; width : integer) return unsigned is
	  variable ret : unsigned(width-1 downto 0);
  begin
    if that'length = 0 then
       ret := (others => '0');
    else
       ret := resize(that,width);
    end if;
		return ret;
  end pkg_resize;
 
  function pkg_resize (that : signed; width : integer) return signed is
	  variable ret : signed(width-1 downto 0);
  begin
    if that'length = 0 then
       ret := (others => '0');
    elsif that'length >= width then
       ret := that(width-1 downto 0);
    else
       ret := resize(that,width);
    end if;
		return ret;
  end pkg_resize;
 end pkg_scala2hdl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity UdpApp is
  port( 
    io_rx_cmd_valid : in std_logic;
    io_rx_cmd_ready : out std_logic;
    io_rx_cmd_payload_ip : in std_logic_vector(31 downto 0);
    io_rx_cmd_payload_srcPort : in std_logic_vector(15 downto 0);
    io_rx_cmd_payload_dstPort : in std_logic_vector(15 downto 0);
    io_rx_cmd_payload_length : in unsigned(15 downto 0);
    io_rx_data_valid : in std_logic;
    io_rx_data_ready : out std_logic;
    io_rx_data_payload_last : in std_logic;
    io_rx_data_payload_fragment : in std_logic_vector(7 downto 0);
    io_tx_cmd_valid : out std_logic;
    io_tx_cmd_ready : in std_logic;
    io_tx_cmd_payload_ip : out std_logic_vector(31 downto 0);
    io_tx_cmd_payload_srcPort : out std_logic_vector(15 downto 0);
    io_tx_cmd_payload_dstPort : out std_logic_vector(15 downto 0);
    io_tx_cmd_payload_length : out unsigned(15 downto 0);
    io_tx_data_valid : out std_logic;
    io_tx_data_ready : in std_logic;
    io_tx_data_payload_last : out std_logic;
    io_tx_data_payload_fragment : out std_logic_vector(7 downto 0);
    clk : in std_logic;
    reset : in std_logic 
  );
end UdpApp;

architecture arch of UdpApp is

  signal flushRx_active : std_logic;
  signal zz_1 : std_logic;
  signal discoveringRspTxCmdFsm_wantExit : std_logic;
  signal discoveringRspTxDataFsm_wantExit : std_logic;
  signal discoveringRspTxDataFsm_sendMessage_counter : unsigned(2 downto 0);
  signal discoveringRspTxCmdFsm_stateReg : discoveringRspTxCmdFsm_enumDefinition;
  signal discoveringRspTxCmdFsm_stateNext : discoveringRspTxCmdFsm_enumDefinition;
  signal zz_2 : std_logic;
  signal discoveringRspTxDataFsm_stateReg : discoveringRspTxDataFsm_enumDefinition;
  signal discoveringRspTxDataFsm_stateNext : discoveringRspTxDataFsm_enumDefinition;
  signal zz_3 : std_logic;
  signal zz_4 : std_logic;
  signal fsm_stateReg : fsm_enumDefinition;
  signal fsm_stateNext : fsm_enumDefinition;
  signal zz_5 : std_logic;
  signal zz_6 : std_logic;
  signal zz_7 : std_logic;
  signal zz_8 : std_logic;
  signal zz_9 : std_logic;
  signal zz_10 : std_logic;
  signal zz_11 : std_logic;
  signal zz_12 : std_logic;
  signal io_tx_data_payload_last_readableBuffer : std_logic;
begin
  io_tx_cmd_payload_ip <= io_rx_cmd_payload_ip;
  io_tx_cmd_payload_srcPort <= io_rx_cmd_payload_dstPort;
  io_tx_cmd_payload_dstPort <= io_rx_cmd_payload_srcPort;
  io_tx_cmd_payload_length <= pkg_unsigned("0000000000000111");
  io_tx_data_payload_last <= io_tx_data_payload_last_readableBuffer;
  zz_1 <= (io_rx_data_valid and io_rx_data_payload_last);
  zz_2 <= pkg_toStdLogic(discoveringRspTxCmdFsm_stateReg = pkg_enum.e0);
  zz_3 <= pkg_toStdLogic(discoveringRspTxDataFsm_stateReg = pkg_enum.e0);
  zz_4 <= pkg_toStdLogic(discoveringRspTxDataFsm_stateReg = pkg_enum.e1);
  zz_5 <= pkg_toStdLogic(fsm_stateReg = pkg_enum.fsm_idle);
  zz_6 <= (io_rx_cmd_valid and (not flushRx_active));
  zz_7 <= pkg_toStdLogic(io_rx_cmd_payload_dstPort = pkg_stdLogicVector("1001010001100000"));
  zz_8 <= pkg_toStdLogic(fsm_stateReg = pkg_enum.fsm_helloHeader);
  zz_9 <= pkg_toStdLogic(io_rx_data_payload_fragment = pkg_stdLogicVector("00010001"));
  zz_10 <= pkg_toStdLogic(fsm_stateReg = pkg_enum.fsm_discoveringRspTx);
  zz_11 <= ((pkg_toStdLogic(discoveringRspTxCmdFsm_stateReg = pkg_enum.boot) or discoveringRspTxCmdFsm_wantExit) and (pkg_toStdLogic(discoveringRspTxDataFsm_stateReg = pkg_enum.boot) or discoveringRspTxDataFsm_wantExit));
  zz_12 <= ((not pkg_toStdLogic(fsm_stateReg = pkg_enum.fsm_discoveringRspTx)) and pkg_toStdLogic(fsm_stateNext = pkg_enum.fsm_discoveringRspTx));
  process(flushRx_active,zz_1)
  begin
    io_rx_cmd_ready <= pkg_toStdLogic(false);
    io_rx_data_ready <= pkg_toStdLogic(false);
    if flushRx_active = '1' then
      if zz_1 = '1' then
        io_rx_cmd_ready <= pkg_toStdLogic(true);
      end if;
      io_rx_data_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  process(io_tx_cmd_ready,io_tx_data_ready,discoveringRspTxDataFsm_sendMessage_counter,discoveringRspTxCmdFsm_stateReg,zz_2,discoveringRspTxDataFsm_stateReg,zz_3,zz_4,zz_12,io_tx_data_payload_last_readableBuffer)
  begin
    io_tx_data_valid <= pkg_toStdLogic(false);
    io_tx_data_payload_fragment <= pkg_stdLogicVector("00000000");
    discoveringRspTxDataFsm_wantExit <= pkg_toStdLogic(false);
    io_tx_cmd_valid <= pkg_toStdLogic(false);
    discoveringRspTxCmdFsm_wantExit <= pkg_toStdLogic(false);
    discoveringRspTxCmdFsm_stateNext <= discoveringRspTxCmdFsm_stateReg;
    if zz_2 = '1' then
      io_tx_cmd_valid <= pkg_toStdLogic(true);
      if io_tx_cmd_ready = '1' then
        discoveringRspTxCmdFsm_wantExit <= pkg_toStdLogic(true);
        discoveringRspTxCmdFsm_stateNext <= pkg_enum.boot;
      end if;
    end if;
    discoveringRspTxDataFsm_stateNext <= discoveringRspTxDataFsm_stateReg;
    io_tx_data_payload_last_readableBuffer <= pkg_toStdLogic(false);
    case discoveringRspTxDataFsm_stateReg is
      when pkg_enum.e0 =>
        io_tx_data_valid <= pkg_toStdLogic(true);
        io_tx_data_payload_fragment <= pkg_stdLogicVector("00100010");
        if io_tx_data_ready = '1' then
          discoveringRspTxDataFsm_stateNext <= pkg_enum.e1;
        end if;
      when pkg_enum.e1 =>
        io_tx_data_valid <= pkg_toStdLogic(true);
        io_tx_data_payload_fragment <= pkg_mux(pkg_extract(discoveringRspTxDataFsm_sendMessage_counter,2),pkg_mux(pkg_extract(discoveringRspTxDataFsm_sendMessage_counter,0),pkg_stdLogicVector("00110101"),pkg_stdLogicVector("00110100")),pkg_mux(pkg_extract(discoveringRspTxDataFsm_sendMessage_counter,1),pkg_mux(pkg_extract(discoveringRspTxDataFsm_sendMessage_counter,0),pkg_stdLogicVector("00110011"),pkg_stdLogicVector("00110010")),pkg_mux(pkg_extract(discoveringRspTxDataFsm_sendMessage_counter,0),pkg_stdLogicVector("00110001"),pkg_stdLogicVector("00110000"))));
        if io_tx_data_ready = '1' then
          if io_tx_data_payload_last_readableBuffer = '1' then
            discoveringRspTxDataFsm_wantExit <= pkg_toStdLogic(true);
            discoveringRspTxDataFsm_stateNext <= pkg_enum.boot;
          end if;
        end if;
        io_tx_data_payload_last_readableBuffer <= pkg_toStdLogic(discoveringRspTxDataFsm_sendMessage_counter = pkg_unsigned("101"));
      when others =>
    end case;
    if zz_12 = '1' then
      discoveringRspTxCmdFsm_stateNext <= pkg_enum.e0;
      discoveringRspTxDataFsm_stateNext <= pkg_enum.e0;
    end if;
  end process;

  process(io_rx_data_valid,fsm_stateReg,zz_5,zz_6,zz_7,zz_8,zz_9,zz_10,zz_11)
  begin
    fsm_stateNext <= fsm_stateReg;
    case fsm_stateReg is
      when pkg_enum.fsm_idle =>
        if zz_6 = '1' then
          if zz_7 = '1' then
            fsm_stateNext <= pkg_enum.fsm_helloHeader;
          end if;
        end if;
      when pkg_enum.fsm_helloHeader =>
        if io_rx_data_valid = '1' then
          if zz_9 = '1' then
            fsm_stateNext <= pkg_enum.fsm_discoveringRspTx;
          else
            fsm_stateNext <= pkg_enum.fsm_idle;
          end if;
        end if;
      when pkg_enum.fsm_discoveringRspTx =>
        if zz_11 = '1' then
          fsm_stateNext <= pkg_enum.fsm_idle;
        end if;
      when others =>
        fsm_stateNext <= pkg_enum.fsm_idle;
    end case;
  end process;

  process(clk,reset)
  begin
    if reset = '1' then
      flushRx_active <= pkg_toStdLogic(false);
      discoveringRspTxCmdFsm_stateReg <= pkg_enum.boot;
      discoveringRspTxDataFsm_stateReg <= pkg_enum.boot;
      fsm_stateReg <= pkg_enum.boot;
    elsif rising_edge(clk) then
      if flushRx_active = '1' then
        if zz_1 = '1' then
          flushRx_active <= pkg_toStdLogic(false);
        end if;
      end if;
      case fsm_stateReg is
        when pkg_enum.fsm_idle =>
          if zz_6 = '1' then
            if zz_7 = '1' then
            else
              flushRx_active <= pkg_toStdLogic(true);
            end if;
          end if;
        when pkg_enum.fsm_helloHeader =>
          if io_rx_data_valid = '1' then
            if zz_9 = '1' then
            else
              flushRx_active <= pkg_toStdLogic(true);
            end if;
          end if;
        when pkg_enum.fsm_discoveringRspTx =>
          if zz_11 = '1' then
            flushRx_active <= pkg_toStdLogic(true);
          end if;
        when others =>
      end case;
      discoveringRspTxCmdFsm_stateReg <= discoveringRspTxCmdFsm_stateNext;
      discoveringRspTxDataFsm_stateReg <= discoveringRspTxDataFsm_stateNext;
      fsm_stateReg <= fsm_stateNext;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      case discoveringRspTxDataFsm_stateReg is
        when pkg_enum.e0 =>
        when pkg_enum.e1 =>
          if io_tx_data_ready = '1' then
            discoveringRspTxDataFsm_sendMessage_counter <= (discoveringRspTxDataFsm_sendMessage_counter + pkg_unsigned("001"));
          end if;
        when others =>
      end case;
      if ((not pkg_toStdLogic(discoveringRspTxDataFsm_stateReg = pkg_enum.e1)) and pkg_toStdLogic(discoveringRspTxDataFsm_stateNext = pkg_enum.e1)) = '1' then
        discoveringRspTxDataFsm_sendMessage_counter <= pkg_unsigned("000");
      end if;
    end if;
  end process;

end arch;

