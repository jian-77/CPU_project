transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+cpuclk  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.cpuclk xil_defaultlib.glbl

do {cpuclk.udo}

run 1000ns

endsim

quit -force
