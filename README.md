# 32-bit Single-Cycle RISC-V Processor (RV32I)

A 32-bit Single-Cycle RISC-V (RV32I) Processor designed using **Verilog HDL** and simulated in **Xilinx Vivado**.

This project was developed to strengthen my understanding of **RTL Design, Computer Architecture, Digital Logic Design, and Processor Datapath Implementation**.

---

## Project Overview

The processor executes one instruction per clock cycle following the Single-Cycle RISC-V architecture. The design is modular, with each hardware block implemented as an independent Verilog module.

### Implemented Modules

- Program Counter (PC)
- Instruction Memory
- Register File
- Immediate Generator
- Main Decoder
- ALU Decoder
- Control Unit
- Arithmetic Logic Unit (ALU)
- Data Memory
- Multiplexers
- Top-Level Processor Module
- Verilog Testbench

---

## Processor Datapath

The processor consists of the following stages:

### Instruction Fetch
- Program Counter (PC)
- Instruction Memory

### Instruction Decode
- Register File
- Immediate Generator
- Control Unit

### Execute
- ALU Control
- Arithmetic Logic Unit (ALU)
- Operand Selection Logic

### Memory Access
- Data Memory

### Write Back
- Register File Update

---

## Supported Instructions

### R-Type
- ADD
- SUB
- AND
- OR
- SLT

### I-Type
- LW

### S-Type
- SW

### B-Type
- BEQ

---
## Repository Structure

<details>
<summary><b>RTL</b></summary>

### Datapath
- ALU.v
- Mux.v
- PC.v
- Register_File.v
- Instruction_Memory.v
- Data_Memory.v
- Imm_Extend.v

### Control
- Main_Decoder.v
- ALU_Decoder.v
- Control_Unit_Top.v

### Top Module
- Single_Cycle_Top.v

</details>

<details>
<summary><b>Testbench</b></summary>

- Single_Cycle_Top_Tb.v

</details>

<details>
<summary><b>Programs</b></summary>

- memfile.hex

</details>
---

## Tools Used

- Verilog HDL
- Xilinx Vivado 2025.2
- Git
- GitHub

---

## Sample Program

```assembly
addi x1, x0, 10
addi x2, x0, 20
add  x3, x1, x2
sub  x4, x2, x1
and  x5, x1, x2
or   x6, x1, x2
slt  x7, x1, x2
```

---

## Current Status

 **Work in Progress**

The processor datapath and major RTL modules have been implemented. Additional instruction support, branch logic, and verification are currently under development.

---

## Learning Outcomes

Through this project, I gained hands-on experience with:

- Verilog HDL
- RTL Design
- Digital Logic Design
- Computer Architecture
- RISC-V ISA
- Processor Datapath Design
- Control Unit Design
- Hardware Simulation using Vivado
- Modular Hardware Design

---

## Future Improvements

- Complete Branch Datapath
- Additional RV32I Instructions
- Jump (JAL/JALR) Support
- Enhanced Testbench Coverage
- Pipeline Implementation
- FPGA Implementation and Validation

---

## Author

**Mridul Pandey**

B.Tech Electrical Engineering  
Delhi Technological University (DTU)

---
