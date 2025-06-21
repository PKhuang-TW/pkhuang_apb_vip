`ifndef APB_SLAVE_ENV_SV
`define APB_SLAVE_ENV_SV

class apb_slave_env extends apb_env_base;
    `uvm_component_utils(apb_slave_env)

    function new ( string name = "apb_slave_env", uvm_component parent );
        super.new(name, parent);
    endfunction

    function void build_phase ( uvm_phase phase );
        
        factory.set_type_override_by_type(
            apb_agent_base::get_type(),
            apb_slave_agent::get_type()
        );

        // factory.set_type_override_by_type (
        //     apb_scoreboard_base::get_type(),
        //     apb_slave_scoreboard::get_type()
        // );

        // factory.set_type_override_by_type (
        //     apb_coverage_base::get_type(),
        //     apb_slave_coverage::get_type()
        // );
        
        super.build_phase(phase);
    endfunction
endclass

`endif