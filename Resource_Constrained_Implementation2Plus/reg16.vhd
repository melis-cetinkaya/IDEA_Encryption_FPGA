----------------------------------------------------------------------------------
-- 16-Bit Wide Register
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg16 is
	Port ( D : IN STD_LOGIC_VECTOR(15 downto 0);
			 clk, en: IN STD_LOGIC;
			 Q: OUT STD_LOGIC_VECTOR(15 downto 0));
end reg16;

architecture Behavioral of reg16 is
begin

	PROCESS(clk)
	BEGIN
		IF clk = '1' and clk'event THEN
			IF en = '1' THEN
				Q <= D;
			END IF;
		END IF;
	END PROCESS;
	
end Behavioral;

