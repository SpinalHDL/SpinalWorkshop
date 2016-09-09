library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity Apb3Timer_tb is
end Apb3Timer_tb;

architecture arch of Apb3Timer_tb is
  signal io_apb_PADDR : unsigned(15 downto 0);
  signal io_apb_PSEL : std_logic_vector(0 downto 0);
  signal io_apb_PENABLE : std_logic;
  signal io_apb_PREADY : std_logic;
  signal io_apb_PWRITE : std_logic;
  signal io_apb_PWDATA : std_logic_vector(31 downto 0);
  signal io_apb_PRDATA : std_logic_vector(31 downto 0);
  signal io_external_tick : std_logic;
  signal io_external_clear : std_logic;
  signal clk : std_logic;
  signal reset : std_logic;
  -- #spinalBegin userDeclarations
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics
  -- #spinalEnd userLogics
  uut : entity work.Apb3Timer
    port map (
      io_apb_PADDR =>  io_apb_PADDR,
      io_apb_PSEL =>  io_apb_PSEL,
      io_apb_PENABLE =>  io_apb_PENABLE,
      io_apb_PREADY =>  io_apb_PREADY,
      io_apb_PWRITE =>  io_apb_PWRITE,
      io_apb_PWDATA =>  io_apb_PWDATA,
      io_apb_PRDATA =>  io_apb_PRDATA,
      io_external_tick =>  io_external_tick,
      io_external_clear =>  io_external_clear,
      clk =>  clk,
      reset =>  reset 
    );
end arch;
