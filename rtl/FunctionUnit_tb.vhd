library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity FunctionUnit_tb is
end FunctionUnit_tb;

architecture arch of FunctionUnit_tb is
  signal io_cmd_valid : std_logic;
  signal io_cmd_payload : std_logic_vector(7 downto 0);
  signal io_valueA : std_logic_vector(7 downto 0);
  signal io_valueB : std_logic_vector(31 downto 0);
  signal io_valueC : std_logic_vector(47 downto 0);
  signal clk : std_logic;
  signal reset : std_logic;
  -- #spinalBegin userDeclarations
  shared variable done : integer := 0;
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics

  process
  begin
    clk <= '0';
    wait for 5 ns;
    if done = 1 then
      wait;
    end if;
    assert now < 100 us report "timeout" severity failure;
    clk <= '1';
    wait for 5 ns;
  end process;

  process
    procedure waitCycle(cycle : integer) is
    begin
      for i in 0 to cycle - 1 loop
        wait until rising_edge(clk);
      end loop;
    end procedure;
  begin
    reset <= '1';
    io_cmd_valid <= '0';
    waitCycle(2);
    reset <= '0';
    waitCycle(2);

  end process;


  -- #spinalEnd userLogics
  uut : entity work.FunctionUnit
    port map (
      io_cmd_valid =>  io_cmd_valid,
      io_cmd_payload =>  io_cmd_payload,
      io_valueA =>  io_valueA,
      io_valueB =>  io_valueB,
      io_valueC =>  io_valueC,
      clk =>  clk,
      reset =>  reset 
    );
end arch;
