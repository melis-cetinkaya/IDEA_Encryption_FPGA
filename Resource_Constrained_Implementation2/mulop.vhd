----------------------------------------------------------------------------------
-- Modulo Multiplier Module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mulop is
    Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop;

architecture Behavioral of mulop is
		
begin
	
	PROCESS(I_1,I_2)
		VARIABLE a: UNSIGNED(16 downto 0);
		VARIABLE b: UNSIGNED(16 downto 0);
		VARIABLE product: UNSIGNED(33 downto 0);
		
		VARIABLE low: UNSIGNED (16 downto 0);
		VARIABLE high: UNSIGNED (16 downto 0);
		VARIABLE result: UNSIGNED (16 downto 0);
	BEGIN
		
		-- Calculate a,b for Low High Algorithm
		-- Usage of resize() is AI suggested
		IF I_1 = X"0000" THEN
			a := to_unsigned(65536, 17);
		ELSE
			a := resize(unsigned(I_1(15 downto 0)),17);
		END IF;
		
		IF I_2 = X"0000" THEN
			b := to_unsigned(65536, 17);
		ELSE
			b := resize(unsigned(I_2(15 downto 0)),17);
		END IF;
		
		
		-- Calculate a*b Product
		product := a * b;
		
		
		-- Low, High Calculations
		low := resize(product(15 downto 0),17);
		high := product(32 downto 16);
		
		
		-- Apply Algorithm
		IF low >= high THEN
			result := low - high;
		ELSE
			result := low - high + 65537;
		END IF;
		
		-- Case: Both inputs are 0 zero
		IF result = 65536 THEN
			O_1 <= (others => '0');
		ELSE
			O_1 <= std_logic_vector(result(15 downto 0));
		END IF;
	END PROCESS;


end Behavioral;

