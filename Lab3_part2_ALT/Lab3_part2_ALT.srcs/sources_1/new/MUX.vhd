----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2019 06:21:08 PM
-- Design Name: 
-- Module Name: MUX - Behavioral
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

entity MUX is
  Port (d1 : in STD_LOGIC_VECTOR(3 downto 0);
        d2 : in STD_LOGIC_VECTOR (6 downto 0);
        s : in STD_LOGIC_VECTOR(2 downto 0);
        y : out STD_LOGIC_VECTOR(6 downto 0));
end MUX;

architecture Behavioral of MUX is

begin
    process(s)
    begin 
        if(s = "000") then 
            y <= "0000000";
        elsif (s = "001") then 
            y <= "000" & d1;
        elsif (s= "010") then 
            y <= d2;
        end if;  
    end process;

end Behavioral;
