--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:21:16 04/25/2016
-- Design Name:   
-- Module Name:   C:/Users/lukas/FPGA-Projekte/Senso/tb_counter.vhd
-- Project Name:  Senso
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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
 
ENTITY tb_counter IS
END tb_counter;
 
ARCHITECTURE behavior OF tb_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         clk : IN  std_logic;
         res_n : IN  std_logic;
         res_score : IN  std_logic;
         inc_score : IN  std_logic;
         res_step : IN  std_logic;
         inc_step : IN  std_logic;
         an : OUT  std_logic_vector(3 downto 0);
         seg : OUT  std_logic_vector(6 downto 0);
         equal : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal res_n : std_logic := '0';
   signal res_score : std_logic := '0';
   signal inc_score : std_logic := '0';
   signal res_step : std_logic := '0';
   signal inc_step : std_logic := '0';

 	--Outputs
   signal an : std_logic_vector(3 downto 0);
   signal seg : std_logic_vector(6 downto 0);
   signal equal : std_logic;
   
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          clk => clk,
          res_n => res_n,
          res_score => res_score,
          inc_score => inc_score,
          res_step => res_step,
          inc_step => inc_step,
          an => an,
          seg => seg,
          equal => equal          
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
   res_proc1: process
   begin
        res_n<='0';
      wait for 100 ns; 
        res_n<='1';
      wait for 200 ns;
        res_n<='0';
      wait for 10 ns;
        res_n<='1';
      wait for 200 ns;
         res_n<='0';
      wait for 10 ns;
        res_n<='1';
      wait;
    end process;

   stim_proc1: process
   begin   
      wait for 100 ns; 
        inc_score<='1';
        res_score<='0';
      wait for clk_period*5;
        inc_score<='0';
        res_score<='1';
      wait for clk_period*1;
        inc_score<='1';
        res_score<='0';
      wait for clk_period*9;
      wait for 500 ns;

      wait for 10 ns;
 
        inc_score<='1';
        res_score<='0';
      wait for clk_period*5;
        inc_score<='0';
        res_score<='1';
      wait for clk_period*1;
        inc_score<='1';
        res_score<='0';
      wait for clk_period*9;
      wait;
   end process;

    stim_proc2: process
   begin   
      
      wait for 100 ns;
      wait for 200 ns; 
        inc_step<='1';
        res_step<='0';
      wait for clk_period*5;
        inc_step<='0';
        res_step<='1';
      wait for clk_period*1;
        inc_step<='1';
        res_step<='0';
      wait for clk_period*9;
      wait for 500 ns;
        
      wait for 10 ns;
      
        inc_step<='1';
        res_step<='0';
      wait for clk_period*5;
        inc_step<='0';
        res_step<='1';
      wait for clk_period*1;
        inc_step<='1';
        res_step<='0';
      wait for clk_period*9;
      wait;
   end process;

   

END;
