`ifndef APB_DRIVER_BASE_SV
`define APB_DRIVER_BASE_SV

class apb_driver_base extends uvm_driver #(apb_seq_item);
    `uvm_component_utils(apb_driver_base)

    apb_config          cfg;
    virtual apb_if      vif;

    apb_seq_item        txn;

    function new ( string name = "apb_driver_base", uvm_component parent );
        super.new(name, parent);
    endfunction

    function void build_phase ( uvm_phase phase );
        super.build_phase(phase);

        if ( !uvm_config_db #(apb_config) :: get (this, "", "cfg", cfg) )
            `uvm_fatal("NOCFG", $sformatf("No config set for %s.cfg", get_full_name() ))
        vif = cfg.vif;
    endfunction
endclass

`endif