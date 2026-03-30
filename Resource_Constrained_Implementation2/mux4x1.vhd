----------------------------------------------------------------------------------
-- 4-to-1 Multiplexer
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1 is
	Port ( D0, D1, D2, D3 : IN STD_LOGIC_VECTOR(15 downto 0);
			 S: IN STD_LOGIC_VECTOR(1 downto 0);
			 O: OUT STD_LOGIC_VECTOR(15 downto 0));
end mux4x1;

architecture Behavioral of mux4x1 is
begin

	PROCESS(S, D0, D1, D2, D3)
	BEGIN
		CASE S is
			WHEN "00"=> 
				O <= D0;
			WHEN "01"=> 
				O <= D1;
			WHEN "10"=> 
				O <= D2;
			WHEN "11"=> 
				O <= D3;
			WHEN OTHERS =>
				O <= (others => 'X');
		END CASE;
	END PROCESS;
	
end Behavioral;


