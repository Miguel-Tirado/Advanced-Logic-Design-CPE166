----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2019 02:35:28 PM
-- Design Name: 
-- Module Name: RNG - Behavioral
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

entity RNG is
  Port (rst, ld, clk : in STD_LOGIC;
        muxS: in STD_LOGIC_VECTOR(2 downto 0);
        y: out STD_LOGIC_VECTOR(6 downto 0) );
end RNG;

architecture Behavioral of RNG is
signal w1, w2 : STD_LOGIC_VECTOR(3 downto 0);
signal w3: STD_LOGIC_VECTOR(6 downto 0);

component LFSR
    port (rst, clk: in STD_LOGIC;
          Q: out STD_LOGIC_VECTOR(3 downto 0));
end component; 

component DFF
    port (ld, clk, rst : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR(3 downto 0);
        Q : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component Hamming
   Port (din : in STD_LOGIC_VECTOR(4 downto 1);
      dout : out STD_LOGIC_VECTOR(7 downto 1));
end component;

component MUX 
  Port (d1 : in STD_LOGIC_VECTOR(3 downto 0);
      d2 : in STD_LOGIC_VECTOR (6 downto 0);
      s : in STD_LOGIC_VECTOR(2 downto 0);
      y : out STD_LOGIC_VECTOR(6 downto 0));
end component;

begin
    G1: LFSR port map (rst => rst, clk => clk, Q => w1);
    G2: DFF port map (D => w1, rst => rst, clk => clk, ld => ld, Q => w2);
    G3: Hamming port map (din => w2, dout => w3);
    G4: MUX port map (d1 => w2, d2 => w3, s => muxS, y => y);

end Behavioral;
