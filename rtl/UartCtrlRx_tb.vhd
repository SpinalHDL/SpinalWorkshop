library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity UartCtrlRx_tb is
end UartCtrlRx_tb;

architecture arch of UartCtrlRx_tb is
  signal io_rxd : std_logic;
  signal io_samplingTick : std_logic;
  signal io_read_valid : std_logic;
  signal io_read_payload : std_logic_vector(7 downto 0);
  signal clk : std_logic;
  signal reset : std_logic;
  -- #spinalBegin userDeclarations
  shared variable done : integer := 0;
  constant clockDivision : integer := 10;
  constant rxdSamplePerBit : integer := 8;
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics
  process
  begin
    clk <= '0';
    wait for 5 ns;
    if done = 2 then
      wait;
    end if;
    assert now < 100 us report "timeout" severity failure;
    clk <= '1';
    wait for 5 ns;
  end process;
  
  process
  begin
    io_samplingTick <= '0';
    for i in 0 to clockDivision-2 loop
      wait until rising_edge(clk);
    end loop;
    io_samplingTick <= '1';
    wait until rising_edge(clk); 
  end process;
  
  process
    procedure waitBaudTime is
    begin
      for i in 0 to clockDivision*rxdSamplePerBit-1 loop
        wait until rising_edge(clk);
      end loop;
    end procedure;
  
    procedure sendByte(value : std_logic_vector(7 downto 0)) is
    begin
      io_rxd <= '0';
      waitBaudTime;
      for i in 0 to 7 loop 
        io_rxd <= value(i);
        waitBaudTime;
      end loop;
      io_rxd <= '1';
      waitBaudTime;
    end procedure;
  
    variable byteCounter : integer := 0;
  begin
    byteCounter := 0;
    reset <= '1';
    io_rxd <= '1';
    wait for 100 ns;
    wait until rising_edge(clk);
    reset <= '0';
    wait for 100 ns;
    waitBaudTime;
    
    sendByte(X"FF");
    
    waitBaudTime;
    waitBaudTime;
    
    sendByte(X"00");
    
    waitBaudTime;
    waitBaudTime;
    
    sendByte(X"55");
    sendByte(X"AA");
    
    wait for 2 us;
    done := done + 1;
    wait;
  end process;
    
  process
    procedure assertRead(value : std_logic_vector(7 downto 0)) is
    begin
      wait until rising_edge(clk) and io_read_valid = '1';
      assert io_read_payload = value report "io_read_payload missmatch ! Should be " & integer'image(to_integer(unsigned(value))) & " but was " & integer'image(to_integer(unsigned(io_read_payload)))  severity failure;
    end procedure;
  begin
    assertRead(X"FF");
    assertRead(X"00");
    assertRead(X"55");
    assertRead(X"AA");
    wait for 2 us;
    done := done + 1;
    wait;
  end process;
  
  -- #spinalEnd userLogics
  uut : entity work.UartCtrlRx
    port map (
      io_rxd =>  io_rxd,
      io_samplingTick =>  io_samplingTick,
      io_read_valid =>  io_read_valid,
      io_read_payload =>  io_read_payload,
      clk =>  clk,
      reset =>  reset 
    );
end arch;
