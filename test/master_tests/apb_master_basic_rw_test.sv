`ifndef APB_MASTER_BASIC_RW_TEST_SV
`define APB_MASTER_BASIC_RW_TEST_SV

`include "apb_define.svh"

class apb_master_basic_rw_test extends uvm_test;
    `uvm_component_utils(apb_master_basic_rw_test)

    apb_master_env      env;

    // apb_basic_rw_seq    seq;

    function new ( string name = "apb_master_basic_rw_test", uvm_component parent );
        super.new(name, parent);
    endfunction

    function void build_phase ( uvm_phase phase );
        super.build_phase(phase);
        env = apb_master_env :: type_id :: create ("env", this);
    endfunction

    virtual task run_phase ( uvm_phase phase );
        phase.raise_objection(this);
        // seq = apb_basic_rw_seq :: type_id :: create("seq");
        // seq.start(env.agt_active.seqr);
        phase.drop_objection(this);
    endtask
endclass

`endif