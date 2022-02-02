library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add_8b is 
	port(
			a,b : in std_logic_vector(7 downto 0);
			s : out std_logic_vector(7 downto 0));

end add_8b;

architecture a of add_8b is
signal cin : std_logic;
signal ret: std_logic;
begin
	process(a,b,cin)
		begin
			cin <= '0';
			s(0) <= (a(0) xor b(0)) xor cin;
			ret <= (a(0) and b(0)) or (b(0) and '0') or (a(0) and '0');
			
			cin <= ret ;
			s(1) <= (a(1) xor b(1)) xor cin;
			ret <= (a(1) and b(1)) or (b(1) and cin) or (a(1) and cin);
			
			cin <= ret ;
			s(2) <= (a(2) xor b(2)) xor cin;
			ret <= (a(2) and b(2)) or (b(2) and cin) or (a(2) and cin);
			
			cin <= ret ;
			s(3) <= (a(3) xor b(3)) xor cin;
			ret <= (a(3) and b(3)) or (b(3) and cin) or (a(3) and cin);
			
			cin <= ret ;
			s(4) <= (a(4) xor b(4)) xor cin;
			ret <= (a(4) and b(4)) or (b(4) and cin) or (a(4) and cin);
			
			cin <= ret ;
			s(5) <= (a(5) xor b(5)) xor cin;
			ret <= (a(5) and b(5)) or (b(5) and cin) or (a(5) and cin);
			
			cin <= ret ;
			s(6) <= (a(6) xor b(6)) xor cin;
			ret <= (a(6) and b(6)) or (b(6) and cin) or (a(6) and cin);
			
			cin <= ret ;
			s(7) <= (a(7) xor b(7)) xor cin;
			
			
	end process;
end a;