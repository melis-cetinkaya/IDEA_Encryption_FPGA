----------------------------------------------------------------------------------
-- Round Module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity round is
	Port( X1, X2, X3, X4 : in STD_LOGIC_VECTOR (15 downto 0);
			Z1, Z2, Z3, Z4, Z5, Z6 : in STD_LOGIC_VECTOR (15 downto 0);
			Y1, Y2, Y3, Y4 : out STD_LOGIC_VECTOR (15 downto 0));
end round;

architecture Behavioral of round is
	
	-- Component Declerations
	COMPONENT xorop
		Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
				 I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
				 O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	
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
	
	-- Signal Declerations
	SIGNAL tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9 : STD_LOGIC_VECTOR (15 downto 0);

begin

	-- Structural Connections
	mul0: mulop PORT MAP (I_1 => X1, I_2 => Z1, O_1 => tmp0);
	add0: addop PORT MAP (I_1 => X2, I_2 => Z2, O_1 => tmp1);
	mul1: mulop PORT MAP (I_1 => X4, I_2 => Z4, O_1 => tmp3);
	add1: addop PORT MAP (I_1 => X3, I_2 => Z3, O_1 => tmp2);
	xor0: xorop PORT MAP (I_1 => tmp0, I_2 => tmp2, O_1 => tmp4);
	xor1: xorop PORT MAP (I_1 => tmp1, I_2 => tmp3, O_1 => tmp5);
	mul2: mulop PORT MAP (I_1 => Z5, I_2 => tmp4, O_1 => tmp6);
	add2: addop PORT MAP (I_1 => tmp6, I_2 => tmp5, O_1 => tmp7);
	mul3: mulop PORT MAP (I_1 => Z6, I_2 => tmp7, O_1 => tmp8);
	add3: addop PORT MAP (I_1 => tmp6, I_2 => tmp8, O_1 => tmp9);
	xor2: xorop PORT MAP (I_1 => tmp0, I_2 => tmp8, O_1 => Y1);
	xor3: xorop PORT MAP (I_1 => tmp1, I_2 => tmp9, O_1 => Y3);
	xor4: xorop PORT MAP (I_1 => tmp2, I_2 => tmp8, O_1 => Y2);
	xor5: xorop PORT MAP (I_1 => tmp3, I_2 => tmp9, O_1 => Y4);
	


end Behavioral;

