-- Generator : SpinalHDL v0.10.15    git head : ad680de6db01087f707f499ca62f637b2e5d6fef
-- Date      : 19/08/2017, 21:40:53
-- Component : PrimeTester

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity PrimeTester_tb is
end PrimeTester_tb;

architecture arch of PrimeTester_tb is
  signal io_value : unsigned(7 downto 0);
  signal io_isPrime : std_logic;
  -- #spinalBegin userDeclarations
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics
  -- #spinalEnd userLogics
  uut : entity work.PrimeTester
    port map (
      io_value =>  io_value,
      io_isPrime =>  io_isPrime 
    );
end arch;
