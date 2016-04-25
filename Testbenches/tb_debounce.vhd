--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:28:02 04/12/2016
-- Design Name:   
-- Module Name:   C:/Users/lukas/FPGA-Projekte/Senso/tb_debounce.vhd
-- Project Name:  Senso
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: debounce
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
 
ENTITY tb_debounce IS
END tb_debounce;
 
ARCHITECTURE behavior OF tb_debounce IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT debounce
    PORT(
         clk : IN  std_logic;
         res_n : IN  std_logic;
         t_in : IN  std_logic;
         t_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal res_n : std_logic := '0';
   signal t_in : std_logic := '0';

 	--Outputs
   signal t_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: debounce PORT MAP (
          clk => clk,
          res_n => res_n,
          t_in => t_in,
          t_out => t_out
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
      -- hold reset state for 100 ns.
      res_n<='1';
      wait for 100 ns;	
        t_in <= '0';
      wait for clk_period*3;
        t_in <= '1';
      wait for clk_period*1;
        t_in <= '0';
      wait for clk_period*3;
        t_in <= '1';
      wait for clk_period*2;
        t_in <= '0';
      wait for clk_period*3;
           t_in <= '1';
      wait for clk_period*3;
        t_in <= '0';
      wait for clk_period*3;
           t_in <= '1';
      wait for clk_period*10;
        t_in <= '0';
      wait for clk_period*3;

      -- insert stimulus here 

      wait;
   end process;

END;
