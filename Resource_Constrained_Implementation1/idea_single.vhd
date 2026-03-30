----------------------------------------------------------------------------------
-- IDEA Algorithm Module 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity idea_single is
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
end idea_single;

architecture Structural of idea_single is
	
	-- Component Declerations
	COMPONENT keygen
		PORT(Round : IN  std_logic_vector(3 downto 0);
           KEY : IN  std_logic_vector(127 downto 0);
           Z1, Z2, Z3, Z4, Z5, Z6 : OUT  std_logic_vector(15 downto 0));
	END COMPONENT;
	
	COMPONENT mux2x1 is
    Port (D0, D1 : IN STD_LOGIC_VECTOR(15 downto 0);
			 S: IN STD_LOGIC;
			 O: OUT STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	
	COMPONENT control
    PORT(CLK : IN  std_logic;
         START : IN  std_logic;
         ROUND : OUT  std_logic_vector(3 downto 0);
         READY : OUT  std_logic;
         EN : OUT  std_logic;
         S : OUT  std_logic);
   END COMPONENT;
	
	COMPONENT reg16
    PORT(D : IN  std_logic_vector(15 downto 0);
         clk, en : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0));
    END COMPONENT;
	 
	 COMPONENT round
    Port( X1, X2, X3, X4 : in STD_LOGIC_VECTOR (15 downto 0);
			Z1, Z2, Z3, Z4, Z5, Z6 : in STD_LOGIC_VECTOR (15 downto 0);
			Y1, Y2, Y3, Y4 : out STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
	 
	 COMPONENT trafo
    Port( X1, X2, X3, X4 : in STD_LOGIC_VECTOR (15 downto 0);
			Z1, Z2, Z3, Z4 : in STD_LOGIC_VECTOR (15 downto 0);
			Y1, Y2, Y3, Y4 : out STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
	 
	 -- Signal Declerations
	 SIGNAL c_EN, c_S : STD_LOGIC;
	 SIGNAL c_ROUND : STD_LOGIC_VECTOR(3 downto 0);
	 SIGNAL r_X1, r_X2, r_X3, r_X4: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL Z_1, Z_2, Z_3, Z_4, Z_5, Z_6: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL D_1, D_2, D_3, D_4: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL Q_1, Q_2, Q_3, Q_4: STD_LOGIC_VECTOR(15 downto 0);

begin
	
	-- Structural Connections
	control1: control PORT MAP(CLK => CLOCK, START => START, ROUND => c_ROUND, READY => READY, EN => c_EN, S => c_S);
	keyggen1: keygen PORT MAP(Round => c_ROUND, KEY => KEY, Z1 => Z_1, Z2 => Z_2, Z3 => Z_3, Z4 => Z_4, Z5 => Z_5, Z6 => Z_6);
	mux1: mux2x1 PORT MAP(D0 => X_1, D1 => Q_1, S => c_S, O => r_X1);
	mux2: mux2x1 PORT MAP(D0 => X_2, D1 => Q_2, S => c_S, O => r_X2);
	mux3: mux2x1 PORT MAP(D0 => X_3, D1 => Q_3, S => c_S, O => r_X3);
	mux4: mux2x1 PORT MAP(D0 => X_4, D1 => Q_4, S => c_S, O => r_X4);
	round1: round PORT MAP(X1 => r_X1, X2 => r_X2, X3 => r_X3, X4 => r_X4, Z1 => Z_1, Z2 => Z_2, Z3 => Z_3, Z4 => Z_4, Z5 => Z_5, Z6 => Z_6, Y1 => D_1, Y2 => D_2, Y3 => D_3, Y4 => D_4);
	reg1: reg16 PORT MAP(D => D_1, clk => CLOCK, en => c_EN, Q => Q_1);
	reg2: reg16 PORT MAP(D => D_2, clk => CLOCK, en => c_EN, Q => Q_2);
	reg3: reg16 PORT MAP(D => D_3, clk => CLOCK, en => c_EN, Q => Q_3);
	reg4: reg16 PORT MAP(D => D_4, clk => CLOCK, en => c_EN, Q => Q_4);
	outtrafo: trafo PORT MAP(X1 => Q_1, X2 => Q_2, X3 => Q_3, X4 => Q_4, Z1 => Z_1, Z2 => Z_2, Z3 => Z_3, Z4 => Z_4, Y1 => Y_1, Y2 => Y_2, Y3 => Y_3, Y4 => Y_4);

end Structural;

