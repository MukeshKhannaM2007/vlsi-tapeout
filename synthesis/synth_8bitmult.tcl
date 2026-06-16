# ----------------------------
# Library
# ----------------------------
read_libs /home/sdl18/cad/FOUNDRY/digital/45nm/NangateOpenCellLibrary_v1.00_20080225/liberty/FreePDK45_lib_v1.0_typical.lib

# ----------------------------
# Read RTL
# ----------------------------
read_hdl ../rtl/mult_8bit.v
elaborate mult_8bit

# ----------------------------
# Synthesis flow
# ----------------------------
syn_generic
syn_map
syn_opt

gui_show


# ----------------------------
# Reports
# ----------------------------
report_area   > ../reports/area.rpt
report_timing > ../reports/timing.rpt
report_power  > ../reports/power.rpt

# ----------------------------
# Output netlist
# ----------------------------
write_hdl > ../reports/mult_8bit_synth.v
