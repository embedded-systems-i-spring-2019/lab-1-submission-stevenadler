library ieee;
use ieee.std_logic_1164.all;


entity divider_top is
    port(
    
        signal clk_top: in std_logic;
        signal led0: out std_logic
        
    );
        
end divider_top;

architecture behavior of divider_top is

    signal div_top : std_logic;
    signal led0_buf : std_logic := '0';
    
component clock_div is
    port(

        clk  : in std_logic;         -- 125 MHz clock
        div : out std_logic         -- 2 Hz clock

    );
end component;
begin
    div: clock_div port map (clk => clk_top, div => div_top);
    process(div_top)
    begin
        if rising_edge(div_top) then  
            led0_buf <= not led0_buf; 
        end if;
        led0<=led0_buf;
    end process;

end behavior;
