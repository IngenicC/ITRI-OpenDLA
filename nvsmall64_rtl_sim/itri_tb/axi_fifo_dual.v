module axi_fifo_dual #(parameter WIDTH = 57,
                       parameter DEPTH = 8)(
    input clk_wr_i,
    input clk_rd_i,
    input rst_n_i,
    input wr_req_i,
    input [WIDTH - 1 : 0] wr_wdata_i,
    output wr_ready_o,
    input rd_ready_i,
    output rd_valid_o,
    output [WIDTH - 1 : 0] rd_rdata_o
);


dual_clock_fifo #(.ADDR_WIDTH($clog2(DEPTH)),
                  .DATA_WIDTH(WIDTH)) u_fifo (
    .wr_rst_i(~rst_n_i),
    .wr_clk_i(clk_wr_i),
    .wr_en_i(wr_req_i),
    .wr_data_i(wr_wdata_i),

    .rd_rst_i(~rst_n_i),
    .rd_clk_i(clk_rd_i),
    .rd_en_i(rd_ready_i),
    .rd_data_o(rd_rdata_o),

    .full_o(fifo_full),
    .empty_o(fifo_empty)
);

// wr_ready_o == not full (after writing if fifo is writing)
assign wr_ready_o = ~fifo_full;

assign rd_valid_o = ~fifo_empty;
/*
always @(posedge clk_rd_i or negedge rst_n_i)
begin
    if (!rst_n_i)
        rd_valid_o <= 1'b0;

    else if (fifo_empty)
        rd_valid_o <= 1'b0;

//    else if (raddr_inc == waddr && rd_ready_i)
//        rd_valid_o <= 1'b0;

    else if (rd_valid_o && rd_ready_i)  // after data out, 1-cycle wait for rd_rdata_o update
        rd_valid_o <= 1'b0;

    else
        rd_valid_o <= 1'b1;
end
*/
endmodule

