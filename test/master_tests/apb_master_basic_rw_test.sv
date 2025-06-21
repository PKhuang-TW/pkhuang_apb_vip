`ifndef APB_MASTER_BASIC_RW_TEST_SV
`define APB_MASTER_BASIC_RW_TEST_SV

class apb_master_basic_rw_test extends uvm_test;
    `uvm_component_utils(apb_master_basic_rw_test)

    apb_master_env          env;
    apb_master_basic_seq    seq;

    apb_config              cfg;

    function new ( string name = "apb_master_basic_rw_test", uvm_component parent );
        super.new(name, parent);
    endfunction

    function void build_phase ( uvm_phase phase );
        super.build_phase(phase);
        env = apb_master_env :: type_id :: create ("env", this);
        cfg = apb_config :: type_id :: create ("cfg");

        if ( !uvm_config_db #(virtual apb_if) :: get (this, "", "vif", cfg.vif) )
            `uvm_fatal ("NOVIF", $sformatf("No interface set for %s.vif", get_full_name()) )
        uvm_config_db #(apb_config) :: set (this, "*", "cfg", cfg);
    endfunction

    virtual task run_phase ( uvm_phase phase );
        phase.raise_objection(this);
        seq = apb_master_basic_seq :: type_id :: create("seq");
        seq.start(env.agt_active.seqr);
        phase.drop_objection(this);
    endtask

    function void end_of_elaboration_phase (uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
        uvm_factory::get().print();
    endfunction
endclass

`endif