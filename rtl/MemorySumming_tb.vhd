library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity MemorySumming_tb is
end MemorySumming_tb;

architecture arch of MemorySumming_tb is
  signal io_wr_en : std_logic;
  signal io_wr_addr : unsigned(7 downto 0);
  signal io_wr_data : std_logic_vector(15 downto 0);
  signal io_sum_start : std_logic;
  signal io_sum_done : std_logic;
  signal io_sum_value : unsigned(15 downto 0);
  signal io_wr_clk : std_logic;
  signal io_sum_clk : std_logic;
  signal io_sum_reset : std_logic;
  -- #spinalBegin userDeclarations
  shared variable done : integer := 0;
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics
  process
  begin
    io_wr_clk <= '0';
    wait for 5 ns;
    if done = 1 then
      wait;
    end if;
    assert now < 100 us report "timeout" severity failure;
    io_wr_clk <= '1';
    wait for 5 ns;
  end process;

  process
  begin
    io_sum_clk <= '0';
    wait for 30 ns;
    if done = 1 then
      wait;
    end if;
    assert now < 1 ms report "timeout" severity failure;
    io_sum_clk <= '1';
    wait for 30 ns;
  end process;


  process
  begin
    io_sum_reset <= '1';
    io_sum_start <= '0';
    wait until rising_edge(io_sum_clk);
    wait until rising_edge(io_sum_clk);

    io_sum_reset <= '0';

    for i in 0 to 255 loop
      io_wr_en <= '1';
      io_wr_addr <= to_unsigned(i,8);
     io_wr_data <= std_logic_vector(to_unsigned((i+4), 16));
      wait until rising_edge(io_wr_clk);
    end loop;
    io_wr_en <= '0';

    wait until rising_edge(io_sum_clk);
    wait until rising_edge(io_sum_clk);
    wait until rising_edge(io_sum_clk);

    io_sum_start <= '1';
    wait until rising_edge(io_sum_clk);
    io_sum_start <= '0';

    wait until rising_edge(io_sum_clk) and io_sum_done = '1';
    assert io_sum_value = 33664 report "io_sum_value error" severity failure;

    wait until rising_edge(io_sum_clk);
    wait until rising_edge(io_sum_clk);
    wait until rising_edge(io_sum_clk);
    wait until rising_edge(io_sum_clk);
    wait until rising_edge(io_sum_clk);

    io_sum_start <= '1';
    wait until rising_edge(io_sum_clk);
    io_sum_start <= '0';

    wait until rising_edge(io_sum_clk) and io_sum_done = '1';
    assert io_sum_value = 33664 report "io_sum_value error" severity failure;


    done := done + 1;
    wait;
  end process;

  -- #spinalEnd userLogics
  uut : entity work.MemorySumming
    port map (
      io_wr_en =>  io_wr_en,
      io_wr_addr =>  io_wr_addr,
      io_wr_data =>  io_wr_data,
      io_sum_start =>  io_sum_start,
      io_sum_done =>  io_sum_done,
      io_sum_value =>  io_sum_value,
      io_wr_clk =>  io_wr_clk,
      io_sum_clk =>  io_sum_clk,
      io_sum_reset =>  io_sum_reset 
    );
end arch;
