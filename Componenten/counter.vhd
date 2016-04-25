----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:03:23 04/04/2016 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
Port(
	clk, res_n, res_score, inc_score, res_step, inc_step : in std_logic;
 	an : out std_logic_vector(3 downto 0);
 	seg : out std_logic_vector(6 downto 0);
 	equal : out std_logic
);
end counter;

architecture struct of counter is
	
	Signal value1, value2 : Integer range 0 to 63;

begin
	step: entity teilcounter
	port map(
		clk=>clk,
		res_n=>res_n,
		res_score=>res_step,
		inc_score=>inc_step,
		value=> value1
	);

	score: entity teilcounter
	port map(
		clk=>clk,
		res_n=>res_n,
		res_score=>res_score,
		inc_score=>inc_score,
		value => value2
	);

	vergleicher: entity gleich
	port map(
		value1=>value1,
		value2=>value2,
		equal=>equal
	);

	display1: entity Display
	port map(
		clk=> clk,
		res_n=>res_n,
		value=> value1,
		an=>an,
		seg=>seg
	);


end struct;

