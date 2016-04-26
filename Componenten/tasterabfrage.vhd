----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:15:42 04/26/2016 
-- Design Name: 
-- Module Name:    tasterabfrage - Behavioral 
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

entity tasterabfrage is
Port(
	taster: in std_logic_vector(3 downto 0);
	key: out std_logic;
	kval: out Integer range 0 to 4
	);

end tasterabfrage;

architecture Behavioral of tasterabfrage is

begin
	umsetzung: process(taster)
	begin
		case taster is
 		when B"0001" =>
			key<='1';
			kval<=1;
		when B"0010" =>
			key<='1';
			kval<=2;
		when B"0100" =>
			key<='1';
			kval<=3;
		when B"1000" =>
			key<='1';
			kval<=4;
		when others =>
			key<='0';
			kval<=0;
		end case;
	end process;
end Behavioral;

