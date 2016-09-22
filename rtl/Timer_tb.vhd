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
  signal io_limit : unsigned(7 downto 0);
  signal io_full : std_logic;
  signal io_value : unsigned(7 downto 0);
  signal clk : std_logic;
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
    procedure waitCycles(count : integer) is
    begin
      for i in 0 to count - 1 loop
        wait until rising_edge(clk);
      end loop;
    end procedure;
  begin
    io_tick <= '0';
    io_clear <= '0';
    io_limit <= (others => '1');

    waitCycles(1);

    -- Do clear
    io_clear <= '1';
    waitCycles(1);
    io_clear <= '0';
    waitCycles(1);
    assert io_value = (io_value'range => '0') report "io_value should be zero" severity failure ;
    waitCycles(1);
    assert io_value = (io_value'range => '0') report "io_value should be zero" severity failure ;

    io_tick <= '1';
    waitCycles(16);
    io_tick <= '0';
    waitCycles(2);
    assert io_value = X"10" report "io_value should be 0x10" severity failure ;

    io_limit <= X"20";
    io_tick <= '1';
    assert io_full = '0' report "io_full should be '0'" severity failure ;
    waitCycles(16);
    assert io_value = X"1F" report "io_value should be 0x1F" severity failure ;
    assert io_full = '0' report "io_full should be '0'" severity failure ;
    waitCycles(1);
    assert io_value = X"20" report "io_value should be 0x20" severity failure ;
    assert io_full = '1' report "io_full should be '1'" severity failure ;
    waitCycles(10);
    io_tick <= '0';
    assert io_value = X"20" report "io_value should be 0x20" severity failure ;
    assert io_full = '1' report "io_full should be '1'" severity failure ;


    -- Do clear
    io_clear <= '1';
    waitCycles(1);
    io_clear <= '0';
    waitCycles(1);
    assert io_value = (io_value'range => '0') report "io_value should be zero" severity failure ;
    waitCycles(1);
    assert io_value = (io_value'range => '0') report "io_value should be zero" severity failure ;


    waitCycles(10);
    done := done + 1;
    wait;
  end process;

  -- #spinalEnd userLogics
  uut : entity work.Timer
    port map (
      io_tick =>  io_tick,
      io_clear =>  io_clear,
      io_limit =>  io_limit,
      io_full =>  io_full,
      io_value =>  io_value,
      clk =>  clk 
    );
end arch;
