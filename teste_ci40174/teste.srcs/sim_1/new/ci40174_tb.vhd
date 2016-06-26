----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.06.2016 23:34:53
-- Design Name: 
-- Module Name: ci40174_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ci40174_tb is
--  Port ( );
end ci40174_tb;

architecture Behavioral of ci40174_tb is

component ci40174 is
Port (	
        D0:		in STD_LOGIC;
		D1:		in STD_LOGIC;
		D2:		in STD_LOGIC;
		D3:		in STD_LOGIC;
		D4: 	in STD_LOGIC;
		D5: 	in STD_LOGIC;
		CLK: 	in STD_LOGIC;
		Q0: 	out STD_LOGIC;
		Q1: 	out STD_LOGIC;
		Q2: 	out STD_LOGIC;
		Q3: 	out STD_LOGIC;
		Q4: 	out STD_LOGIC;
		Q5: 	out STD_LOGIC
		);
end component;

signal T_clock : std_logic;
signal D0, D1, D2, D3, D4, D5 : std_logic;
signal Q0, Q1, Q2, Q3, Q4, Q5 : std_logic;

begin

CI1: ci40174 port map(D0, D1, D2, D3, D4, D5, T_clock, Q0, Q1, Q2, Q3, Q4, Q5);

process
begin
T_clock <= '0';
wait for 5 ns;
T_clock <= '1';
wait for 5 ns;
end process;

process
begin
D0 <= '0';
D1 <= '1';
D2 <= '1';
D3 <= '0';
D4 <= '1';
D5 <= '0';
wait for 23 ns;
D0 <= '1';
D1 <= '0';
D2 <= '1';
D3 <= '1';
D4 <= '0';
D5 <= '1';
wait for 23 ns;
end process;

end Behavioral;
