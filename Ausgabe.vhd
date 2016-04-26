----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:47 04/26/2016 
-- Design Name: 
-- Module Name:    Ausgabe - Behavioral 
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

entity Ausgabe is
	Port(
		led_ctrl: in std_logic;
		rnd: in std_logic_vector(1 downto 0);
		kval: in Integer range 0 to 4;

	);
end Ausgabe;

architecture Behavioral of Ausgabe is
	Signal led1, led2: std_logic_vector(3 downto 0);
begin
	rnd1: process(rnd)
	begin
		case rnd
		when B"00" =>
			led1:=B"0001";
		when B"01" =>
			led1:=B"0010";
		when B"10" =>
			led1:=B"0100";
		when B"11" =>
			led1:=B"1000";
		when others =>
			led1:=B"0000";	
		end case;
	end process;

	kval1: process(kval)
	begin
		case kval
		when 1 =>
			led2:=B"0001";
		when 2 =>
			led2:=B"0010";
		when 3 =>
			led2:=B"0100";
		when 4 =>
			led2:=B"1000";
		when others=>
			led2:=B"0000";
		end case;
	end process;

	led_ctrl1: process (led_ctrl)
	begin
		if led_ctrl='0' then
			led<=led2;
		else
			led<=led1;
		end if;
	end process;


end Behavioral;

