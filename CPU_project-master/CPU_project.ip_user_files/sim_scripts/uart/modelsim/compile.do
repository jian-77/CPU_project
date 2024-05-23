vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../CPU_project.srcs/sources_1/ip/uart/uart_bmpg.v" \
"../../../../CPU_project.srcs/sources_1/ip/uart/upg.v" \
"../../../../CPU_project.srcs/sources_1/ip/uart/sim/uart.v" \


vlog -work xil_defaultlib \
"glbl.v"

