----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:01 04/12/2016 
-- Design Name: 
-- Module Name:    vergleicher - Behavioral 
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

entity gleich is
    Port ( value1 : in  Integer range 0 to 63;
           value2 : in  Integer range 0 to 63;
           equal : out  STD_LOGIC);
end gleich;

architecture Behavioral of gleich is

begin
	vergleicher: process (value1, value2) is
	begin
		if value1=value2 then 
			equal <= '1';
		else 
			equal <= '0';
		end if;
	end process;
end Behavioral;

