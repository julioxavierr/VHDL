----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.06.2016 21:26:01
-- Design Name: 
-- Module Name: password_config - Behavioral
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

entity password_config is
Port (  D0 :            				in STD_LOGIC;
        D1 :            				in STD_LOGIC;
        D2 :            				in STD_LOGIC;
        D3 :            				in STD_LOGIC;
        D4 :            				in STD_LOGIC;
        D5 :            				in STD_LOGIC;
        D6 :            				in STD_LOGIC;
        D7 :            				in STD_LOGIC;
        D8 :            				in STD_LOGIC;
        D9 :            				in STD_LOGIC;
        MODE :          				in STD_LOGIC;
        U6_Q0 :							out STD_LOGIC;
        U6_Q1 :							out STD_LOGIC;
        U6_Q2 :							out STD_LOGIC;
        U6_Q3 :							out STD_LOGIC;
        U6_Q4 :							out STD_LOGIC;
        U6_Q5 :							out STD_LOGIC;
        U29_Q0 :						out STD_LOGIC;
        U29_Q1 :						out STD_LOGIC;
        U29_Q2 :						out STD_LOGIC;
        U29_Q3 :						out STD_LOGIC;
        U29_Q4 :						out STD_LOGIC;
        U29_Q5 :						out STD_LOGIC);
end password_config;

architecture Behavioral of password_config is

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

signal and_clock : STD_LOGIC;
signal d_4_unused, d_5_unused : STD_LOGIC;
signal SAVE_PASSWORD_CLOCK : STD_LOGIC;

begin

and_clock <= NOT(MODE) AND SAVE_PASSWORD_CLOCK;

CI_U6: ci40174 port map (D0=>D0,D1=>D1,D2=>D2,D3=>D3,D4=>D4,D5=>D5,CLK=>and_clock,Q0=>U6_Q0,Q1=>U6_Q1,Q2=>U6_Q2,Q3=>U6_Q3,Q4=>U6_Q4,Q5=>U6_Q5);
CI_U29: ci40174 port map (D0=>D6,D1=>D7,D2=>D8,D3=>D9,D4=>d_4_unused,D5=>d_5_unused,CLK=>and_clock,Q0=>U29_Q0,Q1=>U29_Q1,Q2=>U29_Q2,Q3=>U29_Q3,Q4=>U29_Q4,Q5=>U29_Q5);

process
begin
SAVE_PASSWORD_CLOCK <= '0';
wait for 30 ns;
SAVE_PASSWORD_CLOCK <= '1';
wait for 30 ns;
end process;

end Behavioral;
