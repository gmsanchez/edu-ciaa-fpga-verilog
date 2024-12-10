# SystemVerilog example for Turning all the leds on (for the EDU-CIAA-FPGA boards)

apio raw 'yosys -p "plugin -i slang; read_slang leds.sv; synth_ice40 -top leds -blif leds.blif"'

apio raw "arachne-pnr -d 8k -P tq144:4k -p leds.pcf leds.blif -o leds.asc"

apio raw "icepack leds.asc leds.bin"

apio raw "iceprog leds.bin"