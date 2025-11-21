library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lookahead_tb is
end;

architecture testbench of lookahead_tb is

    component lookahead
        port(A, B  : in  std_logic_vector(3 downto 0);
             Cin   : in  std_logic;
             S     : out std_logic_vector(3 downto 0);
             Cout  : out std_logic);
    end component;

    signal A, B : std_logic_vector(3 downto 0);
    signal Cin  : std_logic;
    signal S    : std_logic_vector(3 downto 0);
    signal Cout : std_logic;

begin
    uut: lookahead port map (A => A,
                             B => B,
                             Cin => Cin,
                             S => S,
                             Cout => Cout);
                             
    estimulo: process
    begin
        A <= "1001";
        B <= "0110";
        Cin <= '0';
        
        wait for 50 ns;

        A <= "1111";
        B <= "1111";
        Cin <= '0';
        
        wait for 50 ns;

        A <= "0101";
        B <= "1110";
        Cin <= '0';
        
        wait for 50 ns;

        A <= "1010";
        B <= "1100";
        Cin <= '0';
        
        wait;        
    end process;

end architecture;
