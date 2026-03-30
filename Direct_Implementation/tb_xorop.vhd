--------------------------------------------------------------------------------
-- XOR Module Testbench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_xorop IS
END tb_xorop;
 
ARCHITECTURE behavior OF tb_xorop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT xorop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_1 : std_logic_vector(15 downto 0);
   signal I_2 : std_logic_vector(15 downto 0);

 	--Outputs
   signal O_1 : std_logic_vector(15 downto 0); 
 
   constant I_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xorop PORT MAP (
          I_1 => I_1,
          I_2 => I_2,
          O_1 => O_1
        );

   -- Stimulus process
	Test_process :process
   begin
		I_1 <= X"0000";
		I_2 <= X"0000";
		wait for I_period;
		I_1 <= X"FFFF";
		I_2 <= X"0000";
		wait for I_period;
		I_1 <= X"FFFF";
		I_2 <= X"FFFF";
		wait for I_period;
		I_1 <= X"0000";
		I_2 <= X"FFFF";
		wait for I_period;
   end process;
 
END;
