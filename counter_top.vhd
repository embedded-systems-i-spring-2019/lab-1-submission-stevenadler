library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_top is
    port(
            clk     : in  std_logic;  
            btn,sw  : in  std_logic_vector(3 downto 0);  
            led 	: out std_logic_vector(3 downto 0)   
        ); 
end counter_top;

architecture behavior of counter_top is

    component debounce is
        port(
            clk     : in  std_logic;  
            btn  	: in  std_logic;  
            dbnc 	: out std_logic   
        ); 
    end component;
    
    component fancy_counter is
       port(
            clk,clk_en,rst,updn,ld,dir,en   : in  std_logic;  
            val                             : in  std_logic_vector(3 downto 0);
            cnt                             : out std_logic_vector(3 downto 0)   
    
        ); 
    end component;
    
    component clock_div is
        port(
            clk  : in std_logic;         -- 125 MHz clock
            div : out std_logic         -- 2 Hz clock
        );
    end component;
    
    signal counter : std_logic_vector(26 downto 0) := (others => '0');
    signal dbnc_0  : std_logic := '0'; 
    signal dbnc_1  : std_logic := '0'; 
    signal dbnc_2  : std_logic := '0'; 
    signal dbnc_3  : std_logic := '0'; 
    signal clk_div : std_logic := '0'; 
    

begin

u1: debounce
    port map ( clk => clk,
               btn => btn(0),
               dbnc => dbnc_0);
u2: debounce
    port map ( clk => clk,
               btn => btn(1),
               dbnc => dbnc_1);
u3: debounce
    port map ( clk => clk,
               btn => btn(2),
               dbnc => dbnc_2);
u4: debounce
    port map ( clk => clk,
               btn => btn(3),
               dbnc => dbnc_3);

u5: clock_div
    port map( clk => clk,
              div => clk_div);

u6: fancy_counter
    port map ( clk => clk,
               clk_en => clk_div,
               dir => sw(0),
               en => dbnc_1,
               ld => dbnc_3,
               rst => dbnc_0,
               updn => dbnc_2,
               val => sw,
               cnt => led);
    
    
    
    
end behavior;
