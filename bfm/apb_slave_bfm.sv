`ifndef APB_SLAVE_BFM_SV
`define APB_SLAVE_BFM_SV

`include "apb_define.svh"

module apb_slave_bfm #(
)(
    input   logic       PCLK,
    input   logic       PRESETn,
    inout   apb_if      vif
);
    logic [`D_DATA_WIDTH-1:0]       mem [`D_MEM_SIZE-1:0];

    initial begin
        foreach ( mem[i] )  mem[i] = 0;
    end

    always @ ( posedge PCLK or negedge PRESETn ) begin
        if ( !PRESETn ) begin
            vif.PRDATA  <= 0;
            vif.PREADY  <= 1;
        end else begin
            if ( vif.PSEL && vif.PENABLE ) begin
                vif.PREADY  <= 0;
                @ ( posedge PCLK );  // simulate delay
                vif.PREADY  <= 1;

                if ( vif.PWRITE ) begin
                    mem[vif.PADDR]  <= vif.PWDATA;
                end else begin
                    vif.PRDATA      <= mem[vif.PADDR];
                end
            end
        end
    end
endmodule

`endif