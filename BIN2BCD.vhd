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
use mytypes.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BIN2BCD is
Port(
	value_in: in zaehlerstand;
	stelle2, stelle1: out bcd_ziffer
);
end BIN2BCD;

architecture Behavioral of BIN2BCD is

begin
	process(value_in)
		subtype zehnertype is Integer range 0 to zaehlerstand'high-bcd_ziffer'high;
		variable zehner: zehnertype;
		variable zehnerbuffer: bcd_ziffer;
		variable einser: bcd_ziffer;
	begin
		
		
		zehnerbuffer:= 0;
		if value_in >=10  then
			for n in 0 to 6 loop
				if value<=n*10 then
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

