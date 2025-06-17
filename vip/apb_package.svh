`ifndef APB_PACKAGE_SVH
`define APB_PACKAGE_SVH

package apb_package;
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    
    `include "apb_config.sv"
    `include "apb_define.svh"
    `include "apb_if.sv"
    `include "apb_seq_item.sv"

endpackage

`endif