`ifndef AGT_COVERAGE_BASE_SV
`define AGT_COVERAGE_BASE_SV

`include "apb_define.svh"

class apb_coverage_base extends uvm_subscriber #(apb_seq_item);
    `uvm_component_utils(apb_coverage_base)

    apb_seq_item        txn;

    function new ( string name = "apb_coverage_base", uvm_component parent );
        super.new(name, parent);
    endfunction
    
    virtual function void write ( apb_seq_item t );
        `uvm_info("COV_BASE", "write called! Do nothing...", UVM_LOW)
    endfunction
endclass

`endif