--------------------------------------------------------------------------------
-- IDEA Encryption Module Testbench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
 
ENTITY tb_idea IS
END tb_idea;
 
ARCHITECTURE behavior OF tb_idea IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT idea
    PORT(
         KEY : IN  std_logic_vector(127 downto 0);
         X_1 : IN  std_logic_vector(15 downto 0);
         X_2 : IN  std_logic_vector(15 downto 0);
         X_3 : IN  std_logic_vector(15 downto 0);
         X_4 : IN  std_logic_vector(15 downto 0);
         Y_1 : OUT  std_logic_vector(15 downto 0);
         Y_2 : OUT  std_logic_vector(15 downto 0);
         Y_3 : OUT  std_logic_vector(15 downto 0);
         Y_4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal KEY : std_logic_vector(127 downto 0) := (others => '0');
   signal X_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_4 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y_1 : std_logic_vector(15 downto 0);
   signal Y_2 : std_logic_vector(15 downto 0);
   signal Y_3 : std_logic_vector(15 downto 0);
   signal Y_4 : std_logic_vector(15 downto 0); 
 
   constant clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: idea PORT MAP (
          KEY => KEY,
          X_1 => X_1,
          X_2 => X_2,
          X_3 => X_3,
          X_4 => X_4,
          Y_1 => Y_1,
          Y_2 => Y_2,
          Y_3 => Y_3,
          Y_4 => Y_4
        );


   -- Stimulus process
   stim_proc: process
   begin		
		X_1 <= X"0000";
		X_2 <= X"0000";
		X_3 <= X"0000";
		X_4 <= X"0000";
		KEY <= X"00000000000000000000000000000000";
		wait for clock_period;
		X_1 <= X"1111";
		X_2 <= X"2222";
		X_3 <= X"4444";
		X_4 <= X"8888";
		KEY <= X"00010002000300040005000600070008";
		wait for clock_period;
		X_1 <= X"FFFF";
		X_2 <= X"FFFF";
		X_3 <= X"FFFF";
		X_4 <= X"FFFF";
		KEY <= X"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
		wait for clock_period;
		X_1 <= X"FFFF";
		X_2 <= X"0000";
		X_3 <= X"FFFF";
		X_4 <= X"0000";
		KEY <= X"FFFF0000FFFF0000FFFF0000FFFF0000";
		wait for clock_period;
		X_1 <= X"FF00";
		X_2 <= X"FF00";
		X_3 <= X"FF00";
		X_4 <= X"FF00";
		KEY <= X"FF00FF00FF00FF00FF00FF00FF00FF00";
		wait for clock_period;
		X_1 <= X"0000";
		X_2 <= X"0000";
		X_3 <= X"0000";
		X_4 <= X"0000";
		KEY <= X"80000000000000000000000000000000";
		wait for clock_period;
		X_1 <= X"FFFF";
		X_2 <= X"FFFF";
		X_3 <= X"FFFF";
		X_4 <= X"FFFF";
		KEY <= X"00000000000000000000000000000001";
		wait for clock_period;
		X_1 <= X"0000";
		X_2 <= X"0000";
		X_3 <= X"0000";
		X_4 <= X"0001";
		KEY <= X"A56BABCD1234567890ABCDEF11112222";
		wait for clock_period;
   end process;

END;
