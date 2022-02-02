library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
	port( 
			sw : in std_logic_vector(7 downto 0);
			clk: in std_logic;
			x: out std_logic_vector(7 downto 0));
end reg;

architecture ac of reg is
begin
		process(clk)
		begin
			if rising_edge(clk) then
				x <= sw ;
			end if;
		end process;
end ac;		