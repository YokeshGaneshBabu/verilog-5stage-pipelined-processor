# verilog-5stage-pipelined-processor

This repository contains the Verilog implementation of a **5-stage pipelined processor** based on the **Harvard Architecture**. The processor is designed to demonstrate modular pipelining, instruction-level parallelism, and hazard management in a clean and scalable way.

---

## 🎓 Course Project

This project was developed as part of the **Scripting Languages and Verification** course.

---

## 💡 Features

- **5 Pipeline Stages**: IF, ID, EX, MEM, WB  
- **22 Modular Components** including hazard units and multiplexers  
- **Forwarding and Hazard Detection** implemented  
- **Harvard Architecture** with separate instruction and data memory  
- **Testbench-based Verification** using ModelSim

---

## 🧩 Modules Overview

Key modules include:

- `PC`, `Adder`, `InstructionMemory`, `DataMemory`
- `RegisterFile`, `ALU32Bit`, `ALUControl`
- `ControlUnit`, `Comparator`, `SignExtend`, `ShiftLeft2`
- Pipeline registers: `IF_ID`, `ID_EX`, `EX_MEM`, `MEM_WB`
- `ForwardingUnit`, `HazardDetectionUnit`
- Multiplexers for various widths and control combinations

All modules are custom-coded and verified in isolation before integration.

---

## ⚙️ Execution Flow

1. **Instruction Fetch** – Fetch instruction from instruction memory using PC  
2. **Instruction Decode** – Decode and prepare operands using control logic  
3. **Execution** – Perform ALU operations, compute branch targets  
4. **Memory Access** – Read/write data from/to memory  
5. **Write Back** – Update register file with the result

---

## 🧪 Simulation & Testing

- Simulated using ModelSim
- Clock toggled every 100ns
- Custom testbench includes `ADD`, `SUB`, `LW`, `SW`, `BEQ`, and `NOP` instructions
- Waveform analysis used for verification

---

## 📚 Instruction Format

### R-Type (e.g. `ADD`, `SUB`)
- | 31-26 | 25-21 | 20-16 | 15-11 | 10-6 | 5-0 | 
- |Opcode| rs | rt | rd |shamt|funct|



### I-Type (e.g. `LW`, `SW`, `BEQ`)
- | 31-26 | 25-21 | 20-16 | 15-0 | 
- |Opcode| rs | rt | immediate |


---

## 📌 Future Enhancements

- Add JUMP and JAL instruction support  
- Extend forwarding to handle all use cases  
- Integrate branch prediction  
- Interface with assembler frontend  
- Cache simulation

---

## 👨‍💻 Authors

Yokesh G 
Hariharan Nagarajan
Harikrisshna 
