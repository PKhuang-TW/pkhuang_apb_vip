`ifndef APB_MONITOR_BASE_SV
`define APB_MONITOR_BASE_SV

class apb_monitor_base extends uvm_monitor;
    `uvm_component_utils(apb_monitor_base)

    apb_config                          cfg;
    virtual apb_interface               vif;

    apb_seq_item                        txn;

    uvm_active_passive_enum             agt_mode;

    uvm_analysis_port #(apb_seq_item)   port;

    function new ( string name = "apb_monitor_base", uvm_component parent );
        super.new(name, parent);
        port = new("port", this);
    endfunction

    function void build_phase ( uvm_phase phase );
        super.build_phase(phase);

        if ( !uvm_config_db #(apb_config) :: get (this, "", "cfg", cfg) )
            `uvm_fatal("NOCFG", $sformatf("No config set for %s.cfg", get_full_name() ))
        vif = cfg.vif;

        if ( !uvm_config_db #(uvm_active_passive_enum) :: get (this, "", "agt_mode", agt_mode) )
            `uvm_fatal("NOAGTMODE", $sformatf("No agt_mode set for %s.agt_mode", get_full_name() ))
    endfunction
endclass

`endif