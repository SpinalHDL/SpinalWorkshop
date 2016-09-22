library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use ieee.math_real.all;

package pkg_enum is
  type stateMachine_enumDefinition is (stateMachine_IDLE,stateMachine_START,stateMachine_DATA,stateMachine_STOP,boot);
  type stateMachine_enumDefinition_debug is (XXX,stateMachine_IDLE,stateMachine_START,stateMachine_DATA,stateMachine_STOP,boot);

  function pkg_mux (sel : std_logic;one : stateMachine_enumDefinition;zero : stateMachine_enumDefinition) return stateMachine_enumDefinition;
  function pkg_toStdLogicVector_native (value : stateMachine_enumDefinition) return std_logic_vector;
  function pkg_tostateMachine_enumDefinition_native (value : std_logic_vector(2 downto 0)) return stateMachine_enumDefinition;
end pkg_enum;

package body pkg_enum is
  function pkg_mux (sel : std_logic;one : stateMachine_enumDefinition;zero : stateMachine_enumDefinition) return stateMachine_enumDefinition is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_tostateMachine_enumDefinition_native (value : std_logic_vector(2 downto 0)) return stateMachine_enumDefinition is
  begin
    case value is
      when "000" => return stateMachine_IDLE;
      when "001" => return stateMachine_START;
      when "010" => return stateMachine_DATA;
      when "011" => return stateMachine_STOP;
      when "100" => return boot;
      when others => return stateMachine_IDLE;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : stateMachine_enumDefinition) return std_logic_vector is
  begin
    case value is
      when stateMachine_IDLE => return "000";
      when stateMachine_START => return "001";
      when stateMachine_DATA => return "010";
      when stateMachine_STOP => return "011";
      when boot => return "100";
      when others => return "000";
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


entity UartCtrlRx is
  port( 
    io_rxd : in std_logic;
    io_samplingTick : in std_logic;
    io_read_valid : out std_logic;
    io_read_payload : out std_logic_vector(7 downto 0);
    clk : in std_logic;
    reset : in std_logic 
  );
end UartCtrlRx;

architecture arch of UartCtrlRx is

  signal zz_1 : std_logic;
  signal zz_2 : std_logic;
  signal zz_3 : std_logic;
  signal zz_4 : std_logic;
  signal zz_5 : std_logic;
  signal zz_6 : std_logic;
  signal zz_7 : std_logic;
  signal sampler_value : std_logic;
  signal sampler_tick : std_logic;
  signal bitTimer_counter : unsigned(2 downto 0);
  signal bitTimer_recenter : std_logic;
  signal bitTimer_tick : std_logic;
  signal bitCounter_value : unsigned(2 downto 0);
  signal bitCounter_clear : std_logic;
  signal stateMachine_buffer : std_logic_vector(7 downto 0);
  signal stateMachine_stateReg : stateMachine_enumDefinition;
  signal stateMachine_stateNext : stateMachine_enumDefinition;
  signal zz_8 : std_logic;
  signal zz_9 : std_logic;
  signal zz_10 : std_logic;
  signal zz_11 : std_logic;
  signal zz_12 : std_logic;
begin
  io_read_payload <= stateMachine_buffer;
  zz_1 <= pkg_toStdLogic(true);
  zz_8 <= pkg_toStdLogic(stateMachine_stateReg = pkg_enum.stateMachine_IDLE);
  zz_9 <= (sampler_tick and (not sampler_value));
  zz_10 <= pkg_toStdLogic(stateMachine_stateReg = pkg_enum.stateMachine_START);
  zz_11 <= pkg_toStdLogic(stateMachine_stateReg = pkg_enum.stateMachine_DATA);
  zz_12 <= pkg_toStdLogic(stateMachine_stateReg = pkg_enum.stateMachine_STOP);
  process(bitTimer_tick,bitCounter_value,stateMachine_stateReg,zz_8,zz_9,zz_10,zz_11,zz_12)
  begin
    io_read_valid <= pkg_toStdLogic(false);
    bitTimer_recenter <= pkg_toStdLogic(false);
    bitCounter_clear <= pkg_toStdLogic(false);
    stateMachine_stateNext <= stateMachine_stateReg;
    case stateMachine_stateReg is
      when pkg_enum.stateMachine_IDLE =>
        if zz_9 = '1' then
          bitTimer_recenter <= pkg_toStdLogic(true);
          stateMachine_stateNext <= pkg_enum.stateMachine_START;
        end if;
      when pkg_enum.stateMachine_START =>
        if bitTimer_tick = '1' then
          bitCounter_clear <= pkg_toStdLogic(true);
          stateMachine_stateNext <= pkg_enum.stateMachine_DATA;
        end if;
      when pkg_enum.stateMachine_DATA =>
        if bitTimer_tick = '1' then
          if bitCounter_value = pkg_unsigned("111") then
            stateMachine_stateNext <= pkg_enum.stateMachine_STOP;
          end if;
        end if;
      when pkg_enum.stateMachine_STOP =>
        if bitTimer_tick = '1' then
          io_read_valid <= pkg_toStdLogic(true);
          stateMachine_stateNext <= pkg_enum.stateMachine_IDLE;
        end if;
      when others =>
        stateMachine_stateNext <= pkg_enum.stateMachine_IDLE;
    end case;
  end process;

  process(sampler_tick,bitTimer_counter)
  begin
    bitTimer_tick <= pkg_toStdLogic(false);
    if sampler_tick = '1' then
      if bitTimer_counter = pkg_unsigned("000") then
        bitTimer_tick <= pkg_toStdLogic(true);
      end if;
    end if;
  end process;

  process(clk,reset,zz_1)
  begin
    if reset = '1' then
      zz_2 <= zz_1;
      zz_3 <= zz_1;
      zz_4 <= zz_1;
      zz_5 <= zz_1;
      zz_6 <= zz_1;
      zz_7 <= zz_1;
      stateMachine_stateReg <= pkg_enum.boot;
    elsif rising_edge(clk) then
      if io_samplingTick = '1' then
        zz_2 <= io_rxd;
      end if;
      if io_samplingTick = '1' then
        zz_3 <= zz_2;
      end if;
      if io_samplingTick = '1' then
        zz_4 <= zz_3;
      end if;
      if io_samplingTick = '1' then
        zz_5 <= zz_4;
      end if;
      if io_samplingTick = '1' then
        zz_6 <= zz_5;
      end if;
      if io_samplingTick = '1' then
        zz_7 <= zz_6;
      end if;
      stateMachine_stateReg <= stateMachine_stateNext;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      sampler_value <= ((((((((((pkg_toStdLogic(false) or (((pkg_toStdLogic(true) and zz_3) and zz_4) and zz_5)) or (((pkg_toStdLogic(true) and zz_3) and zz_4) and zz_6)) or (((pkg_toStdLogic(true) and zz_3) and zz_5) and zz_6)) or (((pkg_toStdLogic(true) and zz_4) and zz_5) and zz_6)) or (((pkg_toStdLogic(true) and zz_3) and zz_4) and zz_7)) or (((pkg_toStdLogic(true) and zz_3) and zz_5) and zz_7)) or (((pkg_toStdLogic(true) and zz_4) and zz_5) and zz_7)) or (((pkg_toStdLogic(true) and zz_3) and zz_6) and zz_7)) or (((pkg_toStdLogic(true) and zz_4) and zz_6) and zz_7)) or (((pkg_toStdLogic(true) and zz_5) and zz_6) and zz_7));
      sampler_tick <= io_samplingTick;
      if sampler_tick = '1' then
        bitTimer_counter <= (bitTimer_counter - pkg_unsigned("001"));
      end if;
      if bitTimer_recenter = '1' then
        bitTimer_counter <= pkg_unsigned("010");
      end if;
      if bitTimer_tick = '1' then
        bitCounter_value <= (bitCounter_value + pkg_unsigned("001"));
      end if;
      if bitCounter_clear = '1' then
        bitCounter_value <= pkg_unsigned("000");
      end if;
      case stateMachine_stateReg is
        when pkg_enum.stateMachine_IDLE =>
        when pkg_enum.stateMachine_START =>
        when pkg_enum.stateMachine_DATA =>
          if bitTimer_tick = '1' then
            stateMachine_buffer(to_integer(bitCounter_value)) <= sampler_value;
          end if;
        when others =>
      end case;
    end if;
  end process;

end arch;

