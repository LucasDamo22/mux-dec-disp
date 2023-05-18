vlib work

vcom mux_dec_disp.vhd
vcom mux_dec_disp_tb.vhd

vsim -voptargs=+acc -wlfdeleteonquit -t ns work.mux_dec_disp

do wave.do

run 200 ns