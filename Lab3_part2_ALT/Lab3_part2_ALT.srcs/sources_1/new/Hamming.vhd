----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2019 05:56:41 PM
-- Design Name: 
-- Module Name: Hamming - Behavioral
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

entity Hamming is
  Port (din : in STD_LOGIC_VECTOR(4 downto 1);
        dout : out STD_LOGIC_VECTOR(7 downto 1));
end Hamming;

architecture Behavioral of Hamming is
signal p3, p2, p1: STD_LOGIC;
begin
    p3 <= din(4) xor din(3) xor din(2);
    p2 <= din(4) xor din(3) xor din(1);
    p1 <= din(4) xor din(2) xor din(1);
    
    dout <= din(4) & din(3) & din(2) & p3 & din(1) & p2 & p1;

end Behavioral;
