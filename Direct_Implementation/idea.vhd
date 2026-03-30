----------------------------------------------------------------------------------
-- IDEA Encryption Module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity idea is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0));
end idea;

architecture Structural of idea is

	-- Component Declerations
	COMPONENT trafo
		Port( X1, X2, X3, X4 : in STD_LOGIC_VECTOR (15 downto 0);
				Z1, Z2, Z3, Z4 : in STD_LOGIC_VECTOR (15 downto 0);
				Y1, Y2, Y3, Y4 : out STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	
	COMPONENT round
		Port( X1, X2, X3, X4 : in STD_LOGIC_VECTOR (15 downto 0);
				Z1, Z2, Z3, Z4, Z5, Z6 : in STD_LOGIC_VECTOR (15 downto 0);
				Y1, Y2, Y3, Y4 : out STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	
	-- Signal Declerations
	SIGNAL r1_Y1, r1_Y2, r1_Y3, r1_Y4: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r2_Y1, r2_Y2, r2_Y3, r2_Y4: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r3_Y1, r3_Y2, r3_Y3, r3_Y4: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r4_Y1, r4_Y2, r4_Y3, r4_Y4: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r5_Y1, r5_Y2, r5_Y3, r5_Y4: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r6_Y1, r6_Y2, r6_Y3, r6_Y4: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r7_Y1, r7_Y2, r7_Y3, r7_Y4: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r8_Y1, r8_Y2, r8_Y3, r8_Y4: STD_LOGIC_VECTOR (15 downto 0);
	
	SIGNAL r1_Z1, r1_Z2, r1_Z3, r1_Z4, r1_Z5, r1_Z6: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r2_Z1, r2_Z2, r2_Z3, r2_Z4, r2_Z5, r2_Z6: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r3_Z1, r3_Z2, r3_Z3, r3_Z4, r3_Z5, r3_Z6: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r4_Z1, r4_Z2, r4_Z3, r4_Z4, r4_Z5, r4_Z6: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r5_Z1, r5_Z2, r5_Z3, r5_Z4, r5_Z5, r5_Z6: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r6_Z1, r6_Z2, r6_Z3, r6_Z4, r6_Z5, r6_Z6: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r7_Z1, r7_Z2, r7_Z3, r7_Z4, r7_Z5, r7_Z6: STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL r8_Z1, r8_Z2, r8_Z3, r8_Z4, r8_Z5, r8_Z6: STD_LOGIC_VECTOR (15 downto 0);
	
	SIGNAL o_Z1, o_Z2, o_Z3, o_Z4: STD_LOGIC_VECTOR (15 downto 0);
	
	SIGNAL KEY1, KEY2, KEY3, KEY4, KEY5, KEY6, KEY7: UNSIGNED(127 downto 0);

begin
	
	-- Partial Key Generation
	-- Round 1
	KEY1 <= unsigned(KEY);
	
	r2_Z2 <= KEY(15 downto 0);
	r2_Z1 <= KEY(31 downto 16);
	r1_Z6 <= KEY(47 downto 32);
	r1_Z5 <= KEY(63 downto 48);
	r1_Z4 <= KEY(79 downto 64);
	r1_Z3 <= KEY(95 downto 80);
	r1_Z2 <= KEY(111 downto 96);
	r1_Z1 <= KEY(127 downto 112);
	
	-- Round 2
	KEY2 <= KEY1 rol 25;
	
	r3_Z4 <= std_logic_vector(KEY2(15 downto 0));
	r3_Z3 <=  std_logic_vector(KEY2(31 downto 16));
	r3_Z2 <=  std_logic_vector(KEY2(47 downto 32));
	r3_Z1 <=  std_logic_vector(KEY2(63 downto 48));
	r2_Z6 <=  std_logic_vector(KEY2(79 downto 64));
	r2_Z5 <=  std_logic_vector(KEY2(95 downto 80));
	r2_Z4 <=  std_logic_vector(KEY2(111 downto 96));
	r2_Z3 <=  std_logic_vector(KEY2(127 downto 112));
	
	-- Round 3
	KEY3 <= KEY2 rol 25;
	
	r4_Z6 <= std_logic_vector(KEY3(15 downto 0));
	r4_Z5 <=  std_logic_vector(KEY3(31 downto 16));
	r4_Z4 <=  std_logic_vector(KEY3(47 downto 32));
	r4_Z3 <=  std_logic_vector(KEY3(63 downto 48));
	r4_Z2 <=  std_logic_vector(KEY3(79 downto 64));
	r4_Z1 <=  std_logic_vector(KEY3(95 downto 80));
	r3_Z6 <=  std_logic_vector(KEY3(111 downto 96));
	r3_Z5 <=  std_logic_vector(KEY3(127 downto 112));

	-- Round 4
	KEY4 <= KEY3 rol 25;
	
	r6_Z2 <= std_logic_vector(KEY4(15 downto 0));
	r6_Z1 <= std_logic_vector(KEY4(31 downto 16));
	r5_Z6 <= std_logic_vector(KEY4(47 downto 32));
	r5_Z5 <= std_logic_vector(KEY4(63 downto 48));
	r5_Z4 <= std_logic_vector(KEY4(79 downto 64));
	r5_Z3 <= std_logic_vector(KEY4(95 downto 80));
	r5_Z2 <= std_logic_vector(KEY4(111 downto 96));
	r5_Z1 <= std_logic_vector(KEY4(127 downto 112));

	-- Round 5
	KEY5 <= KEY4 rol 25;
	
	r7_Z4 <= std_logic_vector(KEY5(15 downto 0));
	r7_Z3 <=  std_logic_vector(KEY5(31 downto 16));
	r7_Z2 <=  std_logic_vector(KEY5(47 downto 32));
	r7_Z1 <=  std_logic_vector(KEY5(63 downto 48));
	r6_Z6 <=  std_logic_vector(KEY5(79 downto 64));
	r6_Z5 <=  std_logic_vector(KEY5(95 downto 80));
	r6_Z4 <=  std_logic_vector(KEY5(111 downto 96));
	r6_Z3 <=  std_logic_vector(KEY5(127 downto 112));
	
	-- Round 6
	KEY6 <= KEY5 rol 25;
	
	r8_Z6 <= std_logic_vector(KEY6(15 downto 0));
	r8_Z5 <=  std_logic_vector(KEY6(31 downto 16));
	r8_Z4 <=  std_logic_vector(KEY6(47 downto 32));
	r8_Z3 <=  std_logic_vector(KEY6(63 downto 48));
	r8_Z2 <=  std_logic_vector(KEY6(79 downto 64));
	r8_Z1 <=  std_logic_vector(KEY6(95 downto 80));
	r7_Z6 <=  std_logic_vector(KEY6(111 downto 96));
	r7_Z5 <=  std_logic_vector(KEY6(127 downto 112));
	
	-- Round 7
	KEY7 <= KEY6 rol 25;
	
	o_Z1 <= std_logic_vector(KEY7(127 downto 112));
	o_Z2 <= std_logic_vector(KEY7(111 downto 96));
	o_Z3 <= std_logic_vector(KEY7(95 downto 80));
	o_Z4 <= std_logic_vector(KEY7(79 downto 64));

	
	-- Structural Connections
	round1: round PORT MAP (X1 => X_1, X2 => X_2, X3 => X_3, X4 => X_4, 
									Z1 => r1_Z1, Z2 => r1_Z2, Z3 => r1_Z3, Z4 => r1_Z4, Z5 => r1_Z5, Z6 => r1_Z6,
									Y1 => r1_Y1, Y2 => r1_Y2, Y3 => r1_Y3, Y4 => r1_Y4);
	round2: round PORT MAP (X1 => r1_Y1, X2 => r1_Y2, X3 => r1_Y3, X4 => r1_Y4, 
									Z1 => r2_Z1, Z2 => r2_Z2, Z3 => r2_Z3, Z4 => r2_Z4, Z5 => r2_Z5, Z6 => r2_Z6,
									Y1 => r2_Y1, Y2 => r2_Y2, Y3 => r2_Y3, Y4 => r2_Y4);
	round3: round PORT MAP (X1 => r2_Y1, X2 => r2_Y2, X3 => r2_Y3, X4 => r2_Y4, 
									Z1 => r3_Z1, Z2 => r3_Z2, Z3 => r3_Z3, Z4 => r3_Z4, Z5 => r3_Z5, Z6 => r3_Z6,
									Y1 => r3_Y1, Y2 => r3_Y2, Y3 => r3_Y3, Y4 => r3_Y4);
	round4: round PORT MAP (X1 => r3_Y1, X2 => r3_Y2, X3 => r3_Y3, X4 => r3_Y4, 
									Z1 => r4_Z1, Z2 => r4_Z2, Z3 => r4_Z3, Z4 => r4_Z4, Z5 => r4_Z5, Z6 => r4_Z6,
									Y1 => r4_Y1, Y2 => r4_Y2, Y3 => r4_Y3, Y4 => r4_Y4);
	round5: round PORT MAP (X1 => r4_Y1, X2 => r4_Y2, X3 => r4_Y3, X4 => r4_Y4, 
									Z1 => r5_Z1, Z2 => r5_Z2, Z3 => r5_Z3, Z4 => r5_Z4, Z5 => r5_Z5, Z6 => r5_Z6,
									Y1 => r5_Y1, Y2 => r5_Y2, Y3 => r5_Y3, Y4 => r5_Y4);
	round6: round PORT MAP (X1 => r5_Y1, X2 => r5_Y2, X3 => r5_Y3, X4 => r5_Y4, 
									Z1 => r6_Z1, Z2 => r6_Z2, Z3 => r6_Z3, Z4 => r6_Z4, Z5 => r6_Z5, Z6 => r6_Z6,
									Y1 => r6_Y1, Y2 => r6_Y2, Y3 => r6_Y3, Y4 => r6_Y4);
	round7: round PORT MAP (X1 => r6_Y1, X2 => r6_Y2, X3 => r6_Y3, X4 => r6_Y4, 
									Z1 => r7_Z1, Z2 => r7_Z2, Z3 => r7_Z3, Z4 => r7_Z4, Z5 => r7_Z5, Z6 => r7_Z6,
									Y1 => r7_Y1, Y2 => r7_Y2, Y3 => r7_Y3, Y4 => r7_Y4);
	round8: round PORT MAP (X1 => r7_Y1, X2 => r7_Y2, X3 => r7_Y3, X4 => r7_Y4, 
									Z1 => r8_Z1, Z2 => r8_Z2, Z3 => r8_Z3, Z4 => r8_Z4, Z5 => r8_Z5, Z6 => r8_Z6,
									Y1 => r8_Y1, Y2 => r8_Y2, Y3 => r8_Y3, Y4 => r8_Y4);
	out_trafo: trafo PORT MAP (X1 => r8_Y1, X2 => r8_Y2, X3 => r8_Y3, X4 => r8_Y4,
										Z1 => o_Z1, Z2 => o_Z2, Z3 => o_Z3, Z4 => o_Z4,
										Y1 => Y_1, Y2 => Y_2, Y3 => Y_3, Y4 => Y_4);

end Structural;

