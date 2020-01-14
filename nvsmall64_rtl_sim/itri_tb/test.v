//
//  ITRI Test Suit Interfaces
//  Coded by KC Chang, 2019 
//

`include "project.vh"             // hardware spec.
`include "itri_tb_defines.vh"

`timescale 1ns/10ps
module test;

parameter CLK_PER = 10;
//parameter MEM_PER = 55;
parameter MEM_PER = 10;

reg [15:0] parse_result;
reg start_run = 0;
integer clk_cnt;

reg clk;
reg mem_clk;
reg rst_n;

// -----------------
// global var DECL
// -----------------
reg global_clk_ovr_on;
reg tmc2slcg_disable_clock_gating;
wire direct_reset_;
reg test_mode;
reg [31:0] nvdla_pwrbus_ram_c_pd;
reg [31:0] nvdla_pwrbus_ram_ma_pd;
reg [31:0] nvdla_pwrbus_ram_mb_pd;
reg [31:0] nvdla_pwrbus_ram_p_pd;
reg [31:0] nvdla_pwrbus_ram_o_pd;
reg [31:0] nvdla_pwrbus_ram_a_pd;

// -----------------
// APB WIRE DECL
// -----------------
wire pclk;
wire prstn;
wire psel;
wire penable;
wire pwrite;
wire [31:0] paddr;
wire [31:0] pwdata;
wire [31:0] prdata;
wire pready;
wire pslverr;

// -----------------
// AXI WIRE DECL
// -----------------
wire                                      nvdla_core2dbb_aw_awvalid;
wire                                      nvdla_core2dbb_aw_awready;
wire                                [7:0] nvdla_core2dbb_aw_awid;
wire                                [3:0] nvdla_core2dbb_aw_awlen;
wire                                [2:0] nvdla_core2dbb_aw_awsize;
wire                                [1:0] nvdla_core2dbb_aw_awburst;
wire                                [2:0] nvdla_core2dbb_aw_awprot;
wire       [`NVDLA_MEM_ADDRESS_WIDTH-1:0] nvdla_core2dbb_aw_awaddr;

wire                                      nvdla_core2dbb_w_wvalid;
wire                                      nvdla_core2dbb_w_wready;
wire     [`NVDLA_PRIMARY_MEMIF_WIDTH-1:0] nvdla_core2dbb_w_wdata;
wire   [`NVDLA_PRIMARY_MEMIF_WIDTH/8-1:0] nvdla_core2dbb_w_wstrb;
wire                                      nvdla_core2dbb_w_wlast;

wire                                      nvdla_core2dbb_ar_arvalid;
wire                                      nvdla_core2dbb_ar_arready;
wire                                [7:0] nvdla_core2dbb_ar_arid;
wire                                [3:0] nvdla_core2dbb_ar_arlen;
wire                                [2:0] nvdla_core2dbb_ar_arsize;
wire                                [1:0] nvdla_core2dbb_ar_arburst;
wire                                [2:0] nvdla_core2dbb_ar_arprot;
wire       [`NVDLA_MEM_ADDRESS_WIDTH-1:0] nvdla_core2dbb_ar_araddr;

wire                                      nvdla_core2dbb_b_bvalid;
wire                                      nvdla_core2dbb_b_bready;
wire                                [7:0] nvdla_core2dbb_b_bid;

wire                                      nvdla_core2dbb_r_rvalid;
wire                                      nvdla_core2dbb_r_rready;
wire                                [7:0] nvdla_core2dbb_r_rid;
wire                                      nvdla_core2dbb_r_rlast;
wire     [`NVDLA_PRIMARY_MEMIF_WIDTH-1:0] nvdla_core2dbb_r_rdata;

`ifdef NVDLA_SECONDARY_MEMIF_ENABLE
wire                                      nvdla_core2cvsram_aw_awvalid;
wire                                      nvdla_core2cvsram_aw_awready;
wire                                [7:0] nvdla_core2cvsram_aw_awid;
wire                                [3:0] nvdla_core2cvsram_aw_awlen;
wire                                [2:0] nvdla_core2cvsram_aw_awsize;
wire                                [1:0] nvdla_core2cvsram_aw_awburst;
wire                                [2:0] nvdla_core2cvsram_aw_awprot;
wire       [`NVDLA_MEM_ADDRESS_WIDTH-1:0] nvdla_core2cvsram_aw_awaddr;

wire                                      nvdla_core2cvsram_w_wvalid;
wire                                      nvdla_core2cvsram_w_wready;
wire   [`NVDLA_SECONDARY_MEMIF_WIDTH-1:0] nvdla_core2cvsram_w_wdata;
wire [`NVDLA_SECONDARY_MEMIF_WIDTH/8-1:0] nvdla_core2cvsram_w_wstrb;
wire                                      nvdla_core2cvsram_w_wlast;

wire                                      nvdla_core2cvsram_b_bvalid;
wire                                      nvdla_core2cvsram_b_bready;
wire                                [7:0] nvdla_core2cvsram_b_bid;

wire                                      nvdla_core2cvsram_ar_arvalid;
wire                                      nvdla_core2cvsram_ar_arready;
wire                                [7:0] nvdla_core2cvsram_ar_arid;
wire                                [3:0] nvdla_core2cvsram_ar_arlen;
wire                                [2:0] nvdla_core2cvsram_ar_arsize;
wire                                [1:0] nvdla_core2cvsram_ar_arburst;
wire                                [2:0] nvdla_core2cvsram_ar_arprot;
wire       [`NVDLA_MEM_ADDRESS_WIDTH-1:0] nvdla_core2cvsram_ar_araddr;

wire                                      nvdla_core2cvsram_r_rvalid;
wire                                      nvdla_core2cvsram_r_rready;
wire                                [7:0] nvdla_core2cvsram_r_rid;
wire                                      nvdla_core2cvsram_r_rlast;
wire   [`NVDLA_SECONDARY_MEMIF_WIDTH-1:0] nvdla_core2cvsram_r_rdata;
`endif

wire nvdla_irq;
reg [1023:0] cfg_file;
wire nvdla_done;

    assign pclk = clk;
    assign prstn = rst_n;

    sequencer #(.CMD_FILE("trace_parser_cmd_seq.log")) u_seq(
        .clk_i(pclk),
        .rst_n_i(rst_n),
        .start_run_i(start_run),
        .irq_i(nvdla_irq),
        .nvdla_done_o(nvdla_done),

        .psel_o(psel),
        .penable_o(penable),
        .pwrite_o(pwrite),
        .paddr_o(paddr),
        .pwdata_o(pwdata),
        .prdata_i(prdata),
        .pready_i(pready)
    );

    axi_mem #(.ADDR_WIDTH(`NVDLA_MEM_ADDRESS_WIDTH),
              .DATA_WIDTH(`NVDLA_PRIMARY_MEMIF_WIDTH),
              .MEM_START(`DBB_ADDR_START),
              .MEM_SIZE(`DBB_MEM_SIZE)) dbb_mem(
        .axi_clk_i(clk),
        .mem_clk_i(mem_clk),
        .rst_n_i(rst_n),

        // axi write address channel
        .axi_awid_i   (nvdla_core2dbb_aw_awid),   //!< AXI write address ID
        .axi_awaddr_i (nvdla_core2dbb_aw_awaddr), //!< AXI write address
        .axi_awlen_i  (nvdla_core2dbb_aw_awlen),  //!< AXI write burst length
        .axi_awsize_i (nvdla_core2dbb_aw_awsize), //!< AXI write burst size (skip this)
        .axi_awburst_i(2'b01),                    //!< AXI write burst type
        .axi_awlock_i (2'b0),                     //!< AXI write lock type
        .axi_awcache_i(4'b0),                     //!< AXI write cache type
        .axi_awprot_i (3'b0),                     //!< AXI write protection type
        .axi_awvalid_i(nvdla_core2dbb_aw_awvalid),//!< AXI write address valid
        .axi_awready_o(nvdla_core2dbb_aw_awready),//!< AXI write ready

        // axi write data channel
        .axi_wid_i    (8'h0),                     //!< AXI write data ID (AXI-3 only)
        .axi_wdata_i  (nvdla_core2dbb_w_wdata),   //!< AXI write data
        .axi_wstrb_i  (nvdla_core2dbb_w_wstrb),   //!< AXI write strobes
        .axi_wlast_i  (nvdla_core2dbb_w_wlast),   //!< AXI write last
        .axi_wvalid_i (nvdla_core2dbb_w_wvalid),  //!< AXI write valid
        .axi_wready_o (nvdla_core2dbb_w_wready),  //!< AXI write ready

        // axi write response channel
        .axi_bid_o    (nvdla_core2dbb_b_bid),     //!< AXI write response ID
        .axi_bresp_o  (),                         //!< AXI write response (optional)
        .axi_bvalid_o (nvdla_core2dbb_b_bvalid),  //!< AXI write response valid
        .axi_bready_i (nvdla_core2dbb_b_bready),  //!< AXI write response ready

        // axi read address channel
        .axi_arid_i   (nvdla_core2dbb_ar_arid),   //!< AXI read address ID
        .axi_araddr_i (nvdla_core2dbb_ar_araddr), //!< AXI read address
        .axi_arlen_i  (nvdla_core2dbb_ar_arlen),  //!< AXI read burst length
        .axi_arsize_i (nvdla_core2dbb_ar_arsize), //!< AXI read burst size (skip this)
        .axi_arburst_i(nvdla_core2dbb_ar_arburst),//!< AXI read burst type
        .axi_arlock_i (2'b0),                     //!< AXI read lock type
        .axi_arcache_i(4'b0),                     //!< AXI read cache type
        .axi_arprot_i (nvdla_core2dbb_ar_arprot), //!< AXI read protection type
        .axi_arvalid_i(nvdla_core2dbb_ar_arvalid),//!< AXI read address valid
        .axi_arready_o(nvdla_core2dbb_ar_arready),//!< AXI read address ready

        // axi read data channel
        .axi_rid_o    (nvdla_core2dbb_r_rid),     //!< AXI read response ID
        .axi_rdata_o  (nvdla_core2dbb_r_rdata),   //!< AXI read data
        .axi_rresp_o  (),                         //!< AXI read response (optional)
        .axi_rlast_o  (nvdla_core2dbb_r_rlast),   //!< AXI read last
        .axi_rvalid_o (nvdla_core2dbb_r_rvalid),  //!< AXI read response valid
        .axi_rready_i (nvdla_core2dbb_r_rready)   //!< AXI read response ready
    );

`ifdef NVDLA_SECONDARY_MEMIF_ENABLE
    axi_mem #(.ADDR_WIDTH(`NVDLA_MEM_ADDRESS_WIDTH),
              .DATA_WIDTH(`NVDLA_PRIMARY_MEMIF_WIDTH),
              .MEM_START(`CVSRAM_ADDR_START),
              .MEM_SIZE(`CVSRAM_MEM_SIZE)) cvsram_mem(
        .axi_clk_i(clk),
        .mem_clk_i(mem_clk),
        .rst_n_i(rst_n),

        // axi write address channel
        .axi_awid_i   (nvdla_core2cvsram_aw_awid),   //!< AXI write address ID
        .axi_awaddr_i (nvdla_core2cvsram_aw_awaddr), //!< AXI write address
        .axi_awlen_i  (nvdla_core2cvsram_aw_awlen),  //!< AXI write burst length
        .axi_awsize_i (nvdla_core2cvsram_aw_awsize), //!< AXI write burst size (skip this)
        .axi_awburst_i(nvdla_core2cvsram_aw_awburst),//!< AXI write burst type
        .axi_awlock_i (2'b0),                     //!< AXI write lock type
        .axi_awcache_i(4'b0),                     //!< AXI write cache type
        .axi_awprot_i (nvdla_core2cvsram_aw_awprot), //!< AXI write protection type
        .axi_awvalid_i(nvdla_core2cvsram_aw_awvalid),//!< AXI write address valid
        .axi_awready_o(nvdla_core2cvsram_aw_awready),//!< AXI write ready

        // axi write data channel
        .axi_wid_i    (8'h0),                     //!< AXI write data ID (AXI-3 only)
        .axi_wdata_i  (nvdla_core2cvsram_w_wdata),   //!< AXI write data
        .axi_wstrb_i  (nvdla_core2cvsram_w_wstrb),   //!< AXI write strobes
        .axi_wlast_i  (nvdla_core2cvsram_w_wlast),   //!< AXI write last
        .axi_wvalid_i (nvdla_core2cvsram_w_wvalid),  //!< AXI write valid
        .axi_wready_o (nvdla_core2cvsram_w_wready),  //!< AXI write ready

        // axi write response channel
        .axi_bid_o    (nvdla_core2cvsram_b_bid),     //!< AXI write response ID
        .axi_bresp_o  (),                         //!< AXI write response (optional)
        .axi_bvalid_o (nvdla_core2cvsram_b_bvalid),  //!< AXI write response valid
        .axi_bready_i (nvdla_core2cvsram_b_bready),  //!< AXI write response ready

        // axi read address channel
        .axi_arid_i   (nvdla_core2cvsram_ar_arid),   //!< AXI read address ID
        .axi_araddr_i (nvdla_core2cvsram_ar_araddr), //!< AXI read address
        .axi_arlen_i  (nvdla_core2cvsram_ar_arlen),  //!< AXI read burst length
        .axi_arsize_i (nvdla_core2cvsram_ar_arsize), //!< AXI read burst size (skip this)
        .axi_arburst_i(nvdla_core2cvsram_ar_arburst),//!< AXI read burst type
        .axi_arlock_i (2'b0),                     //!< AXI read lock type
        .axi_arcache_i(4'b0),                     //!< AXI read cache type
        .axi_arprot_i (nvdla_core2cvsram_ar_arprot), //!< AXI read protection type
        .axi_arvalid_i(nvdla_core2cvsram_ar_arvalid),//!< AXI read address valid
        .axi_arready_o(nvdla_core2cvsram_ar_arready),//!< AXI read address ready

        // axi read data channel
        .axi_rid_o    (nvdla_core2cvsram_r_rid),     //!< AXI read response ID
        .axi_rdata_o  (nvdla_core2cvsram_r_rdata),   //!< AXI read data
        .axi_rresp_o  (),                         //!< AXI read response (optional)
        .axi_rlast_o  (nvdla_core2cvsram_r_rlast),   //!< AXI read last
        .axi_rvalid_o (nvdla_core2cvsram_r_rvalid),  //!< AXI read response valid
        .axi_rready_i (nvdla_core2cvsram_r_rready)   //!< AXI read response ready
    );
`endif

    NV_nvdla DUT(
        .dla_core_clk(clk),
`ifdef NV_SMALL_64
        .dla_csb_clk(clk),
`endif
        .global_clk_ovr_on(global_clk_ovr_on),
        .tmc2slcg_disable_clock_gating(tmc2slcg_disable_clock_gating),
        .dla_reset_rstn(rst_n),
        .direct_reset_(direct_reset_),
        .test_mode(test_mode),

        .dla_intr(nvdla_irq),

        .pclk(pclk),
        .prstn(prstn),
        .psel(psel),
        .penable(penable),
        .pwrite(pwrite),
        .paddr(paddr),
        .pwdata(pwdata),
        .prdata(prdata),
        .pready(pready),
`ifndef NV_SMALL_64
        .pslverr(pslverr),
`endif

        .nvdla_core2dbb_aw_awvalid(nvdla_core2dbb_aw_awvalid),
        .nvdla_core2dbb_aw_awready(nvdla_core2dbb_aw_awready),
        .nvdla_core2dbb_aw_awid(nvdla_core2dbb_aw_awid),
        .nvdla_core2dbb_aw_awlen(nvdla_core2dbb_aw_awlen),
`ifndef NV_SMALL_64
        .nvdla_core2dbb_aw_awsize(nvdla_core2dbb_aw_awsize),
        .nvdla_core2dbb_aw_awburst(nvdla_core2dbb_aw_awburst),
        .nvdla_core2dbb_aw_awprot(nvdla_core2dbb_aw_awprot),
`endif
        .nvdla_core2dbb_aw_awaddr(nvdla_core2dbb_aw_awaddr),
        .nvdla_core2dbb_w_wvalid(nvdla_core2dbb_w_wvalid),
        .nvdla_core2dbb_w_wready(nvdla_core2dbb_w_wready),
        .nvdla_core2dbb_w_wdata(nvdla_core2dbb_w_wdata),
        .nvdla_core2dbb_w_wstrb(nvdla_core2dbb_w_wstrb),
        .nvdla_core2dbb_w_wlast(nvdla_core2dbb_w_wlast),
        .nvdla_core2dbb_ar_arvalid(nvdla_core2dbb_ar_arvalid),
        .nvdla_core2dbb_ar_arready(nvdla_core2dbb_ar_arready),
        .nvdla_core2dbb_ar_arid(nvdla_core2dbb_ar_arid),
        .nvdla_core2dbb_ar_arlen(nvdla_core2dbb_ar_arlen),
`ifndef NV_SMALL_64
        .nvdla_core2dbb_ar_arsize(nvdla_core2dbb_ar_arsize),
        .nvdla_core2dbb_ar_arburst(nvdla_core2dbb_ar_arburst),
        .nvdla_core2dbb_ar_arprot(nvdla_core2dbb_ar_arprot),
`endif
        .nvdla_core2dbb_ar_araddr(nvdla_core2dbb_ar_araddr),
        .nvdla_core2dbb_b_bvalid(nvdla_core2dbb_b_bvalid),
        .nvdla_core2dbb_b_bready(nvdla_core2dbb_b_bready),
        .nvdla_core2dbb_b_bid(nvdla_core2dbb_b_bid),
        .nvdla_core2dbb_r_rvalid(nvdla_core2dbb_r_rvalid),
        .nvdla_core2dbb_r_rready(nvdla_core2dbb_r_rready),
        .nvdla_core2dbb_r_rid(nvdla_core2dbb_r_rid),
        .nvdla_core2dbb_r_rlast(nvdla_core2dbb_r_rlast),
        .nvdla_core2dbb_r_rdata(nvdla_core2dbb_r_rdata),

`ifdef NVDLA_SECONDARY_MEMIF_ENABLE
        .nvdla_core2cvsram_aw_awvalid(nvdla_core2cvsram_aw_awvalid),
        .nvdla_core2cvsram_aw_awready(nvdla_core2cvsram_aw_awready),
        .nvdla_core2cvsram_aw_awid(nvdla_core2cvsram_aw_awid),
        .nvdla_core2cvsram_aw_awlen(nvdla_core2cvsram_aw_awlen),
        .nvdla_core2cvsram_aw_awsize(nvdla_core2cvsram_aw_awsize),
        .nvdla_core2cvsram_aw_awburst(nvdla_core2cvsram_aw_awburst),
        .nvdla_core2cvsram_aw_awprot(nvdla_core2cvsram_aw_awprot),
        .nvdla_core2cvsram_aw_awaddr(nvdla_core2cvsram_aw_awaddr),
        .nvdla_core2cvsram_w_wvalid(nvdla_core2cvsram_w_wvalid),
        .nvdla_core2cvsram_w_wready(nvdla_core2cvsram_w_wready),
        .nvdla_core2cvsram_w_wdata(nvdla_core2cvsram_w_wdata),
        .nvdla_core2cvsram_w_wstrb(nvdla_core2cvsram_w_wstrb),
        .nvdla_core2cvsram_w_wlast(nvdla_core2cvsram_w_wlast),
        .nvdla_core2cvsram_ar_arvalid(nvdla_core2cvsram_ar_arvalid),
        .nvdla_core2cvsram_ar_arready(nvdla_core2cvsram_ar_arready),
        .nvdla_core2cvsram_ar_arid(nvdla_core2cvsram_ar_arid),
        .nvdla_core2cvsram_ar_arlen(nvdla_core2cvsram_ar_arlen),
        .nvdla_core2cvsram_ar_arsize(nvdla_core2cvsram_ar_arsize),
        .nvdla_core2cvsram_ar_arburst(nvdla_core2cvsram_ar_arburst),
        .nvdla_core2cvsram_ar_arprot(nvdla_core2cvsram_ar_arprot),
        .nvdla_core2cvsram_ar_araddr(nvdla_core2cvsram_ar_araddr),
        .nvdla_core2cvsram_b_bvalid(nvdla_core2cvsram_b_bvalid),
        .nvdla_core2cvsram_b_bready(nvdla_core2cvsram_b_bready),
        .nvdla_core2cvsram_b_bid(nvdla_core2cvsram_b_bid),
        .nvdla_core2cvsram_r_rvalid(nvdla_core2cvsram_r_rvalid),
        .nvdla_core2cvsram_r_rready(nvdla_core2cvsram_r_rready),
        .nvdla_core2cvsram_r_rid(nvdla_core2cvsram_r_rid),
        .nvdla_core2cvsram_r_rlast(nvdla_core2cvsram_r_rlast),
        .nvdla_core2cvsram_r_rdata(nvdla_core2cvsram_r_rdata),
`endif

        .nvdla_pwrbus_ram_c_pd(nvdla_pwrbus_ram_c_pd),
        .nvdla_pwrbus_ram_ma_pd(nvdla_pwrbus_ram_ma_pd),
        .nvdla_pwrbus_ram_mb_pd(nvdla_pwrbus_ram_mb_pd),
        .nvdla_pwrbus_ram_p_pd(nvdla_pwrbus_ram_p_pd),
        .nvdla_pwrbus_ram_o_pd(nvdla_pwrbus_ram_o_pd),
        .nvdla_pwrbus_ram_a_pd(nvdla_pwrbus_ram_a_pd)
    );

`ifdef NV_SMALL_64
assign pslverr = 1'b0;
assign nvdla_core2dbb_ar_arsize = 3'b011;
assign nvdla_core2dbb_aw_awsize = 3'b011;
`endif

always #(CLK_PER/2) clk = ~clk;
always #(MEM_PER/2) mem_clk = ~mem_clk;

always @(posedge clk)
begin
    if (!rst_n)
        clk_cnt <= 0;
    else
        clk_cnt <= clk_cnt + 1;
end

assign direct_reset_ = rst_n;

initial
begin

    $value$plusargs("CFG_FILE=%s", cfg_file);
    $display("CFG_file=%s",cfg_file);

    $parse_cfg(cfg_file);

    // DUMP FSDB
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;

    // ------------------------------------------
    //  global input setting
    // ------------------------------------------
    global_clk_ovr_on = 0;
    tmc2slcg_disable_clock_gating = 0;
    test_mode = 0;
    nvdla_pwrbus_ram_c_pd = 0;
    nvdla_pwrbus_ram_ma_pd = 0;
    nvdla_pwrbus_ram_mb_pd = 0;
    nvdla_pwrbus_ram_p_pd = 0;
    nvdla_pwrbus_ram_o_pd = 0;
    nvdla_pwrbus_ram_a_pd = 0;

    // ------------------------------------------
    //  start
    // ------------------------------------------
    clk = 0;
    mem_clk = 0;
    rst_n = 0;

    #(MEM_PER * 10);
    rst_n = 1;

    #(MEM_PER * 10);    // wait for nvdla_falcon_rstn


    start_run = 1;

    wait(nvdla_done);

    $display("nvdla_done! Cycle = %d", clk_cnt);
//    #(MEM_PER * 10000000);
    #(MEM_PER * 10000);

    $finish;
end

endmodule
