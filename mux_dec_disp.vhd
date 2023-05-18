--Lucas Damo
--ex ridiculo f
library ieee;
    use ieee.std_logic_1164.all;

entity mux_dec_disp is  
    port(
    
        data : in std_logic_vector(3 downto 0);
        selector : in std_logic;
        display : out std_logic_vector(6 downto 0)
    );
end mux_dec_disp;

architecture mux_dec_disp_arch of mux_dec_disp is
    signal bcd_dec_A :std_logic_vector(3 downto 0):=(others => '0');
    signal output_A :std_logic_vector(6 downto 0):=(others => '0');
    signal bcd_dec_B :std_logic_vector(3 downto 0):=(others => '0');
    signal output_B :std_logic_vector(6 downto 0):=(others => '0');

    signal mux :           std_logic_vector(6 downto 0):=(others => '0');
begin

    bcd_dec_A <= data;
    bcd_dec_B <= data;

    mux <=  output_A when selector ='0' else
            output_B when selector = '1' else
            output_A;

    

    output_A <= "1110111" when  bcd_dec_A = "0000" else
                "0011111" when  bcd_dec_A = "0001" else
                "1001110" when  bcd_dec_A = "0010" else
                "0111101" when  bcd_dec_A = "0011" else
                "1001111" when  bcd_dec_A = "0100" else
                "1000111" when  bcd_dec_A = "0101" else
                "1111011" when  bcd_dec_A = "0110" else
                "0110111" when  bcd_dec_A = "0111" else
                "0011111" when  bcd_dec_A = "1000" else
                "0000000";

    output_B <= "1101101" when bcd_dec_B = "0000" else
                "1101101" when bcd_dec_B = "0001" else
                "0110000" when bcd_dec_B = "0010" else
                "0110000" when bcd_dec_B = "0011" else
                "0110000" when bcd_dec_B = "0100" else
                "1101101" when bcd_dec_B = "0101" else
                "0110011" when bcd_dec_B = "0110" else
                "1011111" when bcd_dec_B = "0111" else
                "0000001" when bcd_dec_B = "1000" else
                "1111011" when bcd_dec_B = "1010" else 
                "0000000";

                
    display <= mux;
end mux_dec_disp_arch;