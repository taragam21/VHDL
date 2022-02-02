library ieee;
use ieee.std_logic_1164.all;

entity afficheur is
	port( E : in std_logic_vector(3 downto 0);
			S : out std_logic_vector(6 downto 0));
end afficheur;

architecture a of afficheur is
begin
		process(E)
			begin
			case E is 
				when "0000" => S <= "1000000";
				when "0001" => S <= "1111001";
				when "0010" => S <= "0100100";
				when "0011" => S <= "0110000";
				when "0100" => S <= "0011001";
				when "0101" => S <= "0010010";
				when "0110" => S <= "0000010";
				when "0111" => S <= "1111000";
				when "1000" => S <= "0000000";
				when "1001" => S <= "0011000";
				when "1010" => S <= "0001000";
				when "1011" => S <= "0000011";
				when "1100" => S <= "1000110";
				when "1101" => S <= "0100001";
				when "1110" => S <= "0000110";
				when others => S <= "0001110";
			end case;
		end process;
end a;