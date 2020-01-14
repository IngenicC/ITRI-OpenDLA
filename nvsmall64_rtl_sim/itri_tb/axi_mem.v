
module axi_mem #(parameter ADDR_WIDTH = 32,
                 parameter DATA_WIDTH = 32,
                 parameter MEM_START = 32'h8000_0000,
                 parameter MEM_SIZE = (2**25))(

    input axi_clk_i,
    input mem_clk_i,
    input rst_n_i,

    // axi write address channel
    input               [7:0] axi_awid_i,    //!< AXI write address ID
    input    [ADDR_WIDTH-1:0] axi_awaddr_i,  //!< AXI write address
    input               [3:0] axi_awlen_i,   //!< AXI write burst length
    input               [2:0] axi_awsize_i,  //!< AXI write burst size
    input               [1:0] axi_awburst_i, //!< AXI write burst type
    input               [1:0] axi_awlock_i,  //!< AXI write lock type
    input               [3:0] axi_awcache_i, //!< AXI write cache type
    input               [2:0] axi_awprot_i,  //!< AXI write protection type
    input                     axi_awvalid_i, //!< AXI write address valid
    output                    axi_awready_o, //!< AXI write ready

    // axi write data channel
    input               [7:0] axi_wid_i,     //!< AXI write data ID
    input    [DATA_WIDTH-1:0] axi_wdata_i,   //!< AXI write data
    input  [DATA_WIDTH/8-1:0] axi_wstrb_i,   //!< AXI write strobes
    input                     axi_wlast_i,   //!< AXI write last
    input                     axi_wvalid_i,  //!< AXI write valid
    output                    axi_wready_o,  //!< AXI write ready

    // axi write response channel
    output              [7:0] axi_bid_o,     //!< AXI write response ID
    output              [1:0] axi_bresp_o,   //!< AXI write response
    output                    axi_bvalid_o,  //!< AXI write response valid
    input                     axi_bready_i,  //!< AXI write response ready

    // axi read address channel
    input               [7:0] axi_arid_i,    //!< AXI read address ID
    input    [ADDR_WIDTH-1:0] axi_araddr_i,  //!< AXI read address
    input               [3:0] axi_arlen_i,   //!< AXI read burst length
    input               [2:0] axi_arsize_i,  //!< AXI read burst size
    input               [1:0] axi_arburst_i, //!< AXI read burst type
    input               [1:0] axi_arlock_i,  //!< AXI read lock type
    input               [3:0] axi_arcache_i, //!< AXI read cache type
    input               [2:0] axi_arprot_i,  //!< AXI read protection type
    input                     axi_arvalid_i, //!< AXI read address valid
    output                    axi_arready_o, //!< AXI read address ready

    // axi read data channel
    output              [7:0] axi_rid_o,     //!< AXI read response ID
    output   [DATA_WIDTH-1:0] axi_rdata_o,   //!< AXI read data
    output              [1:0] axi_rresp_o,   //!< AXI read response
    output                    axi_rlast_o,   //!< AXI read last
    output                    axi_rvalid_o,  //!< AXI read response valid
    input                     axi_rready_i  //!< AXI read response ready
);

wire   [ADDR_WIDTH-1:0] sys_addr;  //!< system bus read/write address.
wire   [DATA_WIDTH-1:0] sys_wdata; //!< system bus write data.
wire [ADDR_WIDTH/8-1:0] sys_sel;   //!< system bus write byte select.
wire                    sys_wen;   //!< system bus write enable.
wire                    sys_ren;   //!< system bus read enable.
wire   [DATA_WIDTH-1:0] sys_rdata; //!< system bus read data.
wire                    sys_err;   //!< system bus error indicator.
wire                    sys_ack;   //!< system bus acknowledge signal.
wire                    sys_access;

// mem_clk domain
wire   [ADDR_WIDTH-1:0] mem_addr;  //!< system bus read/write address.
wire   [DATA_WIDTH-1:0] mem_wdata; //!< system bus write data.
wire [ADDR_WIDTH/8-1:0] mem_sel;   //!< system bus write byte select.
wire                    mem_wen;   //!< system bus write enable.
wire                    mem_ren;   //!< system bus read enable.
wire   [DATA_WIDTH-1:0] mem_rdata; //!< system bus read data.
wire                    mem_err;   //!< system bus error indicator.
wire                    mem_ack;   //!< system bus acknowledge signal.

    // -----------------------------------------------------------------------
    //  axi_clk domain
    // -----------------------------------------------------------------------
    axi_slave #(.ADDR_WIDTH(ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH),
                .MEM_START(MEM_START),
                .MEM_SIZE(MEM_SIZE)) u_axi_wrap(
        .axi_clk_i(axi_clk_i),
        .axi_rstn_i(rst_n_i),

        // axi write address channel
        .axi_awid_i   (axi_awid_i),   //!< AXI write address ID
        .axi_awaddr_i (axi_awaddr_i), //!< AXI write address
        .axi_awlen_i  (axi_awlen_i),  //!< AXI write burst length
        .axi_awsize_i (3'b110),                   //!< AXI write burst size
        .axi_awburst_i(2'b01),                    //!< AXI write burst type
        .axi_awlock_i (2'b0),                     //!< AXI write lock type
        .axi_awcache_i(4'b0),                     //!< AXI write cache type
        .axi_awprot_i (3'b0),                     //!< AXI write protection type
        .axi_awvalid_i(axi_awvalid_i),//!< AXI write address valid
        .axi_awready_o(axi_awready_o),//!< AXI write ready

        // axi write data channel
        .axi_wid_i    (8'h0),                     //!< AXI write data ID (AXI-3 only)
        .axi_wdata_i  (axi_wdata_i),   //!< AXI write data
        .axi_wstrb_i  (axi_wstrb_i),   //!< AXI write strobes
        .axi_wlast_i  (axi_wlast_i),   //!< AXI write last
        .axi_wvalid_i (axi_wvalid_i),  //!< AXI write valid
        .axi_wready_o (axi_wready_o),  //!< AXI write ready

        // axi write response channel
        .axi_bid_o    (axi_bid_o),     //!< AXI write response ID
        .axi_bresp_o  (axi_bresp_o),                         //!< AXI write response (optional)
        .axi_bvalid_o (axi_bvalid_o),  //!< AXI write response valid
        .axi_bready_i (axi_bready_i),  //!< AXI write response ready

        // axi read address channel
        .axi_arid_i   (axi_arid_i),   //!< AXI read address ID
        .axi_araddr_i (axi_araddr_i), //!< AXI read address
        .axi_arlen_i  (axi_arlen_i),  //!< AXI read burst length
        .axi_arsize_i (3'b110),                   //!< AXI read burst size
        .axi_arburst_i(2'b01),                    //!< AXI read burst type
        .axi_arlock_i (2'b0),                     //!< AXI read lock type
        .axi_arcache_i(4'b0),                     //!< AXI read cache type
        .axi_arprot_i (3'b0),                     //!< AXI read protection type
        .axi_arvalid_i(axi_arvalid_i),//!< AXI read address valid
        .axi_arready_o(axi_arready_o),//!< AXI read address ready

        // axi read data channel
        .axi_rid_o    (axi_rid_o),     //!< AXI read response ID
        .axi_rdata_o  (axi_rdata_o),   //!< AXI read data
        .axi_rresp_o  (axi_rresp_o),                         //!< AXI read response (optional)
        .axi_rlast_o  (axi_rlast_o),   //!< AXI read last
        .axi_rvalid_o (axi_rvalid_o),  //!< AXI read response valid
        .axi_rready_i (axi_rready_i),  //!< AXI read response ready

        // system read/write channel
        .sys_addr_o   (sys_addr),
        .sys_wdata_o  (sys_wdata),
        .sys_sel_o    (sys_sel),
        .sys_wen_o    (sys_wen),
        .sys_ren_o    (sys_ren),
        .sys_rdata_i  (sys_rdata),
        .sys_err_i    (sys_err),
        .sys_ack_i    (sys_ack)
    );

/*
axi_port #(.ADDR_WIDTH(ADDR_WIDTH),
           .DATA_WIDTH(DATA_WIDTH),
           .MEM_SIZE(MEM_SIZE)) u_axi_port(
    .clk_i(axi_clk_i),
    .sdram_clk_i(axi_clk_i),
    .rst_n_i(rst_n_i),

    // AXI I/F
    .axi_awid_i(axi_awid_i),
    .axi_awaddr_i(axi_awaddr_i),
    .axi_awlen_i(axi_awlen_i),
    .axi_awsize_i(axi_awsize_i),
    .axi_awburst_i(axi_awburst_i),
    .axi_awcache_i(axi_awcache_i),
    .axi_awprot_i(axi_awprot_i),
    .axi_awvalid_i(axi_awvalid_i),
    .axi_awready_o(axi_awready_o),

    .axi_wdata_i(axi_wdata_i),
    .axi_wstrb_i(axi_wstrb_i),
    .axi_wlast_i(axi_wlast_i),
    .axi_wvalid_i(axi_wvalid_i),
    .axi_wready_o(axi_wready_o),

    .axi_bid_o(axi_bid_o),
    .axi_bresp_o(axi_bresp_o),
    .axi_bvalid_o(axi_bvalid_o),
    .axi_bready_i(axi_bready_i),

    .axi_arid_i(axi_arid_i),
    .axi_araddr_i(axi_araddr_i),
    .axi_arlen_i(axi_arlen_i),
    .axi_arsize_i(axi_arsize_i),
    .axi_arburst_i(axi_arburst_i),
    .axi_arcache_i(axi_arcache_i),
    .axi_arprot_i(axi_arprot_i),
    .axi_arvalid_i(axi_arvalid_i),
    .axi_arready_o(axi_arready_o),

    .axi_rid_o(axi_rid_o),
    .axi_rdata_o(axi_rdata_o),
    .axi_rresp_o(axi_rresp_o),
    .axi_rlast_o(axi_rlast_o),
    .axi_rvalid_o(axi_rvalid_o),
    .axi_rready_i(axi_rready_i),

    // Internal interface
//    .dram_access_o(mem_sel & (mem_wen | mem_ren)),
    .dram_access_o(sys_access),
    .dram_we_o(sys_wen),
    .dram_addr_o(sys_addr),
    .dram_wdata_o(sys_wdata),
    .dram_ready_i(1'b1),
    .dram_ack_i(sys_ack),
    .dram_rdata_i(sys_rdata),
    .dram_err_i(sys_err)
);
assign sys_sel = 4'hf;
assign sys_ren = sys_access & ~sys_wen;
*/
    // -----------------------------------------------------------------------
    //  axi_clk <-> mem_clk cross domain
    // -----------------------------------------------------------------------
`ifdef SYNC_AXI_MEM
    sync_axi_mem #(.ADDR_WIDTH(ADDR_WIDTH),
                   .DATA_WIDTH(DATA_WIDTH)) u_sync(
        .axi_clk_i(axi_clk_i),
        .mem_clk_i(mem_clk_i),
        .rst_n_i(rst_n_i),

        .axi_addr_i (sys_addr),
        .axi_wdata_i(sys_wdata),
        .axi_sel_i  (sys_sel),
        .axi_wen_i  (sys_wen),
        .axi_ren_i  (sys_ren),
        .axi_rdata_o(sys_rdata),
        .axi_err_o  (sys_err),
        .axi_ack_o  (sys_ack),

        .mem_addr_o (mem_addr),  //!< system bus read/write address.
        .mem_wdata_o(mem_wdata), //!< system bus write data.
        .mem_sel_o  (mem_sel),   //!< system bus write byte select.
        .mem_wen_o  (mem_wen),   //!< system bus write enable.
        .mem_ren_o  (mem_ren),   //!< system bus read enable.
        .mem_rdata_i(mem_rdata), //!< system bus read data.
        .mem_err_i  (mem_err),   //!< system bus error indicator.
        .mem_ack_i  (mem_ack)    //!< system bus acknowledge signal.

    );
`else
assign mem_addr = sys_addr;
assign mem_wdata = sys_wdata;
assign mem_sel = sys_sel;
assign mem_wen = sys_wen;
assign mem_ren = sys_ren;
assign sys_rdata = mem_rdata;
assign sys_err = mem_err;
assign sys_ack = mem_ack;
`endif

    // -----------------------------------------------------------------------
    //  mem_clk domain
    // -----------------------------------------------------------------------
    ext_mem #(.ADDR_WIDTH(ADDR_WIDTH),
              .DATA_WIDTH(DATA_WIDTH),
              .MEM_START(MEM_START),
              .MEM_SIZE(MEM_SIZE)) u_mem(

        .mem_clk_i(mem_clk_i),
        .rst_n_i(rst_n_i),

        .mem_addr_i (mem_addr),  //!< system bus read/write address.
        .mem_wdata_i(mem_wdata), //!< system bus write data.
        .mem_sel_i  (mem_sel),   //!< system bus write byte select.
        .mem_wen_i  (mem_wen),   //!< system bus write enable.
        .mem_ren_i  (mem_ren),   //!< system bus read enable.
        .mem_rdata_o(mem_rdata), //!< system bus read data.
        .mem_err_o  (mem_err),   //!< system bus error indicator.
        .mem_ack_o  (mem_ack)    //!< system bus acknowledge signal.
    );
   

endmodule
