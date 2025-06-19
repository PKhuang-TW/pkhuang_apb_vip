`ifndef APB_IF_SV
`define APB_IF_SV

`include "apb_define.svh"

interface apb_if(
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

    task automatic apb_write (
        input   logic                       sel,
        input   logic [`D_ADDR_WIDTH-1:0]   addr,
        input   logic [`D_DATA_WIDTH-1:0]   data
    );
        @ ( posedge PCLK );
        PADDR   <= addr;
        PSEL    <= sel;
        PWDATA  <= data;
        PWRITE  <= 1;

        @ ( posedge PCLK );
        PENABLE <= 1;

        @ ( posedge PCLK );
        @ ( posedge PREADY );
        reset_signal();
    endtask

    task automatic apb_read (
        input   logic                       sel,
        input   logic [`D_ADDR_WIDTH-1:0]   addr
    );
        @ ( posedge PCLK );
        PADDR   <= addr;
        PSEL    <= sel;
        PWRITE  <= 0;

        @ ( posedge PCLK );
        PENABLE <= 1;

        @ ( posedge PCLK );
        @ ( posedge PREADY );
        reset_signal();
    endtask
    
    task automatic reset_signal();
        PADDR   <= '0;
        PWRITE  <= '0;
        PSEL    <= '0;
        PENABLE <= '0;
        PWDATA  <= '0;
    endtask
endinterface

`endif