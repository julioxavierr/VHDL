----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.06.2016 00:06:04
-- Design Name: 
-- Module Name: shift_register_testbench - Behavioral
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

entity shift_register_testbench is
--  Port ( );
end shift_register_testbench;

architecture Behavioral of shift_register_testbench is

component shift_register is
Port ( 	
		MODE : 			in STD_LOGIC;
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
end component;

signal t_mode : STD_LOGIC := '1';
signal t_shift_select : STD_LOGIC := '1';
signal t_digit : STD_LOGIC := '1';
signal t_d0, t_d1, t_d2, t_d3, t_d4, t_d5, t_d6, t_d7, t_d8, t_d9 : STD_LOGIC;
signal valor : STD_LOGIC := '1';
begin

s1: shift_register port map (MODE=>t_mode, SHIFT_SELECT=>t_shift_select, DIGIT=>t_digit, D0=>t_d0, D1=>t_d1, D2=>t_d2, D3=>t_d3, D4=>t_d4, D5=>t_d5, D6=>t_d6, D7=>t_d7, D8=>t_d8, D9=>t_d9);

valor <= t_d9 XNOR valor;
end Behavioral;
