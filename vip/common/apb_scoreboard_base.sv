`ifndef APB_SCOREBOARD_BASE_SV
`define APB_SCOREBOARD_BASE_SV

`include "apb_define.svh"

class apb_scoreboard_base extends uvm_scoreboard;
    `uvm_component_utils(apb_scoreboard_base)
    
    `uvm_analysis_imp_decl(_active)
    `uvm_analysis_imp_decl(_passive)

    logic [`D_DATA_WIDTH-1:0]                   mem [`D_MEM_SIZE-1:0];

    uvm_analysis_imp_active #(apb_seq_item, apb_scoreboard_base)    imp_active;
    uvm_analysis_imp_passive #(apb_seq_item, apb_scoreboard_base)   imp_passive;
    
    function new ( string name = "apb_scoreboard_base", uvm_component parent );
        super.new(name, parent);
    endfunction

    function void build_phase ( uvm_phase phase );
        super.build_phase(phase);
    endfunction: build_phase
    
    virtual function void write_active (apb_seq_item txn);
        `uvm_info("SCB_BASE", "write_passive called! Do nothing...", UVM_LOW)
    endfunction

    virtual function void write_passive (apb_seq_item txn);
        `uvm_info("SCB_BASE", "write_passive called! Do nothing...", UVM_LOW)
    endfunction
endclass

`endif