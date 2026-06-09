
# VLSI Tapeout — RTL to Synthesis Flow

Implementation of digital designs through a complete RTL to Synthesis + DFT flow using Cadence Genus EDA tool.

## Author

**Mukesh Khanna M**  
B.E. Electronics and Communication Engineering — II Year  
Chennai Institute of Technology

---

## Repository Structure

```
vlsi-tapeout/
│
├── RTL/          # RTL design and testbench files
├── synthesis/    # Genus synthesis scripts and SDC constraints
├── netlists/     # Synthesized gate-level netlists
├── reports/      # Area, timing and power reports
└── dft/          # DFT scan netlist and scripts
```

---

## Designs

| Design | Description | Status |
|---|---|---|
| ALU | 8-bit Arithmetic Logic Unit | ✅ Completed |
| 4-bit Multiplier | 4-bit binary multiplier | 🔄 In Progress |
| 8-bit Multiplier | 8-bit binary multiplier | 🔄 In Progress |

---

## Tool Flow

```
RTL Design (.v)
      ↓
Simulation & Verification (Cadence Xcelium)
      ↓
Logic Synthesis (Cadence Genus)
      ↓
DFT — Scan Insertion (Cadence Genus)
      ↓
Gate Level Netlist (.v)
```

---

## ALU Synthesis Results

| Parameter | Value |
|---|---|
| Technology | NanGate 45nm |
| Clock Period | 10 ns |
| Total Cell Area | 220.248 nm² |
| Worst Negative Slack (WNS) | 3771 ps (MET ✅) |
| Total Power | 100 µW |

### DFT Results

| Parameter | Value |
|---|---|
| Scan Flip-Flops | 11 |
| Scan Chain | Inserted ✅ |

---

## Tools Used

| Tool | Purpose |
|---|---|
| Cadence Genus 20.11 | Logic synthesis and DFT |
| Cadence Xcelium | RTL simulation |
| NanGate 45nm PDK | Standard cell library |
| Verilog HDL | Hardware description language |

---

## About

This repository documents the RTL to Synthesis + DFT flow implemented as part of the VLSI tapeout coursework at Chennai Institute of Technology. The flow covers RTL design, functional simulation, logic synthesis, and Design for Testability (DFT) using industry-standard Cadence EDA tools.
