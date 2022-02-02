library ieee;
use ieee.std_logic_1164.all;

entity pulse_input is
	port(
			pb : in std_logic;
			clk : in std_logic;
			pb_pulse : out std_logic);
end pulse_input;

architecture p of pulse_input is 
signal x: std_logic_vector(1 downto 0);
begin 
	process(clk)
	begin
		if rising_edge(clk) then
			if x ="00" then
				if pb='0' then 
					x <= "01";
				else 
					x <= "00";
				end if;
			elsif x ="01" then
				if pb='0' then 
					x <= "10";
				else
					x <= "00";
				end if;
			elsif x ="10" then
				if pb='0' then 
					x <= "10";
				else
					x <= "00";
				end if;	
			end if;
		end if;	
	end process;
	pb_pulse <= x(0);
end p;