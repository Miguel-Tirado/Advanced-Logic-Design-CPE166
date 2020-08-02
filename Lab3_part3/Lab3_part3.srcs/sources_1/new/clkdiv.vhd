----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2019 05:54:39 PM
-- Design Name: 
-- Module Name: clkdiv - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity clkdiv is
port(clk, rst : in STD_LOGIC;
     clock2 : out STD_LOGIC ); 
end clkdiv;
architecture beh of clkdiv is
signal cnt_div: std_logic_vector(25 downto 0);
signal tmp_clk : STD_LOGIC;
begin
    process(clk)
    begin
        if (rst = '1') then 
            cnt_div <= (others => '0');  
        elsif (rising_edge (clk)) then
            if (cnt_div = 99999999) then 
                cnt_div <= (others => '0');
                tmp_clk <= '1';
            elsif (cnt_div < 49999999) then
                cnt_div <= cnt_div + 1;
                tmp_clk <= '1';
            else
                cnt_div <= cnt_div + 1;
                tmp_clk <= '0';
            end if;
        end if;
    end process;
    clock2 <= tmp_clk;
end beh;
