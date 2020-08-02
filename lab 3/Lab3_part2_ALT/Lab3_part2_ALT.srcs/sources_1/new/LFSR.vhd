----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2019 06:09:43 PM
-- Design Name: 
-- Module Name: LFSR - Behavioral
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

entity LFSR is
  Port (rst,clk: in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(3 downto 0));
end LFSR;

architecture Behavioral of LFSR is
signal D: STD_LOGIC_VECTOR (3 downto 0);

begin
    process(clk, rst)
    begin 
        if(rst = '1') then 
            D <= (1 => '1', others => '0');
        elsif (rising_edge(clk)) then 
            D(3) <= D(0);
            D(2) <= D(3) xor D(0);
            D(1) <= D(2);
            D(0) <= D(1);
        end if;
    end process;
    Q <= D;
end Behavioral;
