----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:32 04/04/2016 
-- Design Name: 
-- Module Name:    toplevel_senso - struct 
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
use work.all;

entity toplevel_senso is
Port(
	t : in std_logic_vector (3 downto 0);
	res_schalter : in std_logic;
	mclk : in std_logic;

	l : out std_logic_vector (3 downto 0);
	an : out std_logic_vector(3 downto 0);
	seg : out std_logic_vector(6 downto 0)
);
end toplevel_senso;

architecture struct of toplevel_senso is
	Signal t_debounced : std_logic_vector(3 downto 0);
	Signal rnd: std_logic_vector(1 downto 0);
	Signal res_n, shift, store, restore, res_score, inc_score, res_step, inc_step, equal : std_logic;



begin
	
	debounce_taster: entity debounce_all
	port map(
		clk => mclk,
		res_n => res_n,
		t_in => t,
		t_out => t_debounced
	);

	debounce_reset: entity debounce
	port map (
		clk => mclk,
		res_n => '1',
		t_in => res_schalter,
		t_out => res_n 
	);

	main: entity main
    port map(
    	clk => mclk,
      	res_n => res_n,
        t => t_debounced,
        shift => shift,
        store => store,
        restore => restore,
        rnd => rnd,
        res_score =>res_score,
        inc_score => inc_score,
        res_step => res_step,
        inc_step => inc_step,	
        equal => equal,
        l => l
    );

    random: entity random
    port map (
    	clk => mclk,
    	res_n => res_n,
    	shift => shift,
    	store => store,
    	restore => restore,
    	rnd => rnd
    );

    counter: entity counter
    port map(
    	clk => mclk,
    	res_n => res_n,
		res_score => res_score,
		inc_score=>inc_score,
		res_step=>res_step,
		inc_step=>inc_step,
		equal=>equal,
		an=>an,
		seg=>seg)
    ;

end struct;

