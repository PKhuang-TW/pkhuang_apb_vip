`ifndef APB_MASTER_SCOREBOARD_SV
`define APB_MASTER_SCOREBOARD_SV

`include "apb_define.svh"

class apb_master_scoreboard extends apb_scoreboard_base;
    `uvm_component_utils(apb_master_scoreboard)

    function new ( string name = "apb_master_scoreboard", uvm_component parent );
        super.new(name, parent);
    endfunction

    function void build_phase ( uvm_phase phase );
        super.build_phase(phase);
        imp_active = new("imp_active", this);
        imp_passive = new("imp_passive", this);
    endfunction: build_phase
    
    virtual function void write_active (apb_seq_item txn);
        if ( txn.PWRITE ) begin  // APB write
            mem[txn.PADDR[$clog2(`D_MEM_SIZE)-1:0]] = txn.PWDATA;
        end
    endfunction

    virtual function void write_passive (apb_seq_item txn);
        bit [`D_DATA_WIDTH-1:0]     exp_data;
        if ( !txn.PWRITE ) begin  // APB read
            exp_data = mem[txn.PADDR[$clog2(`D_MEM_SIZE)-1:0]];
            if ( exp_data != txn.PRDATA ) begin
                `uvm_error(
                    "MISCOMPARE",
                    $sformatf("Read addr (0x%h): data = 0x%h while expected 0x%h",txn.PADDR, txn.PRDATA, exp_data)
                )
            end
        end
    endfunction
endclass

`endif