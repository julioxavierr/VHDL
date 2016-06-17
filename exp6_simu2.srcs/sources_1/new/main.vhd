----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.06.2016 08:57:30
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( A : in STD_LOGIC;
           CLOCK : in STD_LOGIC;
           D3 : out STD_LOGIC;
           D2 : out STD_LOGIC;
           D1 : out STD_LOGIC;
           D0 : out STD_LOGIC);
end main;

architecture Behavioral of main is

component jk is
    port(
      j : in STD_LOGIC; 
      k : in STD_LOGIC; 
      clk : in STD_LOGIC; 
      reset : in STD_LOGIC; 
      q : out STD_LOGIC; 
      qb : out STD_LOGIC 
   );
end component;

signal Q0, NQ0: STD_LOGIC;

begin

FF1: jk port map(j=>A, k=>NOT(A), clk=>CLOCK, reset=>'0', q=>Q0, qb=>NQ0);

end Behavioral;
