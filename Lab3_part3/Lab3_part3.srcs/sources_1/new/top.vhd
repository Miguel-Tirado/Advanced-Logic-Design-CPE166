----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2019 06:27:09 PM
-- Design Name: 
-- Module Name: top - beh
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

entity top is
  Port (sw1, sw2, sw3, sw4, clk : in STD_LOGIC;
        numOut: out STD_LOGIC_VECTOR(3 downto 0);
        seg, dig : out STD_LOGIC_VECTOR(7 downto 0) );
end top;

architecture beh of top is
signal w1, w2, w4 : STD_LOGIC;
signal w3,w8,w9,w10,w11,w12 : STD_LOGIC_VECTOR(2 downto 0);
signal w7: STD_LOGIC_VECTOR(3 downto 0);
component lfsr
PORT
(rst, clk, RE: IN STD_LOGIC;
Q1, Q2 : OUT STD_LOGIC_VECTOR(4 downto 1));
end component;

component calculator
  Port (din3, din4 : in STD_LOGIC_VECTOR (1 downto 0);
        y1, y2, y3, y4 : out STD_LOGIC_VECTOR (2 downto 0) );
end component;

component clkdiv
port(clk, rst : in STD_LOGIC;
     clock2 : out STD_LOGIC ); 
end component;

component fsm 
  Port (sw1 , sw2, sw3, sw4, clk: in STD_LOGIC;
        RE, clr : out STD_LOGIC;
        muxS : out STD_LOGIC_VECTOR(2 downto 0) );
end component;

component displayer
   Port ( clk: in std_logic;
   din, s: in STD_LOGIC_VECTOR(2 downto 0);
   seg: out std_logic_vector(7 downto 0);
   dig: out std_logic_vector(7 downto 0) );
end component;

component mux
  Port (d0, d1, d2, d3, s : in STD_LOGIC_VECTOR(2 downto 0);
        y : out STD_LOGIC_VECTOR(2 downto 0) );
end component;
begin
    U1: fsm port map (sw1 => sw1, sw2 => sw2, sw3 => sw3, sw4 => sw4, clk => clk, RE => w1, clr => w2, muxS => w3);
    U2: lfsr port map (rst => w2, RE => w1, clk => w4, Q1 => w7, Q2 => numOut);
    U3: calculator port map (din4 => w7(3 downto 2), din3 => w7(1 downto 0),y1 => w8, y2 => w9, y3 => w10,y4 => w11);
    U4: clkdiv port map (clk => clk, rst => w2, clock2 => w4);
    U5: displayer port map (clk => clk, din => w12, s => w3, seg => seg, dig => dig);
    U6: mux port map (d0 => w8, d1 => w9, d2 => w10,  d3 => w11, s => w3, y => w12);
end beh;

