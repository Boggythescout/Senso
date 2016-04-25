--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:35:08 04/12/2016
-- Design Name:   
-- Module Name:   C:/Users/lukas/FPGA-Projekte/Senso/tb_teilcounter.vhd
-- Project Name:  Senso
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: teilcounter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_teilcounter IS
END tb_teilcounter;
 
ARCHITECTURE behavior OF tb_teilcounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT teilcounter
    PORT(
         clk : IN  std_logic;
         res_n : IN  std_logic;
         res_score : IN  std_logic;
         inc_score : IN  std_logic;
         value : OUT zaehlerstand
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal res_n : std_logic := '0';
   signal res_score : std_logic := '0';
   signal inc_score : std_logic := '0';

 	--Outputs
   signal value : integer range 0 to 63;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: teilcounter PORT MAP (
          clk => clk,
          res_n => res_n,
          res_score => res_score,
          inc_score => inc_score,
          value => value
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
        res_n<='0';
      wait for 100 ns;
        res_n<='1';	
        inc_score<='1';
        res_score<='0';
      wait for clk_period*5;
        inc_score<='0';
        res_score<='1';
      wait for clk_period*1;
        inc_score<='1';
        res_score<='0';
      wait for clk_period*80;
      -- insert stimulus here 

      wait;
   end process;

END;
