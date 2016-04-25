----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:19:51 04/12/2016 
-- Design Name: 
-- Module Name:    debounce_all - Behavioral 
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

entity debounce_all is
    Port ( t_in : in  STD_LOGIC_VECTOR (3 downto 0);
           t_out : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           res_n : in  STD_LOGIC);
end debounce_all;

architecture Behavioral of debounce_all is

begin
	t0: entity debounce
	port map(
	clk => clk,
	res_n => res_n,
	t_in => t_in(0),
	t_out => t_out(0)
	);	

	t1:	entity debounce
	port map(
	clk => clk,
	res_n => res_n,
	t_in => t_in(1),
	t_out => t_out(1)
	);

	t2: entity debounce
	port map(
	clk => clk,
	res_n => res_n,
	t_in => t_in(2),
	t_out => t_out(2)
	);

	t3: entity debounce
	port map(
	clk => clk,
	res_n => res_n,
	t_in => t_in(3),
	t_out => t_out(3)
	);

end Behavioral;

