`ifndef APB_SLAVE_AGENT_SV
`define APB_SLAVE_AGENT_SV

class apb_slave_agent extends apb_agent_base;
    `uvm_component_utils(apb_slave_agent)

    function new ( string name = "apb_slave_agent", uvm_component parent );
        super.new(name, parent);
    endfunction

    function void build_phase ( uvm_phase phase );

        factory.set_type_override_by_type (
            apb_driver_base::get_type(),
            apb_slave_driver::get_type()
        );

        factory.set_type_override_by_type (
            apb_monitor_base::get_type(),
            apb_slave_monitor::get_type()
        );
        super.build_phase(phase);
    endfunction
endclass

`endif