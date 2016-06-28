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

component dff is
port(   data_in:    in std_logic;
    clock:      in std_logic;
    data_out:   out std_logic
);
end component;

signal alto : std_logic := '1';
signal T_qn : std_logic;

begin

FF1: dff port map (data_in=>D0,clock=>CLK,data_out=>Q0);
FF2: dff port map (data_in=>D1,clock=>CLK,data_out=>Q1);
FF3: dff port map (data_in=>D2,clock=>CLK,data_out=>Q2);
FF4: dff port map (data_in=>D3,clock=>CLK,data_out=>Q3);
FF5: dff port map (data_in=>D4,clock=>CLK,data_out=>Q4);
FF6: dff port map (data_in=>D5,clock=>CLK,data_out=>Q5);

end Behavioral;
