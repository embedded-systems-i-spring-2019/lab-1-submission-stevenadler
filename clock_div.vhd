library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_div is
    port(

        clk  : in std_logic;         -- 125 MHz clock
        div : out std_logic         -- 2 Hz clock

    );
end clock_div;

architecture behavior of clock_div is

    signal counter : std_logic_vector(26 downto 0) := (others => '0');
    signal div_buf : std_logic := '0';  --output buffer signal
    

begin
    process(clk)
    begin
    
        if rising_edge(clk) then      
                
                if (unsigned(counter) < 31249999) then
                    counter <= std_logic_vector(unsigned(counter) + 1);
                    
                else
                    counter <= (others => '0');
                    div_buf <= not div_buf;     --invert output buffer
                end if;
                div <= div_buf;    
        end if;
    
    end process;
    
end behavior;