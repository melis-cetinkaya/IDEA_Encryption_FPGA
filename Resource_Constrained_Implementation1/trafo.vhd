----------------------------------------------------------------------------------
-- Output Transformation Module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trafo is
	Port( X1, X2, X3, X4 : in STD_LOGIC_VECTOR (15 downto 0);
			Z1, Z2, Z3, Z4 : in STD_LOGIC_VECTOR (15 downto 0);
			Y1, Y2, Y3, Y4 : out STD_LOGIC_VECTOR (15 downto 0));
end trafo;

architecture Behavioral of trafo is

	-- Component Declerations
	COMPONENT addop
		Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
				 I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
				 O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
	
	END COMPONENT;
	
	COMPONENT mulop
		Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
				 I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
				 O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
	
	END COMPONENT;

begin
	
	-- Structural Connections
	mul0: mulop PORT MAP (I_1 => X1, I_2 => Z1, O_1 => Y1);
	add0: addop PORT MAP (I_1 => X3, I_2 => Z2, O_1 => Y2);
	mul1: mulop PORT MAP (I_1 => X4, I_2 => Z4, O_1 => Y4);
	add1: addop PORT MAP (I_1 => X2, I_2 => Z3, O_1 => Y3);


end Behavioral;

