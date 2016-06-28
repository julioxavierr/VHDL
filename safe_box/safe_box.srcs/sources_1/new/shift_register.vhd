----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.06.2016 22:11:44
-- Design Name: 
-- Module Name: shift_register - Behavioral
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

entity shift_register is
Port ( 	
		MODE : 			in STD_LOGIC;
        CLOCK : 		in STD_LOGIC;
        SHIFT_SELECT : 	in STD_LOGIC;
        DIGIT : 		in STD_LOGIC;
        D0 :			out STD_LOGIC;
        D1 :			out STD_LOGIC;
        D2 :			out STD_LOGIC;
        D3 :			out STD_LOGIC;
        D4 :			out STD_LOGIC;
        D5 :			out STD_LOGIC;
        D6 :			out STD_LOGIC;
        D7 :			out STD_LOGIC;
        D8 :			out STD_LOGIC;
        D9 :			out STD_LOGIC);
end shift_register;

architecture Behavioral of shift_register is

component d_ff is
  
  port (
    clk   : in  std_logic;
    rst_n : in  std_logic;
    set_n : in  std_logic;
    d     : in  std_logic;
    q     : out std_logic;
    q_n   : out std_logic);

end component;

component mux8x4 is
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
end component;


signal alto : STD_LOGIC := '1';
signal gnd : STD_LOGIC := '0';
signal and_clock : STD_LOGIC;
signal q_u2, q_u3, q_u4, q_u5, q_u21, q_u22, q_u23, q_u24, q_u25, q_u26 : STD_LOGIC;
signal q_n_u2, q_n_u3, q_n_u4, q_n_u5, q_n_u21, q_n_u22, q_n_u23, q_n_u24, q_n_u25, q_n_u26 : STD_LOGIC;
signal d_u2, d_u3, d_u4, d_u5, d_u21, d_u22, d_u23, d_u24, d_u25, d_u26 : STD_LOGIC;
signal d_u27, d_u28, a_3_u3, b_3_u3, a_4_u4, b_4_u4 : STD_LOGIC; -- nao foram usados
begin

and_clock <= MODE AND CLOCK;

U1mux: mux8x4 port map  (SEL=>SHIFT_SELECT, A_1=>q_u3, B_1=>DIGIT, A_2=>q_u4, B_2=>q_u2, A_3=>q_u5, B_3=>q_u3, A_4=>q_u21, B_4=>q_u4, Y_1=>d_u2, Y_2=>d_u3, Y_3=>d_u4, Y_4=>d_u5);
U2mux: mux8x4 port map  (SEL=>SHIFT_SELECT, A_1=>q_u22, B_1=>q_u5, A_2=>q_u23, B_2=>q_u21, A_3=>q_u24, B_3=>q_u22, A_4=>q_u25, B_4=>q_u23, Y_1=>d_u21, Y_2=>d_u22, Y_3=>d_u23, Y_4=>d_u24);
U3mux: mux8x4 port map  (SEL=>SHIFT_SELECT, A_1=>q_u26, B_1=>q_u24, A_2=>gnd, B_2=>q_u25, A_3=>a_3_u3, B_3=>b_3_u3, A_4=>a_4_u4, B_4=>b_4_u4, Y_1=>d_u25, Y_2=>d_u26, Y_3=>d_u27, Y_4=>d_u28);


U2FF: d_ff port map (clk=>and_clock,rst_n=>alto,set_n=>alto,d=>d_u2,q=>q_u2,q_n=>q_n_u2);
U3FF: d_ff port map (clk=>and_clock,rst_n=>alto,set_n=>alto,d=>d_u3,q=>q_u3,q_n=>q_n_u3);
U4FF: d_ff port map (clk=>and_clock,rst_n=>alto,set_n=>alto,d=>d_u4,q=>q_u4,q_n=>q_n_u4);
U5FF: d_ff port map (clk=>and_clock,rst_n=>alto,set_n=>alto,d=>d_u5,q=>q_u5,q_n=>q_n_u5);
U21FF: d_ff port map (clk=>and_clock,rst_n=>alto,set_n=>alto,d=>d_u21,q=>q_u21,q_n=>q_n_u21);
U22FF: d_ff port map (clk=>and_clock,rst_n=>alto,set_n=>alto,d=>d_u22,q=>q_u22,q_n=>q_n_u22);
U23FF: d_ff port map (clk=>and_clock,rst_n=>alto,set_n=>alto,d=>d_u23,q=>q_u23,q_n=>q_n_u23);
U24FF: d_ff port map (clk=>and_clock,rst_n=>alto,set_n=>alto,d=>d_u24,q=>q_u24,q_n=>q_n_u24);
U25FF: d_ff port map (clk=>and_clock,rst_n=>alto,set_n=>alto,d=>d_u25,q=>q_u25,q_n=>q_n_u25);
U26FF: d_ff port map (clk=>and_clock,rst_n=>alto,set_n=>alto,d=>d_u26,q=>q_u26,q_n=>q_n_u26);

D0 <= q_u2;
D1 <= q_u3;
D2 <= q_u4;
D3 <= q_u5;
D4 <= q_u21;
D5 <= q_u22;
D6 <= q_u23;
D7 <= q_u24;
D8 <= q_u25;
D9 <= q_u26;

end Behavioral;
