----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.06.2016 16:39:55
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
	Port (Z : out STD_LOGIC );
end main;

architecture Behavioral of main is
    component JK_FF is
    port (	clock:		in STD_LOGIC;
		J, K:		in STD_LOGIC;
		reset:		in STD_LOGIC;
		Q, Qbar:	out STD_LOGIC
    );
	end component;

    signal T_clock : STD_LOGIC;
    signal vcc : STD_LOGIC := '1';
    signal zero : STD_LOGIC := '0';
    signal Q1, Q1_bar, Q2, Q2_bar, Q3, Q3_bar : STD_LOGIC;

begin
     
	FF1: JK_FF port map(clock=>T_clock, J=>vcc, K=>vcc, reset=>zero, Q=>Q1, Qbar=>Q1_bar);
	FF2: JK_FF port map(clock=>Q1, J=>vcc, K=>vcc, reset=>zero, Q=>Q2, Qbar=>Q2_bar);
	FF3: JK_FF port map(clock=>Q2, J=>vcc, K=>vcc, reset=>zero, Q=>Q3, Qbar=>Q3_bar);
	Z <= Q3;

	process
    begin
		T_clock <= '0';
		wait for 5 ns;
		T_clock <= '1';
		wait for 5 ns;
	end process;


end Behavioral;
