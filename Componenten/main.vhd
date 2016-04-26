----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:08:12 04/04/2016 
-- Design Name: 
-- Module Name:    main - Behav 
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

entity main is
Port(
	clk, res_n, equal: in std_logic;
	t : in std_logic_vector(3 downto 0);
	rnd : in std_logic_vector(1 downto 0);

	res_score, inc_score, res_step, inc_step, shift, store, restore : out std_logic;
	l : out std_logic_vector(3 downto 0)
);
end main;

architecture struct of main is
	signal led_ctrl,tick,key : std_logic;
	signal kval: integer range 0 to 4; 
begin
	hauptsteuerung1: entity Hauptsteuerung
	port map(
		led_ctrl=>led_ctrl, 
		shift=>shift, 
		store=>store, 
		restore=>restore,
		res_score=>res_score,
		inc_score=>inc_score, 
		res_step=>res_step,
		inc_step=>inc_step,
		rnd=>rnd,
		tick=>tick,
		key=>key,
		equal=>equal,
		kval=>kval);

	Ticktack: entity tickgenerator
	port map(
		tick=>tick,
		res_n=>res_n,
		clk=>clk);

	Ausgabe1: entity ausgabe
	port map(
		led_ctrl=>led_ctrl,
		kval=>kval,
		rnd=>rnd,
		l=>l);

	Tastee: entity Tasterabfrage
	port map(
		taster=>t,
		key=>key,
		kval=>kval);
end struct;




