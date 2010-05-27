library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_count_ones is --empty entity for testbench
end tb_count_ones;

architecture beh of tb_count_ones is
    component count_ones
      port(
         clk     : in std_ulogic;
         rst     : in std_ulogic;
         ser_in  : in std_ulogic;
         count   : out unsigned(32 downto 0)
        );
     end component ;
     signal   clk     :  std_ulogic := '0';
     signal   rst     :  std_ulogic := '1';
     signal   ser_in  :  std_ulogic := '0';
     signal   count   :  unsigned(32 downto 0);

begin 
  count_ones0: count_ones
               port map ( clk=>clk, rst=>rst, ser_in=>ser_in, count=>count);

  stimulus : process is
  begin
     clk <= '0';
     rst <= '1';
     ser_in <= '0';
     wait for 10 ns;
     clk <= '1'; 
     rst <= '1';
     wait for 10 ns;
     clk <= '0';
     rst <= '0';
     ser_in <= '1';
     wait for 10 ns; --should now be reset
     clk <= '1';
     ser_in <= '1';
     wait for 10 ns; 
     ser_in <= '1';
     clk <= '0';
     wait for 10 ns; 
     clk <= '1';
     wait for 10 ns;
     ser_in <= '0';
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
     ser_in <= '1';
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
     ser_in <= '1';
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
     ser_in <= '0';
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
     ser_in <= '1';
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
     ser_in <= '0';
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
     ser_in <= '1';
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
     ser_in <= '1';
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
     assert count = "00000000000000000000000000000111"
       report "count should be 7" severity error;

     wait;
   end process stimulus;



                        
end beh;
    
