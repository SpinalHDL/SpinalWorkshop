-- Generator : SpinalHDL v0.10.15    git head : ad680de6db01087f707f499ca62f637b2e5d6fef
-- Date      : 22/08/2017, 22:03:15
-- Component : Apb3Decoder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity Apb3Decoder_tb is
end Apb3Decoder_tb;

architecture arch of Apb3Decoder_tb is
  signal io_input_PADDR : unsigned(15 downto 0);
  signal io_input_PSEL : std_logic_vector(0 downto 0);
  signal io_input_PENABLE : std_logic;
  signal io_input_PREADY : std_logic;
  signal io_input_PWRITE : std_logic;
  signal io_input_PWDATA : std_logic_vector(31 downto 0);
  signal io_input_PRDATA : std_logic_vector(31 downto 0);
  signal io_input_PSLVERROR : std_logic;
  signal io_outputs_0_PADDR : unsigned(15 downto 0);
  signal io_outputs_0_PSEL : std_logic_vector(0 downto 0);
  signal io_outputs_0_PENABLE : std_logic;
  signal io_outputs_0_PREADY : std_logic;
  signal io_outputs_0_PWRITE : std_logic;
  signal io_outputs_0_PWDATA : std_logic_vector(31 downto 0);
  signal io_outputs_0_PRDATA : std_logic_vector(31 downto 0);
  signal io_outputs_0_PSLVERROR : std_logic;
  signal io_outputs_1_PADDR : unsigned(15 downto 0);
  signal io_outputs_1_PSEL : std_logic_vector(0 downto 0);
  signal io_outputs_1_PENABLE : std_logic;
  signal io_outputs_1_PREADY : std_logic;
  signal io_outputs_1_PWRITE : std_logic;
  signal io_outputs_1_PWDATA : std_logic_vector(31 downto 0);
  signal io_outputs_1_PRDATA : std_logic_vector(31 downto 0);
  signal io_outputs_1_PSLVERROR : std_logic;
  signal io_outputs_2_PADDR : unsigned(15 downto 0);
  signal io_outputs_2_PSEL : std_logic_vector(0 downto 0);
  signal io_outputs_2_PENABLE : std_logic;
  signal io_outputs_2_PREADY : std_logic;
  signal io_outputs_2_PWRITE : std_logic;
  signal io_outputs_2_PWDATA : std_logic_vector(31 downto 0);
  signal io_outputs_2_PRDATA : std_logic_vector(31 downto 0);
  signal io_outputs_2_PSLVERROR : std_logic;
  signal io_outputs_3_PADDR : unsigned(15 downto 0);
  signal io_outputs_3_PSEL : std_logic_vector(0 downto 0);
  signal io_outputs_3_PENABLE : std_logic;
  signal io_outputs_3_PREADY : std_logic;
  signal io_outputs_3_PWRITE : std_logic;
  signal io_outputs_3_PWDATA : std_logic_vector(31 downto 0);
  signal io_outputs_3_PRDATA : std_logic_vector(31 downto 0);
  signal io_outputs_3_PSLVERROR : std_logic;
  -- #spinalBegin userDeclarations
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics
  -- #spinalEnd userLogics
  uut : entity work.Apb3Decoder
    port map (
      io_input_PADDR =>  io_input_PADDR,
      io_input_PSEL =>  io_input_PSEL,
      io_input_PENABLE =>  io_input_PENABLE,
      io_input_PREADY =>  io_input_PREADY,
      io_input_PWRITE =>  io_input_PWRITE,
      io_input_PWDATA =>  io_input_PWDATA,
      io_input_PRDATA =>  io_input_PRDATA,
      io_input_PSLVERROR =>  io_input_PSLVERROR,
      io_outputs_0_PADDR =>  io_outputs_0_PADDR,
      io_outputs_0_PSEL =>  io_outputs_0_PSEL,
      io_outputs_0_PENABLE =>  io_outputs_0_PENABLE,
      io_outputs_0_PREADY =>  io_outputs_0_PREADY,
      io_outputs_0_PWRITE =>  io_outputs_0_PWRITE,
      io_outputs_0_PWDATA =>  io_outputs_0_PWDATA,
      io_outputs_0_PRDATA =>  io_outputs_0_PRDATA,
      io_outputs_0_PSLVERROR =>  io_outputs_0_PSLVERROR,
      io_outputs_1_PADDR =>  io_outputs_1_PADDR,
      io_outputs_1_PSEL =>  io_outputs_1_PSEL,
      io_outputs_1_PENABLE =>  io_outputs_1_PENABLE,
      io_outputs_1_PREADY =>  io_outputs_1_PREADY,
      io_outputs_1_PWRITE =>  io_outputs_1_PWRITE,
      io_outputs_1_PWDATA =>  io_outputs_1_PWDATA,
      io_outputs_1_PRDATA =>  io_outputs_1_PRDATA,
      io_outputs_1_PSLVERROR =>  io_outputs_1_PSLVERROR,
      io_outputs_2_PADDR =>  io_outputs_2_PADDR,
      io_outputs_2_PSEL =>  io_outputs_2_PSEL,
      io_outputs_2_PENABLE =>  io_outputs_2_PENABLE,
      io_outputs_2_PREADY =>  io_outputs_2_PREADY,
      io_outputs_2_PWRITE =>  io_outputs_2_PWRITE,
      io_outputs_2_PWDATA =>  io_outputs_2_PWDATA,
      io_outputs_2_PRDATA =>  io_outputs_2_PRDATA,
      io_outputs_2_PSLVERROR =>  io_outputs_2_PSLVERROR,
      io_outputs_3_PADDR =>  io_outputs_3_PADDR,
      io_outputs_3_PSEL =>  io_outputs_3_PSEL,
      io_outputs_3_PENABLE =>  io_outputs_3_PENABLE,
      io_outputs_3_PREADY =>  io_outputs_3_PREADY,
      io_outputs_3_PWRITE =>  io_outputs_3_PWRITE,
      io_outputs_3_PWDATA =>  io_outputs_3_PWDATA,
      io_outputs_3_PRDATA =>  io_outputs_3_PRDATA,
      io_outputs_3_PSLVERROR =>  io_outputs_3_PSLVERROR 
    );
end arch;
