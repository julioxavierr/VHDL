-- 40174
-- Entrada D_n
-- Saída Q_n

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ci40174 is
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
end ci40174;

architecture Behavioral of ci40174 is

component d_ff is
  
  port (
    clk   : in  std_logic;
    rst_n : in  std_logic;
    set_n : in  std_logic;
    d     : in  std_logic;
    q     : out std_logic;
    q_n   : out std_logic);

end component;

signal alto : std_logic := '1';
signal T_qn : std_logic;

begin

FF1: d_ff port map (clk=>CLK,rst_n=>alto,set_n=>alto,d=>D0,q=>Q0,q_n=>T_qn);
FF2: d_ff port map (clk=>CLK,rst_n=>alto,set_n=>alto,d=>D1,q=>Q1,q_n=>T_qn);
FF3: d_ff port map (clk=>CLK,rst_n=>alto,set_n=>alto,d=>D2,q=>Q2,q_n=>T_qn);
FF4: d_ff port map (clk=>CLK,rst_n=>alto,set_n=>alto,d=>D3,q=>Q3,q_n=>T_qn);
FF5: d_ff port map (clk=>CLK,rst_n=>alto,set_n=>alto,d=>D4,q=>Q4,q_n=>T_qn);
FF6: d_ff port map (clk=>CLK,rst_n=>alto,set_n=>alto,d=>D5,q=>Q5,q_n=>T_qn);

end Behavioral;
