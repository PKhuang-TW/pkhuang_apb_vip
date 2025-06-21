`ifndef APB_SLAVE_DRIVER_SV
`define  APB_SLAVE_DRIVER_SV

class apb_slave_driver extends apb_driver_base;
    `uvm_component_utils(apb_slave_driver)

    function new ( string name = "apb_slave_driver", uvm_component parent );
        super.new(name, parent);
    endfunction

    virtual task run_phase ( uvm_phase phase );
        forever begin
            @ ( posedge vif.PCLK );
            txn = apb_seq_item :: type_id :: create ("txn");
            
            seq_item_port.get_next_item(this);
            vif.
            @ ( posedge vif.PENABLE );

        end
    endtask
endclass

`endif