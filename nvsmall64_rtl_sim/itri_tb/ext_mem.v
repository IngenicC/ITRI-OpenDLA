`include "project.vh"             // hardware spec.

module ext_mem #(parameter ADDR_WIDTH = 32,
                 parameter DATA_WIDTH = 32,
                 parameter MEM_START = 32'h8000_0000,
                 parameter [31:0] MEM_SIZE = (2**25))(
    input mem_clk_i,
    input rst_n_i,

    input      [ADDR_WIDTH-1:0] mem_addr_i,  //!< system bus read/write address.
    input      [DATA_WIDTH-1:0] mem_wdata_i, //!< system bus write data.
    input    [ADDR_WIDTH/8-1:0] mem_sel_i,   //!< system bus write byte select.
    input                       mem_wen_i,   //!< system bus write enable.
    input                       mem_ren_i,   //!< system bus read enable.
    output reg [DATA_WIDTH-1:0] mem_rdata_o, //!< system bus read data.
    output reg                  mem_err_o,   //!< system bus error indicator.
    output reg                  mem_ack_o    //!< system bus acknowledge signal.
);

localparam MAX_IDX = $clog2(MEM_SIZE) - 1;
localparam MIN_IDX = $clog2(DATA_WIDTH/8);
wire [MAX_IDX:MIN_IDX] midx;
reg error_w;
wire mem_write;
wire mem_read;


assign midx = mem_addr_i[MAX_IDX:MIN_IDX];

// check range
always @*
begin
    if (mem_addr_i[ADDR_WIDTH-1:MAX_IDX+1] == MEM_START[ADDR_WIDTH-1:MAX_IDX+1])
        error_w = 0;
    else
        error_w = 1;
end

assign mem_read = mem_ren_i && !error_w && !mem_ack_o;
assign mem_write = mem_wen_i && !error_w && !mem_ack_o;

`ifdef PRIMARY_MEMIF_WIDTH_64
    reg [31:0] memory_0 [0:(MEM_SIZE/8) - 1];
    reg [31:0] memory_1 [0:(MEM_SIZE/8) - 1];

    always @(posedge mem_clk_i)
    begin
        if (mem_read)
            mem_rdata_o <= {memory_1[midx], memory_0[midx]};
    end

    // write memory
    always @(posedge mem_clk_i)
    begin
        if (mem_write) begin
            {memory_1[midx], memory_0[midx]} <= mem_wdata_i;
        end
    end

`endif

`ifdef PRIMARY_MEMIF_WIDTH_256
    reg [31:0] memory_0 [0:(MEM_SIZE/32) - 1];
    reg [31:0] memory_1 [0:(MEM_SIZE/32) - 1];
    reg [31:0] memory_2 [0:(MEM_SIZE/32) - 1];
    reg [31:0] memory_3 [0:(MEM_SIZE/32) - 1];
    reg [31:0] memory_4 [0:(MEM_SIZE/32) - 1];
    reg [31:0] memory_5 [0:(MEM_SIZE/32) - 1];
    reg [31:0] memory_6 [0:(MEM_SIZE/32) - 1];
    reg [31:0] memory_7 [0:(MEM_SIZE/32) - 1];

    // read memory
    always @(posedge mem_clk_i)
    begin
        if (mem_read)
            mem_rdata_o <= {memory_7[midx], memory_6[midx],
                            memory_5[midx], memory_4[midx],
                            memory_3[midx], memory_2[midx],
                            memory_1[midx], memory_0[midx]};
    end

    // write memory
    always @(posedge mem_clk_i)
    begin
        if (mem_write) begin
            {memory_7[midx], memory_6[midx],
             memory_5[midx], memory_4[midx],
             memory_3[midx], memory_2[midx],
             memory_1[midx], memory_0[midx]} <= mem_wdata_i;
        end
    end

`endif

`ifdef PRIMARY_MEMIF_WIDTH_512
    reg [31:0] memory_0 [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_1 [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_2 [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_3 [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_4 [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_5 [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_6 [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_7 [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_8 [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_9 [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_a [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_b [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_c [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_d [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_e [0:(MEM_SIZE/64) - 1];
    reg [31:0] memory_f [0:(MEM_SIZE/64) - 1];

    // read memory
    always @(posedge mem_clk_i)
    begin
        if (mem_read)
            mem_rdata_o <= {memory_f[midx], memory_e[midx],
                            memory_d[midx], memory_c[midx],
                            memory_b[midx], memory_a[midx],
                            memory_9[midx], memory_8[midx],
                            memory_7[midx], memory_6[midx],
                            memory_5[midx], memory_4[midx],
                            memory_3[midx], memory_2[midx],
                            memory_1[midx], memory_0[midx]};
    end

    // write memory
    always @(posedge mem_clk_i)
    begin
        if (mem_write) begin
            {memory_f[midx], memory_e[midx],
             memory_d[midx], memory_c[midx],
             memory_b[midx], memory_a[midx],
             memory_9[midx], memory_8[midx],
             memory_7[midx], memory_6[midx],
             memory_5[midx], memory_4[midx],
             memory_3[midx], memory_2[midx],
             memory_1[midx], memory_0[midx]} <= mem_wdata_i;
        end
    end

`endif

// acknowledge
always @(posedge mem_clk_i or negedge rst_n_i)
begin
    if (!rst_n_i)
        mem_ack_o <= 1'b0;

    else if (mem_wen_i || mem_ren_i)
        mem_ack_o <= 1'b1;

    else
        mem_ack_o <= 1'b0;
end

always @(posedge mem_clk_i or negedge rst_n_i)
begin
    if (!rst_n_i)
        mem_err_o <= 1'b0;

    else if ((mem_wen_i || mem_ren_i) && error_w)
        mem_err_o <= 1'b1;

    else
        mem_err_o <= 1'b0;
end

initial
begin
`ifdef PRIMARY_MEMIF_WIDTH_64
    $display("P64 is defined");
`endif
end

endmodule
