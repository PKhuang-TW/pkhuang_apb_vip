`ifndef APB_SLAVE_AGENT_SV
`define APB_SLAVE_AGENT_SV

class apb_slave_agent extends apb_agent_base;
    `uvm_component_utils(apb_slave_agent)

    function new ( string name = "apb_slave_agent", uvm_component parent );
        super.new(name, parent);
    endfunction

    function void build_phase ( uvm_phase phase );
        factory.set_inst_override_by_name ( "apb_driver_base", "apb_slave_driver", "drv" );
        factory.set_inst_override_by_name ( "apb_monitor_base", "apb_slave_monitor", "mon" );
        super.build_phase(phase);
    endfunction
endclass

`endif