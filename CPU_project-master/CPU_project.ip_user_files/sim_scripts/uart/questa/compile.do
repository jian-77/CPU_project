vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../CPU_project.srcs/sources_1/ip/uart/uart_bmpg.v" \
"../../../../CPU_project.srcs/sources_1/ip/uart/upg.v" \
"../../../../CPU_project.srcs/sources_1/ip/uart/sim/uart.v" \


vlog -work xil_defaultlib \
"glbl.v"

