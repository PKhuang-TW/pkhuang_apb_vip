`ifndef APB_BASIC_RW_SEQ_SV
`define APB_BASIC_RW_SEQ_SV

class apb_basic_rw_seq extends uvm_sequence #(apb_seq_item);
    `uvm_object_utils(apb_basic_rw_seq)

    apb_seq_item        txn;

    function new ( string name = "apb_basic_rw_seq" );
        super.new(name);
    endfunction

    virtual task body();
        for ( int i=0; i<10000; i+=1 ) begin
            txn = apb_seq_item :: type_id :: create ("txn");
            
            if ( !txn.randomize() )
                `uvm_fatal("RANDERR", "txn randomize fail!")

            start_item(txn);
            finish_item(txn);
        end
    endtask

endclass

`endif