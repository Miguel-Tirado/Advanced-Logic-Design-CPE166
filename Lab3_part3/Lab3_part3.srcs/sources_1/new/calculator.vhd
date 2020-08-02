----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2019 02:11:21 PM
-- Design Name: 
-- Module Name: calculator - beh
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calculator is
  Port (din3, din4 : in STD_LOGIC_VECTOR (1 downto 0);
        y1, y2, y3, y4 : out STD_LOGIC_VECTOR (2 downto 0) );
end calculator;

architecture beh of calculator is
begin
    process (din3, din4)
    begin 
        if (din4 > din3) then 
            y1 <= "001";
        else 
            y1 <= "000";
        end if;
        
        y2 <= ('0' & din4) + ('0' & din3);
        y3 <= ('0' & din4) or ('0' & din3);
        y4 <= ('0' & din4) and ('0' & din3);
    end process;

end beh;
