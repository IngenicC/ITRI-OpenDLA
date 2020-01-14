// Optimize for cache traffic (burst read / write), in which block length = 8x32 bits
// Support byte access (hsize = 000: 8 bits, 001: 16 bits, 010: 32 bits) for single transfer.
// Not support byte access for burst access (hburst != 0)

//modified from axi_port of nvdla_sys (tapeout revision)

module axi_port #(parameter ADDR_WIDTH = 25,
                  parameter DATA_WIDTH = 32,
                  parameter MEM_SIZE = (2**25)) (
    input        clk_i,
    input        sdram_clk_i,
    input        rst_n_i,

    // AXI I/F
    input            [7:0] axi_awid_i,
    input [ADDR_WIDTH-1:0] axi_awaddr_i,
    input            [3:0] axi_awlen_i,
    input            [2:0] axi_awsize_i,
    input            [1:0] axi_awburst_i,
    input            [3:0] axi_awcache_i,
    input            [2:0] axi_awprot_i,
    input                  axi_awvalid_i,
    output reg             axi_awready_o,

    input [DATA_WIDTH-1:0] axi_wdata_i,
    input            [7:0] axi_wstrb_i,
    input                  axi_wlast_i,
    input                  axi_wvalid_i,
    output reg             axi_wready_o,

    output [7:0] axi_bid_o,
    output [1:0] axi_bresp_o,
    output       axi_bvalid_o,
    input        axi_bready_i,

    input            [7:0] axi_arid_i,
    input [ADDR_WIDTH-1:0] axi_araddr_i,
    input            [3:0] axi_arlen_i,
    input            [2:0] axi_arsize_i,
    input            [1:0] axi_arburst_i,
    input            [3:0] axi_arcache_i,
    input            [2:0] axi_arprot_i,
    input                  axi_arvalid_i,
    output reg             axi_arready_o,

    output           [7:0]  axi_rid_o,
    output [DATA_WIDTH-1:0] axi_rdata_o,
    output            [1:0] axi_rresp_o,
    output                  axi_rlast_o,
    output                  axi_rvalid_o,
    input                   axi_rready_i,

    // Internal interface
    output                        dram_access_o,
    output                        dram_we_o,
    output       [ADDR_WIDTH-1:0] dram_addr_o,
    output reg   [DATA_WIDTH-1:0] dram_wdata_o,
    input                         dram_ack_i,
    input                         dram_ready_i,
    input        [DATA_WIDTH-1:0] dram_rdata_i,
    input                         dram_err_i
);
wire                     aw_fifo_wr_req;
wire [ADDR_WIDTH+17-1:0] aw_fifo_wr_wdata;
wire                     aw_fifo_wr_ready;
wire                     aw_fifo_rd_valid;
wire [ADDR_WIDTH+17-1:0] aw_fifo_rd_rdata;
wire                     aw_fifo_rd_ready;
wire                     w_fifo_wr_req;
wire  [DATA_WIDTH+9-1:0] w_fifo_wr_wdata;
wire                     w_fifo_wr_ready;
wire                     w_fifo_rd_valid;
wire  [DATA_WIDTH+9-1:0] w_fifo_rd_rdata;
wire                     w_fifo_rd_ready;
reg                      b_fifo_wr_req;
wire              [ 9:0] b_fifo_wr_wdata;
wire                     b_fifo_wr_ready;
wire                     b_fifo_rd_valid;
wire              [ 9:0] b_fifo_rd_rdata;
wire                     b_fifo_rd_ready;
wire                     ar_fifo_wr_req;
wire [ADDR_WIDTH+17-1:0] ar_fifo_wr_wdata;
wire                     ar_fifo_wr_ready;
wire                     ar_fifo_rd_valid;
wire [ADDR_WIDTH+17-1:0] ar_fifo_rd_rdata;
wire                     ar_fifo_rd_ready;
reg                      r_fifo_wr_req;
wire [DATA_WIDTH+11-1:0] r_fifo_wr_wdata;
wire                     r_fifo_wr_ready;
wire                     r_fifo_rd_valid;
wire [DATA_WIDTH+11-1:0] r_fifo_rd_rdata;
wire                     r_fifo_rd_ready;

wire           [ 7:0] fifo_awid;
wire [ADDR_WIDTH-1:0] fifo_awaddr;
wire           [ 3:0] fifo_awlen;
wire           [ 2:0] fifo_awsize;
wire           [ 1:0] fifo_awburst;
wire [DATA_WIDTH-1:0] fifo_wdata;
wire           [ 7:0] fifo_wstrb;
wire                  fifo_wlast;
wire           [ 7:0] fifo_bid;
wire           [ 1:0] fifo_bresp;
wire           [ 7:0] fifo_arid;
wire [ADDR_WIDTH-1:0] fifo_araddr;
wire           [ 3:0] fifo_arlen;
wire           [ 2:0] fifo_arsize;
wire           [ 1:0] fifo_arburst;
wire           [ 7:0] fifo_rid;
wire [DATA_WIDTH-1:0] fifo_rdata;
wire           [ 1:0] fifo_rresp;
wire                  fifo_rlast;

reg            [ 7:0] dram_rid;
reg  [DATA_WIDTH-1:0] dram_rdata;
reg                   dram_rlast;
reg            [ 7:0] dram_bid;

reg           [ 7:0] fifo_axid_r;
reg [ADDR_WIDTH-1:0] fifo_axaddr_r;
reg           [ 3:0] fifo_axlen_r;
reg           [ 2:0] fifo_axsize_r;
reg           [ 1:0] fifo_axburst_r;

localparam SYS_IDLE = 2'h0;
localparam SYS_READ = 2'h1;
localparam SYS_WRITE = 2'h2;
localparam SYS_BUSY = 2'h3;
localparam DRAM_IDLE = 2'h0;
localparam DRAM_ACCESS = 2'h1;
localparam DRAM_PEND = 2'h2;
reg [1:0] sys_state;
reg [1:0] n_sys_state;
reg [1:0] dram_state;
reg [1:0] n_dram_state;
wire access_end;
wire req_end;
reg [6:0] axsize_byte;
wire [6:0] axsize_byte_minus_1;
reg [5:0] req_cnt;
reg [5:0] ready_cnt;
reg [3:0] burst_req_cnt;
reg [3:0] burst_ready_cnt;
reg [5:0] n_req_cnt;
reg [5:0] n_ready_cnt;
reg [3:0] n_burst_req_cnt;
reg [3:0] n_burst_ready_cnt;
reg read_dram;
reg write_dram;
wire [9:0] req_burst_offset;

reg [3:0] read_cmd_cnt;
reg [3:0] write_cmd_cnt;

wire [3:0] rdata_offset;
wire [3:0] wdata_offset;

// ----------------------------------------------------------------------------
//  aw fifo
// ----------------------------------------------------------------------------
//assign aw_fifo_wr_req = axi_awready_o & axi_awvalid_i;
assign aw_fifo_wr_req = axi_awready_o & axi_awvalid_i & aw_fifo_wr_ready;
assign aw_fifo_wr_wdata[ADDR_WIDTH+17-1:ADDR_WIDTH+9] = axi_awid_i;
assign aw_fifo_wr_wdata[ADDR_WIDTH+9-1:9]  = axi_awaddr_i;
assign aw_fifo_wr_wdata[8:5]   = axi_awlen_i;
assign aw_fifo_wr_wdata[4:2]   = axi_awsize_i;
assign aw_fifo_wr_wdata[1:0]   = axi_awburst_i;
assign fifo_awid    = aw_fifo_rd_rdata[ADDR_WIDTH+17-1:ADDR_WIDTH+9];
assign fifo_awaddr  = aw_fifo_rd_rdata[ADDR_WIDTH+9-1:9];
assign fifo_awlen   = aw_fifo_rd_rdata[8:5];
assign fifo_awsize  = aw_fifo_rd_rdata[4:2];
assign fifo_awburst = aw_fifo_rd_rdata[1:0];
/*
always @(posedge clk_i)
begin
    if (!rst_n_i)
        axi_awready_o <= 1'b0;

    else if (axi_awvalid_i && aw_fifo_wr_ready)
        axi_awready_o <= 1'b1;

    else
        axi_awready_o <= 1'b0;
end
*/
always @*
begin
    if (axi_awvalid_i && aw_fifo_wr_ready)
        axi_awready_o = 1'b1;

    else
        axi_awready_o = 1'b0;

end

axi_fifo_dual #(.WIDTH(ADDR_WIDTH+17),
                .DEPTH(4)) u_aw_fifo(
    .rst_n_i(rst_n_i),

    .clk_wr_i(clk_i),
    .wr_req_i(aw_fifo_wr_req),
    .wr_wdata_i(aw_fifo_wr_wdata),
    .wr_ready_o(aw_fifo_wr_ready),

    .clk_rd_i(sdram_clk_i),
    .rd_ready_i(aw_fifo_rd_ready),
    .rd_valid_o(aw_fifo_rd_valid),
    .rd_rdata_o(aw_fifo_rd_rdata)
);

// ----------------------------------------------------------------------------
//  w fifo
// ----------------------------------------------------------------------------
//assign w_fifo_wr_req = axi_wready_o & axi_wvalid_i;
assign w_fifo_wr_req = axi_wready_o & axi_wvalid_i & w_fifo_wr_ready;
assign w_fifo_wr_wdata[DATA_WIDTH+9-1:9] = axi_wdata_i;
assign w_fifo_wr_wdata[8:1]  = axi_wstrb_i;
assign w_fifo_wr_wdata[0]    = axi_wlast_i;
assign fifo_wdata = w_fifo_rd_rdata[DATA_WIDTH+9-1:9];
assign fifo_wstrb = w_fifo_rd_rdata[8:1];
assign fifo_wlast = w_fifo_rd_rdata[0];
/*
always @(posedge clk_i)
begin
    if (!rst_n_i)
        axi_wready_o <= 1'b0;

    else if (axi_wvalid_i && w_fifo_wr_ready)
        axi_wready_o <= 1'b1;

    else
        axi_wready_o <= 1'b0;
end
*/
always @*
begin
    if (axi_wvalid_i && w_fifo_wr_ready)
        axi_wready_o = 1'b1;

    else
        axi_wready_o = 1'b0;
end

axi_fifo_dual #(.WIDTH(DATA_WIDTH+9),
                .DEPTH(4)) u_w_fifo(
    .rst_n_i(rst_n_i),

    .clk_wr_i(clk_i),
    .wr_req_i(w_fifo_wr_req),
    .wr_wdata_i(w_fifo_wr_wdata),
    .wr_ready_o(w_fifo_wr_ready),

    .clk_rd_i(sdram_clk_i),
    .rd_ready_i(w_fifo_rd_ready),
    .rd_valid_o(w_fifo_rd_valid),
    .rd_rdata_o(w_fifo_rd_rdata)
);

// ----------------------------------------------------------------------------
//  b fifo
// ----------------------------------------------------------------------------
assign b_fifo_wr_wdata[9:2] = dram_bid;
assign b_fifo_wr_wdata[1:0] = 2'h0;
assign fifo_bid = b_fifo_rd_rdata[9:2];
assign fifo_bresp = b_fifo_rd_rdata[1:0];
assign axi_bid_o = b_fifo_rd_valid? fifo_bid : 8'h0;
assign axi_bresp_o = b_fifo_rd_valid? fifo_bresp : 2'h0;
assign axi_bvalid_o = b_fifo_rd_valid;
assign b_fifo_rd_ready = axi_bvalid_o & axi_bready_i;

axi_fifo_dual #(.WIDTH(10),
                .DEPTH(4)) u_b_fifo(
    .rst_n_i(rst_n_i),

    .clk_wr_i(sdram_clk_i),
    .wr_req_i(b_fifo_wr_req),
    .wr_wdata_i(b_fifo_wr_wdata),
    .wr_ready_o(b_fifo_wr_ready),

    .clk_rd_i(clk_i),
    .rd_ready_i(b_fifo_rd_ready),
    .rd_valid_o(b_fifo_rd_valid),
    .rd_rdata_o(b_fifo_rd_rdata)
);

// ----------------------------------------------------------------------------
//  ar fifo
// ----------------------------------------------------------------------------
//assign ar_fifo_wr_req = axi_arready_o & axi_arvalid_i;
assign ar_fifo_wr_req = axi_arready_o & axi_arvalid_i & ar_fifo_wr_ready;
assign ar_fifo_wr_wdata[ADDR_WIDTH+17-1:ADDR_WIDTH+9] = axi_arid_i;
assign ar_fifo_wr_wdata[ADDR_WIDTH+9-1:9]  = axi_araddr_i;
assign ar_fifo_wr_wdata[8:5]   = axi_arlen_i;
assign ar_fifo_wr_wdata[4:2]   = axi_arsize_i;
assign ar_fifo_wr_wdata[1:0]   = axi_arburst_i;
assign fifo_arid    = ar_fifo_rd_rdata[ADDR_WIDTH+17-1:ADDR_WIDTH+9];
assign fifo_araddr  = ar_fifo_rd_rdata[ADDR_WIDTH+9-1:9];
assign fifo_arlen   = ar_fifo_rd_rdata[8:5];
assign fifo_arsize  = ar_fifo_rd_rdata[4:2];
assign fifo_arburst = ar_fifo_rd_rdata[1:0];
/*
always @(posedge clk_i)
begin
    if (!rst_n_i)
        axi_arready_o <= 1'b0;

    else if (axi_arvalid_i && ar_fifo_wr_ready)
        axi_arready_o <= 1'b1;

    else
        axi_arready_o <= 1'b0;
end
*/
always @*
begin
    if (axi_arvalid_i && ar_fifo_wr_ready)
        axi_arready_o = 1'b1;

    else
        axi_arready_o = 1'b0;
end

axi_fifo_dual #(.WIDTH(ADDR_WIDTH+17),
                .DEPTH(4)) u_ar_fifo(
    .rst_n_i(rst_n_i),

    .clk_wr_i(clk_i),
    .wr_req_i(ar_fifo_wr_req),
    .wr_wdata_i(ar_fifo_wr_wdata),
    .wr_ready_o(ar_fifo_wr_ready),

    .clk_rd_i(sdram_clk_i),
    .rd_ready_i(ar_fifo_rd_ready),
    .rd_valid_o(ar_fifo_rd_valid),
    .rd_rdata_o(ar_fifo_rd_rdata)
);

// ----------------------------------------------------------------------------
//  r fifo
// ----------------------------------------------------------------------------
assign r_fifo_wr_wdata[DATA_WIDTH+11-1:DATA_WIDTH+3] = dram_rid;
assign r_fifo_wr_wdata[DATA_WIDTH+3-1:3]  = dram_rdata;
assign r_fifo_wr_wdata[2:1]   = 2'b00;
assign r_fifo_wr_wdata[0]     = dram_rlast;
assign fifo_rid   = r_fifo_rd_rdata[DATA_WIDTH+11-1:DATA_WIDTH+3];
assign fifo_rdata = r_fifo_rd_rdata[DATA_WIDTH+3-1:3];
assign fifo_rresp = r_fifo_rd_rdata[2:1];
assign fifo_rlast = r_fifo_rd_rdata[0];

assign axi_rid_o = r_fifo_rd_valid? fifo_rid : 8'h0;
assign axi_rdata_o = r_fifo_rd_valid? fifo_rdata : 64'h0;
assign axi_rresp_o = r_fifo_rd_valid? fifo_rresp : 2'h0;
assign axi_rlast_o = r_fifo_rd_valid? fifo_rlast : 1'b0;
assign axi_rvalid_o = r_fifo_rd_valid;
assign r_fifo_rd_ready = axi_rvalid_o & axi_rready_i;

axi_fifo_dual #(.WIDTH(DATA_WIDTH+11),
                .DEPTH(8)) u_r_fifo(
    .rst_n_i(rst_n_i),

    .clk_wr_i(sdram_clk_i),
    .wr_req_i(r_fifo_wr_req),
    .wr_wdata_i(r_fifo_wr_wdata),
    .wr_ready_o(r_fifo_wr_ready),

    .clk_rd_i(clk_i),
    .rd_ready_i(r_fifo_rd_ready),
    .rd_valid_o(r_fifo_rd_valid),
    .rd_rdata_o(r_fifo_rd_rdata)
);

always @(posedge sdram_clk_i)
begin
    if (!rst_n_i) begin
        fifo_axid_r <= 8'h0;
        fifo_axaddr_r <= 32'h0;
        fifo_axlen_r <= 4'h0;
        fifo_axsize_r <= 3'h0;
        fifo_axburst_r <= 2'h0;

    end else if (sys_state == SYS_READ) begin
        fifo_axid_r <= fifo_arid;
        fifo_axaddr_r <= fifo_araddr;
        fifo_axlen_r <= fifo_arlen;
//        fifo_axlen_r <= 2;    // for burst test
        fifo_axsize_r <= fifo_arsize;
        fifo_axburst_r <= fifo_arburst;

    end else if (sys_state == SYS_WRITE) begin
        fifo_axid_r <= fifo_awid;
        fifo_axaddr_r <= fifo_awaddr;
        fifo_axlen_r <= fifo_awlen;
//        fifo_axlen_r <= 2;    // for burst test
        fifo_axsize_r <= fifo_awsize;
        fifo_axburst_r <= fifo_awburst;
    end
end

// ----------------------------------------------------------------------------
//  FSM - sys_state: for fifo read control
// ----------------------------------------------------------------------------
always @(posedge sdram_clk_i)
begin
    if (!rst_n_i)
        sys_state <= SYS_IDLE;
    else
        sys_state <= n_sys_state;
end

always @*
begin
    n_sys_state = sys_state;

    if (sys_state == SYS_IDLE) begin

        if (ar_fifo_rd_valid) begin
            n_sys_state = SYS_READ;

        end else if (aw_fifo_rd_valid) begin
            n_sys_state = SYS_WRITE;
        end

    end else if (sys_state == SYS_BUSY) begin
/*
        if (access_end && ar_fifo_rd_valid && aw_fifo_rd_valid) begin

            if (write_cmd_cnt < 4)
                n_sys_state = SYS_WRITE;
            else
                n_sys_state = SYS_READ;

        end else */
        if (access_end && aw_fifo_rd_valid) begin
            n_sys_state = SYS_WRITE;

        end else if (access_end && ar_fifo_rd_valid) begin
            n_sys_state = SYS_READ;

        end else if (access_end) begin
            n_sys_state = SYS_IDLE;
        end

    end else if (sys_state == SYS_READ) begin
        n_sys_state = SYS_BUSY;

    end else if (sys_state == SYS_WRITE) begin
        n_sys_state = SYS_BUSY;
    end
end

assign ar_fifo_rd_ready = (sys_state == SYS_READ)? 1'b1 : 1'b0;
assign aw_fifo_rd_ready = (sys_state == SYS_WRITE)? 1'b1 : 1'b0;

always @(posedge sdram_clk_i)
begin
    if (!rst_n_i) begin
        read_dram <= 1'b0;
        write_dram <= 1'b0;
        read_cmd_cnt <= 0;
        write_cmd_cnt <= 0;

    end else if (sys_state == SYS_READ) begin
        read_dram <= 1'b1;
        write_dram <= 1'b0;
        read_cmd_cnt <= read_cmd_cnt + 1;
        write_cmd_cnt <= 0;

    end else if (sys_state == SYS_WRITE) begin
        read_dram <= 1'b0;
        write_dram <= 1'b1;
        read_cmd_cnt <= 0;
        write_cmd_cnt <= write_cmd_cnt + 1;

    end else if (sys_state == SYS_IDLE) begin
        read_dram <= 1'b0;
        write_dram <= 1'b0;
        read_cmd_cnt <= 0;
        write_cmd_cnt <= 0;
    end
end
// ----------------------------------------------------------------------------
//  FSM - dram_state: for dram access control
// ----------------------------------------------------------------------------
always @(posedge sdram_clk_i)
begin
    if (!rst_n_i)
        dram_state <= DRAM_IDLE;
    else
        dram_state <= n_dram_state;
end

always @*
begin
    n_dram_state = dram_state;

    if (dram_state == DRAM_IDLE) begin

        if (sys_state == SYS_READ)
            n_dram_state = DRAM_ACCESS;

        else if (sys_state == SYS_WRITE)
            n_dram_state = DRAM_ACCESS;

    end else if (dram_state == DRAM_ACCESS) begin

        if (read_dram) begin

            if (!r_fifo_wr_ready && !req_end) begin
                n_dram_state = DRAM_PEND;

            end else if (burst_ready_cnt == fifo_axlen_r) begin
//            if ((ready_cnt == 1 && axsize_byte_minus_1 == 1) || (ready_cnt + 1) == axsize_byte[6:1])
                if ((ready_cnt == 1 && axsize_byte_minus_1 == 1) || ready_cnt == axsize_byte[6:1])
                    n_dram_state = DRAM_IDLE;
            end

        end else if (write_dram && dram_ack_i) begin

            if (burst_req_cnt == fifo_axlen_r) begin
                if ((req_cnt == 1 && axsize_byte_minus_1 == 1) || req_cnt == axsize_byte[6:1])
                    n_dram_state = DRAM_PEND;
            end

        end

    end else if (dram_state == DRAM_PEND) begin
        if (read_dram && r_fifo_wr_ready)
            n_dram_state = DRAM_ACCESS;

        else if (write_dram) begin
            if (dram_ready_i)
                n_dram_state = DRAM_IDLE;
        end

    end else begin
        n_dram_state = DRAM_IDLE;
    end
end

always @*
begin
    case (fifo_axsize_r)
    3'b000:  axsize_byte = 2;  // 1 byte (at least 2 bytes)
    3'b001:  axsize_byte = 2;  // 2 bytes
    3'b010:  axsize_byte = 4;  // 4 bytes
    3'b011:  axsize_byte = 8;  // 8 bytes
    3'b100:  axsize_byte = 16;  // 16 bytes
    3'b101:  axsize_byte = 32; // 32 bytes
    3'b110:  axsize_byte = 64; // 64 bytes
    default: axsize_byte = 64; // must be error!!
    endcase
end

assign axsize_byte_minus_1 = axsize_byte - 1;

always @(posedge sdram_clk_i)
begin
    if (!rst_n_i) begin
        req_cnt <= 6'h0;
        burst_req_cnt <= 4'h0;

    end else begin
        req_cnt <= n_req_cnt;
        burst_req_cnt <= n_burst_req_cnt;
    end
end

always @*
begin
    n_req_cnt = req_cnt;
    n_burst_req_cnt = burst_req_cnt;

    if (dram_state == DRAM_IDLE || access_end) begin
        n_req_cnt = 6'h0;
        n_burst_req_cnt = 4'h0;

    end else if (dram_state == DRAM_PEND || n_dram_state == DRAM_PEND) begin  // wait state
        n_req_cnt = req_cnt;
        n_burst_req_cnt = burst_req_cnt;

    end else if (dram_ack_i && !req_end) begin
        if (read_dram) begin
            if (req_cnt == axsize_byte[6:1]) begin

                n_req_cnt = 1;
                n_burst_req_cnt = burst_req_cnt + 1;

            end else begin
                n_req_cnt = req_cnt + 1;
            end

        end else if (write_dram) begin

            if (req_cnt == axsize_byte[6:1]) begin
                n_req_cnt = 6'h1;
                n_burst_req_cnt = burst_req_cnt + 1;

            end else begin
                n_req_cnt = req_cnt + 1;
            end
        end


    end else if (req_end)
        n_req_cnt = axsize_byte[6:1];
end

always @(posedge sdram_clk_i or negedge rst_n_i)
begin
    if (!rst_n_i) begin
        ready_cnt <= 6'h0;
        burst_ready_cnt <= 4'h0;

    end else begin
        ready_cnt <= n_ready_cnt;
        burst_ready_cnt <= n_burst_ready_cnt;
    end
end

always @*
begin
//    n_ready_cnt = ready_cnt;
//    n_burst_ready_cnt = burst_ready_cnt;

    if (dram_state == DRAM_IDLE || access_end) begin
        n_ready_cnt = 6'h0;
        n_burst_ready_cnt = 4'h0;

    end else if (dram_ready_i && !access_end) begin

        if (ready_cnt == axsize_byte[6:1]) begin
            n_ready_cnt = 6'h1;
            n_burst_ready_cnt = burst_ready_cnt + 1;

        end else begin
            n_ready_cnt = ready_cnt + 1;
            n_burst_ready_cnt = burst_ready_cnt;
        end

    end else begin
        n_ready_cnt = ready_cnt;
        n_burst_ready_cnt = burst_ready_cnt;
    end
end

// ----------------------------------------------------------------------------
//  DRAM read response
// ----------------------------------------------------------------------------
always @(posedge sdram_clk_i)
begin
    if (!rst_n_i) begin
        dram_rid <= 0;

    end else if (sys_state == SYS_READ) begin
        dram_rid <= fifo_arid;
    end
end

// NOT support unaligned burst & single byte burst
/*
always @(posedge sdram_clk_i)
begin
    if (!rst_n_i) begin
        dram_rlast <= 1'b0;

    end else if (access_end) begin
        dram_rlast <= 1'b1;

    end else begin
        dram_rlast <= 1'b0;
    end
end
*/
always @*
begin
    if (access_end)
       dram_rlast = 1'b1;
    else
       dram_rlast = 1'b0;
end

always @(posedge sdram_clk_i)
begin
    if (!rst_n_i) begin
        dram_rdata <= 0;

    end else if (dram_ready_i && read_dram) begin
        dram_rdata <= dram_rdata_i;
//        if (rdata_offset[2:1] == 0) begin
//            dram_rdata[15:0] <= dram_rdata_i;

//        end else if (rdata_offset[2:1] == 1) begin
//            dram_rdata[31:16] <= dram_rdata_i;

//        end else if (rdata_offset[2:1] == 2) begin
//            dram_rdata[47:32] <= dram_rdata_i;

//        end else if (rdata_offset[2:1] == 3) begin
//            dram_rdata[63:48] <= dram_rdata_i;
//        end

    end
end

assign rdata_offset = fifo_axaddr_r[3:0] + burst_ready_cnt*axsize_byte + ready_cnt*2; 
//assign rdata_offset = (ready_cnt == 0)? fifo_axaddr_r[3:0] + burst_ready_cnt*axsize_byte : 
//                                        fifo_axaddr_r[3:0] + burst_ready_cnt*axsize_byte + (ready_cnt-1)*2;

always @(posedge sdram_clk_i)
begin
    if (!rst_n_i) begin
        r_fifo_wr_req <= 1'b0;

    end else if (dram_ready_i && read_dram && r_fifo_wr_ready && dram_ack_i) begin
//        if (ready_cnt == (axsize_byte[6:1] - 1)) begin
            r_fifo_wr_req <= 1'b1;

//        end else begin
//            r_fifo_wr_req <= 1'b0;
//        end

    end else begin
        r_fifo_wr_req <= 1'b0;
    end
end


// ----------------------------------------------------------------------------
//  write response
// ----------------------------------------------------------------------------
// load request data
//assign w_fifo_rd_ready = (write_dram && dram_ack_i && req_cnt == 3)? 1'b1 : 1'b0;
assign w_fifo_rd_ready = (write_dram && dram_state == DRAM_PEND && req_end)? 1'b1 : 1'b0;
//assign w_fifo_rd_ready = (write_dram && dram_statee == DRAM_PEND)? 1'b1 : 1'b0;

always @(posedge sdram_clk_i)
begin
    if (!rst_n_i) begin
        dram_bid <= 0;

    end else if (sys_state == SYS_WRITE) begin
        dram_bid <= fifo_awid;
    end
end

always @(posedge sdram_clk_i)
begin
    if (!rst_n_i) begin
        b_fifo_wr_req <= 1'b0;

//    end else if (dram_ready_i && access_end && write_dram) begin
//    end else if (access_end && write_dram) begin
    end else if (access_end && write_dram && b_fifo_wr_ready) begin
        b_fifo_wr_req <= 1'b1;

    end else begin
        b_fifo_wr_req <= 1'b0;
    end
end

// ----------------------------------------------------------------------------
//  DRAM ctrl interface
// ----------------------------------------------------------------------------
//assign req_end = (dram_ack_i && (burst_req_cnt == fifo_axlen_r) 
//assign req_end = ((burst_req_cnt == fifo_axlen_r) && (req_cnt == axsize_byte[6:1]))? 1'b1 : 1'b0;
//assign req_end = ((burst_req_cnt == fifo_axlen_r) && (req_cnt == (axsize_byte[6:1])))? 1'b1 : 1'b0;
assign req_end = (burst_req_cnt == fifo_axlen_r)? 1'b1 : 1'b0;
//assign access_end = ((burst_ready_cnt == fifo_axlen_r) && (ready_cnt == axsize_byte[6:1]))? 1'b1 : 1'b0;
assign access_end = (burst_ready_cnt == fifo_axlen_r)? 1'b1 : 1'b0;
//assign access_end = ((burst_ready_cnt == fifo_axlen_r) && ((ready_cnt + 1) == axsize_byte[6:1]))? 1'b1 : 1'b0;

// DRAM control signals
//assign dram_access_o = ((read_dram && dram_state == DRAM_ACCESS && !req_end)
//                     || (write_dram && dram_state == DRAM_ACCESS && !req_end))? 1'b1 : 1'b0;
assign dram_access_o = ((sys_state == SYS_READ) || (sys_state == SYS_WRITE));
/*
always @(posedge sdram_clk_i)
begin
    if (!rst_n_i)
        dram_access_o <= 1'b0;

    else if ((read_dram || write_dram) && dram_state == DRAM_ACCESS && !req_end)
        dram_access_o <= 1'b1;

    else
        dram_access_o <= 1'b0;
end
*/
assign req_burst_offset = burst_req_cnt*(axsize_byte); // note: not support single byte burst
assign dram_addr_o = fifo_axaddr_r + req_burst_offset[9:0] + req_cnt;  // burst type??
/*
always @(posedge sdram_clk_i)
begin
    if (!rst_n_i)
        dram_addr_o <= 0;
    else
        dram_addr_o <= {fifo_axaddr_r[24:1]} + req_burst_offset[9:1] + req_cnt;
end
*/
assign dram_we_o = (dram_state == DRAM_ACCESS && write_dram)? 1'b1 : 1'b0;
/*
always @(posedge sdram_clk_i)
begin
    if (!rst_n_i)
        dram_we_o <= 1'b0;
    else if (dram_state == DRAM_ACCESS && write_dram)
        dram_we_o <= 1'b1;
    else
        dram_we_o <= 1'b0;
end
*/
always @*
//always @(posedge sdram_clk_i)
begin
    if (!rst_n_i)
        dram_wdata_o = 0;

    else if (write_dram) begin
        dram_wdata_o = fifo_wdata;

    end else begin
        dram_wdata_o = 0;
    end
end

assign wdata_offset = fifo_axaddr_r[3:0] + burst_req_cnt*axsize_byte + req_cnt*2;

endmodule
