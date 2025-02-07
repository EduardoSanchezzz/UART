# UART Module
## UART Implementation using SystemVerilog

- [UART Module](#uart-module)
  - [UART Implementation using SystemVerilog](#uart-implementation-using-systemverilog)
  - [Overview](#overview)
  - [Features](#features)
  - [UART Transmitter](#uart-transmitter)
    - [Circuit Diagram](#circuit-diagram)
    - [Tx TestBench](#tx-testbench)
    - [Baud Rate Generator](#baud-rate-generator)
    - [Parity Bit Generator](#parity-bit-generator)
    - [PISO Shift Register](#piso-shift-register)

## Overview
This projects involves designing and implementing a *Universal Asynchronous Receiver/Transmitter(UART)* using SystemVerilog to transmit and receive serial data. UART is a physical circuit and includes a Transmitter and Receiver.

## Features
- **Full Duplex Operation**
- **Configurable Baud Rate**
- **Configurable Data Length**
- **Optional Error Correction (parity checking)**

## UART Transmitter
The UART Tx circuit includes a Baud Rate Generator, Parity Bit Generator and a Parallel-In-Serial-Out (PISO) Shift Register.

### Circuit Diagram
<!-- IMAGE -->

### Tx TestBench
**Baud Rate**
image

**Parity Type**
image

**Data Length**
image

**Reset Behaviour**
image

### Baud Rate Generator
Supports 4 possible baud rates(based on 36MHz clock rate):
- 4800 bps
- 9600 bps
- 19200 bps
- 38400 bps

**Circuit Diagram**
<!-- IMAGE -->

### Parity Bit Generator
Supports 3 possible parity types:
- No Parity
- Odd Parity
- Even Parity

**Circuit Diagram**
<!-- IMAGE -->

### PISO Shift Register
Takes in data and parity bit and sends out as serial data along with UART frame data.
Supports data length of 5-8 bits.

**Circuit Diagram**
<!-- IMAGE -->
