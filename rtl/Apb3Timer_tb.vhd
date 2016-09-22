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
  signal io_apb_PADDR : unsigned(7 downto 0);
  signal io_apb_PSEL : std_logic_vector(0 downto 0);
  signal io_apb_PENABLE : std_logic;
  signal io_apb_PREADY : std_logic;
  signal io_apb_PWRITE : std_logic;
  signal io_apb_PWDATA : std_logic_vector(31 downto 0);
  signal io_apb_PRDATA : std_logic_vector(31 downto 0);
  signal io_fullA : std_logic;
  signal io_fullB : std_logic;
  signal io_external_tick : std_logic;
  signal io_external_clear : std_logic;
  signal clk : std_logic;
  signal reset : std_logic;
  -- #spinalBegin userDeclarations
  shared variable done : integer := 0;
  signal counter : integer := 0;
  signal testId : integer := 0;
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


  process(clk)
  begin
    if rising_edge(clk) then
      counter <= counter + 1;
    end if;
  end process;

  process
    procedure waitCycles(count : integer) is
    begin
      for i in 0 to count - 1 loop
        wait until rising_edge(clk);
      end loop;
    end procedure;

    procedure apbWrite(address : unsigned;data : std_logic_vector) is
    begin
      io_apb_PSEL <= "1";
      io_apb_PWRITE  <= '1';
      io_apb_PADDR <= address;
      io_apb_PWDATA <= data;
      wait until rising_edge(clk) and io_apb_PREADY = '1';
      io_apb_PENABLE <= '1';
      wait until rising_edge(clk) and io_apb_PREADY = '1';
      io_apb_PENABLE <= '0';
      io_apb_PSEL <= "0";
      io_apb_PWRITE  <= '-';
      io_apb_PADDR <= (others => '-');
      io_apb_PWDATA <= (others => '-');
    end procedure;


    procedure apbRead(address : unsigned;data : std_logic_vector;mask : std_logic_vector;message : String) is
    begin
      io_apb_PSEL <= "1";
      io_apb_PWRITE  <= '0';
      io_apb_PADDR <= address;
      wait until rising_edge(clk) and io_apb_PREADY = '1';
      io_apb_PENABLE <= '1';
      wait until rising_edge(clk) and io_apb_PREADY = '1';
      io_apb_PENABLE <= '0';
      io_apb_PSEL <= "0";
      io_apb_PWRITE  <= '-';
      io_apb_PADDR <= (others => '-');
      assert (io_apb_PRDATA and mask) = data report message & " " & integer'image(to_integer(unsigned(io_apb_PRDATA and mask))) & " in place of " & integer'image(to_integer(unsigned(data))) severity failure ;
    end procedure;

    variable lastCounter : integer;
  begin
    reset <= '1';
    io_apb_PENABLE <= '0';
    io_apb_PSEL <= "0";

    waitCycles(2);
    reset <= '0';
    waitCycles(1);

    testId <= 1;
    apbWrite(X"08",X"0000_0000");    -- Clear timerA
    apbRead (X"08",X"0000_0000",X"0000_FFFF","TimerA clear/read value doesn't work");

    testId <= 2;
    apbWrite(X"04",X"0000_003F");    -- timerA set limit
    apbRead (X"04",X"0000_003F",X"0000_FFFF","TimerA limit read/write doesn't work");

    testId <= 3;
    apbWrite(X"04",X"0000_001F");    -- timerA set limit
    apbRead (X"04",X"0000_001F",X"0000_FFFF","TimerA limit read/write doesn't work");
    apbWrite(X"00",X"0000_0001");    -- timerA self tick
    waitCycles(31);
    assert io_fullA = '0' report "io_fullA should be '0'" severity failure ;
    waitCycles(1);
    assert io_fullA = '1' report "io_fullA should be '1'" severity failure ;

    testId <= 4;
    waitCycles(2);
    apbWrite(X"04",X"0000_002F");
    waitCycles(47);
    assert io_fullA = '0' report "io_fullA should be '0'" severity failure ;
    waitCycles(1);
    assert io_fullA = '1' report "io_fullA should be '1'" severity failure ;

    testId <= 5;
    apbWrite(X"04",X"0000_001F");
    apbWrite(X"00",X"0001_0001");    -- timerA self tick self reset
    apbWrite(X"08",X"0000_0000");    -- Clear timerA
    wait until rising_edge(clk) and io_fullA = '1';
    waitCycles(31);
    assert io_fullA = '0' report "io_fullA should be '0'" severity failure ;
    waitCycles(1);
    assert io_fullA = '1' report "io_fullA should be '1'" severity failure ;

    testId <= 6;
    apbWrite(X"00",X"0001_0002");    -- timerA clockdivider tick self reset
    apbWrite(X"08",X"0000_0000");    -- Clear timerA
    wait until rising_edge(clk) and io_fullA = '1';
    waitCycles(31*16-1);
    assert io_fullA = '0' report "io_fullA should be '0'" severity failure ;
    waitCycles(1);
    assert io_fullA = '1' report "io_fullA should be '1'" severity failure ;

    testId <= 7;
    io_external_tick <= '0';
    io_external_clear <= '0';
    apbWrite(X"00",X"0002_0004");    -- timerA clockdivider tick self reset
    apbWrite(X"08",X"0000_0000");    -- Clear timerA
    io_external_tick <= '1';
    waitCycles(6);
    io_external_tick <= '0';
    apbRead (X"08",X"0000_0006",X"0000_FFFF","TimerA external tick doesn't work");
    io_external_clear <= '1';
    waitCycles(1);
    io_external_tick <= '0';
    apbRead (X"08",X"0000_0000",X"0000_FFFF","TimerA external clear doesn't work");


    waitCycles(100);

    testId <= 8;
    apbWrite(X"18",X"0000_0000");    -- Clear timerB
    apbRead (X"18",X"0000_0000",X"0000_00FF","TimerA clear/read value doesn't work");

    testId <= 9;
    apbWrite(X"14",X"0000_003F");    -- timerB set limit
    apbRead (X"14",X"0000_003F",X"0000_00FF","TimerA limit read/write doesn't work");

    testId <= 10;
    apbWrite(X"14",X"0000_001F");    -- timerB set limit
    apbRead (X"14",X"0000_001F",X"0000_00FF","TimerA limit read/write doesn't work");
    apbWrite(X"10",X"0000_0001");    -- timerB self tick
    waitCycles(31);
    assert io_fullB = '0' report "io_fullB should be '0'" severity failure ;
    waitCycles(1);
    assert io_fullB = '1' report "io_fullB should be '1'" severity failure ;

    testId <= 11;
    waitCycles(2);
    apbWrite(X"14",X"0000_002F");
    waitCycles(47);
    assert io_fullB = '0' report "io_fullB should be '0'" severity failure ;
    waitCycles(1);
    assert io_fullB = '1' report "io_fullB should be '1'" severity failure ;

    testId <= 12;
    apbWrite(X"14",X"0000_001F");
    apbWrite(X"10",X"0001_0001");    -- timerB self tick self reset
    apbWrite(X"18",X"0000_0000");    -- Clear timerB
    wait until rising_edge(clk) and io_fullB = '1';
    waitCycles(31);
    assert io_fullB = '0' report "io_fullB should be '0'" severity failure ;
    waitCycles(1);
    assert io_fullB = '1' report "io_fullB should be '1'" severity failure ;

    testId <= 13;
    apbWrite(X"10",X"0001_0002");    -- timerB clockdivider tick self reset
    apbWrite(X"18",X"0000_0000");    -- Clear timerB
    wait until rising_edge(clk) and io_fullB = '1';
    waitCycles(31*16-1);
    assert io_fullB = '0' report "io_fullB should be '0'" severity failure ;
    waitCycles(1);
    assert io_fullB = '1' report "io_fullB should be '1'" severity failure ;

    testId <= 14;
    io_external_tick <= '0';
    io_external_clear <= '0';
    apbWrite(X"10",X"0002_0004");    -- timerB clockdivider tick self reset
    apbWrite(X"18",X"0000_0000");    -- Clear timerB
    io_external_tick <= '1';
    waitCycles(6);
    io_external_tick <= '0';
    apbRead (X"18",X"0000_0006",X"0000_00FF","TimerA external tick doesn't work");
    io_external_clear <= '1';
    waitCycles(1);
    io_external_tick <= '0';
    apbRead (X"18",X"0000_0000",X"0000_00FF","TimerA external clear doesn't work");




    waitCycles(10);
    done := done + 1;
    wait;
  end process;


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
      io_fullA =>  io_fullA,
      io_fullB =>  io_fullB,
      io_external_tick =>  io_external_tick,
      io_external_clear =>  io_external_clear,
      clk =>  clk,
      reset =>  reset 
    );
end arch;
