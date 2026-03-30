----------------------------------------------------------------------------------
-- Key Generator Module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity keygen is
	Port( Round : IN STD_LOGIC_VECTOR(3 downto 0);
			KEY: IN STD_LOGIC_VECTOR(127 downto 0);
			Z1, Z2, Z3, Z4, Z5, Z6: OUT STD_LOGIC_VECTOR(15 downto 0));
end keygen;

architecture Behavioral of keygen is
begin
	PROCESS(Round, KEY)
	VARIABLE KEY1, KEY2, KEY3, KEY4, KEY5, KEY6, KEY7: UNSIGNED(127 downto 0);
	BEGIN
		
		KEY1 := unsigned(KEY);
		KEY2 := KEY1 rol 25;
		KEY3 := KEY2 rol 25;
		KEY4 := KEY3 rol 25;
		KEY5 := KEY4 rol 25;
		KEY6 := KEY5 rol 25;
		KEY7 := KEY6 rol 25;
		
		-- Assigning partial keys to the output
		CASE Round IS
			-- Round 1
			WHEN "0000" =>
				Z1 <= std_logic_vector(KEY1(127 downto 112));
				Z2 <= std_logic_vector(KEY1(111 downto 96));
				Z3 <= std_logic_vector(KEY1(95 downto 80));
				Z4 <= std_logic_vector(KEY1(79 downto 64));
				Z5 <= std_logic_vector(KEY1(63 downto 48));
				Z6 <= std_logic_vector(KEY1(47 downto 32));
			
			-- Round 2
			WHEN "0001" =>
				Z1 <= std_logic_vector(KEY1(31 downto 16));
				Z2 <= std_logic_vector(KEY1(15 downto 0));
				Z3 <= std_logic_vector(KEY2(127 downto 112));
				Z4 <= std_logic_vector(KEY2(111 downto 96));
				Z5 <= std_logic_vector(KEY2(95 downto 80));
				Z6 <= std_logic_vector(KEY2(79 downto 64));
			
			-- Round 3
			WHEN "0010" =>
				Z1 <= std_logic_vector(KEY2(63 downto 48));
				Z2 <= std_logic_vector(KEY2(47 downto 32));
				Z3 <= std_logic_vector(KEY2(31 downto 16));
				Z4 <= std_logic_vector(KEY2(15 downto 0));
				Z5 <= std_logic_vector(KEY3(127 downto 112));
				Z6 <= std_logic_vector(KEY3(111 downto 96));
			
			-- Round 4
			WHEN "0011" =>
				Z1 <= std_logic_vector(KEY3(95 downto 80));
				Z2 <= std_logic_vector(KEY3(79 downto 64));
				Z3 <= std_logic_vector(KEY3(63 downto 48));
				Z4 <= std_logic_vector(KEY3(47 downto 32));
				Z5 <= std_logic_vector(KEY3(31 downto 16));
				Z6 <= std_logic_vector(KEY3(15 downto 0));
			
			-- Round 5
			WHEN "0100" =>
				Z1 <= std_logic_vector(KEY4(127 downto 112));
				Z2 <= std_logic_vector(KEY4(111 downto 96));
				Z3 <= std_logic_vector(KEY4(95 downto 80));
				Z4 <= std_logic_vector(KEY4(79 downto 64));
				Z5 <= std_logic_vector(KEY4(63 downto 48));
				Z6 <= std_logic_vector(KEY4(47 downto 32));
			
			-- Round 6
			WHEN "0101" =>
				Z1 <= std_logic_vector(KEY4(31 downto 16));
				Z2 <= std_logic_vector(KEY4(15 downto 0));
				Z3 <= std_logic_vector(KEY5(127 downto 112));
				Z4 <= std_logic_vector(KEY5(111 downto 96));
				Z5 <= std_logic_vector(KEY5(95 downto 80));
				Z6 <= std_logic_vector(KEY5(79 downto 64));
			
			-- Round 7
			WHEN "0110" =>
				Z1 <= std_logic_vector(KEY5(63 downto 48));
				Z2 <= std_logic_vector(KEY5(47 downto 32));
				Z3 <= std_logic_vector(KEY5(31 downto 16));
				Z4 <= std_logic_vector(KEY5(15 downto 0));
				Z5 <= std_logic_vector(KEY6(127 downto 112));
				Z6 <= std_logic_vector(KEY6(111 downto 96));
			
			-- Round 8
			WHEN "0111" =>
				Z1 <= std_logic_vector(KEY6(95 downto 80));
				Z2 <= std_logic_vector(KEY6(79 downto 64));
				Z3 <= std_logic_vector(KEY6(63 downto 48));
				Z4 <= std_logic_vector(KEY6(47 downto 32));
				Z5 <= std_logic_vector(KEY6(31 downto 16));
				Z6 <= std_logic_vector(KEY6(15 downto 0));
			
			-- Output Trafo
			WHEN "1000" =>
				Z1 <= std_logic_vector(KEY7(127 downto 112));
				Z2 <= std_logic_vector(KEY7(111 downto 96));
				Z3 <= std_logic_vector(KEY7(95 downto 80));
				Z4 <= std_logic_vector(KEY7(79 downto 64));
			
			WHEN others =>
				Z1 <= (others => '0');
				Z2 <= (others => '0');
				Z3 <= (others => '0');
				Z4 <= (others => '0');
				Z5 <= (others => '0');
				Z6 <= (others => '0');
		END CASE;
	END PROCESS;
	


end Behavioral;

