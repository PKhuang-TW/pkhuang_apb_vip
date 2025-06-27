`ifndef APB_SLAVE_MONITOR_SV
`define APB_SLAVE_MONITOR_SV

class apb_slave_monitor extends apb_monitor_base;
    `uvm_component_utils(apb_slave_monitor)

    function new ( string name = "apb_slave_monitor", uvm_component parent );
        super.new(name, parent);
    endfunction
endclass

`endif