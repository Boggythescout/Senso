----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:12:18 04/12/2016 
-- Design Name: 
-- Module Name:    teilcounter - Behavioral 
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
use work.all;
use mytypes.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity teilcounter is
    Port ( clk : in  STD_LOGIC;
           res_n : in  STD_LOGIC;
           res_score : in  STD_LOGIC;
           inc_score : in  STD_LOGIC;
           value : out  zaehlerstand);
end teilcounter;

architecture Behavioral of teilcounter is

begin
	zaehler: process(clk, res_n) is
		type lilint is range 0 to 63;
		variable score : lilint;	
	begin
		if res_n='1' then
			if clk'event and clk='1' then
				if res_score = '0' then
					if inc_score = '1' and score < lilint'high then
						score:=score+1;
					elsif inc_score ='1' and score = lilint'high then 
						score := lilint'low;
					end if;
				else
					score := lilint'low;
				end if;
			end if;
		else
			score := lilint'low;
		end if;
		value <=integer(score);
	end process zaehler;	
end Behavioral;

