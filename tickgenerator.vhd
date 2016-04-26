----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:22:13 04/26/2016 
-- Design Name: 
-- Module Name:    tickgenerator - Behavioral 
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

entity tickgenerator is
	Port(
	clk, res_n: in std_logic;
	tick: out std_logic
	);
end tickgenerator;

architecture Behavioral of tickgenerator is

begin
	zaehler: process (clk,res_n)
		variable: zaehler Integer range 0 to 49_999_999;
	begin
		if res_n='0' then
			zaehler:=0;
		else
			if clk'event and clk='1' then
				if zaehler=49_999_999 then
					zaehler:=0;
					tick<='1';
				else
					zaehler:=zaehler+1;
					tick<='0';
				end if; 
			end if;
		end if;
end Behavioral;

