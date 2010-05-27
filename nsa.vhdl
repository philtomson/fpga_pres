library ieee;
use ieee.std_logic_1164.all;

entity NSA is
  generic (num_bits : Natural);
  port(
         clk     : in std_ulogic;
         rst     : in std_ulogic;
         s_in    : in std_ulogic;
         inbits  : in std_ulogic_vector(num_bits-1 downto 0);
         found   : out std_ulogic;
         outbits : out std_ulogic_vector(num_bits-1 downto 0);
         ready   : out std_ulogic
      );
end entity NSA;

architecture beh of NSA is
--  constant max_count: Natural := num_bits - 1 ;
--  signal   inreg    : std_ulogic_vector(num_bits downto 0) := (others => '0');
  signal   outreg   : std_ulogic_vector(num_bits-1 downto 0) := (others => '0');
  signal   match    : std_ulogic := '0';
  signal   acquire  : std_ulogic := '0';
  alias    check_n  : std_ulogic  is acquire;
  signal   counter  : Natural range 0 to num_bits-1 := 0; 
begin

  mcount : process(clk,rst)
  begin
    if(clk'event and clk = '0') then
      if( rst = '1' or (match = '0' and check_n = '0')  ) then
        counter <=  0; 
        acquire <= '0';
        found   <= '0';
        ready   <= '0';
      elsif( counter = (num_bits-1) and check_n = '0') then
        found   <= '1';
        counter <=  0;
        acquire <= '1';
        ready   <= '0';
      elsif( counter = (num_bits-1) and acquire = '1') then
        found   <= '0';
        counter <=  0;
        acquire <= '0';
        ready   <= '1';
      else
        found   <= '0';
        ready   <= '0';
        counter <= counter + 1 ;
      end if;
    end if; 
  end process mcount;

  matcher : process(clk, rst)
  begin
    if(clk'event and clk = '1') then
      if(rst = '1') then
        match  <= '0';
      else
        if(inbits(counter) = s_in) then
          match <= '1';
        else
          match <= '0';      
        end if;
      end if;
    end if;
  end process matcher;

  acquirer : process(clk,rst)
  begin
    if(clk'event and clk = '1') then
      if(rst = '1' ) then
        outreg <= (others => '0');
      else
        if(acquire = '1') then
          outreg <= ( outreg(num_bits-2 downto 0) & s_in);
        end if;
      end if;
    end if;
  end process acquirer;

  outbits <= outreg;

end architecture beh;

