--------------------------------------------------------------------------------
-- IDEA Algorithm Module Testbench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_idea_single IS
END tb_idea_single;
 
ARCHITECTURE behavior OF tb_idea_single IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT idea_single
    PORT(
         CLOCK : IN  std_logic;
         START : IN  std_logic;
         KEY : IN  std_logic_vector(127 downto 0);
         X_1 : IN  std_logic_vector(15 downto 0);
         X_2 : IN  std_logic_vector(15 downto 0);
         X_3 : IN  std_logic_vector(15 downto 0);
         X_4 : IN  std_logic_vector(15 downto 0);
         Y_1 : OUT  std_logic_vector(15 downto 0);
         Y_2 : OUT  std_logic_vector(15 downto 0);
         Y_3 : OUT  std_logic_vector(15 downto 0);
         Y_4 : OUT  std_logic_vector(15 downto 0);
         READY : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal START : std_logic := '0';
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
   signal READY : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: idea_single PORT MAP (
          CLOCK => CLOCK,
          START => START,
          KEY => KEY,
          X_1 => X_1,
          X_2 => X_2,
          X_3 => X_3,
          X_4 => X_4,
          Y_1 => Y_1,
          Y_2 => Y_2,
          Y_3 => Y_3,
          Y_4 => Y_4,
          READY => READY
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		START <= '0';
		
		
      -- All zeros
		X_1 <= X"0000";
		X_2 <= X"0000";
		X_3 <= X"0000";
		X_4 <= X"0000";
		KEY <= X"00000000000000000000000000000000";
		 
		wait for CLOCK_period;
		START <= '1';
		wait for CLOCK_period;
		START <= '0';
		wait for 15 * CLOCK_period;
		 
		 -- Simple increasing key
		 X_1 <= X"1111";
       X_2 <= X"2222";
       X_3 <= X"4444";
       X_4 <= X"8888";
       KEY <= X"00010002000300040005000600070008";
		  
		 wait for CLOCK_period;
		 START <= '1';
		 wait for CLOCK_period;
		 START <= '0';
		 wait for 15 * CLOCK_period;
		  
		  -- All ones
		  X_1 <= X"FFFF";
        X_2 <= X"FFFF";
        X_3 <= X"FFFF";
        X_4 <= X"FFFF";
        KEY <= X"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";

        wait for CLOCK_period;
		  START <= '1';
		  wait for CLOCK_period;
		  START <= '0';
		  wait for 15 * CLOCK_period;
		  
		  -- Alternating sequences
		  X_1 <= X"FFFF";
        X_2 <= X"0000";
        X_3 <= X"FFFF";
        X_4 <= X"0000";
        KEY <= X"FFFF0000FFFF0000FFFF0000FFFF0000";

        wait for CLOCK_period;
		  START <= '1';
		  wait for CLOCK_period;
		  START <= '0';
		  wait for 15 * CLOCK_period;
		  
		  X_1 <= X"FF00";
        X_2 <= X"FF00";
        X_3 <= X"FF00";
        X_4 <= X"FF00";
        KEY <= X"FF00FF00FF00FF00FF00FF00FF00FF00";

        wait for CLOCK_period;
		  START <= '1';
		  wait for CLOCK_period;
		  START <= '0';
		  wait for 15 * CLOCK_period;
		  
		  -- High Bit in Key
		  X_1 <= X"0000";
        X_2 <= X"0000";
        X_3 <= X"0000";
        X_4 <= X"0000";
        KEY <= X"80000000000000000000000000000000";

        wait for CLOCK_period;
		  START <= '1';
		  wait for CLOCK_period;
		  START <= '0';
		  wait for 15 * CLOCK_period;
		  
		  -- Low Bit in Key
		  X_1 <= X"FFFF";
        X_2 <= X"FFFF";
        X_3 <= X"FFFF";
        X_4 <= X"FFFF";
        KEY <= X"00000000000000000000000000000001";

        wait for CLOCK_period;
		  START <= '1';
		  wait for CLOCK_period;
		  START <= '0';
		  wait for 15 * CLOCK_period;
		  
		  --Random
		  X_1 <= X"0000";
        X_2 <= X"0000";
        X_3 <= X"0000";
        X_4 <= X"0001";
        KEY <= X"A56BABCD1234567890ABCDEF11112222";

        wait for CLOCK_period;
		  START <= '1';
		  wait for CLOCK_period;
		  START <= '0';
		  wait for 15 * CLOCK_period;

   end process;

END;
