library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity Ram_1w_1r_2c is
  generic(
    wordCount : integer;
    wordWidth : integer
  );
  port(
    io_wr_clk : in std_logic;
    io_wr_en : in std_logic;
    io_wr_addr : in unsigned;
    io_wr_data : in std_logic_vector;
    io_rd_clk : in std_logic;
    io_rd_en : in std_logic;
    io_rd_addr : in unsigned;
    io_rd_data : out std_logic_vector
  );
end Ram_1w_1r_2c;

architecture arch of Ram_1w_1r_2c is
  type ram_type is array (0 to wordCount-1) of std_logic_vector(wordWidth-1 downto 0);
  signal ram : ram_type;
begin
  process(io_wr_clk)
  begin
    if rising_edge(io_wr_clk) then
      if io_wr_en = '1' then
        ram(to_integer(io_wr_addr)) <= io_wr_data;
      end if;
    end if;
  end process;
  
  process(io_rd_clk)
  begin
    if rising_edge(io_rd_clk) then
      if io_rd_en = '1' then
        io_rd_data <= ram(to_integer(io_rd_addr));
      end if;
    end if;
  end process;
  
end arch;

