--------------------------------------------------------------------------------
-- Output Transformation Module Testbench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
 
ENTITY tb_trafo IS
END tb_trafo;
 
ARCHITECTURE behavior OF tb_trafo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trafo
    PORT(
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Z1 : IN  std_logic_vector(15 downto 0);
         Z2 : IN  std_logic_vector(15 downto 0);
         Z3 : IN  std_logic_vector(15 downto 0);
         Z4 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X4 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z1 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z2 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z3 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z4 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y1 : std_logic_vector(15 downto 0);
   signal Y2 : std_logic_vector(15 downto 0);
   signal Y3 : std_logic_vector(15 downto 0);
   signal Y4 : std_logic_vector(15 downto 0);

 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trafo PORT MAP (
          X1 => X1,
          X2 => X2,
          X3 => X3,
          X4 => X4,
          Z1 => Z1,
          Z2 => Z2,
          Z3 => Z3,
          Z4 => Z4,
          Y1 => Y1,
          Y2 => Y2,
          Y3 => Y3,
          Y4 => Y4
        );



   -- Stimulus process
   stim_proc: process
   begin		
     X1 <= X"0000";
		X2 <= X"0000";
		X3 <= X"0000";
		X4 <= X"0000";
		Z1 <= X"0000";
		Z2 <= X"0000";
		Z3 <= X"0000";
		Z4 <= X"0000";
		wait for clock_period;
		X1 <= X"FFFF";
		X2 <= X"0000";
		X3 <= X"0000";
		X4 <= X"0000";
		Z1 <= X"0000";
		Z2 <= X"0000";
		Z3 <= X"0000";
		Z4 <= X"0000";
		wait for clock_period;
		X1 <= X"FFFF";
		X2 <= X"AAAA";
		X3 <= X"0000";
		X4 <= X"0000";
		Z1 <= X"0000";
		Z2 <= X"0000";
		Z3 <= X"0000";
		Z4 <= X"0000";
		wait for clock_period;
		X1 <= X"FFFF";
		X2 <= X"AAAA";
		X3 <= X"5555";
		X4 <= X"0000";
		Z1 <= X"0000";
		Z2 <= X"0000";
		Z3 <= X"0000";
		Z4 <= X"0000";
		wait for clock_period;
		X1 <= X"FFFF";
		X2 <= X"AAAA";
		X3 <= X"5555";
		X4 <= X"2492";
		Z1 <= X"0000";
		Z2 <= X"0000";
		Z3 <= X"0000";
		Z4 <= X"0000";
		wait for clock_period;
		X1 <= X"FFFF";
		X2 <= X"AAAA";
		X3 <= X"5555";
		X4 <= X"2492";
		Z1 <= X"DB6D";
		Z2 <= X"0000";
		Z3 <= X"0000";
		Z4 <= X"0000";
		wait for clock_period;
		X1 <= X"FFFF";
		X2 <= X"AAAA";
		X3 <= X"5555";
		X4 <= X"2492";
		Z1 <= X"DB6D";
		Z2 <= X"1C71";
		Z3 <= X"0000";
		Z4 <= X"0000";
		wait for clock_period;
		X1 <= X"FFFF";
		X2 <= X"AAAA";
		X3 <= X"5555";
		X4 <= X"2492";
		Z1 <= X"DB6D";
		Z2 <= X"1C71";
		Z3 <= X"CCCC";
		Z4 <= X"0000";
		wait for clock_period;
		X1 <= X"FFFF";
		X2 <= X"AAAA";
		X3 <= X"5555";
		X4 <= X"2492";
		Z1 <= X"DB6D";
		Z2 <= X"1C71";
		Z3 <= X"CCCC";
		Z4 <= X"0002";
		wait for clock_period;
		X1 <= X"FFFF";
		X2 <= X"AAAA";
		X3 <= X"5555";
		X4 <= X"2492";
		Z1 <= X"DB6D";
		Z2 <= X"1C71";
		Z3 <= X"CCCC";
		Z4 <= X"0002";
   end process;

END;
