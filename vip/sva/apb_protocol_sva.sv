`ifndef APB_PROTOCOL_SVA_SV
`define APB_PROTOCOL_SVA_SV

`include "apb_define.svh"

module apb_protocol_sva (
    input   logic                           PCLK,
    input   logic                           PRESETn,
    input   logic [`D_ADDR_WIDTH-1:0]       PADDR,
    input   logic                           PWRITE,
    input   logic [`D_SLV_COUNT-1:0]        PSEL,
    input   logic                           PENABLE,
    input   logic [`D_DATA_WIDTH-1:0]       PWDATA,

    // Slave Signal
    input   logic                           PREADY,
    input   logic [`D_DATA_WIDTH-1:0]       PRDATA
);

    property p_idle_phase;
        @ (posedge PCLK) disable iff (!PRESETn)
        !PSEL |-> !( PADDR || PWRITE || PWDATA || PENABLE );
    endproperty
    apb_idle_phase_rule: assert property(p_idle_phase);

    property p_setup_phase_penable_low;
        @ (posedge PCLK) disable iff (!PRESETn)
        $rose(PSEL) |-> !PENABLE;
    endproperty
    apb_setup_phase_penable_low_rule: assert property(p_setup_phase_penable_low);

    property p_psel_to_penable;
        @ (posedge PCLK) disable iff (!PRESETn)
        $rose(PSEL) && !PENABLE |=> PENABLE;
    endproperty
    apb_psel_to_penable_rule: assert property(p_psel_to_penable);

    property p_pready_then_reset;
        @ (posedge PCLK) disable iff (!PRESETn)
        $rose(PREADY) && PENABLE |=> $fell(PADDR) && $fell(PWRITE) && $fell(PSEL) && $fell(PWDATA);
    endproperty
    apb_pready_then_reset_rule: assert property(p_pready_then_reset);

endmodule

`endif