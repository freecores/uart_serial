onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider uart_serial
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/reset
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/clk
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/rx_data_serial
add wave -noupdate -format Literal /tb_uart/uart_serial_inst/rx_data_i
add wave -noupdate -format Literal -radix hexadecimal /tb_uart/uart_serial_inst/rx_data_out
add wave -noupdate -format Literal /tb_uart/uart_serial_inst/line__294/rx_bit_cnt
add wave -noupdate -format Literal /tb_uart/uart_serial_inst/rx_state
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/rx_data_en
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/rx_ovf_err
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/rx_parity_err
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/tx_data_serial
add wave -noupdate -format Literal -radix hexadecimal /tb_uart/uart_serial_inst/tx_data_in
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/tx_data_en
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/tx_ch_rdy
add wave -noupdate -format Literal /tb_uart/uart_serial_inst/baud_sel
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/parity_en
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/parity_type
add wave -noupdate -format Literal /tb_uart/uart_serial_inst/tx_state
add wave -noupdate -format Literal /tb_uart/uart_serial_inst/br_divisor
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/top_ref_baud
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/tx_top_baud
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/rx_top_baud
add wave -noupdate -format Literal /tb_uart/uart_serial_inst/tx_data_s
add wave -noupdate -format Literal /tb_uart/uart_serial_inst/tx_data_reg
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/rx_parity_err_i
add wave -noupdate -format Logic /tb_uart/uart_serial_inst/clr_rx_baud
add wave -noupdate -format Literal /tb_uart/uart_serial_inst/rx_baud_proc/rx_br_divisor_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7654653900 ps} 0} {{Cursor 2} {484386792 ps} 0} {{Cursor 3} {225740100 ps} 0} {{Cursor 4} {17533019 ps} 0} {{Cursor 5} {0 ps} 0}
configure wave -namecolwidth 132
configure wave -valuecolwidth 40
configure wave -justifyvalue right
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ps} {105 us}
