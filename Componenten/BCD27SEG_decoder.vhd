----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:39:42 04/25/2016 
-- Design Name: 
-- Module Name:    BCD27SEG_decoder - Behavioral 
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

entity BCD27SEG_decoder is
Port(
	ziffer: in Integer range 0 to 9 := 0;
	seg: out std_logic_vector(6 downto 0)
	);
end BCD27SEG_decoder;

architecture Behavioral of BCD27SEG_decoder is

begin
	process(ziffer)
	begin
		case ziffer is
			when 0 =>
				seg(0)<='1';
				seg(1)<='1';
				seg(2)<='1';
				seg(3)<='1';
				seg(4)<='1';
				seg(5)<='1';
				seg(6)<='0';

			when 1 =>
				seg(0)<='0';
				seg(1)<='1';
				seg(2)<='1';
				seg(3)<='0';
				seg(4)<='0';
				seg(5)<='0';
				seg(6)<='0';

			when 2 =>
				seg(0)<='1';
				seg(1)<='1';
				seg(2)<='0';
				seg(3)<='1';
				seg(4)<='1';
				seg(5)<='1';
				seg(6)<='0';

			when 3 =>
				seg(0)<='1';
				seg(1)<='1';
				seg(2)<='1';
				seg(3)<='1';
				seg(4)<='0';
				seg(5)<='0';
				seg(6)<='1';

			when 4 =>
				seg(0)<='0';
				seg(1)<='1';
				seg(2)<='1';
				seg(3)<='0';
				seg(4)<='0';
				seg(5)<='1';
				seg(6)<='1';

			when 5 =>
				seg(0)<='1';
				seg(1)<='0';
				seg(2)<='1';
				seg(3)<='1';
				seg(4)<='0';
				seg(5)<='1';
				seg(6)<='1';

			when 6 =>
				seg(0)<='1';
				seg(1)<='0';
				seg(2)<='1';
				seg(3)<='1';
				seg(4)<='1';
				seg(5)<='1';
				seg(6)<='1';

			when 7 =>
				seg(0)<='1';
				seg(1)<='1';
				seg(2)<='1';
				seg(3)<='0';
				seg(4)<='0';
				seg(5)<='0';
				seg(6)<='0';

			when 8 =>
				seg(0)<='1';
				seg(1)<='1';
				seg(2)<='1';
				seg(3)<='1';
				seg(4)<='1';
				seg(5)<='1';
				seg(6)<='1';

			when 9 =>
				seg(0)<='1';
				seg(1)<='1';
				seg(2)<='1';
				seg(3)<='1';
				seg(4)<='0';
				seg(5)<='1';
				seg(6)<='1';
			end case;
	end process;
end Behavioral;

