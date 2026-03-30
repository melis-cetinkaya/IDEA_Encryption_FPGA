--------------------------------------------------------------------------------
-- Key Generator Module Testbench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_keygen IS
END tb_keygen;
 
ARCHITECTURE behavior OF tb_keygen IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keygen
    PORT(
         Round : IN  std_logic_vector(3 downto 0);
         KEY : IN  std_logic_vector(127 downto 0);
         Z1 : OUT  std_logic_vector(15 downto 0);
         Z2 : OUT  std_logic_vector(15 downto 0);
         Z3 : OUT  std_logic_vector(15 downto 0);
         Z4 : OUT  std_logic_vector(15 downto 0);
         Z5 : OUT  std_logic_vector(15 downto 0);
         Z6 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Round : std_logic_vector(3 downto 0) := (others => '0');
   signal KEY : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal Z1 : std_logic_vector(15 downto 0);
   signal Z2 : std_logic_vector(15 downto 0);
   signal Z3 : std_logic_vector(15 downto 0);
   signal Z4 : std_logic_vector(15 downto 0);
   signal Z5 : std_logic_vector(15 downto 0);
   signal Z6 : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keygen PORT MAP (
          Round => Round,
          KEY => KEY,
          Z1 => Z1,
          Z2 => Z2,
          Z3 => Z3,
          Z4 => Z4,
          Z5 => Z5,
          Z6 => Z6
        );

 

   -- Stimulus process
	-- Loop structure for round stimulus is AI suggested
   stim_proc: process
   begin		
      KEY <= X"00000000000000000000000000000000";
		for r in 0 to 8 loop
         Round <= std_logic_vector(to_unsigned(r, 4));
         wait for 20 ns;
      end loop;
		
		KEY <= X"00010002000300040005000600070008";
		for r in 0 to 8 loop
         Round <= std_logic_vector(to_unsigned(r, 4));
         wait for 20 ns;
      end loop;
		
		KEY <= X"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
		for r in 0 to 8 loop
         Round <= std_logic_vector(to_unsigned(r, 4));
         wait for 20 ns;
      end loop;
		
		KEY <= X"80000000000000000000000000000000";
		for r in 0 to 8 loop
         Round <= std_logic_vector(to_unsigned(r, 4));
         wait for 20 ns;
      end loop;
		
		KEY <= X"00000000000000000000000000000001";
		for r in 0 to 8 loop
         Round <= std_logic_vector(to_unsigned(r, 4));
         wait for 20 ns;
      end loop;
		
		KEY <= X"A56BABCD1234567890ABCDEF11112222";
		for r in 0 to 8 loop
         Round <= std_logic_vector(to_unsigned(r, 4));
         wait for 20 ns;
      end loop;
		
   end process;

END;
