----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:10 04/25/2016 
-- Design Name: 
-- Module Name:    BIN2BCD - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BIN2BCD is
Port(
	value_in: in Integer range 0 to 63;
	stelle2, stelle1: out Integer range 0 to 9
);
end BIN2BCD;

architecture Behavioral of BIN2BCD is

begin
	process(value_in)
		variable zehnerbuffer: Integer range 0 to 9;
		variable einser: Integer range 0 to 9;
	begin
		zehnerbuffer:= 0;
		if value_in >=10  then
			for n in 1 to 6 loop
				if value_in>=n*10 then
					zehnerbuffer:=n;
				else 
					zehnerbuffer:=zehnerbuffer;
				end if;
			end loop;
		else
			zehnerbuffer:=0;
		end if;
		stelle2<=zehnerbuffer;

		stelle1<=value_in-(zehnerbuffer*10);
	end process;
end Behavioral;

