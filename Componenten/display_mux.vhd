----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:52:51 04/25/2016 
-- Design Name: 
-- Module Name:    display_mux - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display_mux is
Port(
	seg1, seg2, seg3, seg4: in std_logic_vector(6 downto 0) := B"1111110";
	clk, res_n: in std_logic;
	an: out std_logic_vector(3 downto 0);
	seg: out std_logic_vector(6 downto 0)
	);
end display_mux;

architecture Behavioral of display_mux is
	subtype disptype is Integer range 0 to 3;
	subtype rangetype is Integer range 0 to 100000;
	signal disp: disptype;
begin
	zaehler: process(clk, res_n)
		variable zaehlerstand: rangetype;
		variable dispbuffer : disptype;
	begin	
		if res_n='0' then
			zaehlerstand:=0;
		else
			if clk='1' and clk'event then
				if zaehlerstand = (rangetype'high) then
					zaehlerstand:=rangetype'low;
					if dispbuffer=disptype'high then
						dispbuffer:=disptype'low;
					else
						dispbuffer:=dispbuffer+1;
					end if;
				else
					zaehlerstand:= zaehlerstand+1;
				end if;
			end if;
		end if;
		disp<=dispbuffer;
	end process;

	mux: process(disp, seg1 , seg2, seg3, seg4)
	begin
		case disp is
			when 0 =>
				seg<=seg1;
				an <=B"0001";
			when 1 => 
				seg<=seg1;
				an <=B"0010";
			when 2 => 
				seg<=seg2;
				an <=B"0100";
			when 3 => 
				seg<=seg3;
				an <=B"1000";
		end case;
	end process;

end Behavioral;

