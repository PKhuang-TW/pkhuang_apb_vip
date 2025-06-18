`ifndef APB_SLAVE_ENV_SV
`define APB_SLAVE_ENV_SV

class apb_slave_env extends apb_env_base;
    `uvm_component_utils(apb_slave_env)

    function new ( string name = "apb_slave_env", uvm_component parent );
        super.new(name, parent);
    endfunction

    function void build_phase ( uvm_phase phase );
        factory.set_type_override_by_name("apb_agent_base", "apb_slave_agent");
        // factory.set_type_override_by_name ( "apb_scoreboard_base", "apb_slave_scoreboard");
        // factory.set_type_override_by_name ( "apb_coverage_base", "apb_slave_coverage");
        super.build_phase(phase);
    endfunction
endclass

`endif