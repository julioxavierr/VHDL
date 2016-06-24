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
           D3 : out STD_LOGIC;
           D2 : out STD_LOGIC;
           D1 : out STD_LOGIC;
           D0 : out STD_LOGIC);
end main;

architecture Behavioral of main is

component JK_FF is
    port (	clock:		in std_logic;
		J, K:		in std_logic;
		reset:		in std_logic;
		Q, Qbar:	out std_logic
    );
end component;

signal t_clock : STD_LOGIC;
signal zero : STD_LOGIC := '0';
signal not_A : STD_LOGIC;
signal D3Q, D3Q_bar, D2Q, D2Q_bar, D1Q, D1Q_bar, D0Q, D0Q_bar: STD_LOGIC;
begin

not_A <= NOT(A);
FF1: JK_FF port map(clock=>t_clock, J=>A, K=>not_A, reset=>zero, Q=>D3Q, Qbar=>D3Q_bar);
D3 <= D3Q;
FF2: JK_FF port map(clock=>t_clock, J=>D3Q, K=>D3Q_bar, reset=>zero, Q=>D2Q, Qbar=>D2Q_bar);
D2 <= D2Q;
FF3: JK_FF port map(clock=>t_clock, J=>D2Q, K=>D2Q_bar, reset=>zero, Q=>D1Q, Qbar=>D1Q_bar);
D1 <= D1Q;
FF4: JK_FF port map(clock=>t_clock, J=>D1Q, K=>D1Q_bar, reset=>zero, Q=>D0Q, Qbar=>D0Q_bar);
D0 <= D0Q;

process
    begin
	T_clock <= '0';
	wait for 5 ns;
	T_clock <= '1';
	wait for 5 ns;
end process;
    
end Behavioral;
