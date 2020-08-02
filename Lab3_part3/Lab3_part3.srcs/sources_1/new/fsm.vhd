----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2019 03:01:48 PM
-- Design Name: 
-- Module Name: fsm - beh
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

entity fsm is
  Port (sw1 , sw2, sw3, sw4, clk: in STD_LOGIC;
        RE, clr : out STD_LOGIC;
        muxS : out STD_LOGIC_VECTOR(2 downto 0) );
end fsm;

architecture beh of fsm is
type state_type is(S1, S2, S3, S4, S5, S6, S7);
signal cs, ns : state_type;

begin
    process(sw1, clk)
    begin
        if (sw1 = '1') then
            cs <= S1;
        elsif (rising_edge(clk)) then 
            cs <= ns;
        end if;  
    end process;
    
    process(cs, sw2, sw3, sw4)
    begin 
        case(cs) is 
            When S1 => 
                ns <= S2; clr <= '1'; RE <= '0'; muxS <= "000";
            
            When S2 =>
                clr <= '0'; RE <= '0'; muxS <= "000";
                if(sw2 = '1' and sw3 = '0' and sw4 = '0') then
                    ns <= S3;
                else 
                    ns <= S2;
                end if;
                
            When S3 => 
                clr <= '0'; RE <= '1'; muxS <= "000";
                if (sw2 = '0' and sw3 = '0' and sw4 = '0') then 
                    ns <= S4;
                else 
                    ns <= S3;
                end if;
            
            When S4 => 
                clr <= '0'; RE <= '0'; muxS <= "001";
                if(sw2 = '0' and sw3 = '0' and sw4 = '0') then
                    ns <= S4;
                elsif (sw2 ='0' and sw3 = '0' and sw4 = '1') then 
                    ns <= S5;
                elsif (sw2 ='0' and sw3 = '1' and sw4 = '0') then 
                    ns <= S6;
                elsif (sw2 ='0' and sw3 = '1' and sw4 = '1') then 
                    ns <= S7;
                elsif (sw2 = '1') then 
                    ns <= S3;
                else 
                    ns <= S4;
                end if;
            
            When S5 => 
                    clr <= '0'; RE <= '0'; muxS <= "010";
                    if(sw2 = '1') then
                        ns <= S3;
                    elsif (sw2 ='0' and sw3 = '1' and sw4 = '0') then 
                        ns <= S6;
                    elsif (sw2 ='0' and sw3 = '1' and sw4 = '1') then 
                        ns <= S7;
                    elsif (sw2 ='0' and sw3 = '0' and sw4 = '0') then 
                        ns <= S4;
                    elsif (sw2 ='0' and sw3 = '0' and sw4 = '1') then 
                        ns <= S5;
                    else 
                        ns <= S5;
                    end if;
                    
            When S6 =>                           
                    clr <= '0'; RE <= '0'; muxS <= "011";
                    if(sw2 = '1') then
                        ns <= S3;
                    elsif (sw2 ='0' and sw3 = '1' and sw4 = '0') then 
                        ns <= S6;
                    elsif (sw2 ='0' and sw3 = '1' and sw4 = '1') then 
                        ns <= S7;
                    elsif (sw2 ='0' and sw3 = '0' and sw4 = '0') then 
                        ns <= S4;
                    elsif (sw2 ='0' and sw3 = '0' and sw4 = '1') then 
                        ns <= S5;
                    else 
                        ns <= S6;
                    end if;           
            When S7 =>                           
                    clr <= '0'; RE <= '0'; muxS <= "100";
                    if(sw2 = '1') then
                        ns <= S3;
                    elsif (sw2 ='0' and sw3 = '1' and sw4 = '0') then 
                        ns <= S6;
                    elsif (sw2 ='0' and sw3 = '1' and sw4 = '1') then 
                        ns <= S7;
                    elsif (sw2 ='0' and sw3 = '0' and sw4 = '0') then 
                        ns <= S4;
                    elsif (sw2 ='0' and sw3 = '0' and sw4 = '1') then 
                        ns <= S5;
                    else 
                        ns <= S7;
                    end if;
            When others =>
                ns <= S1; clr <= '1'; RE <= '0'; muxS <= "000";
        end case;
    end process;
end beh;
