----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:16:30 04/25/2016 
-- Design Name: 
-- Module Name:    Display - struct 
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
use mytypes.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Display is
Port(
	clk, res_n : in std_logic;
	value: in zaehlerstand;
	an : out std_logic_vector(3 downto 0);
 	seg : out std_logic_vector(6 downto 0)
 	);
end Display;

architecture struct of Display is
	signal seg1, seg2 : std_logic_vector(6 downto 0);
	signal bcd1, bcd2 : bcd_ziffer;
begin

	bcd_wandler: entity BIN2BCD
	port map(
		value_in => value,
		stelle1 => bcd1,
		stelle2 => bcd2
	);

	decoder1: entity BCD27SEG_decoder
	port map(
		ziffer=>bcd1,
		seg=>seg1
	);


	decoder2: entity BCD27SEG_decoder
	port map(
		ziffer=>bcd2,
		seg=>seg2
	);

	display_mux: entity display_mux
	port map(
		seg1 => seg1,
		seg2 => seg2,
		clk=> clk,
		res_n=>res_n,
		an=>an,
		seg=>seg
	);
end struct;

