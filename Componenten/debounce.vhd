----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:09 04/12/2016 
-- Design Name: 
-- Module Name:    debounce - Behavioral 
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

entity debounce is
    Port ( clk : in  STD_LOGIC;
           res_n : in  STD_LOGIC;
           t_in : in  STD_LOGIC;
           t_out : out  STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
	signal t_dualrank : STD_LOGIC;
begin
	dualrank: process (clk, res_n) is
		variable d1, d2 : STD_LOGIC;
	begin
		if res_n='1' then
			if clk'event and clk='1' then
				d2 := d1;
				d1 := t_in;
				t_dualrank <= d2;
			end if;
		else
			d1:='0';
			d2:='0';
			t_dualrank <= '0';
		end if;
	end process;


	impulsverk: process (clk, res_n)  is 
			type zustaende is (reset, an, aus);
			variable AnAus : zustaende;
	begin
		if res_n ='1' then
			if clk'event and clk='1' then
				if AnAus=reset and t_dualrank='1' then
					AnAus:=an;
					t_out<='1';
				elsif AnAus=an then
					AnAus:=aus;
					t_out <='0';
				elsif AnAus=aus and t_dualrank='0' then
					AnAus:=reset;
					t_out <='0';
				end if;
			end if;
		else
			AnAus:=reset;
			t_out<='0';
		end if;

		

	end process;

end Behavioral;

