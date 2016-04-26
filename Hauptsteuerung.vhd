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


end Behavioral;

