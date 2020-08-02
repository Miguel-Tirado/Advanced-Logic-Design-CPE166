----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 01:41:42 PM
-- Design Name: 
-- Module Name: BCD_Counter - Behavioral
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_Counter is
  Port (clk: in std_logic;
  updown: in std_logic;
  cntout: out std_logic_vector (3 downto 0);  
  clkout: out std_logic
   );
end BCD_Counter;

architecture Behavioral of BCD_Counter is
--internal signals
signal cnt_div: std_logic_vector (9 downto 0);
signal cnt: std_logic_vector (3 downto 0);
signal clk2: std_logic;
--debugger Code ---------------------------------
attribute mark_debug: string;
attribute keep: string;
attribute mark_debug of cntout: signal is "true";
attribute mark_debug of clkout: signal is "true";
--debugger Code End--------------------------------

begin

process(clk)
begin
if rising_edge (clk) then
  if(cnt_div = 99) then
    cnt_div <= (others => '0');
    clk2 <= '1';
  elsif (cnt_div < 49) then
    cnt_div <= cnt_div + 1;
    clk2 <= '1';
  else
    cnt_div <= cnt_div + 1;
    clk2 <= '0';
  end if;
end if;

end process;

process (clk2,updown)
begin
if rising_edge (clk2) then

if(updown = '1') then 
    if(cnt = 9) then
        cnt <= (others => '0');
    else
        cnt <= cnt +1;
    end if;
else 
  cnt <= cnt -1;
end if;
end if;
end process; 

cntout <= cnt;  --output count
clkout <= clk2; --output clk 

end Behavioral;
