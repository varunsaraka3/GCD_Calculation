# 📌 GCD Calculator Using Verilog (Datapath + Control Path Design)

## 🔷 Overview

This project implements a **Greatest Common Divisor (GCD) calculator** using Verilog HDL based on the **Euclidean algorithm**. The design follows an industry-relevant approach by clearly separating the system into:

* **Datapath** → Handles data processing
* **Control Path (FSM)** → Controls the sequence of operations

---

## 🔷 Algorithm Used (Euclidean Algorithm)

The GCD is computed using the following logic:

* If **B = 0**, then **GCD = A**
* Else:

  * Replace **A ← B**
  * Replace **B ← A % B**
* Repeat until **B = 0**

---

## 🔷 1. Datapath Design

The datapath consists of hardware components responsible for performing arithmetic operations and storing intermediate results.

### 🔹 Components

* **Registers**

  * `R1` → Stores operand A
  * `R2` → Stores operand B
  * `R3` → Stores result of modulo operation

* **ALU (Arithmetic Logic Unit)**

  * Performs: `R1 % R2`

* **Multiplexers (MUX)**

  * Select appropriate inputs for registers based on control signals

* **Buses**

  * Transfer data between registers and ALU

### 🔹 Functionality

1. Load inputs into `R1` and `R2`
2. Compute `R3 = R1 % R2`
3. Update:

   * `R1 ← R2`
   * `R2 ← R3`
4. Repeat until `R2 = 0`

---

## 🔷 2. Control Path Design

The control path manages the sequence of operations using a **Finite State Machine (FSM)**.

### 🔹 Responsibilities

* Control data loading into registers
* Trigger ALU operations
* Check termination condition (`B == 0`)
* Manage iteration flow

### 🔹 Control Signals

* `load_R1`, `load_R2` → Load values into registers
* `alu_op` → Select ALU operation (modulo)
* `sel_mux` → Control MUX selection
* `done` → Indicates completion

---

## 🔷 3. FSM States

| State       | Description                |
| ----------- | -------------------------- |
| **IDLE**    | Wait for start signal      |
| **LOAD**    | Load inputs into registers |
| **COMPUTE** | Perform modulo operation   |
| **UPDATE**  | Update register values     |
| **CHECK**   | Check if `R2 == 0`         |
| **DONE**    | Output result              |

---

## 🔷 4. System Architecture

```
        +-------------------+
        |   Control Unit    |
        |      (FSM)        |
        +--------+----------+
                 |
                 v
        +-------------------+
        |     Datapath      |
        | (Registers + ALU) |
        +-------------------+
```

---

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/82c1ac35-0552-4522-8d3b-6506d7c340cf" />
