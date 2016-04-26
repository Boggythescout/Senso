--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:22:21 04/25/2016
-- Design Name:   
-- Module Name:   C:/Users/lukas/FPGA-Projekte/Senso/tb_BIN2BCD.vhd
-- Project Name:  Senso
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BIN2BCD
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
 
ENTITY tb_BIN2BCD IS
END tb_BIN2BCD;
 
ARCHITECTURE behavior OF tb_BIN2BCD IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BIN2BCD
    PORT(
         value_in : IN  Integer range 0 to 63;
         stelle2 : OUT  Integer range 0 to 9;
         stelle1 : OUT  Integer range 0 to 9
        );
    END COMPONENT;
    

   --Inputs
   signal value_in : Integer range 0 to 63;

 	--Outputs
   signal stelle2 : Integer range 0 to 9;
   signal stelle1 : Integer range 0 to 9;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BIN2BCD PORT MAP (
          value_in => value_in,
          stelle2 => stelle2,
          stelle1 => stelle1
        );

   -- Stimulus process
   stim_proc: process
   begin		
      for n in 0 to 63 loop
        value_in<=n;
        wait for 10 ns;
      end loop;
      wait;
   end process;

END;
