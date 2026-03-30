# VHDL System Design Lab — IDEA Encryption (Direct, RCS1, RCS2, RCS2+)

This repository contains my complete hardware implementation of the **IDEA block cipher** for the **TUM VHDL System Design Lab**.  
All design stages are included:

- **Direct (combinational) IDEA implementation**
- **RCS1** – Round-based sequential architecture  
- **RCS2** – Resource-optimized sequential architecture  
- **RCS2+** – Final optimized version  
- Full **testbenches** for all modules  
- **Synthesis reports** for all design stages  

The goal is to design, simulate, verify, and synthesize a full hardware implementation of IDEA using **Xilinx ISE 14.7**.

---

## 📁 Project Structure

- `/Direct_Implementation/` → Direct combinational implementation of the IDEA cipher
- `/Resource_Constrained_Implementation1/` → Sequential round based architecture with reduced hardware usage
- `/Resource_Constrained_Implementation2/` → More resource optimized scheduled architecture
- `/Resource_Constrained_Implementation2Plus/` → Final optimized version with improved efficiency

---

## 🔧 Implemented Modules

### Core Arithmetic Units
- **xorop.vhd** — 16-bit XOR  
- **addop.vhd** — 16-bit addition modulo 2¹⁶  
- **mulop.vhd** — Low-High algorithm modulo multiplier modulo (2¹⁶ + 1)

### IDEA Components
- **round.vhd** — Single IDEA encryption round  
- **trafo.vhd** — Output transformation  
- **Key schedule** integrated inside `idea.vhd`

### Top-Level Architectures
- **idea.vhd** — Direct (combinational) implementation  
- **rcs1.vhd** — Round-based sequential architecture  
- **rcs2.vhd** — Optimized sequential architecture  
- **rcs2plus.vhd** — Further optimized version

---

## 🧪 Testbenches

Each module has a dedicated testbench:

- `tb_xorop.vhd`
- `tb_addop.vhd`
- `tb_mulop.vhd`
- `tb_round.vhd`
- `tb_trafo.vhd`
- `tb_idea.vhd`
- `tb_rcs1.vhd`
- `tb_rcs2.vhd`

### Test vectors include:
- Official IDEA reference vectors  
- All-zero and all-ones patterns  
- Alternating patterns (`AAAA`, `5555`)  
- Randomized vectors  
- Low-High algorithm edge cases (0 → 2¹⁶ substitution)

The **IDEA Tester (Java)** was used for reference validation.

---

## 🔬 Simulation & Synthesis

### ✔ Behavioral Simulation  
Executed in **Xilinx ISim** for every module and architecture.

### ✔ Synthesis (Direct Implementation)
- Synthesis **succeeds**
- Mapping **fails intentionally** (resource overflow)
- Direct implementation uses >34 multipliers → more than available DSP blocks on the Spartan-3E FPGA  
- This is expected and part of the analysis in Section 5.1

### ✔ RCS1 / RCS2 / RCS2+  
- All sequential architectures synthesize and map successfully  
- RCS2+ fits comfortably in the Xilinx Spartan-3E FPGA
