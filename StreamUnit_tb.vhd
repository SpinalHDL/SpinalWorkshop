library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity StreamUnit_tb is
end StreamUnit_tb;

architecture arch of StreamUnit_tb is
  signal io_memWrite_valid : std_logic;
  signal io_memWrite_payload_address : unsigned(7 downto 0);
  signal io_memWrite_payload_data : std_logic_vector(31 downto 0);
  signal io_cmdA_valid : std_logic;
  signal io_cmdA_ready : std_logic;
  signal io_cmdA_payload : unsigned(7 downto 0);
  signal io_cmdB_valid : std_logic;
  signal io_cmdB_ready : std_logic;
  signal io_cmdB_payload : std_logic_vector(31 downto 0);
  signal io_rsp_valid : std_logic;
  signal io_rsp_ready : std_logic;
  signal io_rsp_payload : std_logic_vector(31 downto 0);
  signal clk : std_logic;
  signal reset : std_logic;
  -- #spinalBegin userDeclarations
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics
  -- #spinalEnd userLogics
  uut : entity work.StreamUnit
    port map (
      io_memWrite_valid =>  io_memWrite_valid,
      io_memWrite_payload_address =>  io_memWrite_payload_address,
      io_memWrite_payload_data =>  io_memWrite_payload_data,
      io_cmdA_valid =>  io_cmdA_valid,
      io_cmdA_ready =>  io_cmdA_ready,
      io_cmdA_payload =>  io_cmdA_payload,
      io_cmdB_valid =>  io_cmdB_valid,
      io_cmdB_ready =>  io_cmdB_ready,
      io_cmdB_payload =>  io_cmdB_payload,
      io_rsp_valid =>  io_rsp_valid,
      io_rsp_ready =>  io_rsp_ready,
      io_rsp_payload =>  io_rsp_payload,
      clk =>  clk,
      reset =>  reset 
    );
end arch;
