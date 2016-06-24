----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.06.2016 15:25:11
-- Design Name: 
-- Module Name: main_tb - Behavioral
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

entity main_tb is
--  Port ( );
end main_tb;

architecture Behavioral of main_tb is

    component main is
        Port ( A : in STD_LOGIC;
           D3 : out STD_LOGIC;
           D2 : out STD_LOGIC;
           D1 : out STD_LOGIC;
           D0 : out STD_LOGIC);
    end component;

    signal signal_A : STD_LOGIC;
    signal d3t, d2t, d1t, d0t : STD_LOGIC;

begin

    mapping: main port map(signal_A, d3t, d2t, d1t, d0t);

    process
    begin
        signal_A <= '0';
        wait for 30 ns;
        signal_A <= '1';
        wait for 30 ns;
    end process;
    


end Behavioral;
