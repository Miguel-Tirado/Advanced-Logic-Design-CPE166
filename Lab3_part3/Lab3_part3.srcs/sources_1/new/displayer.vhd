----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2019 05:09:41 PM
-- Design Name: 
-- Module Name: displayer - beh
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity displayer is
   Port ( clk: in std_logic;
   din, s: in STD_LOGIC_VECTOR(2 downto 0);
   seg: out std_logic_vector(7 downto 0);
   dig: out std_logic_vector(7 downto 0) );
end displayer;


architecture beh of displayer is
signal count: std_logic_vector(17 downto 0);
signal dd:    std_logic_vector(3 downto 0);
signal an:    std_logic_vector(7 downto 0);
signal dis1, dis2, dis3 : STD_LOGIC_VECTOR(6 downto 0);
begin
  
  process(clk)
  begin
   if(rising_edge(clk)) then
    count <= count + 1;
    case(count(17 downto 15)) is
      when "000" => dd  <= "0111"; 
                    an  <= x"FE"; 
      when "001" => dd  <= "0110"; 
                    an  <= x"FD";     
      when "010" => dd  <= "0101"; 
                    an  <= x"FB"; 
      when "011" => dd  <= "0100"; 
                    an  <= x"F7"; 
      when "100" => dd  <= "0011"; 
                    an  <= x"EF";     
      when "101" => dd  <= "0010"; 
                    an  <= x"DF"; 
      when "110" => dd  <= "0001"; 
                    an  <= x"AF"; 
      when "111" => dd  <= "0000"; 
                    an  <= x"7F";     
      when others => dd  <= "0000"; 
                     an  <= x"7F";   
     end case;               
   end if;
  
  end process;
  
  dig <= an;
   
     
  process (dd)
  begin
    seg(7) <= '1'; 
    if ( s = "000") then
        dis1 <= "1111111";
        dis2 <= "1111111";
        dis3 <= "1111111";
        
    elsif (s = "001") then 
        dis1 <= "1111111";
        dis2 <= "1111111";
        if (din(0) = '1') then 
            dis3 <= "1111001";
        elsif(din(0) = '0') then 
            dis3 <= "1000000";
        end if;
    elsif (s = "010") then 
        if( din(2) = '1') then
            dis1 <= "1111001";
        elsif (din(2) = '0') then 
            dis1 <= "1000000";
        end if;
        
        if (din(1) = '1') then 
            dis2 <= "1111001";
        elsif (din(1) = '0') then 
            dis2 <= "1000000";
        end if;
        
        if (din(0) = '1') then 
            dis3 <= "1111001";
        elsif (din(0) = '0') then 
            dis3 <= "1000000";
        end if;
        
    elsif (s = "011") then 
        dis1 <= "1111111";

        if( din(1) = '1') then
            dis2 <= "1111001";
        elsif (din(1) = '0') then 
            dis2 <= "1000000";
        end if;        
        
        if( din(0) = '1') then
            dis3 <= "1111001";
        elsif (din(0) = '0') then 
            dis3 <= "1000000";
        end if;
    elsif (s = "100") then 
        dis1 <= "1111111";
        
        if( din(1) = '1') then
            dis2 <= "1111001";
        elsif (din(1) = '0') then 
            dis2 <= "1000000";
        end if;
        
        if( din(0) = '1') then
            dis3 <= "1111001";
        elsif (din(0) = '0') then 
            dis3 <= "1000000";
        end if;
        
    end if;
   

    case(dd) is 
        When x"0" =>
            seg(6 downto 0) <= "1111111"; --dis1;
        When x"1" =>
            seg(6 downto 0) <= "1111111"; --dis2
        When x"2" =>
            seg(6 downto 0) <= "1111111";  --dis3
        
        --when x"0" => seg(6 downto 0) <= "0001110"; --to display F
        --when x"1" => seg(6 downto 0) <= "0001100"; --to display P
        --when x"2" => seg(6 downto 0) <= "0000010"; --to display G
        when x"3" => seg(6 downto 0) <= "1111111"; --to display A
        when x"4" => seg(6 downto 0) <= "1111111"; --to display -
        
        when x"5" => seg(6 downto 0) <= dis1; --to display F
        when x"6" => seg(6 downto 0) <= dis2; --to display u
        when x"7" => seg(6 downto 0) <= dis3; --to display n
        when others => seg(6 downto 0) <= "1111111"; --blank
  end case;
  end process;
  

end beh;

