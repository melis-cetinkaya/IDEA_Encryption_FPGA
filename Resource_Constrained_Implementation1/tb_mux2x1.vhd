--------------------------------------------------------------------------------
-- 2-to-1 Multiplexer Testbench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_mux2x1 IS
END tb_mux2x1;
 
ARCHITECTURE behavior OF tb_mux2x1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2x1
    PORT(
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         S : IN  std_logic;
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D0 : std_logic_vector(15 downto 0) := (others => '0');
   signal D1 : std_logic_vector(15 downto 0) := (others => '0');
   signal S : std_logic;

 	--Outputs
   signal O : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2x1 PORT MAP (
          D0 => D0,
          D1 => D1,
          S => S,
          O => O
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
		D0 <= X"AAAA";
		D1 <= X"BBBB";
		wait for 20 ns;
		
		S <= '0';
		wait for 20 ns;
		
		S <= '1';
		wait for 20 ns;
		
		D0 <= X"ABAB";
		D1 <= X"CCCC";
		wait for 20 ns;
		
		S <= '0';
		wait for 10 ns;
		
		D0 <= X"0000";
		D1 <= X"1111";
		wait for 20 ns;

   end process;

END;
