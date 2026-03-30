----------------------------------------------------------------------------------
-- XOR Module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xorop is
	Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
          I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
          O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
end xorop;

architecture Behavioral of xorop is
begin

	-- Describe XOR Module in context of process
	PROCESS(I_1, I_2)
	BEGIN
		O_1 <= I_1 XOR I_2;
	END PROCESS;

end Behavioral;

