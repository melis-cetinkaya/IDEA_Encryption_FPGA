----------------------------------------------------------------------------------
-- 2-to-1 Multiplexer
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
	Port ( D0, D1 : IN STD_LOGIC_VECTOR(15 downto 0);
			 S: IN STD_LOGIC;
			 O: OUT STD_LOGIC_VECTOR(15 downto 0));
end mux2x1;

architecture Behavioral of mux2x1 is
begin

	PROCESS(S, D0, D1)
	BEGIN
		CASE S is
			WHEN '0'=> 
				O <= D0;
			WHEN '1'=> 
				O <= D1;
			WHEN OTHERS =>
				O <= (others => 'X');
		END CASE;
	END PROCESS;
	
end Behavioral;