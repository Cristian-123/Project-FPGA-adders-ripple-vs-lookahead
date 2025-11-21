library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sumador_tb is
end entity;

architecture testbench of sumador_tb is
    component sumador
        Port(A,B: in std_logic_vector(3 downto 0);
             Cin: in std_logic;
             S: out std_logic_vector(3 downto 0);
             Cout: out std_logic);
    end component;
    
    signal A,B: std_logic_vector(3 downto 0);
    signal Cin: std_logic;
    signal S: std_logic_vector(3 downto 0);
    signal Cout: std_logic;
    
begin
    estructura: sumador port map(A => A,
                                 B => B,
                                 Cin => Cin,
                                 S => S,
                                 Cout => Cout);
                              
    estimulo: process
    begin
        A <= "1010";
        B <= "1100";
        Cin <= '0';
        
        wait for 50 ns;
        
        A <= "0011";
        B <= "0110";
        Cin <= '0';
        
        wait for 50 ns;
        
        A <= "0111";
        B <= "1001";
        Cin <= '0';
        
        wait for 50 ns;
        
        A <= "0001";
        B <= "0101";
        Cin <= '0';
        
        wait;
    end process;
end architecture;
