library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity count_ones is
  port(
         clk     : in std_ulogic;
         rst     : in std_ulogic;
         ser_in  : in std_ulogic;
         count   : out unsigned(32 downto 0)
  );
end entity count_ones;

architecture beh of count_ones is
  signal counter : unsigned(32 downto 0);
begin --everything in here is concurrent:
  counting : process(clk,rst)
  begin --sequential statements inside process:
    if(rising_edge(clk)) then
      if(rst = '1') then
        counter <= (others => '0');
      else
        if(ser_in = '1') then
          counter <= counter + 1;
        end if;
      end if;
    end if;
  end process counting;

  count <= counter; --continuous assignment
end beh;
