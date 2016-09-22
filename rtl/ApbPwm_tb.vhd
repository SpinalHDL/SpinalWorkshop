library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity ApbPwm_tb is
end ApbPwm_tb;

architecture arch of ApbPwm_tb is
  signal io_apb_PSEL : std_logic_vector(0 downto 0);
  signal io_apb_PENABLE : std_logic;
  signal io_apb_PADDR : unsigned(7 downto 0);
  signal io_apb_PWRITE : std_logic;
  signal io_apb_PWDATA : std_logic_vector(31 downto 0);
  signal io_apb_PRDATA : std_logic_vector(31 downto 0);
  signal io_apb_PREADY : std_logic;
  signal io_pwm : std_logic;
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

      procedure checkDutyCycle(dutyCycle : unsigned) is
        variable highCounter : unsigned(7 downto 0);
      begin
        for i in 0 to 256*6-1 loop
          wait until rising_edge(clk);
        end loop;

        wait until rising_edge(io_pwm);
        for i in 0 to 255 loop
          wait until rising_edge(clk);
          if i < dutyCycle then
            assert io_pwm = '1' report "io_pwm should be high" severity failure;
          else
            assert io_pwm = '0' report "io_pwm should be low" severity failure;
          end if;
        end loop;
      end procedure;

    begin
      reset <= '1';
      io_apb_PENABLE <= '0';
      io_apb_PSEL <= "0";
      io_apb_PWRITE  <= '-';
      io_apb_PADDR <= (others => '-');
      io_apb_PWDATA <= (others => '-');
      wait for 100 ns;
      wait until rising_edge(clk);
      reset <= '0';
      wait until rising_edge(clk);

      apbWrite(X"04",X"000000C0");
      apbWrite(X"00",X"00000001");
      checkDutyCycle(X"C0");

      apbWrite(X"04",X"00000040");
      checkDutyCycle(X"40");

      apbRead(X"00",X"00000001",X"00000001","APB pwm enable read doesn't work properly.");
      apbRead(X"04",X"00000040",X"000000FF","APB duty cycle read doesn't work properly.");
      apbWrite(X"00",X"00000000");

      wait for 20 us;
      assert io_pwm'STABLE(10 us)  report "Pwm output change while the enable was low" severity failure;
      
      done := done + 1;
      wait;
    end process;

  -- #spinalEnd userLogics
  uut : entity work.ApbPwm
    port map (
      io_apb_PSEL =>  io_apb_PSEL,
      io_apb_PENABLE =>  io_apb_PENABLE,
      io_apb_PADDR =>  io_apb_PADDR,
      io_apb_PWRITE =>  io_apb_PWRITE,
      io_apb_PWDATA =>  io_apb_PWDATA,
      io_apb_PRDATA =>  io_apb_PRDATA,
      io_apb_PREADY =>  io_apb_PREADY,
      io_pwm =>  io_pwm,
      clk =>  clk,
      reset =>  reset 
    );
end arch;
