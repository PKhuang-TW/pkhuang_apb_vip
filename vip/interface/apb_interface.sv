`ifndef APB_INTERFACE_SV
`define APB_INTERFACE_SV

`include "apb_define.svh"

interface apb_interface(
    input   PCLK,
    input   PRESETn
);
    // Master Signal
    logic [`D_ADDR_WIDTH-1:0]       PADDR;
    logic                           PWRITE;
    logic [`D_SLV_COUNT-1:0]        PSEL;
    logic                           PENABLE;
    logic [`D_DATA_WIDTH-1:0]       PWDATA;

    // Slave Signal
    logic                           PREADY;
    logic [`D_DATA_WIDTH-1:0]       PRDATA;

    modport master (
        output  PADDR, PWRITE, PSEL, PENABLE, PWDATA,
        input   PREADY, PRDATA
    );

    modport slave (
        input   PADDR, PWRITE, PSEL, PENABLE, PWDATA,
        output  PREADY, PRDATA
    );
endinterface

`endif