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
    signal internal_state         : STD_LOGIC_VECTOR(1 downto 0) := "11";
    signal internal_state_delayed : STD_LOGIC_VECTOR(1 downto 0) := "11";
    signal active                 : STD_LOGIC := '0';
    signal active_delayed         : STD_LOGIC := '0';
begin

    c: process(CLK)
    begin
        if CLK = '1' and CLK'event then
            if internal_state = "11" then
                if INIT = '1' then
                    internal_state <= "00";
                    active <= '1';
                else
                    active <= '0';
                end if;
            elsif internal_state = "01" and TRAFO = '1' then
                internal_state <= "11";
            else
                internal_state <= STD_LOGIC_VECTOR(UNSIGNED(internal_state) + 1);
            end if;

            -- Delay by 1 cycle
            internal_state_delayed <= internal_state;
            active_delayed         <= active;
        end if;
    end process c;

    EN125  <= '1' when internal_state_delayed = "00" else '0';
    EN346  <= '1' when internal_state_delayed = "01" else '0';
    EN78   <= '1' when internal_state_delayed = "10" else '0';

    RESULT <= '1' when internal_state_delayed = "11" and active_delayed = '1' else '0';

    S   <= internal_state_delayed;
    S_T <= internal_state_delayed(1) & (internal_state_delayed(0) xor TRAFO);

end Behavioral;