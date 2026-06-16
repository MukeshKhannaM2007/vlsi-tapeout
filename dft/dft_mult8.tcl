#################################################
# DFT INSERTION FOR 8-BIT MULTIPLIER
#################################################

#################################################
# Library
#################################################

read_libs /home/sdl18/cad/FOUNDRY/digital/45nm/NangateOpenCellLibrary_v1.00_20080225/liberty/FreePDK45_lib_v1.0_typical_scan.lib

#################################################
# Read Design
#################################################

read_hdl mult_8bit_synth.v
elaborate mult_8bit

#################################################
# DFT Style
#################################################

set_db dft_scan_style muxed_scan

#################################################
# Define Test Clock
#################################################

define_dft test_clock \
    -name CLK \
    -period 100 \
    clk

#################################################
# Define Shift Enable
#################################################

define_shift_enable \
    -name scan_en \
    -active high \
    -create_port \
    scan_en

#################################################
# Define Scan Chain
#################################################

define_scan_chain \
    -name chain1 \
    -sdi scan_in \
    -sdo scan_out \
    -create_ports \
    -shift_enable scan_en

#################################################
# Check DFT Rules
#################################################

check_dft_rules -verbose

#################################################
# Convert DFFs to Scan DFFs
#################################################

convert_to_scan

#################################################
# Connect Scan Chains
#################################################

connect_scan_chains

gui_show

#################################################
# Report Scan Chains
#################################################

report_scan_chains

#################################################
# Generate Scan Netlist
#################################################

write_hdl > mult_8bit_scan.v
