--------------------------------------------------------------------------------
-- Adder Module Testbench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_addop IS
END tb_addop;
 
ARCHITECTURE behavior OF tb_addop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT addop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal I_2 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal O_1 : std_logic_vector(15 downto 0);
 
   constant I_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addop PORT MAP (
          I_1 => I_1,
          I_2 => I_2,
          O_1 => O_1
        );

   -- Stimulus process
	-- Ideas of different Overflow scenarios are AI genereted
   stim_proc: process
   begin
		I_1 <= X"0001";
		I_2 <= X"0001";
		wait for 2 * I_period;
		I_1 <= X"0010";
		I_2 <= X"0005";
		wait for 2 * I_period;
		I_1 <= X"FFFF";
		I_2 <= X"0001";
		wait for 2 * I_period;
		I_1 <= X"8000";
		I_2 <= X"8000";
		wait for 2 * I_period;
		I_1 <= X"FFFF";
		I_2 <= X"FFFF";
		wait for 2 * I_period;
		I_1 <= X"7FFF";
		I_2 <= X"0001";
		wait for 2 * I_period;
   end process;

END;
