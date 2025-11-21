library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lookahead is
    Port(A, B: in std_logic_vector(3 downto 0);
         Cin: in std_logic;
         S: out std_logic_vector(3 downto 0);
         Cout: out std_logic);
end entity;

architecture Dataflow of lookahead is
    signal G, P: std_logic_vector(3 downto 0);
    signal C: std_logic_vector(4 downto 0);
begin
    --Carry de entrada
    C(0) <= Cin;
    
    --Señales Generate (Gi) y Propagate (Pi)
    --Por las ecuaciones que se generan al reordenar la estructura
    G <= A and B;
    P <= A xor B;
    
    --Calculo de Carrys (Lookahead)
    C(1) <= G(0) or 
            (P(0) and C(0));
    
    --C(2) <= G(1) or (P(1) and C(1))
    C(2) <= G(1) or 
            (P(1) and G(0)) or (P(1) and P(0) and C(0));
    
    --C(3) <= G(2) or (P(2) and C(2))
    C(3) <= G(2) or 
            (P(2) and G(1)) or 
            (P(2) and P(1) and G(0)) or 
            (P(2) and P(1) and P(0) and C(0));
    
    --C(4) <= G(3) or P(3) and C(3);
    C(4) <= G(3) or 
            (P(3) and G(2)) or 
            (P(3) and P(2) and G(1)) or 
            (P(3) and P(2) and P(1) and G(0)) or 
            (P(3) and P(2) and P(1) and P(0) and C(0));
    
    --Calculo de salidas de resultado
    S(0) <= P(0) xor C(0);
    S(1) <= P(1) xor C(1);
    S(2) <= P(2) xor C(2);
    S(3) <= P(3) xor C(3);
    
    --Carry de salida
    Cout <= C(4);
end architecture;
