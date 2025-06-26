`ifndef APB_ENV_BASE_SV
`define APB_ENV_BASE_SV

class apb_env_base extends uvm_env;
    `uvm_component_utils(apb_env_base)

    apb_agent_base          agt_active;
    // apb_agent_base          agt_passive;
    apb_scoreboard_base     scb;
    apb_coverage_base       cov;

    function new ( string name = "apb_env_base", uvm_component parent );
        super.new(name, parent);
    endfunction

    function void build_phase ( uvm_phase phase );
        super.build_phase(phase);

        uvm_config_db #(uvm_active_passive_enum) :: set (this, "agt_active", "agt_mode", UVM_ACTIVE);
        // uvm_config_db #(uvm_active_passive_enum) :: set (this, "agt_passive", "agt_mode", UVM_PASSIVE);

        // Type override is written in master/slave env
        agt_active = apb_agent_base :: type_id :: create ("agt_active", this);
        // agt_passive = apb_agent_base :: type_id :: create ("agt_passive", this);
        scb = apb_scoreboard_base :: type_id :: create ("scb", this);
        cov = apb_coverage_base :: type_id :: create ("cov", this);
    endfunction

    function void connect_phase ( uvm_phase phase );
        super.connect_phase(phase);

        // SCB connection
        agt_active.mon.port.connect(scb.imp_active);
        // agt_passive.mon.port.connect(scb.imp_passive);

        // COV connection
        agt_active.mon.port.connect(cov.analysis_export);
    endfunction
endclass

`endif