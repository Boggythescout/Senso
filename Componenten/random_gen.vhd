----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:27:43 04/26/2016 
-- Design Name: 
-- Module Name:    random_gen - Behavioral 
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

entity random_gen is
Port(
	q_in: in  std_logic_vector(7 downto 0);
	q: out std_logic_vector(7 downto 0)
);
end random_gen;

architecture Behavioral of random_gen is
begin

	zufall: Process(q_in)
	begin
		q(7)<=q_in(6);
		q(6)<=q_in(5);
		q(5)<=q_in(4);
		q(4)<=q_in(7) xor q_in(3);
		q(3)<=q_in(7) xor q_in(2);
		q(2)<=q_in(7) xor q_in(1);
		q(1)<=q_in(0);
		q(0)<=q_in(7);
	end Process;
end Behavioral;

