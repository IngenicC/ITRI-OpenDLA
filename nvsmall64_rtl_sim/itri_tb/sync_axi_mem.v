module sync_axi_mem #(parameter ADDR_WIDTH = 32,
                      parameter DATA_WIDTH = 32)(
    input axi_clk_i,
    input mem_clk_i,
    input rst_n_i,

    input [ADDR_WIDTH-1:0] axi_addr_i,
    input [DATA_WIDTH-1:0] axi_wdata_i,
    input axi_sel_i,
    input axi_wen_i,
    input axi_ren_i,
    output reg [DATA_WIDTH-1:0] axi_rdata_o,
    output reg axi_err_o,
    output reg axi_ack_o,

    output reg [ADDR_WIDTH-1:0] mem_addr_o,                                     
    output reg [DATA_WIDTH-1:0] mem_wdata_o,                              
    output reg mem_sel_o,                                      
    output reg mem_wen_o,                                 
    output reg mem_ren_o,                                 
    input [DATA_WIDTH-1:0] mem_rdata_i,                            
    input mem_err_i,                                     
    input mem_ack_i                                        
);

reg axi_ren_m1;
reg axi_ren_m2;
reg axi_wen_m1;
reg axi_wen_m2;

reg mem_ack_a1;
reg mem_ack_a2;

// ----------------------------------------------------------------------------
//  axi clock domain
// ----------------------------------------------------------------------------
always @(posedge axi_clk_i)
begin
    if (!rst_n_i) begin
        mem_ack_a1 <= 1'b0;
        mem_ack_a2 <= 1'b0;

    end else begin
        mem_ack_a1 <= mem_ack_i;
        mem_ack_a2 <= mem_ack_a1;
    end
end

always @(posedge axi_clk_i)
begin
    if (!rst_n_i) begin
        axi_ack_o <= mem_ack_i;
        axi_rdata_o <= 0;
        axi_err_o <= 0;

    end else begin

        if (mem_ack_a2) begin
            axi_rdata_o <= mem_rdata_i;
            axi_err_o <= mem_err_i;
            axi_ack_o <= 1'b1;

        end else begin
            axi_ack_o <= 1'b0;
        end
    end
end

// ----------------------------------------------------------------------------
//  mem clock domain
// ----------------------------------------------------------------------------
always @(posedge mem_clk_i)
begin
    if (!rst_n_i) begin
        axi_ren_m1 <= 1'b0;
        axi_ren_m2 <= 1'b0;
        axi_wen_m1 <= 1'b0;
        axi_wen_m2 <= 1'b0;

    end else begin
        axi_ren_m1 <= axi_ren_i;
        axi_ren_m2 <= axi_ren_m1;
        axi_wen_m1 <= axi_wen_i;
        axi_wen_m2 <= axi_wen_m1;
    end
end

always @(posedge mem_clk_i)
begin
    if (!rst_n_i) begin
        mem_addr_o <= 0;
        mem_wdata_o <= 0;
        mem_sel_o <= 0;
        mem_wen_o <= 0;
        mem_ren_o <= 0;

    end else begin
        if (axi_wen_m2) begin
            mem_addr_o <= axi_addr_i;
            mem_sel_o <= axi_sel_i;
            mem_wdata_o <= axi_wdata_i;
            mem_wen_o <= 1'b1;
            mem_ren_o <= 1'b0;

        end else if (axi_ren_m2) begin
            mem_addr_o <= axi_addr_i;
            mem_sel_o <= axi_sel_i;
            mem_wen_o <= 1'b0;
            mem_ren_o <= 1'b1;

        end else begin
            mem_wen_o <= 0;
            mem_ren_o <= 0;
        end
    end
end

endmodule
