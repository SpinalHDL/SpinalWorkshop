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


entity FunctionUnit is
  port( 
    io_cmd_valid : in std_logic;
    io_cmd_payload : in std_logic_vector(7 downto 0);
    io_valueA : out std_logic_vector(7 downto 0);
    io_valueB : out std_logic_vector(31 downto 0);
    io_valueC : out std_logic_vector(47 downto 0);
    clk : in std_logic;
    reset : in std_logic 
  );
end FunctionUnit;

architecture arch of FunctionUnit is

  signal zz_1 : unsigned(2 downto 0);
  signal zz_2 : std_logic;
  signal zz_3 : std_logic;
  signal zz_4 : std_logic;
  signal zz_5 : std_logic;
  signal zz_6 : std_logic;
  signal zz_7 : std_logic;
  signal zz_8 : std_logic;
  signal zz_9 : std_logic;
  signal zz_10 : std_logic;
  signal zz_11 : std_logic;
  signal zz_12 : unsigned(2 downto 0);
  signal zz_13 : std_logic;
  signal zz_14 : std_logic;
  signal zz_15 : std_logic;
  signal zz_16 : std_logic;
  signal zz_17 : unsigned(1 downto 0);
  signal zz_18 : unsigned(1 downto 0);
  signal zz_19 : std_logic;
  signal zz_20 : unsigned(1 downto 0);
  signal zz_21 : unsigned(3 downto 0);
  signal zz_22 : unsigned(2 downto 0);
  signal zz_23 : std_logic;
  signal zz_24 : std_logic;
  signal zz_25 : std_logic;
  signal zz_26 : std_logic;
  signal zz_27 : unsigned(2 downto 0);
  signal zz_28 : unsigned(2 downto 0);
  signal zz_29 : std_logic;
  signal zz_30 : unsigned(7 downto 0);
begin
  zz_2 <= pkg_toStdLogic(io_cmd_payload = pkg_stdLogicVector("01110110"));
  zz_3 <= pkg_toStdLogic(io_cmd_payload = pkg_stdLogicVector("01100001"));
  zz_4 <= pkg_toStdLogic(io_cmd_payload = pkg_stdLogicVector("01101100"));
  zz_5 <= pkg_toStdLogic(io_cmd_payload = pkg_stdLogicVector("01110101"));
  zz_6 <= pkg_toStdLogic(io_cmd_payload = pkg_stdLogicVector("01100101"));
  zz_8 <= pkg_mux(pkg_extract(zz_1,2),pkg_mux(pkg_extract(zz_1,0),pkg_toStdLogic(io_cmd_payload = pkg_stdLogicVector("01000001")),zz_6),pkg_mux(pkg_extract(zz_1,1),pkg_mux(pkg_extract(zz_1,0),zz_5,zz_4),pkg_mux(pkg_extract(zz_1,0),zz_3,zz_2)));
  zz_9 <= pkg_toStdLogic(zz_1 = pkg_unsigned("110"));
  zz_11 <= pkg_toStdLogic(true);
  zz_14 <= pkg_mux(pkg_extract(zz_12,2),pkg_mux(pkg_extract(zz_12,0),pkg_toStdLogic(io_cmd_payload = pkg_stdLogicVector("01000010")),zz_6),pkg_mux(pkg_extract(zz_12,1),pkg_mux(pkg_extract(zz_12,0),zz_5,zz_4),pkg_mux(pkg_extract(zz_12,0),zz_3,zz_2)));
  zz_15 <= pkg_toStdLogic(zz_12 = pkg_unsigned("110"));
  zz_19 <= pkg_toStdLogic(zz_18 = pkg_unsigned("11"));
  zz_20 <= (zz_18 + pkg_resize(unsigned(pkg_toStdLogicVector(pkg_toStdLogic(false))),2));
  zz_21 <= pkg_shiftLeft(pkg_unsigned("1"),zz_18);
  zz_24 <= pkg_mux(pkg_extract(zz_22,2),pkg_mux(pkg_extract(zz_22,0),pkg_toStdLogic(io_cmd_payload = pkg_stdLogicVector("01000011")),zz_6),pkg_mux(pkg_extract(zz_22,1),pkg_mux(pkg_extract(zz_22,0),zz_5,zz_4),pkg_mux(pkg_extract(zz_22,0),zz_3,zz_2)));
  zz_25 <= pkg_toStdLogic(zz_22 = pkg_unsigned("110"));
  zz_29 <= pkg_toStdLogic(zz_28 = pkg_unsigned("101"));
  zz_30 <= pkg_shiftLeft(pkg_unsigned("1"),zz_28);
  process(io_cmd_valid,zz_8,zz_9)
  begin
    zz_7 <= pkg_toStdLogic(false);
    if io_cmd_valid = '1' then
      if zz_8 = '1' then
        if zz_9 = '1' then
          zz_7 <= pkg_toStdLogic(true);
        end if;
      end if;
    end if;
  end process;

  process(io_cmd_valid,zz_14,zz_15)
  begin
    zz_13 <= pkg_toStdLogic(false);
    if io_cmd_valid = '1' then
      if zz_14 = '1' then
        if zz_15 = '1' then
          zz_13 <= pkg_toStdLogic(true);
        end if;
      end if;
    end if;
  end process;

  process(zz_20)
  begin
    zz_17 <= zz_20;
    if false then
      zz_17 <= pkg_unsigned("00");
    end if;
  end process;

  process(io_cmd_valid,zz_24,zz_25)
  begin
    zz_23 <= pkg_toStdLogic(false);
    if io_cmd_valid = '1' then
      if zz_24 = '1' then
        if zz_25 = '1' then
          zz_23 <= pkg_toStdLogic(true);
        end if;
      end if;
    end if;
  end process;

  process(zz_28,zz_29)
  begin
    if false then
      if zz_29 = '1' then
        zz_27 <= pkg_unsigned("000");
      else
        zz_27 <= (zz_28 + pkg_unsigned("001"));
      end if;
    else
      zz_27 <= zz_28;
    end if;
    if false then
      zz_27 <= pkg_unsigned("000");
    end if;
  end process;

  process(clk,reset)
  begin
    if reset = '1' then
      zz_10 <= pkg_toStdLogic(false);
      zz_16 <= pkg_toStdLogic(false);
      zz_18 <= pkg_unsigned("00");
      zz_26 <= pkg_toStdLogic(false);
      zz_28 <= pkg_unsigned("000");
    elsif rising_edge(clk) then
      if zz_7 = '1' then
        zz_10 <= pkg_toStdLogic(true);
      end if;
      if zz_10 = '1' then
        if zz_11 = '1' then
          zz_10 <= pkg_toStdLogic(false);
        end if;
      end if;
      if zz_13 = '1' then
        zz_16 <= pkg_toStdLogic(true);
      end if;
      if zz_16 = '1' then
        if zz_19 = '1' then
          zz_16 <= pkg_toStdLogic(false);
        end if;
      end if;
      zz_18 <= zz_17;
      if zz_23 = '1' then
        zz_26 <= pkg_toStdLogic(true);
      end if;
      if zz_26 = '1' then
        if zz_29 = '1' then
          zz_26 <= pkg_toStdLogic(false);
        end if;
      end if;
      zz_28 <= zz_27;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_cmd_valid = '1' then
        if zz_8 = '1' then
          if zz_9 = '1' then
            zz_1 <= pkg_unsigned("000");
          else
            zz_1 <= (zz_1 + pkg_unsigned("001"));
          end if;
        else
          zz_1 <= pkg_unsigned("000");
        end if;
      end if;
      if zz_10 = '1' then
        if pkg_extract(pkg_unsigned("1"),0) = '1' then
          io_valueA(7 downto 0) <= io_cmd_payload;
        end if;
      end if;
      if io_cmd_valid = '1' then
        if zz_14 = '1' then
          if zz_15 = '1' then
            zz_12 <= pkg_unsigned("000");
          else
            zz_12 <= (zz_12 + pkg_unsigned("001"));
          end if;
        else
          zz_12 <= pkg_unsigned("000");
        end if;
      end if;
      if zz_16 = '1' then
        if pkg_extract(zz_21,0) = '1' then
          io_valueB(7 downto 0) <= io_cmd_payload;
        end if;
        if pkg_extract(zz_21,1) = '1' then
          io_valueB(15 downto 8) <= io_cmd_payload;
        end if;
        if pkg_extract(zz_21,2) = '1' then
          io_valueB(23 downto 16) <= io_cmd_payload;
        end if;
        if pkg_extract(zz_21,3) = '1' then
          io_valueB(31 downto 24) <= io_cmd_payload;
        end if;
      end if;
      if io_cmd_valid = '1' then
        if zz_24 = '1' then
          if zz_25 = '1' then
            zz_22 <= pkg_unsigned("000");
          else
            zz_22 <= (zz_22 + pkg_unsigned("001"));
          end if;
        else
          zz_22 <= pkg_unsigned("000");
        end if;
      end if;
      if zz_26 = '1' then
        if pkg_extract(zz_30,0) = '1' then
          io_valueC(7 downto 0) <= io_cmd_payload;
        end if;
        if pkg_extract(zz_30,1) = '1' then
          io_valueC(15 downto 8) <= io_cmd_payload;
        end if;
        if pkg_extract(zz_30,2) = '1' then
          io_valueC(23 downto 16) <= io_cmd_payload;
        end if;
        if pkg_extract(zz_30,3) = '1' then
          io_valueC(31 downto 24) <= io_cmd_payload;
        end if;
        if pkg_extract(zz_30,4) = '1' then
          io_valueC(39 downto 32) <= io_cmd_payload;
        end if;
        if pkg_extract(zz_30,5) = '1' then
          io_valueC(47 downto 40) <= io_cmd_payload;
        end if;
      end if;
    end if;
  end process;

end arch;

