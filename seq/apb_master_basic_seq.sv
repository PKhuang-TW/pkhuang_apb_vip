`ifndef APB_MASTER_BASIC_SEQ_SV
`define APB_MASTER_BASIC_SEQ_SV

class apb_master_basic_seq extends uvm_sequence #(apb_seq_item);

    apb_seq_item        txn;

    function new ( string name = "apb_master_basic_seq", uvm_component parent );
        super.new(name, parent);
    endfunction

    virtual task body();
        for ( int i=0; i<1000; i+=1 ) begin
            txn = apb_seq_item :: type_id :: create ("txn");
            
            if ( !txn.randomize() )
                `uvm_fatal("RANDERR", "txn randomize fail!")

            start_item(txn);
            finish_item(txn);
        end
    endtask

endclass

`endif