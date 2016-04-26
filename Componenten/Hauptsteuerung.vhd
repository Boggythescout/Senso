----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:22 04/26/2016 
-- Design Name: 
-- Module Name:    Hauptsteuerung - Behavioral 
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

entity Hauptsteuerung is
	Port (
		key, tick, equal: in std_logic;
		rnd: in std_logic_vector(1 downto 0);
		kval: in Integer range 0 to 4;

		led_ctrl, shift, store, restore: out std_logic;
		res_score, inc_score, res_step, inc_step : out std_logic
	);
end Hauptsteuerung;

architecture Behavioral of Hauptsteuerung is

begin
	type spieltype is (init, start, diSplay, increment, 
		display_over, pass, pass_inc, fail)
	signal spielzustandPlus1, spielzustand:spieltype:= init;
	signal richtig : boolean;

gleich: process(rnd, kval)
begin
	if rnd=B"00" and kval=1 then
		richtig<=true;
	elsif rnd=B"01" and kval=2 then
		richtig<=true;
	elsif rnd=B"10" and kval=3 then
		richtig<=true;
	elsif rnd=B"11" and kval=4 then
		richtig<=true;
	else
		richtig<=false;
	end if;
end process	

Register:process ( res_n,clk) 
begin	
	if res_n='0' then
		spiel<=init;
	else 
		if clk'event and clk='1' then
			spielzustand<=spielzustandPlus1;
		end if;
	end if;
end process;

transition:process (spielzustand, richtig, key, tick, equal)
begin
case spielzustand is
	when init =>
					if key='1' and key'event then
						spielzustandPlus1<=start;
					else
						spielzustandPlus1<=init;
					end if;
	when start => 
					spielzustandPlus1<=display
					 
	when display => 
					if Tick'event and Tick='1' and Not(equal) then
						spielzustandPlus1<=increment;
					elsif Tick'event and Tick='1' and equal then
						spielzustandPlus1<=display_over;
					else
						spielzustandPlus1<= display;
					end if;
	when increment =>
					if Tick'event and Tick='1' then
						spielzustandPlus1<=display;
					else
						spielzustandPlus1<=increment;
					end if;
	when display_over =>
					if key'event and key='1' and richtig then
						spielzustandPlus1<=pass_inc;
					elsif key'event and key='1' and Not(richtig) then
						spielzustandPlus1<=fail;
					else
						spielzustandPlus1<=display_over;
					end if;
	when pass =>
					if key'event and key='1' and richtig then
						spielzustandPlus1<=pass_inc;
					elsif key'event and key='1' and Not(richtig) then
						spielzustandPlus1<=fail;
					elsif equal='1' then
						spielzustandPlus1<=start;
					else
						spielzustandPlus1<=pass;
					end if;
	when pass_inc =>
					spielzustandPlus1<=pass;
	when fail =>
					spielzustandPlus1<= init;
	end case;
end process;

ausgabe: process(spielzustand)
begin
end process;
end Behavioral;

