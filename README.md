# 📘 APB UVM VIP Description

## 🧩 Module Overview

This VIP module implements a reusable Advanced Peripheral Bus (APB) Verification IP following the AMBA APB protocol specification.  
It provides a complete UVM verification environment with layered base components, optional bus functional models (BFMs), master and slave agents, protocol timing assertions (SVA), and functional coverage.

This VIP supports the following features:

- Master transactions: APB read and write
- Slave response: ready signal and valid data
- Configurable setup and access phase timing
- Built-in SystemVerilog Assertions (SVA) for protocol timing checks
- Random, directed, and corner-case test scenarios
- Functional coverage for all phases and responses

---

## 🔧 I/O Signals

| Signal     | Direction | Width        | Description                           |
|------------|-----------|--------------|---------------------------------------|
| `PCLK`     | Input     | 1            | APB clock                             |
| `PRESETn`  | Input     | 1            | Active-low reset                      |
| `PSEL`     | Input     | 1            | Peripheral select                     |
| `PENABLE`  | Input     | 1            | Enable for access phase               |
| `PADDR`    | Input     | Configurable | Address bus                           |
| `PWRITE`   | Input     | 1            | Write enable                          |
| `PWDATA`   | Input     | Configurable | Write data bus                        |
| `PRDATA`   | Output    | Configurable | Read data bus                         |
| `PREADY`   | Output    | 1            | Ready signal                          |

---

## 🔁 APB Protocol Behavior

- **Setup Phase**:
  - Master asserts `PSEL` with valid `PADDR`, `PWRITE`, `PWDATA` (for write) on the rising edge of `PCLK`.

- **Access Phase**:
  - Master asserts `PENABLE` while keeping `PSEL` high.
  - Slave responds with `PREADY` and provides `PRDATA` for read operations.

- **Timing Control**:
  - Single setup and access phase; no burst support.
  - Ready signal may insert wait states.

---

<!-- ## 📷 APB Block Diagram

![APB Block Diagram](doc/block_diagram.png)

--- -->

## 📁 Directory Structure
```
apb_vip_project/
│
├── README.md
|
├── block_diagram.png
│
├── tb/
│   └── tb_top.sv
│
├── bfm/
│   ├── apb_master_bfm.sv
│   └── apb_slave_bfm.sv
│
├── vip/
│   ├── apb_package.svh
│   │
│   ├── interface/
│   │   └── apb_interface.sv
│   │
│   ├── sva/
│   │   ├── apb_protocol_sva.sv
│   │   └── bin_apb_protocol_sva.sv
│   │
│   ├── common/
│   │   ├── apb_define.svh
│   │   ├── apb_seq_item.sv
│   │   ├── apb_config.sv
│   │   ├── apb_driver_base.sv
│   │   ├── apb_monitor_base.sv
│   │   ├── apb_agent_base.sv
│   │   ├── apb_env_base.sv
│   │   ├── apb_scoreboard_base.sv
│   │   └── apb_coverage_base.sv
│   │
│   └── master/
│       ├── apb_master_driver.sv
│       ├── apb_master_driver_error.sv
│       ├── apb_master_monitor.sv
│       ├── apb_master_agent.sv
│       ├── apb_master_env.sv
│       ├── apb_master_scoreboard.sv
│       └── apb_master_coverage.sv
│   
├── seq/
│   └── apb_basic_rw_seq.sv
│   
└── test/
    ├── apb_basic_rw_test.sv
    └── apb_master_error_test.sv
```