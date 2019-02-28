library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity debounce_tb is
end debounce_tb;

architecture tb of debounce_tb is
    component debounce is
        
        port(
            clk     : in  std_logic;  
            btn  	: in  std_logic;  
            dbnc 	: out std_logic   
        ); 
        
    end component;
    signal tb_clk : std_logic := '0';
    signal tb_btn : std_logic := '0';
    signal tb_dbnc : std_logic := '0';

begin
    btn: debounce port map (clk => tb_clk, btn => tb_btn, dbnc => tb_dbnc);
    process begin
    for iter1 in 0 to 4 loop
        for iter2 in 0 to 3125000 loop -- 25ms
            tb_clk <= '0';
            wait for 4 ns;
            tb_clk <= '1';
            wait for 4 ns;
            end loop;
        tb_btn <= not tb_btn;
        end loop;
  end process;
    
end tb;