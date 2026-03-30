----------------------------------------------------------------------------------
-- IDEA Algorithm Inner Module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity idea_rcs2 is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0);
           READY : out  STD_LOGIC);
end idea_rcs2;

architecture Structural of idea_rcs2 is

	-- Component Declerations
	COMPONENT keygen
	Port( Round : IN STD_LOGIC_VECTOR(3 downto 0);
			KEY: IN STD_LOGIC_VECTOR(127 downto 0);
			Z1, Z2, Z3, Z4, Z5, Z6: OUT STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	
	COMPONENT clockedround 
    Port ( CLK : in  STD_LOGIC;
           INIT : in  STD_LOGIC;
           TRAFO : in STD_LOGIC;
           X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
           RESULT : out STD_LOGIC;
           Y1_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	
	COMPONENT roundcounter
		Port ( CLK : in  STD_LOGIC;
				  START : in  STD_LOGIC;
				  RESULT : in  STD_LOGIC;
				  READY : out  STD_LOGIC;
				  S_i : out  STD_LOGIC;
				  INIT : out  STD_LOGIC;
				  TRAFO : out  STD_LOGIC;
				  ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
	END COMPONENT;
	
	COMPONENT mux2x1
		Port ( D0, D1 : IN STD_LOGIC_VECTOR(15 downto 0);
		 S: IN STD_LOGIC;
		 O: OUT STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	
	COMPONENT reg16
		Port ( D : IN STD_LOGIC_VECTOR(15 downto 0);
			 clk, en: IN STD_LOGIC;
			 Q: OUT STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	
	-- Signal declerations
	SIGNAL Y1_int, Y2_int, Y3_int, Y4_int: STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL O1, O2, O3, O4: STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL X1_int, X2_int, X3_int, X4_int: STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL Z1_int, Z2_int, Z3_int, Z4_int, Z5_int, Z6_int: STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL Si, RESULT_int, INIT_int, TRAFO_int: STD_LOGIC;
	SIGNAL Round_int: STD_LOGIC_VECTOR(3 downto 0);

begin
	
	reg1: reg16 PORT MAP( D => Y1_int, clk => CLOCK, en => RESULT_int, Q => O1);
	reg2: reg16 PORT MAP( D => Y2_int, clk => CLOCK, en => RESULT_int, Q => O2);
	reg3: reg16 PORT MAP( D => Y3_int, clk => CLOCK, en => RESULT_int, Q => O3);
	reg4: reg16 PORT MAP( D => Y4_int, clk => CLOCK, en => RESULT_int, Q => O4);
	
	mux1: mux2x1 PORT MAP( D0 => O1, D1 => X_1, S => Si, O => X1_int);
	mux2: mux2x1 PORT MAP( D0 => O2, D1 => X_2, S => Si, O => X2_int);
	mux3: mux2x1 PORT MAP( D0 => O3, D1 => X_3, S => Si, O => X3_int);
	mux4: mux2x1 PORT MAP( D0 => O4, D1 => X_4, S => Si, O => X4_int);
	
	key_generator: keygen PORT MAP( Round => Round_int, KEY => KEY,
											 Z1 => Z1_int, Z2 => Z2_int, Z3 => Z3_int,
											 Z4 => Z4_int, Z5 => Z5_int, Z6 => Z6_int);
	
	clocked_round: clockedround PORT MAP( CLK => CLOCK, INIT => INIT_int,
													TRAFO => TRAFO_int, RESULT => RESULT_int,
													X1 => X1_int, X2 => X2_int, X3 => X3_int, X4 => X4_int,
													Z1 => Z1_int, Z2 => Z2_int, Z3 => Z3_int, Z4 => Z4_int, Z5 => Z5_int, Z6 => Z6_int,
													Y1 => Y1_int, Y2 => Y2_int, Y3 => Y3_int, Y4 => Y4_int,
													Y1_TRAFO => Y_1, Y2_TRAFO => Y_2, Y3_TRAFO => Y_3, Y4_TRAFO => Y_4);
	
	round_counter: roundcounter PORT MAP( CLK => CLOCK, START => START, 
													RESULT => RESULT_int, READY => READY,
													S_i => Si, INIT => INIT_int, TRAFO => TRAFO_int,
													ROUND => Round_int);
	
end Structural;

