--------------------------------------------------------------------------------
-- 16-Bit Wide Register Testbench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_reg16 IS
END tb_reg16;
 
ARCHITECTURE behavior OF tb_reg16 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg16
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         en : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal en : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg16 PORT MAP (
          D => D,
          clk => clk,
          en => en,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
	
      en <= '0';
		D <= X"0000";
		wait for 5 * clk_period;
		
		en <= '1';
		D <= X"1234";
		wait for clk_period;
		
		D <= X"BBBB";
		wait for clk_period;
		
		en <= '0';
		D <= X"AAAA";
      wait for 2 * clk_period;
		
		en <= '1';
		wait for clk_period;
		
		D <= X"FACE";
		wait for clk_period;
   end process;

END;
