# if simulation was running then quit
quit -sim

set origin [pwd]

if {![file isdirectory work]} {
    exec vlib work
}

#cd $origin

# map lpm library, for ModelSim to find lpm objects
exec vmap lpm {$MODEL_TECH/../altera/vhdl/220model}

# map the work library
exec vmap work work


# compile all files

vcom -work work -2002 -explicit -check_synthesis ../sources/uart_serial.vhd
vcom -work work -2002 -explicit -check_synthesis ../testbench/tb_uart.vhd
