`ifndef APB_MASTER_BFM_SV
`define APB_MASTER_BFM_SV

module apb_master_bfm #(
)(
    input   logic       PCLK,
    input   logic       PRESETn,
    inout   apb_if      vif
);

    initial begin
        vif.reset_signal();
    end

    always_ff @ ( negedge PRESETn ) begin
        vif.reset_signal();
    end
endmodule

`endif