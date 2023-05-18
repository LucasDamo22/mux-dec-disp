--Lucas Damo
--
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.numeric_std_unsigned.all;

entity mux_dec_disp_tb is
end mux_dec_disp_tb;

architecture tb of mux_dec_disp_tb is
    signal tb_data: std_logic_vector(3 downto 0):=(others => '0');
    signal tb_selector: std_logic:='0';
    signal tb_display: std_logic_vector(6 downto 0):=(others =>'0');
begin
    
    
    tb_data <= (tb_data + 1) after 5 ns;
    
    tb_selector <= not tb_selector after  60 ns;

    duv: entity work.mux_dec_disp
    port map(
        data => tb_data,
        selector => tb_selector,
        display => tb_display
    );


end tb;