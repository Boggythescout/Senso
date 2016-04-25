--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:08:34 04/12/2016
-- Design Name:   
-- Module Name:   C:/Users/lukas/FPGA-Projekte/Senso/Testbenches/tb_vergleicher.vhd
-- Project Name:  Senso
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vergleicher
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
USE ieee.numeric_std.ALL;
 
ENTITY tb_vergleicher IS
END tb_vergleicher;
 
ARCHITECTURE behavior OF tb_vergleicher IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vergleicher
    PORT(
         value1 : IN  Integer range 0 to 63;
         value2 : IN  Integer range 0 to 63;
         equal : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal value1 : Integer range 0 to 63;
   signal value2 : Integer range 0 to 63;

 	--Outputs
   signal equal : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vergleicher PORT MAP (
          value1 => value1,
          value2 => value2,
          equal => equal
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      value1<=12;
      value2<=14;
      wait for 100 ns;	

     value1<=14;
      value2<=14;
      wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
