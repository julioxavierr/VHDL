-- Mux 8x4 utilizando quatro mux2x1
-- Entrada A_n, B_n Saída Y_n

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux8x4 is
Port (	
        SEL : in STD_LOGIC;
        A_1 : in STD_LOGIC;
		B_1 : in STD_LOGIC;
		A_2 : in STD_LOGIC;
		B_2 : in STD_LOGIC;
		A_3 : in STD_LOGIC;
		B_3 : in STD_LOGIC;
		A_4 : in STD_LOGIC;
		B_4 : in STD_LOGIC;
		Y_1 : out STD_LOGIC;
		Y_2 : out STD_LOGIC;
		Y_3 : out STD_LOGIC;
		Y_4 : out STD_LOGIC
	);
end mux8x4;

architecture Behavioral of mux8x4 is

component mux2x1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           SEL : in STD_LOGIC;
           R : out STD_LOGIC);
end component;



begin

MUX1: mux2x1 port map (A => A_1, B => B_1, SEL => SEL, R => Y_1);
MUX2: mux2x1 port map (A => A_2, B => B_2, SEL => SEL, R => Y_2);
MUX3: mux2x1 port map (A => A_3, B => B_3, SEL => SEL, R => Y_3);
MUX4: mux2x1 port map (A => A_4, B => B_4, SEL => SEL, R => Y_4);

end Behavioral;
