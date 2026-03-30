----------------------------------------------------------------------------------
-- Round Controller Module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity control is
    Port ( CLK : in  STD_LOGIC;
           INIT : in  STD_LOGIC;
           TRAFO : in STD_LOGIC;
           EN125 : out  STD_LOGIC;
           EN346 : out  STD_LOGIC;
           EN78 : out  STD_LOGIC;
           RESULT : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(1 downto 0);
           S_T: out STD_LOGIC_VECTOR(1 downto 0));	
end control;

architecture Behavioral of control is
    SIGNAL internal_state: STD_LOGIC_VECTOR(2 downto 0) := "111";
    SIGNAL internal_state_delayed: STD_LOGIC_VECTOR(2 downto 0) := "111";
begin
	
    -- 3 bit counter
    c: PROCESS(CLK)
    BEGIN
        IF CLK = '1' and CLK'event THEN
            IF internal_state = "111" THEN
                IF INIT = '1' THEN
                    internal_state <= "000";
                END IF;
            ELSIF internal_state = "011" AND TRAFO = '1' THEN
                internal_state <= "110";
            ELSE
                internal_state <= STD_LOGIC_VECTOR(UNSIGNED(internal_state) + 1);
            END IF;
            
            -- Delay internal state by 1 cycle
            internal_state_delayed <= internal_state;
        END IF;
    END PROCESS c;
	
    -- Use delayed state for all outputs
    EN125 <= '1' when internal_state_delayed = "000" else '0';
    EN346 <= '1' when internal_state_delayed = "010" else '0';
    EN78 <= '1' when internal_state_delayed = "100" else '0';
    RESULT <= '1' when internal_state_delayed = "110" else '0';
    S <= internal_state_delayed(2 downto 1);
    S_T <= internal_state_delayed(2) & (internal_state_delayed(1) XOR TRAFO);
	
end Behavioral;

