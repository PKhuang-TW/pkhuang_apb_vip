`ifndef APB_SEQ_ITEM_SV
`define APB_SEQ_ITEM_SV

`include "apb_define.svh"

class apb_seq_item extends uvm_seq_item;
    
    rand bit [`D_ADDR_WIDTH-1:0]    PADDR;
    rand bit                        PWRITE;
    rand bit [`D_SLV_COUNT-1:0]     PSEL;
    rand bit [`D_DATA_WIDTH-1:0]    PWDATA;

    bit                             PENABLE;
    bit                             PREADY;
    bit [`D_DATA_WIDTH-1:0]         PRDATA;

    `uvm_object_utils_begin(apb_seq_item)
        `uvm_field_int(PADDR)
        `uvm_field_int(PWRITE)
        `uvm_field_int(PSEL)
        `uvm_field_int(PWDATA)
        `uvm_field_int(PENABLE)
        `uvm_field_int(PREADY)
        `uvm_field_int(PRDATA)
    `uvm_object_utils_end

    constraint psel_onhot_c { $onehot(PSEL); }
    constraint addr_overflow_c { PADDR < `D_MEM_SIZE; }
    constraint align_addr_to_width_c { PADDR % `D_DATA_WIDTH == 0; }

    function new ( string name = "apb_seq_item" );
        super.new(name);
    endfunction

endclass

`endif