# VLSI Tapeout — RTL to GDSII Flow

Implementation of digital designs through a complete RTL to GDSII physical design flow using Cadence EDA tools.

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
├── dft/          # DFT scan netlist and scripts
└── innovus/      # Final GDSII layout files
```

---

## Designs

| Design | Description | Status |
|---|---|---|
| ALU | 8-bit Arithmetic Logic Unit | ✅ Completed |
| 4-bit Multiplier | 4-bit binary multiplier | ✅ Completed |
| 8-bit Multiplier | 8-bit binary multiplier | ✅ Completed |

---

## Tool Flow

```
RTL Design (.v)
      ↓
Simulation & Verification (Cadence Xcelium)
      ↓
Code Coverage Analysis (Cadence IMC)
      ↓
Logic Synthesis + DFT Scan Insertion (Cadence Genus)
      ↓
Physical Design — Floorplan, Placement, CTS, Routing (Cadence Innovus)
      ↓
Final GDSII Layout (.gds)
```

---

## Synthesis Results (Cadence Genus)

| Design | Technology | Clock Period | Cell Area | Worst Slack | DFT |
|---|---|---|---|---|---|
| ALU | NanGate 45nm | 10 ns | 220.248 nm² | 3771 ps (MET ✅) | 11 Scan FFs ✅ |
| 4-bit Multiplier | NanGate 45nm | 10 ns | — | — | ✅ |
| 8-bit Multiplier | NanGate 45nm | 10 ns | — | — | ✅ |

---

## Physical Design Results (Cadence Innovus)

| Design | Cell Area | Worst Slack | DRC Violations |
|---|---|---|---|
| ALU | 220.048 nm² | 1.3 ns (MET ✅) | None ✅ |
| 4-bit Multiplier | 122.360 nm² | ~1.0 ns (MET ✅) | None ✅ |
| 8-bit Multiplier | 483.588 nm² | ~0.039 ns (MET ✅) | None ✅ |

---

## Tools Used

| Tool | Purpose |
|---|---|
| Cadence Xcelium | RTL simulation and functional verification |
| Cadence IMC | Code coverage analysis |
| Cadence Genus | Logic synthesis and DFT scan insertion |
| Cadence Innovus | Physical design — placement, CTS, routing |
| NanGate 45nm PDK | Standard cell library |
| Verilog HDL | Hardware description language |

---

## About

This repository documents the complete RTL to GDSII physical design flow implemented as part of the VLSI tapeout coursework at Chennai Institute of Technology. The flow covers RTL design, functional simulation, code coverage, logic synthesis, DFT scan insertion and physical design using industry-standard Cadence EDA tools.
