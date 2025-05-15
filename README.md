# UART Protocol Implementation in Verilog

This project implements a **Universal Asynchronous Receiver/Transmitter (UART)** communication module in Verilog. The UART protocol enables serial communication between digital systems using two dedicated lines: **TX (Transmit)** and **RX (Receive)**.

---

## Overview

UART is a widely-used asynchronous serial communication protocol, particularly in embedded systems and microcontrollers. This design adheres to standard UART conventions and supports:

- **Baud Rate**: 19,200 bits per second (bps)
- **Data Format**: 8 data bits, 1 stop bit, no parity
- **Asynchronous Communication** using TX and RX lines

---

## Key Features

- **Configurable Baud Rate** (current implementation at 19,200 bps)
- **Oversampling Receiver** (16x oversampling for noise rejection)
- **Baud Tick Generator** for accurate timing
- **Transmit and Receive Modules**:
  - TX shifts out 8-bit parallel data serially
  - RX detects and reconstructs incoming serial data
    
---

## Functional Description

### Baud Rate Generator

- Generates **baud ticks** based on the system clock frequency
- Used to time both transmission and reception processes
- Produces 16 ticks per bit duration for oversampling

### Transmitter (`uart_tx`)

- Accepts 8-bit parallel data (`tx_in`)
- Serializes and transmits it over the `tx` line
- Each bit is shifted out **every 16th baud tick**

### Receiver (`uart_rx`)

- Continuously samples the `rx` line on each baud tick
- On detecting a start bit, it captures a total of 8 data bits and 1 stop bit
- **Samples each bit at the midpoint** (8th tick of the bit period) to minimize error due to noise or jitter

---

## Timing Parameters

| Parameter         | Value             |
|------------------|-------------------|
| Baud Rate         | 19,200 bps         |
| Oversampling Rate | 16x                |
| Stop Bits         | 1                  |
| Parity Bits       | 0 (None)           |
| Data Bits         | 8                  |

---

## Simulation and Testing

The UART modules are verified using:
- Behavioral simulations with known test vectors
- Loopback and communication tests between transmitter and receiver modules
- Timing verification to ensure correct sampling and transmission intervals

Oscilloscope-style waveform inspection confirms correct timing, framing, and bit integrity at the specified baud rate.

---

