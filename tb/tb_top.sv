`timescale 1ps/1ps

`include "apb_define.svh"
`include "apb_interface.sv"

import uvm_pkg::*;

`include "apb_package.svh"
import apb_package::*;

`include "apb_master_bfm.sv"
`include "apb_slave_bfm.sv"

module tb_top;

    logic           clk, rst_n;
    apb_interface   vif (clk, rst_n);

    apb_master_bfm mst (
        .PCLK   (clk),
        .PRESETn(rst_n),
        .vif    (vif)
    );

    apb_slave_bfm slv (
        .PCLK   (clk),
        .PRESETn(rst_n),
        .vif    (vif)
    );

    always  #5  clk = ~clk;

    initial begin

        uvm_config_db #(virtual apb_interface) :: set (null, "uvm_test_top", "vif", vif);

        clk     = 0;
        rst_n   = 0;

        #10;
        rst_n   = 1;

        run_test();
    end

    initial begin
        $fsdbDumpfile("wave.fsdb");
        $fsdbDumpvars;
    end

endmodule