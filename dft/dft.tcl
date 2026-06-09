#====================================================
# ALU DFT INSERTION SCRIPT
# Cadence Genus 20.11
#====================================================

#----------------------------------------------------
# Library
#----------------------------------------------------
read_libs /home/sdl18/cad/FOUNDRY/digital/45nm/NangateOpenCellLibrary_v1.00_20080225/liberty/FreePDK45_lib_v1.0_typical_scan.lib

#----------------------------------------------------
# Design
#----------------------------------------------------
read_hdl alu_8bit_synth.v
elaborate alu

#----------------------------------------------------
# DFT Style
#----------------------------------------------------
set_db dft_scan_style muxed_scan

#----------------------------------------------------
# Define Test Clock
#----------------------------------------------------
define_dft test_clock \
    -name CLK \
    -period 100 \
    clk

#----------------------------------------------------
# Define Shift Enable
#----------------------------------------------------
define_shift_enable \
    -name scan_en \
    -active high \
    -create_port \
    scan_en

#----------------------------------------------------
# Define Scan Chain
#----------------------------------------------------
define_scan_chain \
    -name chain1 \
    -sdi scan_in \
    -sdo scan_out \
    -create_ports \
    -shift_enable scan_en

#----------------------------------------------------
# DFT Rule Check
#----------------------------------------------------
check_dft_rules -verbose > dft_rules.rpt

#----------------------------------------------------
# Convert FF -> Scan FF
#----------------------------------------------------
convert_to_scan

#----------------------------------------------------
# Connect Scan Chains
#----------------------------------------------------
connect_scan_chains


#----------------------------------------------------
#GUI SHOW
#----------------------------------------------------
gui_show

#----------------------------------------------------
# Scan Chain Report
#----------------------------------------------------
report_scan_chains > scan_chain.rpt

#----------------------------------------------------
# Area Report
#----------------------------------------------------
report_area > area_after_dft.rpt

#----------------------------------------------------
# Timing Report
#----------------------------------------------------
report_timing > timing_after_dft.rpt

#----------------------------------------------------
# Write Scan Netlist
#----------------------------------------------------
write_hdl > alu_scan.v

puts ""
puts "==================================="
puts " DFT INSERTION COMPLETED "
puts "==================================="
puts "Generated Files:"
puts "  alu_scan.v"
puts "  dft_rules.rpt"
puts "  scan_chain.rpt"
puts "  area_after_dft.rpt"
puts "  timing_after_dft.rpt"
puts "==================================="
