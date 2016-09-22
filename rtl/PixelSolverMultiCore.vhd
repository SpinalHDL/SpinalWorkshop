library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use ieee.math_real.all;

package pkg_enum is

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


entity StreamDispatcherSequencial is
  port( 
    io_input_valid : in std_logic;
    io_input_ready : out std_logic;
    io_input_payload_x : in signed(27 downto 0);
    io_input_payload_y : in signed(27 downto 0);
    io_outputs_0_valid : out std_logic;
    io_outputs_0_ready : in std_logic;
    io_outputs_0_payload_x : out signed(27 downto 0);
    io_outputs_0_payload_y : out signed(27 downto 0);
    io_outputs_1_valid : out std_logic;
    io_outputs_1_ready : in std_logic;
    io_outputs_1_payload_x : out signed(27 downto 0);
    io_outputs_1_payload_y : out signed(27 downto 0);
    io_outputs_2_valid : out std_logic;
    io_outputs_2_ready : in std_logic;
    io_outputs_2_payload_x : out signed(27 downto 0);
    io_outputs_2_payload_y : out signed(27 downto 0);
    io_outputs_3_valid : out std_logic;
    io_outputs_3_ready : in std_logic;
    io_outputs_3_payload_x : out signed(27 downto 0);
    io_outputs_3_payload_y : out signed(27 downto 0);
    io_outputs_4_valid : out std_logic;
    io_outputs_4_ready : in std_logic;
    io_outputs_4_payload_x : out signed(27 downto 0);
    io_outputs_4_payload_y : out signed(27 downto 0);
    io_outputs_5_valid : out std_logic;
    io_outputs_5_ready : in std_logic;
    io_outputs_5_payload_x : out signed(27 downto 0);
    io_outputs_5_payload_y : out signed(27 downto 0);
    io_outputs_6_valid : out std_logic;
    io_outputs_6_ready : in std_logic;
    io_outputs_6_payload_x : out signed(27 downto 0);
    io_outputs_6_payload_y : out signed(27 downto 0);
    io_outputs_7_valid : out std_logic;
    io_outputs_7_ready : in std_logic;
    io_outputs_7_payload_x : out signed(27 downto 0);
    io_outputs_7_payload_y : out signed(27 downto 0);
    clk : in std_logic;
    reset : in std_logic 
  );
end StreamDispatcherSequencial;

architecture arch of StreamDispatcherSequencial is

  signal counter_willIncrement : std_logic;
  signal counter_willClear : std_logic;
  signal counter_valueNext : unsigned(2 downto 0);
  signal counter_value : unsigned(2 downto 0);
  signal zz_1 : unsigned(2 downto 0);
  signal zz_2 : signed(27 downto 0);
  signal zz_3 : signed(27 downto 0);
  signal zz_4 : std_logic;
  signal zz_5 : signed(27 downto 0);
  signal zz_6 : signed(27 downto 0);
  signal zz_7 : std_logic;
  signal zz_8 : signed(27 downto 0);
  signal zz_9 : signed(27 downto 0);
  signal zz_10 : std_logic;
  signal zz_11 : signed(27 downto 0);
  signal zz_12 : signed(27 downto 0);
  signal zz_13 : std_logic;
  signal zz_14 : signed(27 downto 0);
  signal zz_15 : signed(27 downto 0);
  signal zz_16 : std_logic;
  signal zz_17 : signed(27 downto 0);
  signal zz_18 : signed(27 downto 0);
  signal zz_19 : std_logic;
  signal zz_20 : signed(27 downto 0);
  signal zz_21 : signed(27 downto 0);
  signal zz_22 : std_logic;
  signal zz_23 : signed(27 downto 0);
  signal zz_24 : signed(27 downto 0);
  signal zz_25 : std_logic;
  signal io_input_ready_readableBuffer : std_logic;
begin
  io_input_ready <= io_input_ready_readableBuffer;
  io_outputs_0_payload_x <= zz_2;
  io_outputs_0_payload_y <= zz_3;
  io_outputs_1_payload_x <= zz_5;
  io_outputs_1_payload_y <= zz_6;
  io_outputs_2_payload_x <= zz_8;
  io_outputs_2_payload_y <= zz_9;
  io_outputs_3_payload_x <= zz_11;
  io_outputs_3_payload_y <= zz_12;
  io_outputs_4_payload_x <= zz_14;
  io_outputs_4_payload_y <= zz_15;
  io_outputs_5_payload_x <= zz_17;
  io_outputs_5_payload_y <= zz_18;
  io_outputs_6_payload_x <= zz_20;
  io_outputs_6_payload_y <= zz_21;
  io_outputs_7_payload_x <= zz_23;
  io_outputs_7_payload_y <= zz_24;
  counter_willClear <= pkg_toStdLogic(false);
  zz_1 <= (counter_value + pkg_resize(unsigned(pkg_toStdLogicVector(counter_willIncrement)),3));
  zz_2 <= io_input_payload_x;
  zz_3 <= io_input_payload_y;
  zz_4 <= pkg_toStdLogic(counter_value /= pkg_unsigned("000"));
  zz_5 <= io_input_payload_x;
  zz_6 <= io_input_payload_y;
  zz_7 <= pkg_toStdLogic(counter_value /= pkg_unsigned("001"));
  zz_8 <= io_input_payload_x;
  zz_9 <= io_input_payload_y;
  zz_10 <= pkg_toStdLogic(counter_value /= pkg_unsigned("010"));
  zz_11 <= io_input_payload_x;
  zz_12 <= io_input_payload_y;
  zz_13 <= pkg_toStdLogic(counter_value /= pkg_unsigned("011"));
  zz_14 <= io_input_payload_x;
  zz_15 <= io_input_payload_y;
  zz_16 <= pkg_toStdLogic(counter_value /= pkg_unsigned("100"));
  zz_17 <= io_input_payload_x;
  zz_18 <= io_input_payload_y;
  zz_19 <= pkg_toStdLogic(counter_value /= pkg_unsigned("101"));
  zz_20 <= io_input_payload_x;
  zz_21 <= io_input_payload_y;
  zz_22 <= pkg_toStdLogic(counter_value /= pkg_unsigned("110"));
  zz_23 <= io_input_payload_x;
  zz_24 <= io_input_payload_y;
  zz_25 <= pkg_toStdLogic(counter_value /= pkg_unsigned("111"));
  process(io_input_valid,io_outputs_0_ready,io_outputs_1_ready,io_outputs_2_ready,io_outputs_3_ready,io_outputs_4_ready,io_outputs_5_ready,io_outputs_6_ready,io_outputs_7_ready,zz_4,zz_7,zz_10,zz_13,zz_16,zz_19,zz_22,zz_25)
  begin
    io_input_ready_readableBuffer <= pkg_toStdLogic(false);
    if zz_4 = '1' then
      io_outputs_0_valid <= pkg_toStdLogic(false);
    else
      io_outputs_0_valid <= io_input_valid;
      io_input_ready_readableBuffer <= io_outputs_0_ready;
    end if;
    if zz_7 = '1' then
      io_outputs_1_valid <= pkg_toStdLogic(false);
    else
      io_outputs_1_valid <= io_input_valid;
      io_input_ready_readableBuffer <= io_outputs_1_ready;
    end if;
    if zz_10 = '1' then
      io_outputs_2_valid <= pkg_toStdLogic(false);
    else
      io_outputs_2_valid <= io_input_valid;
      io_input_ready_readableBuffer <= io_outputs_2_ready;
    end if;
    if zz_13 = '1' then
      io_outputs_3_valid <= pkg_toStdLogic(false);
    else
      io_outputs_3_valid <= io_input_valid;
      io_input_ready_readableBuffer <= io_outputs_3_ready;
    end if;
    if zz_16 = '1' then
      io_outputs_4_valid <= pkg_toStdLogic(false);
    else
      io_outputs_4_valid <= io_input_valid;
      io_input_ready_readableBuffer <= io_outputs_4_ready;
    end if;
    if zz_19 = '1' then
      io_outputs_5_valid <= pkg_toStdLogic(false);
    else
      io_outputs_5_valid <= io_input_valid;
      io_input_ready_readableBuffer <= io_outputs_5_ready;
    end if;
    if zz_22 = '1' then
      io_outputs_6_valid <= pkg_toStdLogic(false);
    else
      io_outputs_6_valid <= io_input_valid;
      io_input_ready_readableBuffer <= io_outputs_6_ready;
    end if;
    if zz_25 = '1' then
      io_outputs_7_valid <= pkg_toStdLogic(false);
    else
      io_outputs_7_valid <= io_input_valid;
      io_input_ready_readableBuffer <= io_outputs_7_ready;
    end if;
  end process;

  process(io_input_valid,io_input_ready_readableBuffer)
  begin
    counter_willIncrement <= pkg_toStdLogic(false);
    if (io_input_valid and io_input_ready_readableBuffer) = '1' then
      counter_willIncrement <= pkg_toStdLogic(true);
    end if;
  end process;

  process(counter_willClear,zz_1)
  begin
    counter_valueNext <= zz_1;
    if counter_willClear = '1' then
      counter_valueNext <= pkg_unsigned("000");
    end if;
  end process;

  process(clk,reset)
  begin
    if reset = '1' then
      counter_value <= pkg_unsigned("000");
    elsif rising_edge(clk) then
      counter_value <= counter_valueNext;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity PixelSolver is
  port( 
    io_pixelTask_valid : in std_logic;
    io_pixelTask_ready : out std_logic;
    io_pixelTask_payload_x : in signed(27 downto 0);
    io_pixelTask_payload_y : in signed(27 downto 0);
    io_pixelResult_valid : out std_logic;
    io_pixelResult_ready : in std_logic;
    io_pixelResult_payload_iteration : out unsigned(5 downto 0);
    clk : in std_logic;
    reset : in std_logic 
  );
end PixelSolver;

architecture arch of PixelSolver is

  signal start : std_logic;
  signal xReg : signed(27 downto 0);
  signal yReg : signed(27 downto 0);
  signal iterationReg : unsigned(5 downto 0);
  signal x : signed(27 downto 0);
  signal zz_1 : signed(27 downto 0);
  signal zz_2 : signed(27 downto 0);
  signal y : signed(27 downto 0);
  signal zz_3 : signed(27 downto 0);
  signal zz_4 : signed(27 downto 0);
  signal iteration : unsigned(5 downto 0);
  signal xx : signed(55 downto 0);
  signal yy : signed(55 downto 0);
  signal xy : signed(55 downto 0);
  signal zz_5 : std_logic;
  signal zz_6 : signed(55 downto 0);
  signal zz_7 : signed(35 downto 0);
  signal zz_8 : signed(55 downto 0);
  signal zz_9 : signed(36 downto 0);
  signal io_pixelResult_valid_readableBuffer : std_logic;
  signal io_pixelTask_ready_readableBuffer : std_logic;
begin
  io_pixelTask_ready <= io_pixelTask_ready_readableBuffer;
  io_pixelResult_valid <= io_pixelResult_valid_readableBuffer;
  io_pixelResult_payload_iteration <= iteration;
  x <= pkg_mux(start,zz_1,zz_2);
  zz_1 <= io_pixelTask_payload_x;
  zz_2 <= xReg;
  y <= pkg_mux(start,zz_3,zz_4);
  zz_3 <= io_pixelTask_payload_y;
  zz_4 <= yReg;
  iteration <= pkg_mux(start,pkg_unsigned("000000"),iterationReg);
  xx <= (x * x);
  yy <= (y * y);
  xy <= (x * y);
  zz_5 <= (pkg_toStdLogic(pkg_signed("00000000000001000000000000000000000000000000000000000000") <= (xx + yy)) or pkg_toStdLogic(iteration = pkg_unsigned("111111")));
  zz_6 <= ((xx - yy) + pkg_resize(pkg_shiftLeft(io_pixelTask_payload_x,20),56));
  zz_7 <= pkg_shiftRight(zz_6,20);
  zz_8 <= (xy + pkg_resize(pkg_shiftLeft(io_pixelTask_payload_y,19),56));
  zz_9 <= pkg_shiftRight(zz_8,19);
  process(io_pixelTask_valid,io_pixelResult_ready,zz_5)
  begin
    io_pixelResult_valid_readableBuffer <= pkg_toStdLogic(false);
    io_pixelTask_ready_readableBuffer <= pkg_toStdLogic(false);
    if zz_5 = '1' then
      io_pixelResult_valid_readableBuffer <= io_pixelTask_valid;
      io_pixelTask_ready_readableBuffer <= io_pixelResult_ready;
    end if;
  end process;

  process(clk,reset)
  begin
    if reset = '1' then
      start <= pkg_toStdLogic(true);
    elsif rising_edge(clk) then
      if (io_pixelTask_valid and (not io_pixelResult_valid_readableBuffer)) = '1' then
        start <= pkg_toStdLogic(false);
      end if;
      if io_pixelTask_ready_readableBuffer = '1' then
        start <= pkg_toStdLogic(true);
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if zz_5 = '1' then
      else
        xReg <= pkg_resize(zz_7,28);
        yReg <= pkg_resize(zz_9,28);
        iterationReg <= (iteration + pkg_unsigned("000001"));
      end if;
    end if;
  end process;

end arch;


--PixelSolver_1 remplaced by PixelSolver


--PixelSolver_2 remplaced by PixelSolver


--PixelSolver_3 remplaced by PixelSolver


--PixelSolver_4 remplaced by PixelSolver


--PixelSolver_5 remplaced by PixelSolver


--PixelSolver_6 remplaced by PixelSolver


--PixelSolver_7 remplaced by PixelSolver

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity StreamArbiter is
  port( 
    io_inputs_0_valid : in std_logic;
    io_inputs_0_ready : out std_logic;
    io_inputs_0_payload_iteration : in unsigned(5 downto 0);
    io_inputs_1_valid : in std_logic;
    io_inputs_1_ready : out std_logic;
    io_inputs_1_payload_iteration : in unsigned(5 downto 0);
    io_inputs_2_valid : in std_logic;
    io_inputs_2_ready : out std_logic;
    io_inputs_2_payload_iteration : in unsigned(5 downto 0);
    io_inputs_3_valid : in std_logic;
    io_inputs_3_ready : out std_logic;
    io_inputs_3_payload_iteration : in unsigned(5 downto 0);
    io_inputs_4_valid : in std_logic;
    io_inputs_4_ready : out std_logic;
    io_inputs_4_payload_iteration : in unsigned(5 downto 0);
    io_inputs_5_valid : in std_logic;
    io_inputs_5_ready : out std_logic;
    io_inputs_5_payload_iteration : in unsigned(5 downto 0);
    io_inputs_6_valid : in std_logic;
    io_inputs_6_ready : out std_logic;
    io_inputs_6_payload_iteration : in unsigned(5 downto 0);
    io_inputs_7_valid : in std_logic;
    io_inputs_7_ready : out std_logic;
    io_inputs_7_payload_iteration : in unsigned(5 downto 0);
    io_output_valid : out std_logic;
    io_output_ready : in std_logic;
    io_output_payload_iteration : out unsigned(5 downto 0);
    clk : in std_logic;
    reset : in std_logic 
  );
end StreamArbiter;

architecture arch of StreamArbiter is

  signal locked : std_logic;
  signal maskProposal_0 : std_logic;
  signal maskProposal_1 : std_logic;
  signal maskProposal_2 : std_logic;
  signal maskProposal_3 : std_logic;
  signal maskProposal_4 : std_logic;
  signal maskProposal_5 : std_logic;
  signal maskProposal_6 : std_logic;
  signal maskProposal_7 : std_logic;
  signal maskLocked_0 : std_logic;
  signal maskLocked_1 : std_logic;
  signal maskLocked_2 : std_logic;
  signal maskLocked_3 : std_logic;
  signal maskLocked_4 : std_logic;
  signal maskLocked_5 : std_logic;
  signal maskLocked_6 : std_logic;
  signal maskLocked_7 : std_logic;
  signal maskRouted_0 : std_logic;
  signal maskRouted_1 : std_logic;
  signal maskRouted_2 : std_logic;
  signal maskRouted_3 : std_logic;
  signal maskRouted_4 : std_logic;
  signal maskRouted_5 : std_logic;
  signal maskRouted_6 : std_logic;
  signal maskRouted_7 : std_logic;
  signal arbitration_counter_willIncrement : std_logic;
  signal arbitration_counter_willClear : std_logic;
  signal arbitration_counter_valueNext : unsigned(2 downto 0);
  signal arbitration_counter_value : unsigned(2 downto 0);
  signal zz_1 : unsigned(2 downto 0);
  signal zz_2 : unsigned(7 downto 0);
  signal zz_3 : std_logic;
  signal zz_4 : std_logic;
  signal zz_5 : std_logic;
  signal zz_6 : std_logic;
  signal zz_7 : unsigned(2 downto 0);
  signal io_output_valid_readableBuffer : std_logic;
begin
  io_inputs_0_ready <= (maskRouted_0 and io_output_ready);
  io_inputs_1_ready <= (maskRouted_1 and io_output_ready);
  io_inputs_2_ready <= (maskRouted_2 and io_output_ready);
  io_inputs_3_ready <= (maskRouted_3 and io_output_ready);
  io_inputs_4_ready <= (maskRouted_4 and io_output_ready);
  io_inputs_5_ready <= (maskRouted_5 and io_output_ready);
  io_inputs_6_ready <= (maskRouted_6 and io_output_ready);
  io_inputs_7_ready <= (maskRouted_7 and io_output_ready);
  io_output_valid <= io_output_valid_readableBuffer;
  io_output_payload_iteration <= pkg_mux(pkg_extract(zz_7,2),pkg_mux(pkg_extract(zz_7,1),pkg_mux(pkg_extract(zz_7,0),io_inputs_7_payload_iteration,io_inputs_6_payload_iteration),pkg_mux(pkg_extract(zz_7,0),io_inputs_5_payload_iteration,io_inputs_4_payload_iteration)),pkg_mux(pkg_extract(zz_7,1),pkg_mux(pkg_extract(zz_7,0),io_inputs_3_payload_iteration,io_inputs_2_payload_iteration),pkg_mux(pkg_extract(zz_7,0),io_inputs_1_payload_iteration,io_inputs_0_payload_iteration)));
  maskRouted_0 <= pkg_mux(locked,maskLocked_0,maskProposal_0);
  maskRouted_1 <= pkg_mux(locked,maskLocked_1,maskProposal_1);
  maskRouted_2 <= pkg_mux(locked,maskLocked_2,maskProposal_2);
  maskRouted_3 <= pkg_mux(locked,maskLocked_3,maskProposal_3);
  maskRouted_4 <= pkg_mux(locked,maskLocked_4,maskProposal_4);
  maskRouted_5 <= pkg_mux(locked,maskLocked_5,maskProposal_5);
  maskRouted_6 <= pkg_mux(locked,maskLocked_6,maskProposal_6);
  maskRouted_7 <= pkg_mux(locked,maskLocked_7,maskProposal_7);
  arbitration_counter_willClear <= pkg_toStdLogic(false);
  zz_1 <= (arbitration_counter_value + pkg_resize(unsigned(pkg_toStdLogicVector(arbitration_counter_willIncrement)),3));
  zz_2 <= pkg_shiftLeft(pkg_unsigned("1"),arbitration_counter_value);
  zz_3 <= pkg_toStdLogic(true);
  zz_4 <= (((maskRouted_1 or maskRouted_3) or maskRouted_5) or maskRouted_7);
  zz_5 <= (((maskRouted_2 or maskRouted_3) or maskRouted_6) or maskRouted_7);
  zz_6 <= (((maskRouted_4 or maskRouted_5) or maskRouted_6) or maskRouted_7);
  zz_7 <= unsigned(pkg_cat(pkg_toStdLogicVector(zz_6),pkg_cat(pkg_toStdLogicVector(zz_5),pkg_toStdLogicVector(zz_4))));
  io_output_valid_readableBuffer <= ((((((((io_inputs_0_valid and maskRouted_0) or (io_inputs_1_valid and maskRouted_1)) or (io_inputs_2_valid and maskRouted_2)) or (io_inputs_3_valid and maskRouted_3)) or (io_inputs_4_valid and maskRouted_4)) or (io_inputs_5_valid and maskRouted_5)) or (io_inputs_6_valid and maskRouted_6)) or (io_inputs_7_valid and maskRouted_7));
  process(zz_2,zz_3)
  begin
    maskProposal_0 <= pkg_toStdLogic(false);
    if pkg_extract(zz_2,0) = '1' then
      maskProposal_0 <= zz_3;
    end if;
  end process;

  process(zz_2,zz_3)
  begin
    maskProposal_1 <= pkg_toStdLogic(false);
    if pkg_extract(zz_2,1) = '1' then
      maskProposal_1 <= zz_3;
    end if;
  end process;

  process(zz_2,zz_3)
  begin
    maskProposal_2 <= pkg_toStdLogic(false);
    if pkg_extract(zz_2,2) = '1' then
      maskProposal_2 <= zz_3;
    end if;
  end process;

  process(zz_2,zz_3)
  begin
    maskProposal_3 <= pkg_toStdLogic(false);
    if pkg_extract(zz_2,3) = '1' then
      maskProposal_3 <= zz_3;
    end if;
  end process;

  process(zz_2,zz_3)
  begin
    maskProposal_4 <= pkg_toStdLogic(false);
    if pkg_extract(zz_2,4) = '1' then
      maskProposal_4 <= zz_3;
    end if;
  end process;

  process(zz_2,zz_3)
  begin
    maskProposal_5 <= pkg_toStdLogic(false);
    if pkg_extract(zz_2,5) = '1' then
      maskProposal_5 <= zz_3;
    end if;
  end process;

  process(zz_2,zz_3)
  begin
    maskProposal_6 <= pkg_toStdLogic(false);
    if pkg_extract(zz_2,6) = '1' then
      maskProposal_6 <= zz_3;
    end if;
  end process;

  process(zz_2,zz_3)
  begin
    maskProposal_7 <= pkg_toStdLogic(false);
    if pkg_extract(zz_2,7) = '1' then
      maskProposal_7 <= zz_3;
    end if;
  end process;

  process(io_output_ready,io_output_valid_readableBuffer)
  begin
    arbitration_counter_willIncrement <= pkg_toStdLogic(false);
    if (io_output_valid_readableBuffer and io_output_ready) = '1' then
      arbitration_counter_willIncrement <= pkg_toStdLogic(true);
    end if;
  end process;

  process(arbitration_counter_willClear,zz_1)
  begin
    arbitration_counter_valueNext <= zz_1;
    if arbitration_counter_willClear = '1' then
      arbitration_counter_valueNext <= pkg_unsigned("000");
    end if;
  end process;

  process(clk,reset)
  begin
    if reset = '1' then
      locked <= pkg_toStdLogic(false);
      arbitration_counter_value <= pkg_unsigned("000");
    elsif rising_edge(clk) then
      if io_output_valid_readableBuffer = '1' then
        locked <= pkg_toStdLogic(true);
      end if;
      if io_output_ready = '1' then
        locked <= pkg_toStdLogic(false);
      end if;
      arbitration_counter_value <= arbitration_counter_valueNext;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_output_valid_readableBuffer = '1' then
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
        maskLocked_2 <= maskRouted_2;
        maskLocked_3 <= maskRouted_3;
        maskLocked_4 <= maskRouted_4;
        maskLocked_5 <= maskRouted_5;
        maskLocked_6 <= maskRouted_6;
        maskLocked_7 <= maskRouted_7;
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity PixelSolverMultiCore is
  port( 
    io_pixelTask_valid : in std_logic;
    io_pixelTask_ready : out std_logic;
    io_pixelTask_payload_x : in signed(27 downto 0);
    io_pixelTask_payload_y : in signed(27 downto 0);
    io_pixelResult_valid : out std_logic;
    io_pixelResult_ready : in std_logic;
    io_pixelResult_payload_iteration : out unsigned(5 downto 0);
    clk : in std_logic;
    reset : in std_logic 
  );
end PixelSolverMultiCore;

architecture arch of PixelSolverMultiCore is

  signal zz_1 : std_logic;
  signal zz_2 : signed(27 downto 0);
  signal zz_3 : signed(27 downto 0);
  signal zz_4 : signed(27 downto 0);
  signal zz_5 : signed(27 downto 0);
  signal zz_6 : signed(27 downto 0);
  signal zz_7 : signed(27 downto 0);
  signal zz_8 : signed(27 downto 0);
  signal zz_9 : signed(27 downto 0);
  signal zz_10 : std_logic;
  signal zz_11 : unsigned(5 downto 0);
  signal zz_12 : signed(27 downto 0);
  signal zz_13 : signed(27 downto 0);
  signal zz_14 : std_logic;
  signal zz_15 : unsigned(5 downto 0);
  signal zz_16 : signed(27 downto 0);
  signal zz_17 : signed(27 downto 0);
  signal zz_18 : std_logic;
  signal zz_19 : unsigned(5 downto 0);
  signal zz_20 : signed(27 downto 0);
  signal zz_21 : signed(27 downto 0);
  signal zz_22 : std_logic;
  signal zz_23 : unsigned(5 downto 0);
  signal zz_24 : signed(27 downto 0);
  signal zz_25 : signed(27 downto 0);
  signal zz_26 : std_logic;
  signal zz_27 : unsigned(5 downto 0);
  signal zz_28 : signed(27 downto 0);
  signal zz_29 : signed(27 downto 0);
  signal zz_30 : std_logic;
  signal zz_31 : unsigned(5 downto 0);
  signal zz_32 : signed(27 downto 0);
  signal zz_33 : signed(27 downto 0);
  signal zz_34 : std_logic;
  signal zz_35 : unsigned(5 downto 0);
  signal zz_36 : signed(27 downto 0);
  signal zz_37 : signed(27 downto 0);
  signal zz_38 : std_logic;
  signal zz_39 : unsigned(5 downto 0);
  signal zz_40 : std_logic;
  signal pixelTaskDispatcher_io_input_ready : std_logic;
  signal pixelTaskSolver0_io_pixelTask_ready : std_logic;
  signal pixelTaskSolver0_io_pixelResult_ready : std_logic;
  signal pixelResultArbiter_io_inputs_0_ready : std_logic;
  signal pixelResultArbiter_io_output_ready : std_logic;
  signal pixelResultArbiter_io_output_valid : std_logic;
  signal pixelTaskSolver7_io_pixelResult_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_7_valid : std_logic;
  signal pixelTaskSolver7_io_pixelResult_ready : std_logic;
  signal pixelResultArbiter_io_inputs_7_ready : std_logic;
  signal pixelTaskSolver6_io_pixelResult_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_6_valid : std_logic;
  signal pixelTaskSolver6_io_pixelResult_ready : std_logic;
  signal pixelResultArbiter_io_inputs_6_ready : std_logic;
  signal pixelTaskSolver5_io_pixelResult_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_5_valid : std_logic;
  signal pixelTaskSolver5_io_pixelResult_ready : std_logic;
  signal pixelResultArbiter_io_inputs_5_ready : std_logic;
  signal pixelTaskSolver4_io_pixelResult_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_4_valid : std_logic;
  signal pixelTaskSolver4_io_pixelResult_ready : std_logic;
  signal pixelResultArbiter_io_inputs_4_ready : std_logic;
  signal pixelTaskSolver3_io_pixelResult_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_3_valid : std_logic;
  signal pixelTaskSolver3_io_pixelResult_ready : std_logic;
  signal pixelResultArbiter_io_inputs_3_ready : std_logic;
  signal pixelTaskSolver2_io_pixelResult_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_2_valid : std_logic;
  signal pixelTaskSolver2_io_pixelResult_ready : std_logic;
  signal pixelResultArbiter_io_inputs_2_ready : std_logic;
  signal pixelTaskSolver1_io_pixelResult_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_1_valid : std_logic;
  signal pixelTaskSolver1_io_pixelResult_ready : std_logic;
  signal pixelResultArbiter_io_inputs_1_ready : std_logic;
  signal pixelTaskSolver0_io_pixelResult_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_0_valid : std_logic;
  signal pixelTaskSolver1_io_pixelTask_ready : std_logic;
  signal pixelTaskSolver2_io_pixelTask_ready : std_logic;
  signal pixelTaskSolver3_io_pixelTask_ready : std_logic;
  signal pixelTaskSolver4_io_pixelTask_ready : std_logic;
  signal pixelTaskSolver5_io_pixelTask_ready : std_logic;
  signal pixelTaskSolver6_io_pixelTask_ready : std_logic;
  signal pixelTaskSolver7_io_pixelTask_ready : std_logic;
  signal pixelResultArbiter_io_output_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver0_io_pixelResult_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver1_io_pixelResult_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver2_io_pixelResult_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver3_io_pixelResult_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver4_io_pixelResult_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver5_io_pixelResult_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver6_io_pixelResult_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver7_io_pixelResult_payload_iteration : unsigned(5 downto 0);
  signal io_pixelTask_ready_readableBuffer : std_logic;
begin
  pixelTaskDispatcher : entity work.StreamDispatcherSequencial
    port map ( 
      io_input_valid => zz_1,
      io_input_ready => pixelTaskDispatcher_io_input_ready,
      io_input_payload_x => zz_6,
      io_input_payload_y => zz_7,
      io_outputs_0_valid => pixelTaskDispatcher_io_outputs_0_valid,
      io_outputs_0_ready => pixelTaskSolver0_io_pixelTask_ready,
      io_outputs_0_payload_x => zz_8,
      io_outputs_0_payload_y => zz_9,
      io_outputs_1_valid => pixelTaskDispatcher_io_outputs_1_valid,
      io_outputs_1_ready => pixelTaskSolver1_io_pixelTask_ready,
      io_outputs_1_payload_x => zz_12,
      io_outputs_1_payload_y => zz_13,
      io_outputs_2_valid => pixelTaskDispatcher_io_outputs_2_valid,
      io_outputs_2_ready => pixelTaskSolver2_io_pixelTask_ready,
      io_outputs_2_payload_x => zz_16,
      io_outputs_2_payload_y => zz_17,
      io_outputs_3_valid => pixelTaskDispatcher_io_outputs_3_valid,
      io_outputs_3_ready => pixelTaskSolver3_io_pixelTask_ready,
      io_outputs_3_payload_x => zz_20,
      io_outputs_3_payload_y => zz_21,
      io_outputs_4_valid => pixelTaskDispatcher_io_outputs_4_valid,
      io_outputs_4_ready => pixelTaskSolver4_io_pixelTask_ready,
      io_outputs_4_payload_x => zz_24,
      io_outputs_4_payload_y => zz_25,
      io_outputs_5_valid => pixelTaskDispatcher_io_outputs_5_valid,
      io_outputs_5_ready => pixelTaskSolver5_io_pixelTask_ready,
      io_outputs_5_payload_x => zz_28,
      io_outputs_5_payload_y => zz_29,
      io_outputs_6_valid => pixelTaskDispatcher_io_outputs_6_valid,
      io_outputs_6_ready => pixelTaskSolver6_io_pixelTask_ready,
      io_outputs_6_payload_x => zz_32,
      io_outputs_6_payload_y => zz_33,
      io_outputs_7_valid => pixelTaskDispatcher_io_outputs_7_valid,
      io_outputs_7_ready => pixelTaskSolver7_io_pixelTask_ready,
      io_outputs_7_payload_x => zz_36,
      io_outputs_7_payload_y => zz_37,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver0 : entity work.PixelSolver
    port map ( 
      io_pixelTask_valid => pixelTaskDispatcher_io_outputs_0_valid,
      io_pixelTask_ready => pixelTaskSolver0_io_pixelTask_ready,
      io_pixelTask_payload_x => zz_8,
      io_pixelTask_payload_y => zz_9,
      io_pixelResult_valid => pixelTaskSolver0_io_pixelResult_valid,
      io_pixelResult_ready => pixelTaskSolver0_io_pixelResult_ready,
      io_pixelResult_payload_iteration => pixelTaskSolver0_io_pixelResult_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver1 : entity work.PixelSolver
    port map ( 
      io_pixelTask_valid => pixelTaskDispatcher_io_outputs_1_valid,
      io_pixelTask_ready => pixelTaskSolver1_io_pixelTask_ready,
      io_pixelTask_payload_x => zz_12,
      io_pixelTask_payload_y => zz_13,
      io_pixelResult_valid => pixelTaskSolver1_io_pixelResult_valid,
      io_pixelResult_ready => pixelTaskSolver1_io_pixelResult_ready,
      io_pixelResult_payload_iteration => pixelTaskSolver1_io_pixelResult_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver2 : entity work.PixelSolver
    port map ( 
      io_pixelTask_valid => pixelTaskDispatcher_io_outputs_2_valid,
      io_pixelTask_ready => pixelTaskSolver2_io_pixelTask_ready,
      io_pixelTask_payload_x => zz_16,
      io_pixelTask_payload_y => zz_17,
      io_pixelResult_valid => pixelTaskSolver2_io_pixelResult_valid,
      io_pixelResult_ready => pixelTaskSolver2_io_pixelResult_ready,
      io_pixelResult_payload_iteration => pixelTaskSolver2_io_pixelResult_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver3 : entity work.PixelSolver
    port map ( 
      io_pixelTask_valid => pixelTaskDispatcher_io_outputs_3_valid,
      io_pixelTask_ready => pixelTaskSolver3_io_pixelTask_ready,
      io_pixelTask_payload_x => zz_20,
      io_pixelTask_payload_y => zz_21,
      io_pixelResult_valid => pixelTaskSolver3_io_pixelResult_valid,
      io_pixelResult_ready => pixelTaskSolver3_io_pixelResult_ready,
      io_pixelResult_payload_iteration => pixelTaskSolver3_io_pixelResult_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver4 : entity work.PixelSolver
    port map ( 
      io_pixelTask_valid => pixelTaskDispatcher_io_outputs_4_valid,
      io_pixelTask_ready => pixelTaskSolver4_io_pixelTask_ready,
      io_pixelTask_payload_x => zz_24,
      io_pixelTask_payload_y => zz_25,
      io_pixelResult_valid => pixelTaskSolver4_io_pixelResult_valid,
      io_pixelResult_ready => pixelTaskSolver4_io_pixelResult_ready,
      io_pixelResult_payload_iteration => pixelTaskSolver4_io_pixelResult_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver5 : entity work.PixelSolver
    port map ( 
      io_pixelTask_valid => pixelTaskDispatcher_io_outputs_5_valid,
      io_pixelTask_ready => pixelTaskSolver5_io_pixelTask_ready,
      io_pixelTask_payload_x => zz_28,
      io_pixelTask_payload_y => zz_29,
      io_pixelResult_valid => pixelTaskSolver5_io_pixelResult_valid,
      io_pixelResult_ready => pixelTaskSolver5_io_pixelResult_ready,
      io_pixelResult_payload_iteration => pixelTaskSolver5_io_pixelResult_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver6 : entity work.PixelSolver
    port map ( 
      io_pixelTask_valid => pixelTaskDispatcher_io_outputs_6_valid,
      io_pixelTask_ready => pixelTaskSolver6_io_pixelTask_ready,
      io_pixelTask_payload_x => zz_32,
      io_pixelTask_payload_y => zz_33,
      io_pixelResult_valid => pixelTaskSolver6_io_pixelResult_valid,
      io_pixelResult_ready => pixelTaskSolver6_io_pixelResult_ready,
      io_pixelResult_payload_iteration => pixelTaskSolver6_io_pixelResult_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver7 : entity work.PixelSolver
    port map ( 
      io_pixelTask_valid => pixelTaskDispatcher_io_outputs_7_valid,
      io_pixelTask_ready => pixelTaskSolver7_io_pixelTask_ready,
      io_pixelTask_payload_x => zz_36,
      io_pixelTask_payload_y => zz_37,
      io_pixelResult_valid => pixelTaskSolver7_io_pixelResult_valid,
      io_pixelResult_ready => pixelTaskSolver7_io_pixelResult_ready,
      io_pixelResult_payload_iteration => pixelTaskSolver7_io_pixelResult_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelResultArbiter : entity work.StreamArbiter
    port map ( 
      io_inputs_0_valid => zz_10,
      io_inputs_0_ready => pixelResultArbiter_io_inputs_0_ready,
      io_inputs_0_payload_iteration => zz_11,
      io_inputs_1_valid => zz_14,
      io_inputs_1_ready => pixelResultArbiter_io_inputs_1_ready,
      io_inputs_1_payload_iteration => zz_15,
      io_inputs_2_valid => zz_18,
      io_inputs_2_ready => pixelResultArbiter_io_inputs_2_ready,
      io_inputs_2_payload_iteration => zz_19,
      io_inputs_3_valid => zz_22,
      io_inputs_3_ready => pixelResultArbiter_io_inputs_3_ready,
      io_inputs_3_payload_iteration => zz_23,
      io_inputs_4_valid => zz_26,
      io_inputs_4_ready => pixelResultArbiter_io_inputs_4_ready,
      io_inputs_4_payload_iteration => zz_27,
      io_inputs_5_valid => zz_30,
      io_inputs_5_ready => pixelResultArbiter_io_inputs_5_ready,
      io_inputs_5_payload_iteration => zz_31,
      io_inputs_6_valid => zz_34,
      io_inputs_6_ready => pixelResultArbiter_io_inputs_6_ready,
      io_inputs_6_payload_iteration => zz_35,
      io_inputs_7_valid => zz_38,
      io_inputs_7_ready => pixelResultArbiter_io_inputs_7_ready,
      io_inputs_7_payload_iteration => zz_39,
      io_output_valid => pixelResultArbiter_io_output_valid,
      io_output_ready => pixelResultArbiter_io_output_ready,
      io_output_payload_iteration => pixelResultArbiter_io_output_payload_iteration,
      clk => clk,
      reset => reset 
    );
  io_pixelTask_ready <= io_pixelTask_ready_readableBuffer;
  io_pixelResult_valid <= zz_40;
  zz_2 <= io_pixelTask_payload_x;
  zz_3 <= io_pixelTask_payload_y;
  zz_6 <= zz_4;
  zz_7 <= zz_5;
  pixelTaskSolver0_io_pixelResult_ready <= ((pkg_toStdLogic(true) and (not zz_10)) or pixelResultArbiter_io_inputs_0_ready);
  pixelResultArbiter_io_output_ready <= ((pkg_toStdLogic(true) and (not zz_40)) or io_pixelResult_ready);
  pixelTaskSolver7_io_pixelResult_ready <= ((pkg_toStdLogic(true) and (not zz_38)) or pixelResultArbiter_io_inputs_7_ready);
  pixelTaskSolver6_io_pixelResult_ready <= ((pkg_toStdLogic(true) and (not zz_34)) or pixelResultArbiter_io_inputs_6_ready);
  pixelTaskSolver5_io_pixelResult_ready <= ((pkg_toStdLogic(true) and (not zz_30)) or pixelResultArbiter_io_inputs_5_ready);
  pixelTaskSolver4_io_pixelResult_ready <= ((pkg_toStdLogic(true) and (not zz_26)) or pixelResultArbiter_io_inputs_4_ready);
  pixelTaskSolver3_io_pixelResult_ready <= ((pkg_toStdLogic(true) and (not zz_22)) or pixelResultArbiter_io_inputs_3_ready);
  pixelTaskSolver2_io_pixelResult_ready <= ((pkg_toStdLogic(true) and (not zz_18)) or pixelResultArbiter_io_inputs_2_ready);
  pixelTaskSolver1_io_pixelResult_ready <= ((pkg_toStdLogic(true) and (not zz_14)) or pixelResultArbiter_io_inputs_1_ready);
  io_pixelTask_ready_readableBuffer <= ((pkg_toStdLogic(true) and (not zz_1)) or pixelTaskDispatcher_io_input_ready);
  process(clk,reset)
  begin
    if reset = '1' then
      zz_1 <= pkg_toStdLogic(false);
      zz_10 <= pkg_toStdLogic(false);
      zz_14 <= pkg_toStdLogic(false);
      zz_18 <= pkg_toStdLogic(false);
      zz_22 <= pkg_toStdLogic(false);
      zz_26 <= pkg_toStdLogic(false);
      zz_30 <= pkg_toStdLogic(false);
      zz_34 <= pkg_toStdLogic(false);
      zz_38 <= pkg_toStdLogic(false);
      zz_40 <= pkg_toStdLogic(false);
    elsif rising_edge(clk) then
      if io_pixelTask_ready_readableBuffer = '1' then
        zz_1 <= io_pixelTask_valid;
      end if;
      if pixelTaskSolver0_io_pixelResult_ready = '1' then
        zz_10 <= pixelTaskSolver0_io_pixelResult_valid;
      end if;
      if pixelTaskSolver1_io_pixelResult_ready = '1' then
        zz_14 <= pixelTaskSolver1_io_pixelResult_valid;
      end if;
      if pixelTaskSolver2_io_pixelResult_ready = '1' then
        zz_18 <= pixelTaskSolver2_io_pixelResult_valid;
      end if;
      if pixelTaskSolver3_io_pixelResult_ready = '1' then
        zz_22 <= pixelTaskSolver3_io_pixelResult_valid;
      end if;
      if pixelTaskSolver4_io_pixelResult_ready = '1' then
        zz_26 <= pixelTaskSolver4_io_pixelResult_valid;
      end if;
      if pixelTaskSolver5_io_pixelResult_ready = '1' then
        zz_30 <= pixelTaskSolver5_io_pixelResult_valid;
      end if;
      if pixelTaskSolver6_io_pixelResult_ready = '1' then
        zz_34 <= pixelTaskSolver6_io_pixelResult_valid;
      end if;
      if pixelTaskSolver7_io_pixelResult_ready = '1' then
        zz_38 <= pixelTaskSolver7_io_pixelResult_valid;
      end if;
      if pixelResultArbiter_io_output_ready = '1' then
        zz_40 <= pixelResultArbiter_io_output_valid;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_pixelTask_ready_readableBuffer = '1' then
        zz_4 <= zz_2;
        zz_5 <= zz_3;
      end if;
      if pixelTaskSolver0_io_pixelResult_ready = '1' then
        zz_11 <= pixelTaskSolver0_io_pixelResult_payload_iteration;
      end if;
      if pixelTaskSolver1_io_pixelResult_ready = '1' then
        zz_15 <= pixelTaskSolver1_io_pixelResult_payload_iteration;
      end if;
      if pixelTaskSolver2_io_pixelResult_ready = '1' then
        zz_19 <= pixelTaskSolver2_io_pixelResult_payload_iteration;
      end if;
      if pixelTaskSolver3_io_pixelResult_ready = '1' then
        zz_23 <= pixelTaskSolver3_io_pixelResult_payload_iteration;
      end if;
      if pixelTaskSolver4_io_pixelResult_ready = '1' then
        zz_27 <= pixelTaskSolver4_io_pixelResult_payload_iteration;
      end if;
      if pixelTaskSolver5_io_pixelResult_ready = '1' then
        zz_31 <= pixelTaskSolver5_io_pixelResult_payload_iteration;
      end if;
      if pixelTaskSolver6_io_pixelResult_ready = '1' then
        zz_35 <= pixelTaskSolver6_io_pixelResult_payload_iteration;
      end if;
      if pixelTaskSolver7_io_pixelResult_ready = '1' then
        zz_39 <= pixelTaskSolver7_io_pixelResult_payload_iteration;
      end if;
      if pixelResultArbiter_io_output_ready = '1' then
        io_pixelResult_payload_iteration <= pixelResultArbiter_io_output_payload_iteration;
      end if;
    end if;
  end process;

end arch;

