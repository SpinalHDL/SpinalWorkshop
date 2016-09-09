library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity PixelSolver_tb is
end PixelSolver_tb;

architecture arch of PixelSolver_tb is
  signal io_pixelTask_valid : std_logic;
  signal io_pixelTask_ready : std_logic;
  signal io_pixelTask_payload_x : signed(27 downto 0);
  signal io_pixelTask_payload_y : signed(27 downto 0);
  signal io_pixelResult_valid : std_logic;
  signal io_pixelResult_ready : std_logic;
  signal io_pixelResult_payload_iteration : unsigned(5 downto 0);
  signal clk : std_logic;
  signal reset : std_logic;
  -- #spinalBegin userDeclarations
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics
  -- #spinalEnd userLogics
  uut : entity work.PixelSolver
    port map (
      io_pixelTask_valid =>  io_pixelTask_valid,
      io_pixelTask_ready =>  io_pixelTask_ready,
      io_pixelTask_payload_x =>  io_pixelTask_payload_x,
      io_pixelTask_payload_y =>  io_pixelTask_payload_y,
      io_pixelResult_valid =>  io_pixelResult_valid,
      io_pixelResult_ready =>  io_pixelResult_ready,
      io_pixelResult_payload_iteration =>  io_pixelResult_payload_iteration,
      clk =>  clk,
      reset =>  reset 
    );
end arch;
