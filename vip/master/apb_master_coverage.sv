`ifndef AGT_MASTER_COVERAGE_SV
`define AGT_MASTER_COVERAGE_SV

class apb_master_coverage extends apb_coverage_base;
    `uvm_component_utils(apb_master_coverage)

    covergroup apb_cg;
        cp_addr:    coverpoint  txn.PADDR { 
            bins addr_bins[] = {[0:`D_MEM_SIZE-1]} with ( (item % `D_DATA_WIDTH) == 0 );
        }
        cp_op:      coverpoint  txn.PWRITE;
        cp_sel:     coverpoint  txn.PSEL { bins sel_bins[] = {[1:`D_SLV_COUNT]}; }

        addr_X_op_X_sel:    cross cp_addr, cp_op, cp_sel;
    endgroup

    function new ( string name = "apb_master_coverage", uvm_component parent );
        super.new(name, parent);
        apb_cg = new();
    endfunction
    
    virtual function void write ( apb_seq_item t );
        if ( t.PWRITE == 1 ) begin  // collects APB write only
            txn = t;
            apb_cg.sample();
        end
    endfunction
endclass

`endif
