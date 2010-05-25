library ieee;
use ieee.std_logic_1164.all;

entity nsa_tb is
end nsa_tb;

architecture beh of nsa_tb is
    component nsa
      port(
         clk     : in std_ulogic;
         rst     : in std_ulogic;
         s_in    : in std_ulogic;
         inbits  : in std_ulogic_vector(3 downto 0);
         valid   : out std_ulogic;
         outbits : out std_ulogic_vector(3 downto 0);
         ready   : out std_ulogic
        );
     end component ;
     signal   clk     :  std_ulogic := '0';
     signal   rst     :  std_ulogic := '1';
     signal   s_in    :  std_ulogic := '0';
     signal   inbits  :  std_ulogic_vector(3 downto 0) := "1011";
     signal   valid   :  std_ulogic;
     signal   outbits :  std_ulogic_vector(3 downto 0);
     signal   ready   :  std_ulogic;
begin 
  stimulus : process is
  begin
     inbits <= "1011";
     clk <= '0';
     rst <= '1';
     s_in <= '0';
     wait for 20 ns;
     clk <= '1'; 
     rst <= '1';
     wait for 20 ns;
     clk <= '0';
     rst <= '0';
     s_in <= '1';
     wait for 20 ns; --should now be reset
     clk <= '1';
     s_in <= '1';
     wait for 20 ns; 
     s_in <= '1';
     clk <= '0';
     wait for 20 ns; 
     clk <= '1';
     wait for 20 ns;
     s_in <= '0';
     clk <= '0';
     wait for 20 ns;
     clk <= '1';
     wait for 20 ns;
     s_in <= '1';
     clk <= '0';
     wait for 20 ns;
     clk <= '1';
     wait for 20 ns;
     s_in <= '1';
     clk <= '0';
     wait for 20 ns;
     clk <= '1';
     wait for 20 ns;
     assert valid = '1'
       report "valid has not gone to '1' yet!" severity error;
     s_in <= '0';
     clk <= '0';
     wait for 20 ns;
     clk <= '1';
     wait for 20 ns;
     s_in <= '1';
     clk <= '0';
     wait for 20 ns;
     clk <= '1';
     wait for 20 ns;
     s_in <= '0';
     clk <= '0';
     wait for 20 ns;
     clk <= '1';
     wait for 20 ns;
     s_in <= '1';
     clk <= '0';
     wait for 20 ns;
     clk <= '1';
     wait for 20 ns;

     wait;
   end process stimulus;


     nsa0: nsa port map ( clk=>clk, rst=>rst, s_in=>s_in, inbits => inbits,
                        valid=>valid, outbits=>outbits, ready=>ready );
end beh;
    
