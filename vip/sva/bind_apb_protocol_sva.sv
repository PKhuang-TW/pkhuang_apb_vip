`ifndef BIND_APB_PROTOCOL_SVA_SV
`define BIND_APB_PROTOCOL_SVA_SV

bind tb_top apb_protocol_sva bind_apb_sva (
    .PCLK(vif.PCLK),
    .PRESETn(vif.PRESETn),
    .PADDR(vif.PADDR),
    .PWRITE(vif.PWRITE),
    .PSEL(vif.PSEL),
    .PENABLE(vif.PENABLE),
    .PWDATA(vif.PWDATA),
    .PREADY(vif.PREADY),
    .PRDATA(vif.PRDATA)
);

`endif