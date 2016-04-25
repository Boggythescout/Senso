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

architecture Behav of main is

begin


end Behav;

