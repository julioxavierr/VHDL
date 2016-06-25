-- Mux com 2 entradas
-- Quando SEL = 0 retorna entrada A
-- Quando SEL = 1 retorna entrada B

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2x1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           SEL : in STD_LOGIC;
           R : out STD_LOGIC);
end mux2x1;

architecture Behavioral of mux2x1 is

signal T1, T2, T3 : STD_LOGIC;

begin

T1 <= NOT(SEL) AND A;
T2 <= A AND B;
T3 <= SEL AND B;
R <= T1 OR T2 OR T3;

end Behavioral;
