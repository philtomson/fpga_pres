entity tb_sr_latch is
end entity tb_sr_latch;

architecture beh of tb_sr_latch is
  component sr_latch 
      port(
     s_n  : in bit;
     r_n  : in bit;
     q    : inout bit;
     q_n  : inout bit
     );
  end component;
  signal s_n : bit;
  signal r_n : bit;
  signal q   : bit;
  signal q_n : bit;
begin
  latch_1 : sr_latch 
            port map( s_n=>s_n, r_n=>r_n, q=>q, q_n=>q_n);
  stim: process 
  begin
    s_n <= '1';
    r_n <= '0';
    wait for 10 ns;
    s_n <= '0';
    r_n <= '1';
    wait for 10 ns;
    s_n <= '1';
    r_n <= '1';
    wait for 10 ns;
    s_n <= '1';
    r_n <= '0';
    wait for 10 ns;
    s_n <= '0';
    r_n <= '0';
    wait for 10 ns;

    wait; --wait forever
  end process stim;
end beh;
