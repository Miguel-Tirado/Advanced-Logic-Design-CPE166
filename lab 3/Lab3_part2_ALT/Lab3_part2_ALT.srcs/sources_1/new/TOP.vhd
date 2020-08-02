----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2019 01:33:39 PM
-- Design Name: 
-- Module Name: TOP - Behavioral
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

entity TOP is
  Port (sw1, sw2, sw3, clk : in STD_LOGIC;
        y: out STD_LOGIC_VECTOR(6 downto 0));
end TOP;

architecture Behavioral of TOP is
signal w1, w2 : STD_LOGIC;
signal w3 : STD_LOGIC_VECTOR(2 downto 0);

component FSM 
  port  (sw1, sw2, sw3, clk : in STD_LOGIC;
         clr, ld : out STD_LOGIC;
         muxS : out STD_LOGIC_VECTOR(2 downto 0));
end component; 

component RNG
  port (rst, ld, clk : in STD_LOGIC;
        muxS: in STD_LOGIC_VECTOR(2 downto 0);
        y: out STD_LOGIC_VECTOR(6 downto 0));
end component;
begin
    G1: FSM port map (sw1 => sw1, sw2 => sw2, sw3 => sw3, clk => clk, clr => w1,ld => w2, muxS => w3);
    G2: RNG port map (rst => w1, ld => w2, clk => clk, muxS => w3, y => y);

end Behavioral;
