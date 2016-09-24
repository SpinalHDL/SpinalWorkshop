library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity Counter_tb is
end Counter_tb;

architecture arch of Counter_tb is
  -- #spinalBegin userDeclarations
  shared variable done : integer := 0;
  signal refCounter : unsigned(3 downto 0);
  signal refFull : std_logic;
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

  refFull <= '1' when refCounter = (refCounter'range => '1')
            else '0';

  process(clk,reset)
  begin
    if reset = '1' then
      refCounter <= (others => '0');
    elsif rising_edge(clk) then
      assert io_value = refCounter report "io_value is " & integer'image(to_integer(io_value)) & " in place of " & integer'image(to_integer(refCounter)) severity failure;
      assert io_full = refFull report "io_full is " & std_logic'image((io_full)) & " in place of " & std_logic'image((refFull)) severity failure;
      refCounter <= refCounter + 1;
      if io_clear = '1' then
        refCounter <= (others => '0');
      end if;
    end if;
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
    io_clear <= '0';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    reset <= '0';
    waitCycle(40);
    io_clear <= '1';
    waitCycle(3);
    io_clear <= '0';
    waitCycle(40);
    done := done + 1;
    wait;
  end process;
  -- #spinalEnd userLogics
  uut : entity work.Counter
    port map  
    );
end arch;
