----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.06.2016 20:45:32
-- Design Name: 
-- Module Name: and_4_entity - Behavioral
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

entity and_4_entity is
    Port ( inputs : in STD_LOGIC_VECTOR (3 downto 0);
           outputs : out STD_LOGIC);
end and_4_entity;

architecture Behavioral of and_4_entity is

begin

outputs <= '1' when inputs = "1111" else
           '0';

end Behavioral;
