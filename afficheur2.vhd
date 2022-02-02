library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity afficheur2 is
	port( 
			clk: in std_logic;
			Sw: in std_logic_vector(7 downto 0);
			HEX0: out std_logic_vector(6 downto 0);
			HEX1: out std_logic_vector(6 downto 0);
			signe: out std_logic);
end afficheur2;

architecture a of afficheur2 is
	
signal Sout: std_logic_vector(7 downto 0);
signal R: std_logic_vector(7 downto 0);

component afficheur is 
port( 
	E: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(6 downto 0));
end component;

component reg is
	port( 
			sw :in std_logic_vector(7 downto 0);
			clk: in std_logic;
			x: out std_logic_vector(7 downto 0));
end component;

begin

U3: reg port map (Sw,clk,Sout);
process(Sout)

begin
	if(Sout(7)='0') then
		signe <= '1';
		R<=Sout;
	else 
		signe <= '0';
		R<= std_logic_vector( (unsigned(Sout) xor "11111111") + "00000001");
	end if;
end process;

U1: afficheur port map (R(3 downto 0), HEX0);
U2: afficheur port map (R(7 downto 4), HEX1);
	
end a;
			