library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity fancy_counter is
    port(
        clk,clk_en,rst,updn,ld,dir,en   : in  std_logic;  
        val                             : in  std_logic_vector(3 downto 0);
        cnt                             : out std_logic_vector(3 downto 0)   
    
    );

end fancy_counter;

architecture behavior of fancy_counter is

    signal count: std_logic_vector(3 downto 0) := (others => '0');
    signal direction: std_logic:='0';
    signal value: std_logic_vector(3 downto 0) := (others => '0');

    --signal div_buf : std_logic := '0';  --output buffer signal

begin
    process(clk)
    begin
        if (en = '1') then 
            if (clk_en = '1') then
                if rising_edge(clk) then
                    if (rst = '1') then
                        count <= "0000";
                    end if;
                    if (updn = '1') then
                        direction <= dir;
                    end if;
                    if (ld = '1') then
                        value <= val;
                    end if;
                    if (direction = '1') then
                        if (count=value) then
                            count <= "0000";
                        else
                            count <= std_logic_vector(unsigned(count) + 1);
                        end if;
                    else
                        if (count="0000") then
                            count <= value;
                        else
                            count <= std_logic_vector(unsigned(count) - 1);                        
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;
end behavior;
