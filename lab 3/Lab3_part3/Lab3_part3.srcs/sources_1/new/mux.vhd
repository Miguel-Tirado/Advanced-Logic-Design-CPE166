----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2019 04:02:01 PM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
  Port (d0, d1, d2, d3, s : in STD_LOGIC_VECTOR(2 downto 0);
        y : out STD_LOGIC_VECTOR(2 downto 0) );
end mux;

architecture beh of mux is

begin
    process( s, d0, d1, d2, d3)
    begin
        if( s = "000") then
            y <= "000";
        elsif( s = "001") then
            y <= d0;
        elsif( s = "010") then 
            y <= d1;
        elsif( s = "011") then
            y <= d2;
        elsif(s = "100") then 
            y <= d3;
        end if;
    end process;

end beh;
