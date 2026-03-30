----------------------------------------------------------------------------------
-- Controller State Machine
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity control is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
           READY : out  STD_LOGIC;
           EN : out  STD_LOGIC;
           S : out  STD_LOGIC);
end control;

architecture Behavioral of control is
	TYPE state is (out_trafo, R1, R2, R3, R4, R5, R6, R7, R8);
	SIGNAL current_state: state := out_trafo;
	SIGNAL next_state: state;

begin
	p1:PROCESS(START, current_state)
		BEGIN
			-- Initialize output signals in idle
			READY <='1'; S <= '1'; EN <= '0'; ROUND <= "1000";
			
			CASE current_state IS
				WHEN out_trafo =>
				
				-- Next State Logic
				IF START = '1' THEN
					next_state <= R1;
				ELSE
					next_state <= out_trafo;
				END IF;
				
				-- Output Logic
				READY <= '1';
				S <= '1';
				EN <= '0';
				ROUND <= "1000";
				
				WHEN R1 =>
				
				-- Next State Logic
				next_state <= R2;
				
				-- Output Logic
				READY <= '0';
				S <= '0';
				EN <= '1';
				ROUND <= "0000";
				
				WHEN R2 =>
				
				-- Next State Logic
				next_state <= R3;
				
				-- Output Logic
				READY <= '0';
				S <= '1';
				EN <= '1';
				ROUND <= "0001";
				
				WHEN R3 =>
				
				-- Next State Logic
				next_state <= R4;
				
				-- Output Logic
				READY <= '0';
				S <= '1';
				EN <= '1';
				ROUND <= "0010";
				
				WHEN R4 =>
				
				-- Next State Logic
				next_state <= R5;
				
				-- Output Logic
				READY <= '0';
				S <= '1';
				EN <= '1';
				ROUND <= "0011";
				
				WHEN R5 =>
				
				-- Next State Logic
				next_state <= R6;
				
				-- Output Logic
				READY <= '0';
				S <= '1';
				EN <= '1';
				ROUND <= "0100";
				
				WHEN R6 =>
				
				-- Next State Logic
				next_state <= R7;
				
				-- Output Logic
				READY <= '0';
				S <= '1';
				EN <= '1';
				ROUND <= "0101";
				
				WHEN R7 =>
				
				-- Next State Logic
				next_state <= R8;
				
				-- Output Logic
				READY <= '0';
				S <= '1';
				EN <= '1';
				ROUND <= "0110";
				
				WHEN R8 =>
				
				-- Next State Logic
				next_state <= out_trafo;
				
				-- Output Logic
				READY <= '0';
				S <= '1';
				EN <= '1';
				ROUND <= "0111";
				
				WHEN OTHERS =>
				-- Next State Logic
				next_state <= out_trafo;
				
				-- Output Logic
				READY <= '1';
				S <= '1';
				EN <= '0';
				ROUND <= "1000";
			
			END CASE;
		END PROCESS p1;
	
	p2:PROCESS(CLK)
		BEGIN
			IF CLK = '1' and CLK'event THEN
				current_state <= next_state;
			END IF;
		END PROCESS p2;

end Behavioral;

