library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador is
    Port(A,B: in std_logic_vector(3 downto 0);
         Cin: in std_logic;
         S: out std_logic_vector(3 downto 0);
         Cout: out std_logic);
end entity;

architecture behavioral of sumador is
    signal C: std_logic_vector(2 downto 0);
begin
    -- Bit 0
    S(0) <= A(0) xor B(0) xor Cin;
    C(0) <= (A(0) and B(0)) or (A(0) and Cin) or (B(0) and Cin);

    -- Bit 1
    S(1) <= A(1) xor B(1) xor C(0);
    C(1) <= (A(1) and B(1)) or (A(1) and C(0)) or (B(1) and C(0));

    -- Bit 2
    S(2) <= A(2) xor B(2) xor C(1);
    C(2) <= (A(2) and B(2)) or (A(2) and C(1)) or (B(2) and C(1));

    -- Bit 3
    S(3) <= A(3) xor B(3) xor C(2);
    Cout <= (A(3) and B(3)) or (A(3) and C(2)) or (B(3) and C(2));
end architecture;
