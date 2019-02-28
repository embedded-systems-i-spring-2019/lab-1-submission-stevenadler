library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity clock_div_tb is
end clock_div_tb;

architecture tb of clock_div_tb is
    component clock_div
        port(

        clk : in std_logic;         -- 125 MHz clock
        div : out std_logic         

    );
    end component;
    signal tb_clk : std_logic := '0';
    signal tb_div : std_logic := '0';

begin
    div: clock_div port map (clk => tb_clk, div => tb_div);
    process begin
    for iter in 0 to 15 loop
        tb_clk <= '0';
        wait for 4 ns;
        tb_clk <= '1';
        wait for 4 ns;
        end loop;
  end process;
    
end tb;