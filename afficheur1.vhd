library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity afficheur1 is
	port( 
			Sw: in std_logic_vector(7 downto 0);
			HEX0: out std_logic_vector(6 downto 0);
			HEX1: out std_logic_vector(6 downto 0);
			signe: out std_logic);
end afficheur1;

architecture a of afficheur1 is
	
signal Sout: std_logic_vector(7 downto 0);

component afficheur is 
port( 
	E: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(6 downto 0));
end component;

begin
process(Sw)
begin
	if(Sw(7)='0') then
		signe <= '1';
		Sout <= Sw;
	else 
		signe <= '0';
		Sout <= std_logic_vector( (unsigned(Sw) xor "11111111") + "00000001");
	end if;
end process;

U1: afficheur port map (Sout(3 downto 0), HEX0);
U2: afficheur port map (Sout(7 downto 4), HEX1);
	
end a;
			