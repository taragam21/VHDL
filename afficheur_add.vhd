library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity afficheur_add is
	port( 
			clk, enter, add: in std_logic;
			Sw: in std_logic_vector(7 downto 0);
			HEX0: out std_logic_vector(6 downto 0);
		   HEX1: out std_logic_vector(6 downto 0);
		   signe: out std_logic);
end afficheur_add;

architecture at of afficheur_add is
	
signal fin: std_logic_vector(7 downto 0);
signal tmp: std_logic_vector(7 downto 0);
signal new_add: std_logic;
signal new_enter: std_logic;


component afficheur1 is
	port (
		Sw: in std_logic_vector(7 downto 0);
		HEX0: out std_logic_vector(6 downto 0);
		HEX1: out std_logic_vector(6 downto 0);
		signe: out std_logic);
		
end component ;

component add_8b is
	port(
			a,b : in std_logic_vector(7 downto 0);
			s : out std_logic_vector(7 downto 0));

end component;

component pulse_input is
	port(
			pb : in std_logic;
			clk : in std_logic;
			pb_pulse : out std_logic);
end component;

begin

U1 : add_8b port map (Sw,tmp,fin);
U2: pulse_input port map (add,clk,new_add);
U3: pulse_input port map (enter,clk,new_enter);

process(clk)
begin
  if rising_edge(clk) then
	if new_enter='0' then
		tmp <= fin;
	elsif new_add='0' then
		tmp <= Sw;
	end if;
  end if;	
end process;
U4 : afficheur1 port map (tmp,HEX0,HEX1,signe);
	
end at;