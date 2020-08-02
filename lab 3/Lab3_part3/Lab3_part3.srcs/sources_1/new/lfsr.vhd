----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2019 05:45:06 PM
-- Design Name: 
-- Module Name: lfsr - Behavioral
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


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY lfsr IS
PORT
(
rst, clk, RE: IN STD_LOGIC;
Q1, Q2 : OUT STD_LOGIC_VECTOR(4 downto 1)
);
END lfsr;

ARCHITECTURE beh OF lfsr IS
signal W: std_logic_vector(4 downto 1);

BEGIN
process( clk, rst, RE )
begin
    if (rst='1') then
    W <= ( 1=>'1', others => '0' );
    elsif(RE = '1') then 
        if (rising_edge (clk)) then
        W <= W(3 downto 2) & ( W(1) xor W(4) ) & W(4);
        end if;
    end if;
end process;
Q1 <= W;
Q2 <= W;
END beh;