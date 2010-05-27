--sr_latch.vhdl behavioral set-reset latch
entity sr_latch is
  port(
     s_n  : in bit;
     r_n  : in bit;
     q    : inout bit;
     q_n  : inout bit
     );
end entity sr_latch;

architecture beh of sr_latch is
begin
  q   <= not( s_n and q_n) after 100 ps; --concurrent assignments
  q_n <= not( r_n and q)   after 100 ps;
end beh;
