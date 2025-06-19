`ifndef APB_MASTER_DRIVER_SV
`define APB_MASTER_DRIVER_SV

class apb_master_driver extends apb_driver_base;
    `uvm_component_utils(apb_master_driver)

    function new ( string name = "apb_master_driver", uvm_component parent );
        super.new(name, parent);
    endfunction

    virtual task run_phase ( uvm_phase phase );
        forever begin
            @ ( posedge vif.PCLK );
            txn = apb_seq_item :: type_id :: create ("txn");

            seq_item_port.get_next_item(txn);
            if ( txn.PWRITE ) begin
                vif.apb_write (
                    .sel ( txn.PSEL ),
                    .addr ( txn.PADDR ),
                    .data ( txn.PWDATA )
                );
            end else begin
                vif.apb_read (
                    .sel ( txn.PSEL ),
                    .addr ( txn.PADDR )
                );
            end
            seq_item_port.item_done();
        end
    endtask
endclass

`endif