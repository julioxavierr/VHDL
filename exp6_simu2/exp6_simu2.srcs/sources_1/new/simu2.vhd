----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.06.2016 08:29:36
-- Design Name: 
-- Module Name: simu2 - Behavioral
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

library IEEE; 
use IEEE.STD_LOGIC_1164.all;  

entity jk is 
   port(
      j : in STD_LOGIC; 
      k : in STD_LOGIC; 
      clk : in STD_LOGIC; 
      reset : in STD_LOGIC; 
      q : out STD_LOGIC; 
      qb : out STD_LOGIC 
   ); 
end jk;
  
architecture virat of jk is 
begin 
   jkff : process (j,k,clk,reset) is 
   variable m : std_logic := '0'; 
   
   begin 
      if (reset = '1') then 
         m := '0'; 
      elsif (rising_edge (clk)) then 
         if (j /= k) then
            m := j; 
         elsif (j = '1' and k = '1') then 
            m := not m; 
         end if; 
      end if; 
      
      q <= m; 
      qb <= not m; 
   end process jkff; 
end virat;