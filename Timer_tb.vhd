library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity Timer_tb is
end Timer_tb;

architecture arch of Timer_tb is
  signal io_tick : std_logic;
  signal io_clear : std_logic;
  signal io_limit : unsigned(15 downto 0);
  signal io_overflow : std_logic;
  signal io_value : unsigned(15 downto 0);
  signal clk : std_logic;
  -- #spinalBegin userDeclarations
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics
  -- #spinalEnd userLogics
  uut : entity work.Timer
    port map (
      io_tick =>  io_tick,
      io_clear =>  io_clear,
      io_limit =>  io_limit,
      io_overflow =>  io_overflow,
      io_value =>  io_value,
      clk =>  clk 
    );
end arch;
