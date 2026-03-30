----------------------------------------------------------------------------------
-- Round Counter Controller Module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity roundcounter is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
end roundcounter;

architecture Behavioral of roundcounter is
	TYPE state IS (Sleep, Calc, Setup);
	SIGNAL current_state : state := Sleep;
	SIGNAL round_counter: STD_LOGIC_VECTOR(3 downto 0) := "1000";
begin
    -- Main state machine and counter process
    process(CLK)
    begin
        if CLK = '1' AND CLK'EVENT then
            case current_state is
                when Sleep =>
                    if START = '1' then
                        current_state <= Setup;
                        round_counter <= "0000"; 
                    end if;
                    
                when Setup =>
                    current_state <= Calc;
                    
                when Calc =>
                    if RESULT = '1' then
                        if round_counter = "1000" then
                            current_state <= Sleep;
                        else
                            round_counter <= round_counter + 1;
                            current_state <= Setup;
                        end if;
                    end if;
						  
					when others =>
						current_state <= Sleep;
            end case;
        end if;
    end process;
    
    -- Output signal assignments 
    READY <= '1' when current_state = Sleep else '0';
    INIT <= '1' when current_state = Setup else '0';
    TRAFO <= round_counter(3);  
    S_i <= '1' when round_counter = "0000" else '0'; 
    ROUND <= round_counter;
    
end Behavioral;

