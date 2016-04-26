----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:11:41 04/04/2016 
-- Design Name: 
-- Module Name:    random - Behav 
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
use work.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity random is
Port(
	clk, res_n, shift, store, restore: in std_logic;
	rnd: out std_logic_vector(1 downto 0)
	);
end random;

architecture Behav of random is
	Signal q_in, q: std_logic_vector(7 downto 0);
begin

	zufall: entity random_gen
	PORT Map(
		q_in=>q_in,
		q=>q
	);

	process(clk, res_n)
		variable SR, MR: std_logic_vector(7 downto 0);
	begin
		if res_n='0' then
			SR:=B"0000_0001";
			MR:=(others => '0');
		else
			if clk='1' and clk'event then
				if restore='1' then
					SR:=MR;
				else
					if shift='1' then
						q_in<=SR;
						SR:=q;
					end if;
				end if ;

				if store='1' then
					MR:=SR;
				end if;

				rnd<=SR(1 downto 0);

			end if;
		end if;
	end process;
end Behav;

