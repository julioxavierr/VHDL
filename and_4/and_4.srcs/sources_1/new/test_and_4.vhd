----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.06.2016 20:55:04
-- Design Name: 
-- Module Name: test_and_4 - Behavioral
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

entity test_and_4 is
    Port ( ins : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC);
end test_and_4;

architecture Behavioral of test_and_4 is

component and_4_entity is
    Port ( inputs : in STD_LOGIC_VECTOR (3 downto 0);
           outputs : out STD_LOGIC);
end component;

begin

and_4_1: and_4_entity port map(ins, S);

end Behavioral;
