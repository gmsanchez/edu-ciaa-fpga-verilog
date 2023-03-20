# edu-ciaa-fpga-verilog
Examples on how to use the EDU-CIA-FPGA with Verilog and APIO

## Installation instructions

### Ubuntu 22.04

Install GTKWave
```
sudo apt install gtkwave
```

Create a virtual environment for APIO and activate it
```
python3 -m venv apio_venv
source apio_venv/bin/activate
```

Install APIO, all its packages and enable the FTDI drivers for EDU-CIIA-FPGA
```
pip install -U apio
apio install --all
apio drivers --ftdi-enable
```

Note: Ubuntu users may need to add own “username” to the “dialout” group if they are not “root”, doing this issuing
```
sudo usermod -a -G dialout $USER.
```

## Running the examples

Clone this repository
```
git clone https://github.com/gmsanchez/edu-ciaa-fpga-verilog.git
```

Choose the leds example and check that runs correctly
```
cd edu-ciaa-fpga-verilog/01-leds

apio verify
apio build
apio sim

apio upload
```
