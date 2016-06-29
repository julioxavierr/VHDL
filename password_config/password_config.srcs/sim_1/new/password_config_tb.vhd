----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.06.2016 21:44:22
-- Design Name: 
-- Module Name: password_config_tb - Behavioral
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

entity password_config_tb is
--  Port ( );
end password_config_tb;

architecture Behavioral of password_config_tb is

component password_config is
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
end component;

signal td0, td1, td2, td3, td4, td5, td6, td7, td8, td9 : STD_LOGIC;
signal tmode : STD_LOGIC := '0';
signal tu6_q0, tu6_q1, tu6_q2, tu6_q3, tu6_q4, tu6_q5, tu29_q0, tu29_q1, tu29_q2, tu29_q3, tu29_q4, tu29_q5 : STD_LOGIC;

begin

Test1: password_config port map (D0=>td0, D1=>td1, D2=>td2, D3=>td3, D4=>td4, D5=>td5, D6=>td6, D7=>td7, D8=>td8, D9=>td9, MODE=>tmode, U6_Q0=>tu6_q0, U6_Q1=>tu6_q1, U6_Q2=>tu6_q2, U6_Q3=>tu6_q3, U6_Q4=>tu6_q4, U6_Q5=>tu6_q5, U29_Q0=>tu29_q0, U29_Q1=>tu29_q1, U29_Q2=>tu29_q2, U29_Q3=>tu29_q3, U29_Q4=>tu29_q4, U29_Q5=>tu29_q5);

process
begin
td0 <= '0';
td1 <= '1';
td2 <= '1';
td3 <= '0';
td4 <= '1';
td5 <= '0';
td6 <= '1';
td7 <= '0';
td8 <= '0';
td9 <= '0';
wait for 100ns;
td0 <= '1';
td1 <= '1';
td2 <= '0';
td3 <= '1';
td4 <= '1';
td5 <= '0';
td6 <= '0';
td7 <= '0';
td8 <= '1';
td9 <= '1';
wait for 100ns;
end process;


end Behavioral;
