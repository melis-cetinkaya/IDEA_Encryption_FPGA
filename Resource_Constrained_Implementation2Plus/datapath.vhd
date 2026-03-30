----------------------------------------------------------------------------------
-- Data Path of Round Control Module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath is
	PORT ( X1, X2, X3, X4 : IN STD_LOGIC_VECTOR(15 downto 0);
			 Z1, Z2, Z3, Z4, Z5, Z6 : IN STD_LOGIC_VECTOR(15 downto 0);
			 EN125, EN346, EN78: IN STD_LOGIC;
			 CLK: IN STD_LOGIC;
			 S, S_T: IN STD_LOGIC_VECTOR(1 downto 0);
			 Y1, Y2, Y3, Y4: OUT STD_LOGIC_VECTOR(15 downto 0);
			 Y1_TRAFO, Y2_TRAFO, Y3_TRAFO, Y4_TRAFO: OUT STD_LOGIC_VECTOR(15 downto 0));
end datapath;

architecture Behavioral of datapath is

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
	
	COMPONENT mux4x1
		Port ( D0, D1, D2, D3 : IN STD_LOGIC_VECTOR(15 downto 0);
			 S: IN STD_LOGIC_VECTOR(1 downto 0);
			 O: OUT STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	
	COMPONENT reg16
		Port ( D : IN STD_LOGIC_VECTOR(15 downto 0);
				 clk, en: IN STD_LOGIC;
				 Q: OUT STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	
	-- Signal Declerations
	SIGNAL tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6 : STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL O1, O2, O3, O4, O5, O6, O7, O8 : STD_LOGIC_VECTOR(15 downto 0);

begin
	
	mux0: mux4x1 PORT MAP( D0 => X1, D1 => X4, D2 => Z5, D3 => Z6, S => S, O => tmp0);
	mux1: mux4x1 PORT MAP( D0 => Z1, D1 => Z4, D2 => O5, D3 => O8, S => S, O => tmp1);
	mux2: mux4x1 PORT MAP( D0 => X3, D1 => X2, D2 => O6, D3 => O7, S => S, O => tmp3);
	mux3: mux4x1 PORT MAP( D0 => Z3, D1 => Z2, D2 => tmp2, D3 => tmp2, S => S_T, O => tmp4);
	mulop0: mulop PORT MAP( I_1 => tmp0, I_2 => tmp1, O_1 => tmp2);
	addop0: addop PORT MAP( I_1 => tmp3, I_2 => tmp4, O_1 => tmp5);
	xor0: xorop PORT MAP( I_1 => tmp2, I_2 => tmp5, O_1 => tmp6);
	xor1: xorop PORT MAP( I_1 => tmp5, I_2 => O3, O_1 => Y3);
	xor2: xorop PORT MAP( I_1 => tmp2, I_2 => O2, O_1 => Y2);
	xor3: xorop PORT MAP( I_1 => tmp5, I_2 => O4, O_1 => Y4);
	xor4: xorop PORT MAP( I_1 => tmp2, I_2 => O1, O_1 => Y1);
	reg1: reg16 PORT MAP( D => tmp2, clk => CLK, en => EN125, Q => O1);
	reg2: reg16 PORT MAP( D => tmp5, clk => CLK, en => EN125, Q => O2);
	reg3: reg16 PORT MAP( D => tmp5, clk => CLK, en => EN346, Q => O3);
	reg4: reg16 PORT MAP( D => tmp2, clk => CLK, en => EN346, Q => O4);
	reg5: reg16 PORT MAP( D => tmp6, clk => CLK, en => EN125, Q => O5);
	reg6: reg16 PORT MAP( D => tmp6, clk => CLK, en => EN346, Q => O6);
	reg7: reg16 PORT MAP( D => tmp2, clk => CLK, en => EN78, Q => O7);
	reg8: reg16 PORT MAP( D => tmp5, clk => CLK, en => EN78, Q => O8);
	
	Y1_TRAFO <= O1;
	Y2_TRAFO <= O2;
	Y3_TRAFO <= O3;
	Y4_TRAFO <= O4;
end Behavioral;

