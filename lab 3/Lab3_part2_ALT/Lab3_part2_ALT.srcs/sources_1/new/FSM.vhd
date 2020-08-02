----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2019 07:51:21 PM
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
  Port (sw1, sw2, sw3, clk : in STD_LOGIC;
        clr, ld : out STD_LOGIC;
        muxS : out STD_LOGIC_VECTOR(2 downto 0));
end FSM;

architecture Behavioral of FSM is
type state_type is (S1, S2, S3, S4, S5);
signal cs, ns: state_type;
begin
    process(sw1, clk)
    begin 
        if(sw1 = '1') then 
            cs <= S1;
        elsif (rising_edge(clk)) then 
            cs <= ns;
        end if;
    end process;
    
    process(cs, sw2, sw3) 
    begin 
        case (cs) is
             When S1 => 
                  ns <= S2; clr <= '1'; ld <= '0'; muxS <= "000";
                  
             When S2 => muxS <= "000"; clr <= '0'; ld <= '0';
                  if (sw2 = '0' and sw3 = '0') then
                    ns <= S2;
                  elsif (sw2 = '1' and sw3 = '0') then 
                    ns <= s3;
                  elsif (sw2 = '0' and sw3 = '1') then 
                    ns <= S5;
                  else 
                    ns <= s2;
                  end if;
                  
             When  S3 => muxS <= "000"; clr <= '0'; ld <= '1';
                if (sw2 = '1' and sw3 = '0') then
                    ns <= S4;
                elsif (sw2 = '0' and sw3 = '0') then
                    ns <= S4;
                else 
                    ns <= S3;
                end if;
                
             When S4 => muxS <= "001"; clr <= '0'; ld <= '0';
                if (sw2 = '1' and sw3 = '0') then 
                    ns <= S4;
                elsif (sw2 ='0' and sw3 = '0') then 
                    ns <= S4;
                elsif (sw2 = '0' and sw3 = '1') then 
                    ns <= S5;
                else 
                    ns <= s4;
                end if;
                
            When S5 => muxS <= "010"; clr <= '0'; ld <= '0'; 
                if (sw3 ='1' and sw2 = '0') then 
                    ns <= S5;
                elsif (sw3 = '0' and sw2 ='0') then 
                    ns <= S5;
                elsif ( sw3 ='0' and sw2 = '1') then 
                    ns <= S3;
                else 
                    ns <= S5;
                end if;
                 
            When others =>
                    ns <= S1; muxS <= "000"; clr <= '1'; ld <= '0';
            
        end case;
    end process;
end Behavioral;
