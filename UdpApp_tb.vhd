library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity UdpApp_tb is
end UdpApp_tb;

architecture arch of UdpApp_tb is
  signal io_rx_cmd_valid : std_logic;
  signal io_rx_cmd_ready : std_logic;
  signal io_rx_cmd_payload_ip : std_logic_vector(31 downto 0);
  signal io_rx_cmd_payload_srcPort : std_logic_vector(15 downto 0);
  signal io_rx_cmd_payload_dstPort : std_logic_vector(15 downto 0);
  signal io_rx_cmd_payload_length : unsigned(15 downto 0);
  signal io_rx_data_valid : std_logic;
  signal io_rx_data_ready : std_logic;
  signal io_rx_data_payload_last : std_logic;
  signal io_rx_data_payload_fragment : std_logic_vector(7 downto 0);
  signal io_tx_cmd_valid : std_logic;
  signal io_tx_cmd_ready : std_logic;
  signal io_tx_cmd_payload_ip : std_logic_vector(31 downto 0);
  signal io_tx_cmd_payload_srcPort : std_logic_vector(15 downto 0);
  signal io_tx_cmd_payload_dstPort : std_logic_vector(15 downto 0);
  signal io_tx_cmd_payload_length : unsigned(15 downto 0);
  signal io_tx_data_valid : std_logic;
  signal io_tx_data_ready : std_logic;
  signal io_tx_data_payload_last : std_logic;
  signal io_tx_data_payload_fragment : std_logic_vector(7 downto 0);
  signal clk : std_logic;
  signal reset : std_logic;
  -- #spinalBegin userDeclarations
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics
  -- #spinalEnd userLogics
  uut : entity work.UdpApp
    port map (
      io_rx_cmd_valid =>  io_rx_cmd_valid,
      io_rx_cmd_ready =>  io_rx_cmd_ready,
      io_rx_cmd_payload_ip =>  io_rx_cmd_payload_ip,
      io_rx_cmd_payload_srcPort =>  io_rx_cmd_payload_srcPort,
      io_rx_cmd_payload_dstPort =>  io_rx_cmd_payload_dstPort,
      io_rx_cmd_payload_length =>  io_rx_cmd_payload_length,
      io_rx_data_valid =>  io_rx_data_valid,
      io_rx_data_ready =>  io_rx_data_ready,
      io_rx_data_payload_last =>  io_rx_data_payload_last,
      io_rx_data_payload_fragment =>  io_rx_data_payload_fragment,
      io_tx_cmd_valid =>  io_tx_cmd_valid,
      io_tx_cmd_ready =>  io_tx_cmd_ready,
      io_tx_cmd_payload_ip =>  io_tx_cmd_payload_ip,
      io_tx_cmd_payload_srcPort =>  io_tx_cmd_payload_srcPort,
      io_tx_cmd_payload_dstPort =>  io_tx_cmd_payload_dstPort,
      io_tx_cmd_payload_length =>  io_tx_cmd_payload_length,
      io_tx_data_valid =>  io_tx_data_valid,
      io_tx_data_ready =>  io_tx_data_ready,
      io_tx_data_payload_last =>  io_tx_data_payload_last,
      io_tx_data_payload_fragment =>  io_tx_data_payload_fragment,
      clk =>  clk,
      reset =>  reset 
    );
end arch;
