// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_MCIF_READ_eg_s.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_MCIF_define.h
`include "simulate_x_tick.vh"
module NV_NVDLA_MCIF_READ_eg_s (
   nvdla_core_clk //|< i
  ,nvdla_core_rstn //|< i
  ,cq_rd0_pd //|< i
  ,cq_rd0_pvld //|< i
  ,cq_rd1_pd //|< i
  ,cq_rd1_pvld //|< i
  ,cq_rd2_pd //|< i
  ,cq_rd2_pvld //|< i
  ,cq_rd3_pd //|< i
  ,cq_rd3_pvld //|< i
  ,cq_rd4_pd //|< i
  ,cq_rd4_pvld //|< i
  ,cq_rd5_pd //|< i
  ,cq_rd5_pvld //|< i
  ,cq_rd6_pd //|< i
  ,cq_rd6_pvld //|< i
  ,cq_rd7_pd //|< i
  ,cq_rd7_pvld //|< i
  ,cq_rd8_pd //|< i
  ,cq_rd8_pvld //|< i
  ,cq_rd9_pd //|< i
  ,cq_rd9_pvld //|< i
  ,mcif2bdma_rd_rsp_ready //|< i
  ,mcif2cdma_dat_rd_rsp_ready //|< i
  ,mcif2cdma_wt_rd_rsp_ready //|< i
  ,mcif2cdp_rd_rsp_ready //|< i
  ,mcif2pdp_rd_rsp_ready //|< i
  ,mcif2rbk_rd_rsp_ready //|< i
  ,noc2mcif_axi_r_rdata //|< i
  ,noc2mcif_axi_r_rid //|< i
  ,noc2mcif_axi_r_rlast //|< i
  ,noc2mcif_axi_r_rvalid //|< i
  ,pwrbus_ram_pd //|< i
  ,cq_rd0_prdy //|> o
  ,cq_rd1_prdy //|> o
  ,cq_rd2_prdy //|> o
  ,cq_rd3_prdy //|> o
  ,cq_rd4_prdy //|> o
  ,cq_rd5_prdy //|> o
  ,cq_rd6_prdy //|> o
  ,cq_rd7_prdy //|> o
  ,cq_rd8_prdy //|> o
  ,cq_rd9_prdy //|> o
  ,eg2ig_axi_vld //|> o
  ,mcif2bdma_rd_rsp_pd //|> o
  ,mcif2bdma_rd_rsp_valid //|> o
  ,mcif2cdma_dat_rd_rsp_pd //|> o
  ,mcif2cdma_dat_rd_rsp_valid //|> o
  ,mcif2cdma_wt_rd_rsp_pd //|> o
  ,mcif2cdma_wt_rd_rsp_valid //|> o
  ,mcif2cdp_rd_rsp_pd //|> o
  ,mcif2cdp_rd_rsp_valid //|> o
  ,mcif2pdp_rd_rsp_pd //|> o
  ,mcif2pdp_rd_rsp_valid //|> o
  ,mcif2rbk_rd_rsp_pd //|> o
  ,mcif2rbk_rd_rsp_valid //|> o
  ,mcif2sdp_b_rd_rsp_pd //|> o
  ,mcif2sdp_b_rd_rsp_valid //|> o
  ,mcif2sdp_b_rd_rsp_ready //|< i
  ,mcif2sdp_n_rd_rsp_pd //|> o
  ,mcif2sdp_n_rd_rsp_valid //|> o
  ,mcif2sdp_n_rd_rsp_ready //|< i
  ,mcif2sdp_rd_rsp_pd //|> o
  ,mcif2sdp_rd_rsp_valid //|> o
  ,mcif2sdp_rd_rsp_ready //|< i
  ,noc2mcif_axi_r_rready //|> o
  );
/////////////////////////////////////////////////////////////////////////
//
// NV_NVDLA_MCIF_READ_eg_ports.v
//
input nvdla_core_clk;
input nvdla_core_rstn;
output mcif2sdp_rd_rsp_valid; /* data valid */
input mcif2sdp_rd_rsp_ready; /* data return handshake */
output [64 +1 -1:0] mcif2sdp_rd_rsp_pd;
output mcif2sdp_b_rd_rsp_valid; /* data valid */
input mcif2sdp_b_rd_rsp_ready; /* data return handshake */
output [64 +1 -1:0] mcif2sdp_b_rd_rsp_pd;
output mcif2sdp_n_rd_rsp_valid; /* data valid */
input mcif2sdp_n_rd_rsp_ready; /* data return handshake */
output [64 +1 -1:0] mcif2sdp_n_rd_rsp_pd;
output mcif2cdp_rd_rsp_valid; /* data valid */
input mcif2cdp_rd_rsp_ready; /* data return handshake */
output [64 +1 -1:0] mcif2cdp_rd_rsp_pd;
output mcif2pdp_rd_rsp_valid; /* data valid */
input mcif2pdp_rd_rsp_ready; /* data return handshake */
output [64 +1 -1:0] mcif2pdp_rd_rsp_pd;
output mcif2bdma_rd_rsp_valid; /* data valid */
input mcif2bdma_rd_rsp_ready; /* data return handshake */
output [64 +1 -1:0] mcif2bdma_rd_rsp_pd;
output mcif2rbk_rd_rsp_valid; /* data valid */
input mcif2rbk_rd_rsp_ready; /* data return handshake */
output [64 +1 -1:0] mcif2rbk_rd_rsp_pd;
output mcif2cdma_wt_rd_rsp_valid; /* data valid */
input mcif2cdma_wt_rd_rsp_ready; /* data return handshake */
output [64 +1 -1:0] mcif2cdma_wt_rd_rsp_pd;
output mcif2cdma_dat_rd_rsp_valid; /* data valid */
input mcif2cdma_dat_rd_rsp_ready; /* data return handshake */
output [64 +1 -1:0] mcif2cdma_dat_rd_rsp_pd;
//: foreach my $i (0..9) {
//: print qq(
//: input cq_rd${i}_pvld;
//: output cq_rd${i}_prdy;
//: input [6:0] cq_rd${i}_pd;
//: );
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

input cq_rd0_pvld;
output cq_rd0_prdy;
input [6:0] cq_rd0_pd;

input cq_rd1_pvld;
output cq_rd1_prdy;
input [6:0] cq_rd1_pd;

input cq_rd2_pvld;
output cq_rd2_prdy;
input [6:0] cq_rd2_pd;

input cq_rd3_pvld;
output cq_rd3_prdy;
input [6:0] cq_rd3_pd;

input cq_rd4_pvld;
output cq_rd4_prdy;
input [6:0] cq_rd4_pd;

input cq_rd5_pvld;
output cq_rd5_prdy;
input [6:0] cq_rd5_pd;

input cq_rd6_pvld;
output cq_rd6_prdy;
input [6:0] cq_rd6_pd;

input cq_rd7_pvld;
output cq_rd7_prdy;
input [6:0] cq_rd7_pd;

input cq_rd8_pvld;
output cq_rd8_prdy;
input [6:0] cq_rd8_pd;

input cq_rd9_pvld;
output cq_rd9_prdy;
input [6:0] cq_rd9_pd;

//| eperl: generated_end (DO NOT EDIT ABOVE)
input noc2mcif_axi_r_rvalid;
output noc2mcif_axi_r_rready;
input [7:0] noc2mcif_axi_r_rid;
input noc2mcif_axi_r_rlast;
input [64 -1:0] noc2mcif_axi_r_rdata;
input [31:0] pwrbus_ram_pd;
output eg2ig_axi_vld;
/////////////////////////////////////////////////////////////////////////
reg [1:0] arb_cnt;
reg [6:0] arb_cq_pd;
//: my $mcbw = 64;
//: foreach my $i (0..9) {
//: print qq(
//: reg [1:0] ctt${i}_cnt;
//: reg [6:0] ctt${i}_cq_pd;
//: reg ctt${i}_vld;
//: wire ctt${i}_accept;
//: wire ctt${i}_last_beat;
//: wire ctt${i}_rdy;
//: wire [$mcbw-1:0] rq${i}_rd_pd;
//: wire rq${i}_rd_prdy;
//: wire rq${i}_rd_pvld;
//: wire [$mcbw-1:0] rq${i}_wr_pd;
//: wire rq${i}_wr_prdy;
//: wire rq${i}_wr_pvld;
//: wire src${i}_gnt;
//: wire src${i}_req;
//: wire ro${i}_wr_rdy;
//: );
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

reg [1:0] ctt0_cnt;
reg [6:0] ctt0_cq_pd;
reg ctt0_vld;
wire ctt0_accept;
wire ctt0_last_beat;
wire ctt0_rdy;
wire [64-1:0] rq0_rd_pd;
wire rq0_rd_prdy;
wire rq0_rd_pvld;
wire [64-1:0] rq0_wr_pd;
wire rq0_wr_prdy;
wire rq0_wr_pvld;
wire src0_gnt;
wire src0_req;
wire ro0_wr_rdy;

reg [1:0] ctt1_cnt;
reg [6:0] ctt1_cq_pd;
reg ctt1_vld;
wire ctt1_accept;
wire ctt1_last_beat;
wire ctt1_rdy;
wire [64-1:0] rq1_rd_pd;
wire rq1_rd_prdy;
wire rq1_rd_pvld;
wire [64-1:0] rq1_wr_pd;
wire rq1_wr_prdy;
wire rq1_wr_pvld;
wire src1_gnt;
wire src1_req;
wire ro1_wr_rdy;

reg [1:0] ctt2_cnt;
reg [6:0] ctt2_cq_pd;
reg ctt2_vld;
wire ctt2_accept;
wire ctt2_last_beat;
wire ctt2_rdy;
wire [64-1:0] rq2_rd_pd;
wire rq2_rd_prdy;
wire rq2_rd_pvld;
wire [64-1:0] rq2_wr_pd;
wire rq2_wr_prdy;
wire rq2_wr_pvld;
wire src2_gnt;
wire src2_req;
wire ro2_wr_rdy;

reg [1:0] ctt3_cnt;
reg [6:0] ctt3_cq_pd;
reg ctt3_vld;
wire ctt3_accept;
wire ctt3_last_beat;
wire ctt3_rdy;
wire [64-1:0] rq3_rd_pd;
wire rq3_rd_prdy;
wire rq3_rd_pvld;
wire [64-1:0] rq3_wr_pd;
wire rq3_wr_prdy;
wire rq3_wr_pvld;
wire src3_gnt;
wire src3_req;
wire ro3_wr_rdy;

reg [1:0] ctt4_cnt;
reg [6:0] ctt4_cq_pd;
reg ctt4_vld;
wire ctt4_accept;
wire ctt4_last_beat;
wire ctt4_rdy;
wire [64-1:0] rq4_rd_pd;
wire rq4_rd_prdy;
wire rq4_rd_pvld;
wire [64-1:0] rq4_wr_pd;
wire rq4_wr_prdy;
wire rq4_wr_pvld;
wire src4_gnt;
wire src4_req;
wire ro4_wr_rdy;

reg [1:0] ctt5_cnt;
reg [6:0] ctt5_cq_pd;
reg ctt5_vld;
wire ctt5_accept;
wire ctt5_last_beat;
wire ctt5_rdy;
wire [64-1:0] rq5_rd_pd;
wire rq5_rd_prdy;
wire rq5_rd_pvld;
wire [64-1:0] rq5_wr_pd;
wire rq5_wr_prdy;
wire rq5_wr_pvld;
wire src5_gnt;
wire src5_req;
wire ro5_wr_rdy;

reg [1:0] ctt6_cnt;
reg [6:0] ctt6_cq_pd;
reg ctt6_vld;
wire ctt6_accept;
wire ctt6_last_beat;
wire ctt6_rdy;
wire [64-1:0] rq6_rd_pd;
wire rq6_rd_prdy;
wire rq6_rd_pvld;
wire [64-1:0] rq6_wr_pd;
wire rq6_wr_prdy;
wire rq6_wr_pvld;
wire src6_gnt;
wire src6_req;
wire ro6_wr_rdy;

reg [1:0] ctt7_cnt;
reg [6:0] ctt7_cq_pd;
reg ctt7_vld;
wire ctt7_accept;
wire ctt7_last_beat;
wire ctt7_rdy;
wire [64-1:0] rq7_rd_pd;
wire rq7_rd_prdy;
wire rq7_rd_pvld;
wire [64-1:0] rq7_wr_pd;
wire rq7_wr_prdy;
wire rq7_wr_pvld;
wire src7_gnt;
wire src7_req;
wire ro7_wr_rdy;

reg [1:0] ctt8_cnt;
reg [6:0] ctt8_cq_pd;
reg ctt8_vld;
wire ctt8_accept;
wire ctt8_last_beat;
wire ctt8_rdy;
wire [64-1:0] rq8_rd_pd;
wire rq8_rd_prdy;
wire rq8_rd_pvld;
wire [64-1:0] rq8_wr_pd;
wire rq8_wr_prdy;
wire rq8_wr_pvld;
wire src8_gnt;
wire src8_req;
wire ro8_wr_rdy;

reg [1:0] ctt9_cnt;
reg [6:0] ctt9_cq_pd;
reg ctt9_vld;
wire ctt9_accept;
wire ctt9_last_beat;
wire ctt9_rdy;
wire [64-1:0] rq9_rd_pd;
wire rq9_rd_prdy;
wire rq9_rd_pvld;
wire [64-1:0] rq9_wr_pd;
wire rq9_wr_prdy;
wire rq9_wr_pvld;
wire src9_gnt;
wire src9_req;
wire ro9_wr_rdy;

//| eperl: generated_end (DO NOT EDIT ABOVE)
wire [1:0] arb_cq_lens;
wire arb_last_beat;
wire [3:0] ipipe_axi_axid;
wire [64 -1:0] ipipe_axi_data;
wire ipipe_axi_rdy;
wire [67:0] noc2mcif_axi_r_pd;
wire [64 -1:0] rq_wr_pd;
/////////////////////////////////////////////////////////////////////////
//assign noc2mcif_axi_r_rlast_NC = noc2mcif_axi_r_rlast;
//assign noc2mcif_axi_r_rid_NC = noc2mcif_axi_r_rid[7:3];
assign noc2mcif_axi_r_pd = {noc2mcif_axi_r_rid[3:0],noc2mcif_axi_r_rdata};
//: my $k = (64 +4);
//: &eperl::pipe(" -wid $k -os -do ipipe_axi_pd -vo ipipe_axi_vld -ri ipipe_axi_rdy -di noc2mcif_axi_r_pd -vi noc2mcif_axi_r_rvalid -ro noc2mcif_axi_r_rready ");
//| eperl: generated_beg (DO NOT EDIT BELOW)
// Reg
reg pipe_noc2mcif_axi_r_rvalid;
reg [68-1:0] pipe_noc2mcif_axi_r_pd;
reg pipe_noc2mcif_axi_r_rready;
reg skid_flop_pipe_noc2mcif_axi_r_rready;
reg skid_flop_pipe_noc2mcif_axi_r_rvalid;
reg [68-1:0] skid_flop_pipe_noc2mcif_axi_r_pd;
// Wire
wire noc2mcif_axi_r_rready;
wire skid_pipe_noc2mcif_axi_r_rvalid;
wire [68-1:0] skid_pipe_noc2mcif_axi_r_pd;
wire skid_pipe_noc2mcif_axi_r_rready;
wire ipipe_axi_vld;
wire [68-1:0] ipipe_axi_pd;
// Code
// PIPE READY
assign noc2mcif_axi_r_rready = pipe_noc2mcif_axi_r_rready || !pipe_noc2mcif_axi_r_rvalid;

// PIPE VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        pipe_noc2mcif_axi_r_rvalid <= 1'b0;
    end else begin
        if (noc2mcif_axi_r_rready) begin
            pipe_noc2mcif_axi_r_rvalid <= noc2mcif_axi_r_rvalid;
        end
    end
end

// PIPE DATA
always @(posedge nvdla_core_clk) begin
    if (noc2mcif_axi_r_rready && noc2mcif_axi_r_rvalid) begin
        pipe_noc2mcif_axi_r_pd[68-1:0] <= noc2mcif_axi_r_pd[68-1:0];
    end
end


// SKID READY
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       pipe_noc2mcif_axi_r_rready <= 1'b1;
       skid_flop_pipe_noc2mcif_axi_r_rready <= 1'b1;
   end else begin
       pipe_noc2mcif_axi_r_rready <= skid_pipe_noc2mcif_axi_r_rready;
       skid_flop_pipe_noc2mcif_axi_r_rready <= skid_pipe_noc2mcif_axi_r_rready;
   end
end

// SKID VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        skid_flop_pipe_noc2mcif_axi_r_rvalid <= 1'b0;
    end else begin
        if (skid_flop_pipe_noc2mcif_axi_r_rready) begin
            skid_flop_pipe_noc2mcif_axi_r_rvalid <= pipe_noc2mcif_axi_r_rvalid;
        end
   end
end
assign skid_pipe_noc2mcif_axi_r_rvalid = (skid_flop_pipe_noc2mcif_axi_r_rready) ? pipe_noc2mcif_axi_r_rvalid : skid_flop_pipe_noc2mcif_axi_r_rvalid;

// SKID DATA
always @(posedge nvdla_core_clk) begin
    if (skid_flop_pipe_noc2mcif_axi_r_rready & pipe_noc2mcif_axi_r_rvalid) begin
        skid_flop_pipe_noc2mcif_axi_r_pd[68-1:0] <= pipe_noc2mcif_axi_r_pd[68-1:0];
    end
end
assign skid_pipe_noc2mcif_axi_r_pd[68-1:0] = (skid_flop_pipe_noc2mcif_axi_r_rready) ? pipe_noc2mcif_axi_r_pd[68-1:0] : skid_flop_pipe_noc2mcif_axi_r_pd[68-1:0];


// PIPE OUTPUT
assign skid_pipe_noc2mcif_axi_r_rready = ipipe_axi_rdy;
assign ipipe_axi_vld = skid_pipe_noc2mcif_axi_r_rvalid;
assign ipipe_axi_pd = skid_pipe_noc2mcif_axi_r_pd;

//| eperl: generated_end (DO NOT EDIT ABOVE)
assign eg2ig_axi_vld = ipipe_axi_vld & ipipe_axi_rdy;
assign {ipipe_axi_axid,ipipe_axi_data} = ipipe_axi_pd;
assign rq_wr_pd = ipipe_axi_data;
// RFIFO WRITe side
//assign ipipe_axi_rdy = (rq9_wr_pvld & rq9_wr_prdy)| (rq8_wr_pvld & rq8_wr_prdy)| (rq7_wr_pvld & rq7_wr_prdy)| (rq6_wr_pvld & rq6_wr_prdy)| (rq5_wr_pvld & rq5_wr_prdy)| (rq4_wr_pvld & rq4_wr_prdy)| (rq3_wr_pvld & rq3_wr_prdy)| (rq2_wr_pvld & rq2_wr_prdy)| (rq1_wr_pvld & rq1_wr_prdy)| (rq0_wr_pvld & rq0_wr_prdy);
assign ipipe_axi_rdy = rq9_wr_prdy| rq8_wr_prdy| rq7_wr_prdy| rq6_wr_prdy| rq5_wr_prdy| rq4_wr_prdy| rq3_wr_prdy| rq2_wr_prdy| rq1_wr_prdy| rq0_wr_prdy;
//: foreach my $i (0..9) {
//: print qq(
//: assign rq${i}_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == ${i});
//: assign rq${i}_wr_pd = rq_wr_pd;
//:
//: NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo${i} (
//: .nvdla_core_clk (nvdla_core_clk)
//: ,.nvdla_core_rstn (nvdla_core_rstn)
//: ,.rq_wr_prdy (rq${i}_wr_prdy)
//: ,.rq_wr_pvld (rq${i}_wr_pvld)
//: ,.rq_wr_pd (rq${i}_wr_pd)
//: ,.rq_rd_prdy (rq${i}_rd_prdy)
//: ,.rq_rd_pvld (rq${i}_rd_pvld)
//: ,.rq_rd_pd (rq${i}_rd_pd)
//: ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
//: );
//:
//: assign src${i}_req = rq${i}_rd_pvld & ctt${i}_vld & ro${i}_wr_rdy;
//: assign ctt${i}_rdy = src${i}_gnt;
//: assign rq${i}_rd_prdy = src${i}_gnt;
//: );
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

assign rq0_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == 0);
assign rq0_wr_pd = rq_wr_pd;

NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo0 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.rq_wr_prdy (rq0_wr_prdy)
,.rq_wr_pvld (rq0_wr_pvld)
,.rq_wr_pd (rq0_wr_pd)
,.rq_rd_prdy (rq0_rd_prdy)
,.rq_rd_pvld (rq0_rd_pvld)
,.rq_rd_pd (rq0_rd_pd)
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
);

assign src0_req = rq0_rd_pvld & ctt0_vld & ro0_wr_rdy;
assign ctt0_rdy = src0_gnt;
assign rq0_rd_prdy = src0_gnt;

assign rq1_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == 1);
assign rq1_wr_pd = rq_wr_pd;

NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo1 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.rq_wr_prdy (rq1_wr_prdy)
,.rq_wr_pvld (rq1_wr_pvld)
,.rq_wr_pd (rq1_wr_pd)
,.rq_rd_prdy (rq1_rd_prdy)
,.rq_rd_pvld (rq1_rd_pvld)
,.rq_rd_pd (rq1_rd_pd)
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
);

assign src1_req = rq1_rd_pvld & ctt1_vld & ro1_wr_rdy;
assign ctt1_rdy = src1_gnt;
assign rq1_rd_prdy = src1_gnt;

assign rq2_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == 2);
assign rq2_wr_pd = rq_wr_pd;

NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo2 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.rq_wr_prdy (rq2_wr_prdy)
,.rq_wr_pvld (rq2_wr_pvld)
,.rq_wr_pd (rq2_wr_pd)
,.rq_rd_prdy (rq2_rd_prdy)
,.rq_rd_pvld (rq2_rd_pvld)
,.rq_rd_pd (rq2_rd_pd)
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
);

assign src2_req = rq2_rd_pvld & ctt2_vld & ro2_wr_rdy;
assign ctt2_rdy = src2_gnt;
assign rq2_rd_prdy = src2_gnt;

assign rq3_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == 3);
assign rq3_wr_pd = rq_wr_pd;

NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo3 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.rq_wr_prdy (rq3_wr_prdy)
,.rq_wr_pvld (rq3_wr_pvld)
,.rq_wr_pd (rq3_wr_pd)
,.rq_rd_prdy (rq3_rd_prdy)
,.rq_rd_pvld (rq3_rd_pvld)
,.rq_rd_pd (rq3_rd_pd)
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
);

assign src3_req = rq3_rd_pvld & ctt3_vld & ro3_wr_rdy;
assign ctt3_rdy = src3_gnt;
assign rq3_rd_prdy = src3_gnt;

assign rq4_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == 4);
assign rq4_wr_pd = rq_wr_pd;

NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo4 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.rq_wr_prdy (rq4_wr_prdy)
,.rq_wr_pvld (rq4_wr_pvld)
,.rq_wr_pd (rq4_wr_pd)
,.rq_rd_prdy (rq4_rd_prdy)
,.rq_rd_pvld (rq4_rd_pvld)
,.rq_rd_pd (rq4_rd_pd)
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
);

assign src4_req = rq4_rd_pvld & ctt4_vld & ro4_wr_rdy;
assign ctt4_rdy = src4_gnt;
assign rq4_rd_prdy = src4_gnt;

assign rq5_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == 5);
assign rq5_wr_pd = rq_wr_pd;

NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo5 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.rq_wr_prdy (rq5_wr_prdy)
,.rq_wr_pvld (rq5_wr_pvld)
,.rq_wr_pd (rq5_wr_pd)
,.rq_rd_prdy (rq5_rd_prdy)
,.rq_rd_pvld (rq5_rd_pvld)
,.rq_rd_pd (rq5_rd_pd)
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
);

assign src5_req = rq5_rd_pvld & ctt5_vld & ro5_wr_rdy;
assign ctt5_rdy = src5_gnt;
assign rq5_rd_prdy = src5_gnt;

assign rq6_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == 6);
assign rq6_wr_pd = rq_wr_pd;

NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo6 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.rq_wr_prdy (rq6_wr_prdy)
,.rq_wr_pvld (rq6_wr_pvld)
,.rq_wr_pd (rq6_wr_pd)
,.rq_rd_prdy (rq6_rd_prdy)
,.rq_rd_pvld (rq6_rd_pvld)
,.rq_rd_pd (rq6_rd_pd)
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
);

assign src6_req = rq6_rd_pvld & ctt6_vld & ro6_wr_rdy;
assign ctt6_rdy = src6_gnt;
assign rq6_rd_prdy = src6_gnt;

assign rq7_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == 7);
assign rq7_wr_pd = rq_wr_pd;

NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo7 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.rq_wr_prdy (rq7_wr_prdy)
,.rq_wr_pvld (rq7_wr_pvld)
,.rq_wr_pd (rq7_wr_pd)
,.rq_rd_prdy (rq7_rd_prdy)
,.rq_rd_pvld (rq7_rd_pvld)
,.rq_rd_pd (rq7_rd_pd)
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
);

assign src7_req = rq7_rd_pvld & ctt7_vld & ro7_wr_rdy;
assign ctt7_rdy = src7_gnt;
assign rq7_rd_prdy = src7_gnt;

assign rq8_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == 8);
assign rq8_wr_pd = rq_wr_pd;

NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo8 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.rq_wr_prdy (rq8_wr_prdy)
,.rq_wr_pvld (rq8_wr_pvld)
,.rq_wr_pd (rq8_wr_pd)
,.rq_rd_prdy (rq8_rd_prdy)
,.rq_rd_pvld (rq8_rd_pvld)
,.rq_rd_pd (rq8_rd_pd)
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
);

assign src8_req = rq8_rd_pvld & ctt8_vld & ro8_wr_rdy;
assign ctt8_rdy = src8_gnt;
assign rq8_rd_prdy = src8_gnt;

assign rq9_wr_pvld = ipipe_axi_vld & (ipipe_axi_axid == 9);
assign rq9_wr_pd = rq_wr_pd;

NV_NVDLA_MCIF_READ_EG_lat_fifo lat_fifo9 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.rq_wr_prdy (rq9_wr_prdy)
,.rq_wr_pvld (rq9_wr_pvld)
,.rq_wr_pd (rq9_wr_pd)
,.rq_rd_prdy (rq9_rd_prdy)
,.rq_rd_pvld (rq9_rd_pvld)
,.rq_rd_pd (rq9_rd_pd)
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
);

assign src9_req = rq9_rd_pvld & ctt9_vld & ro9_wr_rdy;
assign ctt9_rdy = src9_gnt;
assign rq9_rd_prdy = src9_gnt;

//| eperl: generated_end (DO NOT EDIT ABOVE)
/////////////////////////////////////////////////////////
assign ro0_wr_rdy = mcif2bdma_rd_rsp_ready;
assign ro1_wr_rdy = mcif2sdp_rd_rsp_ready;
assign ro2_wr_rdy = mcif2pdp_rd_rsp_ready;
assign ro3_wr_rdy = mcif2cdp_rd_rsp_ready;
assign ro4_wr_rdy = mcif2rbk_rd_rsp_ready;
assign ro5_wr_rdy = mcif2sdp_b_rd_rsp_ready;
assign ro6_wr_rdy = mcif2sdp_n_rd_rsp_ready;
assign ro7_wr_rdy = 0;
assign ro8_wr_rdy = mcif2cdma_dat_rd_rsp_ready;
assign ro9_wr_rdy = mcif2cdma_wt_rd_rsp_ready;
assign mcif2bdma_rd_rsp_valid = rq0_rd_pvld;
assign mcif2sdp_rd_rsp_valid = rq1_rd_pvld;
assign mcif2pdp_rd_rsp_valid = rq2_rd_pvld;
assign mcif2cdp_rd_rsp_valid = rq3_rd_pvld;
assign mcif2rbk_rd_rsp_valid = rq4_rd_pvld;
assign mcif2sdp_b_rd_rsp_valid = rq5_rd_pvld;
assign mcif2sdp_n_rd_rsp_valid = rq6_rd_pvld;
assign mcif2sdp_e_rd_rsp_valid = rq7_rd_pvld;
assign mcif2cdma_dat_rd_rsp_valid = rq8_rd_pvld;
assign mcif2cdma_wt_rd_rsp_valid = rq9_rd_pvld;
wire rq0_rd_mask = rq0_rd_pvld;
wire rq1_rd_mask = rq1_rd_pvld;
wire rq2_rd_mask = rq2_rd_pvld;
wire rq3_rd_mask = rq3_rd_pvld;
wire rq4_rd_mask = rq4_rd_pvld;
wire rq5_rd_mask = rq5_rd_pvld;
wire rq6_rd_mask = rq6_rd_pvld;
wire rq7_rd_mask = rq7_rd_pvld;
wire rq8_rd_mask = rq8_rd_pvld;
wire rq9_rd_mask = rq9_rd_pvld;
assign mcif2bdma_rd_rsp_pd = {rq0_rd_mask, rq0_rd_pd};
assign mcif2sdp_rd_rsp_pd = {rq1_rd_mask, rq1_rd_pd};
assign mcif2pdp_rd_rsp_pd = {rq2_rd_mask, rq2_rd_pd};
assign mcif2cdp_rd_rsp_pd = {rq3_rd_mask, rq3_rd_pd};
assign mcif2rbk_rd_rsp_pd = {rq4_rd_mask, rq4_rd_pd};
assign mcif2sdp_b_rd_rsp_pd = {rq5_rd_mask, rq5_rd_pd};
assign mcif2sdp_n_rd_rsp_pd = {rq6_rd_mask, rq6_rd_pd};
assign mcif2sdp_e_rd_rsp_pd = {rq7_rd_mask, rq7_rd_pd};
assign mcif2cdma_dat_rd_rsp_pd= {rq8_rd_mask, rq8_rd_pd};
assign mcif2cdma_wt_rd_rsp_pd = {rq9_rd_mask, rq9_rd_pd};
/////////////////////////////////////////////////////////
// ARB
read_eg_arb u_read_eg_arb (
   .req0 (src0_req) //|< w
  ,.req1 (src1_req) //|< w
  ,.req2 (src2_req) //|< w
  ,.req3 (src3_req) //|< w
  ,.req4 (src4_req) //|< w
  ,.req5 (src5_req) //|< w
  ,.req6 (src6_req) //|< w
  ,.req7 (src7_req) //|< w
  ,.req8 (src8_req) //|< w
  ,.req9 (src9_req) //|< w
  ,.wt0 ({8{1'b1}}) //|< ?
  ,.wt1 ({8{1'b1}}) //|< ?
  ,.wt2 ({8{1'b1}}) //|< ?
  ,.wt3 ({8{1'b1}}) //|< ?
  ,.wt4 ({8{1'b1}}) //|< ?
  ,.wt5 ({8{1'b1}}) //|< ?
  ,.wt6 ({8{1'b1}}) //|< ?
  ,.wt7 ({8{1'b1}}) //|< ?
  ,.wt8 ({8{1'b1}}) //|< ?
  ,.wt9 ({8{1'b1}}) //|< ?
  ,.clk (nvdla_core_clk) //|< i
  ,.reset_ (nvdla_core_rstn) //|< i
  ,.gnt0 (src0_gnt) //|> w
  ,.gnt1 (src1_gnt) //|> w
  ,.gnt2 (src2_gnt) //|> w
  ,.gnt3 (src3_gnt) //|> w
  ,.gnt4 (src4_gnt) //|> w
  ,.gnt5 (src5_gnt) //|> w
  ,.gnt6 (src6_gnt) //|> w
  ,.gnt7 (src7_gnt) //|> w
  ,.gnt8 (src8_gnt) //|> w
  ,.gnt9 (src9_gnt) //|> w
  );
/////////////////////////
always @(*) begin
//spyglass disable_block W171 W226
    case (1'b1 )
      src0_gnt: arb_cq_pd = ctt0_cq_pd;
      src1_gnt: arb_cq_pd = ctt1_cq_pd;
      src2_gnt: arb_cq_pd = ctt2_cq_pd;
      src3_gnt: arb_cq_pd = ctt3_cq_pd;
      src4_gnt: arb_cq_pd = ctt4_cq_pd;
      src5_gnt: arb_cq_pd = ctt5_cq_pd;
      src6_gnt: arb_cq_pd = ctt6_cq_pd;
      src7_gnt: arb_cq_pd = ctt7_cq_pd;
      src8_gnt: arb_cq_pd = ctt8_cq_pd;
      src9_gnt: arb_cq_pd = ctt9_cq_pd;
//VCS coverage off
    default : begin
                arb_cq_pd[6:0] = {7{`x_or_0}};
              end
//VCS coverage on
    endcase
//spyglass enable_block W171 W226
end
always @(*) begin
//spyglass disable_block W171 W226
    case (1'b1 )
      src0_gnt: arb_cnt = ctt0_cnt;
      src1_gnt: arb_cnt = ctt1_cnt;
      src2_gnt: arb_cnt = ctt2_cnt;
      src3_gnt: arb_cnt = ctt3_cnt;
      src4_gnt: arb_cnt = ctt4_cnt;
      src5_gnt: arb_cnt = ctt5_cnt;
      src6_gnt: arb_cnt = ctt6_cnt;
      src7_gnt: arb_cnt = ctt7_cnt;
      src8_gnt: arb_cnt = ctt8_cnt;
      src9_gnt: arb_cnt = ctt9_cnt;
//VCS coverage off
    default : begin
                arb_cnt[1:0] = {2{`x_or_0}};
              end
//VCS coverage on
    endcase
//spyglass enable_block W171 W226
end
// PKT_UNPACK_WIRE( nocif_read_ig2eg , arb_cq_ , arb_cq_pd )
assign arb_cq_lens[1:0] = arb_cq_pd[1:0];
//assign arb_cq_swizzle = arb_cq_pd[2];
//assign arb_cq_odd = arb_cq_pd[3];
//assign arb_cq_ltran = arb_cq_pd[4];
//assign arb_cq_fdrop = arb_cq_pd[5];
//assign arb_cq_ldrop = arb_cq_pd[6];
assign arb_last_beat = (arb_cnt==arb_cq_lens);
// ctt_first tells ctt is the next coming data is the first beat of rdata in a transaction
//: foreach my $i (0..9) {
//: print qq (
//: assign ctt${i}_last_beat = src${i}_gnt & arb_last_beat;
//: assign cq_rd${i}_prdy = (ctt${i}_rdy & ctt${i}_last_beat) || !ctt${i}_vld;
//:
//: always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
//: if (!nvdla_core_rstn) begin
//: ctt${i}_vld <= 1'b0;
//: end else if(cq_rd${i}_prdy) begin
//: ctt${i}_vld <= cq_rd${i}_pvld;
//: end
//: end
//: always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
//: if (!nvdla_core_rstn) begin
//: ctt${i}_cnt <= 0;
//: end else begin
//: if (cq_rd${i}_pvld && cq_rd${i}_prdy) begin
//: ctt${i}_cnt <= 0;
//: end else if (ctt${i}_accept) begin
//: ctt${i}_cnt <= ctt${i}_cnt + 1;
//: end
//: end
//: end
//: assign ctt${i}_accept= ctt${i}_vld & ctt${i}_rdy;
//:
//: always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
//: if (!nvdla_core_rstn) begin
//: ctt${i}_cq_pd <= 0;
//: end else begin
//: if (cq_rd${i}_pvld && cq_rd${i}_prdy) begin
//: ctt${i}_cq_pd <= cq_rd${i}_pd;
//: end
//: end
//: end
//: );
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

assign ctt0_last_beat = src0_gnt & arb_last_beat;
assign cq_rd0_prdy = (ctt0_rdy & ctt0_last_beat) || !ctt0_vld;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt0_vld <= 1'b0;
end else if(cq_rd0_prdy) begin
ctt0_vld <= cq_rd0_pvld;
end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt0_cnt <= 0;
end else begin
if (cq_rd0_pvld && cq_rd0_prdy) begin
ctt0_cnt <= 0;
end else if (ctt0_accept) begin
ctt0_cnt <= ctt0_cnt + 1;
end
end
end
assign ctt0_accept= ctt0_vld & ctt0_rdy;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt0_cq_pd <= 0;
end else begin
if (cq_rd0_pvld && cq_rd0_prdy) begin
ctt0_cq_pd <= cq_rd0_pd;
end
end
end

assign ctt1_last_beat = src1_gnt & arb_last_beat;
assign cq_rd1_prdy = (ctt1_rdy & ctt1_last_beat) || !ctt1_vld;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt1_vld <= 1'b0;
end else if(cq_rd1_prdy) begin
ctt1_vld <= cq_rd1_pvld;
end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt1_cnt <= 0;
end else begin
if (cq_rd1_pvld && cq_rd1_prdy) begin
ctt1_cnt <= 0;
end else if (ctt1_accept) begin
ctt1_cnt <= ctt1_cnt + 1;
end
end
end
assign ctt1_accept= ctt1_vld & ctt1_rdy;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt1_cq_pd <= 0;
end else begin
if (cq_rd1_pvld && cq_rd1_prdy) begin
ctt1_cq_pd <= cq_rd1_pd;
end
end
end

assign ctt2_last_beat = src2_gnt & arb_last_beat;
assign cq_rd2_prdy = (ctt2_rdy & ctt2_last_beat) || !ctt2_vld;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt2_vld <= 1'b0;
end else if(cq_rd2_prdy) begin
ctt2_vld <= cq_rd2_pvld;
end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt2_cnt <= 0;
end else begin
if (cq_rd2_pvld && cq_rd2_prdy) begin
ctt2_cnt <= 0;
end else if (ctt2_accept) begin
ctt2_cnt <= ctt2_cnt + 1;
end
end
end
assign ctt2_accept= ctt2_vld & ctt2_rdy;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt2_cq_pd <= 0;
end else begin
if (cq_rd2_pvld && cq_rd2_prdy) begin
ctt2_cq_pd <= cq_rd2_pd;
end
end
end

assign ctt3_last_beat = src3_gnt & arb_last_beat;
assign cq_rd3_prdy = (ctt3_rdy & ctt3_last_beat) || !ctt3_vld;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt3_vld <= 1'b0;
end else if(cq_rd3_prdy) begin
ctt3_vld <= cq_rd3_pvld;
end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt3_cnt <= 0;
end else begin
if (cq_rd3_pvld && cq_rd3_prdy) begin
ctt3_cnt <= 0;
end else if (ctt3_accept) begin
ctt3_cnt <= ctt3_cnt + 1;
end
end
end
assign ctt3_accept= ctt3_vld & ctt3_rdy;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt3_cq_pd <= 0;
end else begin
if (cq_rd3_pvld && cq_rd3_prdy) begin
ctt3_cq_pd <= cq_rd3_pd;
end
end
end

assign ctt4_last_beat = src4_gnt & arb_last_beat;
assign cq_rd4_prdy = (ctt4_rdy & ctt4_last_beat) || !ctt4_vld;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt4_vld <= 1'b0;
end else if(cq_rd4_prdy) begin
ctt4_vld <= cq_rd4_pvld;
end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt4_cnt <= 0;
end else begin
if (cq_rd4_pvld && cq_rd4_prdy) begin
ctt4_cnt <= 0;
end else if (ctt4_accept) begin
ctt4_cnt <= ctt4_cnt + 1;
end
end
end
assign ctt4_accept= ctt4_vld & ctt4_rdy;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt4_cq_pd <= 0;
end else begin
if (cq_rd4_pvld && cq_rd4_prdy) begin
ctt4_cq_pd <= cq_rd4_pd;
end
end
end

assign ctt5_last_beat = src5_gnt & arb_last_beat;
assign cq_rd5_prdy = (ctt5_rdy & ctt5_last_beat) || !ctt5_vld;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt5_vld <= 1'b0;
end else if(cq_rd5_prdy) begin
ctt5_vld <= cq_rd5_pvld;
end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt5_cnt <= 0;
end else begin
if (cq_rd5_pvld && cq_rd5_prdy) begin
ctt5_cnt <= 0;
end else if (ctt5_accept) begin
ctt5_cnt <= ctt5_cnt + 1;
end
end
end
assign ctt5_accept= ctt5_vld & ctt5_rdy;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt5_cq_pd <= 0;
end else begin
if (cq_rd5_pvld && cq_rd5_prdy) begin
ctt5_cq_pd <= cq_rd5_pd;
end
end
end

assign ctt6_last_beat = src6_gnt & arb_last_beat;
assign cq_rd6_prdy = (ctt6_rdy & ctt6_last_beat) || !ctt6_vld;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt6_vld <= 1'b0;
end else if(cq_rd6_prdy) begin
ctt6_vld <= cq_rd6_pvld;
end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt6_cnt <= 0;
end else begin
if (cq_rd6_pvld && cq_rd6_prdy) begin
ctt6_cnt <= 0;
end else if (ctt6_accept) begin
ctt6_cnt <= ctt6_cnt + 1;
end
end
end
assign ctt6_accept= ctt6_vld & ctt6_rdy;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt6_cq_pd <= 0;
end else begin
if (cq_rd6_pvld && cq_rd6_prdy) begin
ctt6_cq_pd <= cq_rd6_pd;
end
end
end

assign ctt7_last_beat = src7_gnt & arb_last_beat;
assign cq_rd7_prdy = (ctt7_rdy & ctt7_last_beat) || !ctt7_vld;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt7_vld <= 1'b0;
end else if(cq_rd7_prdy) begin
ctt7_vld <= cq_rd7_pvld;
end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt7_cnt <= 0;
end else begin
if (cq_rd7_pvld && cq_rd7_prdy) begin
ctt7_cnt <= 0;
end else if (ctt7_accept) begin
ctt7_cnt <= ctt7_cnt + 1;
end
end
end
assign ctt7_accept= ctt7_vld & ctt7_rdy;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt7_cq_pd <= 0;
end else begin
if (cq_rd7_pvld && cq_rd7_prdy) begin
ctt7_cq_pd <= cq_rd7_pd;
end
end
end

assign ctt8_last_beat = src8_gnt & arb_last_beat;
assign cq_rd8_prdy = (ctt8_rdy & ctt8_last_beat) || !ctt8_vld;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt8_vld <= 1'b0;
end else if(cq_rd8_prdy) begin
ctt8_vld <= cq_rd8_pvld;
end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt8_cnt <= 0;
end else begin
if (cq_rd8_pvld && cq_rd8_prdy) begin
ctt8_cnt <= 0;
end else if (ctt8_accept) begin
ctt8_cnt <= ctt8_cnt + 1;
end
end
end
assign ctt8_accept= ctt8_vld & ctt8_rdy;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt8_cq_pd <= 0;
end else begin
if (cq_rd8_pvld && cq_rd8_prdy) begin
ctt8_cq_pd <= cq_rd8_pd;
end
end
end

assign ctt9_last_beat = src9_gnt & arb_last_beat;
assign cq_rd9_prdy = (ctt9_rdy & ctt9_last_beat) || !ctt9_vld;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt9_vld <= 1'b0;
end else if(cq_rd9_prdy) begin
ctt9_vld <= cq_rd9_pvld;
end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt9_cnt <= 0;
end else begin
if (cq_rd9_pvld && cq_rd9_prdy) begin
ctt9_cnt <= 0;
end else if (ctt9_accept) begin
ctt9_cnt <= ctt9_cnt + 1;
end
end
end
assign ctt9_accept= ctt9_vld & ctt9_rdy;

always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
if (!nvdla_core_rstn) begin
ctt9_cq_pd <= 0;
end else begin
if (cq_rd9_pvld && cq_rd9_prdy) begin
ctt9_cq_pd <= cq_rd9_pd;
end
end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
endmodule // NV_NVDLA_MCIF_READ_eg
`define FORCE_CONTENTION_ASSERTION_RESET_ACTIVE 1'b1
`include "simulate_x_tick.vh"
module NV_NVDLA_MCIF_READ_EG_lat_fifo (
      nvdla_core_clk
    , nvdla_core_rstn
    , rq_wr_prdy
    , rq_wr_pvld
`ifdef FV_RAND_WR_PAUSE
    , rq_wr_pause
`endif
    , rq_wr_pd
    , rq_rd_prdy
    , rq_rd_pvld
    , rq_rd_pd
    , pwrbus_ram_pd
    );
// spyglass disable_block W401 -- clock is not input to module
input nvdla_core_clk;
input nvdla_core_rstn;
output rq_wr_prdy;
input rq_wr_pvld;
`ifdef FV_RAND_WR_PAUSE
input rq_wr_pause;
`endif
input [63:0] rq_wr_pd;
input rq_rd_prdy;
output rq_rd_pvld;
output [63:0] rq_rd_pd;
input [31:0] pwrbus_ram_pd;
// Master Clock Gating (SLCG)
//
// We gate the clock(s) when idle or stalled.
// This allows us to turn off numerous miscellaneous flops
// that don't get gated during synthesis for one reason or another.
//
// We gate write side and read side separately.
// If the fifo is synchronous, we also gate the ram separately, but if
// -master_clk_gated_unified or -status_reg/-status_logic_reg is specified,
// then we use one clk gate for write, ram, and read.
//
wire nvdla_core_clk_mgated_enable; // assigned by code at end of this module
wire nvdla_core_clk_mgated; // used only in synchronous fifos
NV_CLK_gate_power nvdla_core_clk_mgate( .clk(nvdla_core_clk), .reset_(nvdla_core_rstn), .clk_en(nvdla_core_clk_mgated_enable), .clk_gated(nvdla_core_clk_mgated) );
//
// WRITE SIDE
//
// synopsys translate_off
`ifndef SYNTH_LEVEL1_COMPILE
`ifndef SYNTHESIS
wire wr_pause_rand; // random stalling
`endif
`endif
// synopsys translate_on
wire wr_reserving;
reg rq_wr_busy_int; // copy for internal use
assign rq_wr_prdy = !rq_wr_busy_int;
assign wr_reserving = rq_wr_pvld && !rq_wr_busy_int; // reserving write space?
wire wr_popping; // fwd: write side sees pop?
reg [2:0] rq_wr_count; // write-side count
wire [2:0] wr_count_next_wr_popping = wr_reserving ? rq_wr_count : (rq_wr_count - 1'd1); // spyglass disable W164a W484
wire [2:0] wr_count_next_no_wr_popping = wr_reserving ? (rq_wr_count + 1'd1) : rq_wr_count; // spyglass disable W164a W484
wire [2:0] wr_count_next = wr_popping ? wr_count_next_wr_popping :
                                               wr_count_next_no_wr_popping;
wire wr_count_next_no_wr_popping_is_4 = ( wr_count_next_no_wr_popping == 3'd4 );
wire wr_count_next_is_4 = wr_popping ? 1'b0 :
                                          wr_count_next_no_wr_popping_is_4;
wire [2:0] wr_limit_muxed; // muxed with simulation/emulation overrides
wire [2:0] wr_limit_reg = wr_limit_muxed;
`ifdef FV_RAND_WR_PAUSE
// VCS coverage off
wire rq_wr_busy_next = wr_count_next_is_4 || // busy next cycle?
                          (wr_limit_reg != 3'd0 && // check rq_wr_limit if != 0
                           wr_count_next >= wr_limit_reg) || rq_wr_pause;
// VCS coverage on
`else
// VCS coverage off
wire rq_wr_busy_next = wr_count_next_is_4 || // busy next cycle?
                          (wr_limit_reg != 3'd0 && // check rq_wr_limit if != 0
                           wr_count_next >= wr_limit_reg)
// synopsys translate_off
  `ifndef SYNTH_LEVEL1_COMPILE
  `ifndef SYNTHESIS
 || wr_pause_rand
  `endif
  `endif
// synopsys translate_on
;
// VCS coverage on
`endif
always @( posedge nvdla_core_clk_mgated or negedge nvdla_core_rstn ) begin
    if ( !nvdla_core_rstn ) begin
        rq_wr_busy_int <= 1'b0;
        rq_wr_count <= 3'd0;
    end else begin
 rq_wr_busy_int <= rq_wr_busy_next;
 if ( wr_reserving ^ wr_popping ) begin
     rq_wr_count <= wr_count_next;
        end
//synopsys translate_off
            else if ( !(wr_reserving ^ wr_popping) ) begin
        end else begin
            rq_wr_count <= {3{`x_or_0}};
        end
//synopsys translate_on
    end
end
wire wr_pushing = wr_reserving; // data pushed same cycle as rq_wr_pvld
//
// RAM
//
reg [1:0] rq_wr_adr; // current write address
// spyglass disable_block W484
always @( posedge nvdla_core_clk_mgated or negedge nvdla_core_rstn ) begin
    if ( !nvdla_core_rstn ) begin
        rq_wr_adr <= 2'd0;
    end else begin
        if ( wr_pushing ) begin
     rq_wr_adr <= rq_wr_adr + 1'd1;
        end
    end
end
// spyglass enable_block W484
reg [1:0] rq_rd_adr; // read address this cycle
wire ram_we = wr_pushing; // note: write occurs next cycle
wire [63:0] rq_rd_pd; // read data out of ram
wire [31 : 0] pwrbus_ram_pd;
// Adding parameter for fifogen to disable wr/rd contention assertion in ramgen.
// Fifogen handles this by ignoring the data on the ram data out for that cycle.
NV_NVDLA_MCIF_READ_EG_lat_fifo_flopram_rwsa_4x64 ram (
      .clk( nvdla_core_clk_mgated )
    , .pwrbus_ram_pd ( pwrbus_ram_pd )
    , .di ( rq_wr_pd )
    , .we ( ram_we )
    , .wa ( rq_wr_adr )
    , .ra ( rq_rd_adr )
    , .dout ( rq_rd_pd )
    );
wire rd_popping; // read side doing pop this cycle?
wire [1:0] rd_adr_next_popping = rq_rd_adr + 1'd1; // spyglass disable W484
always @( posedge nvdla_core_clk_mgated or negedge nvdla_core_rstn ) begin
    if ( !nvdla_core_rstn ) begin
        rq_rd_adr <= 2'd0;
    end else begin
        if ( rd_popping ) begin
     rq_rd_adr <= rd_adr_next_popping;
        end
//synopsys translate_off
            else if ( !rd_popping ) begin
        end else begin
            rq_rd_adr <= {2{`x_or_0}};
        end
//synopsys translate_on
    end
end
//
// SYNCHRONOUS BOUNDARY
//
assign wr_popping = rd_popping; // let it be seen immediately
wire rd_pushing = wr_pushing; // let it be seen immediately
//
// READ SIDE
//
reg rq_rd_pvld; // data out of fifo is valid
reg rq_rd_pvld_int; // internal copy of rq_rd_pvld
assign rd_popping = rq_rd_pvld_int && rq_rd_prdy;
reg [2:0] rq_rd_count; // read-side fifo count
// spyglass disable_block W164a W484
wire [2:0] rd_count_next_rd_popping = rd_pushing ? rq_rd_count :
                                                                (rq_rd_count - 1'd1);
wire [2:0] rd_count_next_no_rd_popping = rd_pushing ? (rq_rd_count + 1'd1) :
                                                                    rq_rd_count;
// spyglass enable_block W164a W484
wire [2:0] rd_count_next = rd_popping ? rd_count_next_rd_popping :
                                                     rd_count_next_no_rd_popping;
wire rd_count_next_rd_popping_not_0 = rd_count_next_rd_popping != 0;
wire rd_count_next_no_rd_popping_not_0 = rd_count_next_no_rd_popping != 0;
wire rd_count_next_not_0 = rd_popping ? rd_count_next_rd_popping_not_0 :
                                              rd_count_next_no_rd_popping_not_0;
always @( posedge nvdla_core_clk_mgated or negedge nvdla_core_rstn ) begin
    if ( !nvdla_core_rstn ) begin
        rq_rd_count <= 3'd0;
        rq_rd_pvld <= 1'b0;
        rq_rd_pvld_int <= 1'b0;
    end else begin
        if ( rd_pushing || rd_popping ) begin
     rq_rd_count <= rd_count_next;
        end
//synopsys translate_off
            else if ( !(rd_pushing || rd_popping ) ) begin
        end else begin
            rq_rd_count <= {3{`x_or_0}};
        end
//synopsys translate_on
        if ( rd_pushing || rd_popping ) begin
     rq_rd_pvld <= (rd_count_next_not_0);
        end
//synopsys translate_off
            else if ( !(rd_pushing || rd_popping ) ) begin
        end else begin
            rq_rd_pvld <= `x_or_0;
        end
//synopsys translate_on
        if ( rd_pushing || rd_popping ) begin
     rq_rd_pvld_int <= (rd_count_next_not_0);
        end
//synopsys translate_off
            else if ( !(rd_pushing || rd_popping ) ) begin
        end else begin
            rq_rd_pvld_int <= `x_or_0;
        end
//synopsys translate_on
    end
end
// Master Clock Gating (SLCG) Enables
//
// plusarg for disabling this stuff:
// synopsys translate_off
`ifndef SYNTH_LEVEL1_COMPILE
`ifndef SYNTHESIS
reg master_clk_gating_disabled; initial master_clk_gating_disabled = $test$plusargs( "fifogen_disable_master_clk_gating" ) != 0;
`endif
`endif
// synopsys translate_on
// synopsys translate_off
`ifndef SYNTH_LEVEL1_COMPILE
`ifndef SYNTHESIS
reg wr_pause_rand_dly;
always @( posedge nvdla_core_clk or negedge nvdla_core_rstn ) begin
    if ( !nvdla_core_rstn ) begin
        wr_pause_rand_dly <= 1'b0;
    end else begin
        wr_pause_rand_dly <= wr_pause_rand;
    end
end
`endif
`endif
// synopsys translate_on
assign nvdla_core_clk_mgated_enable = ((wr_reserving || wr_pushing || wr_popping || (rq_wr_pvld && !rq_wr_busy_int) || (rq_wr_busy_int != rq_wr_busy_next)) || (rd_pushing || rd_popping || (rq_rd_pvld && rq_rd_prdy)) || (wr_pushing))
                               `ifdef FIFOGEN_MASTER_CLK_GATING_DISABLED
                               || 1'b1
                               `endif
// synopsys translate_off
          `ifndef SYNTH_LEVEL1_COMPILE
          `ifndef SYNTHESIS
                               || master_clk_gating_disabled || (wr_pause_rand != wr_pause_rand_dly)
          `endif
          `endif
// synopsys translate_on
                               ;
// Simulation and Emulation Overrides of wr_limit(s)
//
`ifdef EMU
`ifdef EMU_FIFO_CFG
// Emulation Global Config Override
//
assign wr_limit_muxed = `EMU_FIFO_CFG.NV_NVDLA_MCIF_READ_EG_lat_fifo_wr_limit_override ? `EMU_FIFO_CFG.NV_NVDLA_MCIF_READ_EG_lat_fifo_wr_limit : 3'd0;
`else
// No Global Override for Emulation
//
assign wr_limit_muxed = 3'd0;
`endif // EMU_FIFO_CFG
`else // !EMU
`ifdef SYNTH_LEVEL1_COMPILE
// No Override for GCS Compiles
//
assign wr_limit_muxed = 3'd0;
`else
`ifdef SYNTHESIS
// No Override for RTL Synthesis
//
assign wr_limit_muxed = 3'd0;
`else
// RTL Simulation Plusarg Override
// VCS coverage off
reg wr_limit_override;
reg [2:0] wr_limit_override_value;
assign wr_limit_muxed = wr_limit_override ? wr_limit_override_value : 3'd0;
`ifdef NV_ARCHPRO
event reinit;
initial begin
    $display("fifogen reinit initial block %m");
    -> reinit;
end
`endif
`ifdef NV_ARCHPRO
always @( reinit ) begin
`else
initial begin
`endif
    wr_limit_override = 0;
    wr_limit_override_value = 0; // to keep viva happy with dangles
    if ( $test$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_wr_limit" ) ) begin
        wr_limit_override = 1;
        $value$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_wr_limit=%d", wr_limit_override_value);
    end
end
// VCS coverage on
`endif
`endif
`endif
// Random Write-Side Stalling
// synopsys translate_off
`ifndef SYNTH_LEVEL1_COMPILE
`ifndef SYNTHESIS
// VCS coverage off
// leda W339 OFF -- Non synthesizable operator
// leda W372 OFF -- Undefined PLI task
// leda W373 OFF -- Undefined PLI function
// leda W599 OFF -- This construct is not supported by Synopsys
// leda W430 OFF -- Initial statement is not synthesizable
// leda W182 OFF -- Illegal statement for synthesis
// leda W639 OFF -- For synthesis, operands of a division or modulo operation need to be constants
// leda DCVER_274_NV OFF -- This system task is not supported by DC
integer stall_probability; // prob of stalling
integer stall_cycles_min; // min cycles to stall
integer stall_cycles_max; // max cycles to stall
integer stall_cycles_left; // stall cycles left
`ifdef NV_ARCHPRO
always @( reinit ) begin
`else
initial begin
`endif
    stall_probability = 0; // no stalling by default
    stall_cycles_min = 1;
    stall_cycles_max = 10;
`ifdef NO_PLI
`else
    if ( $test$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_fifo_stall_probability" ) ) begin
        $value$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_fifo_stall_probability=%d", stall_probability);
    end else if ( $test$plusargs( "default_fifo_stall_probability" ) ) begin
        $value$plusargs( "default_fifo_stall_probability=%d", stall_probability);
    end
    if ( $test$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_fifo_stall_cycles_min" ) ) begin
        $value$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_fifo_stall_cycles_min=%d", stall_cycles_min);
    end else if ( $test$plusargs( "default_fifo_stall_cycles_min" ) ) begin
        $value$plusargs( "default_fifo_stall_cycles_min=%d", stall_cycles_min);
    end
    if ( $test$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_fifo_stall_cycles_max" ) ) begin
        $value$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_fifo_stall_cycles_max=%d", stall_cycles_max);
    end else if ( $test$plusargs( "default_fifo_stall_cycles_max" ) ) begin
        $value$plusargs( "default_fifo_stall_cycles_max=%d", stall_cycles_max);
    end
`endif
    if ( stall_cycles_min < 1 ) begin
        stall_cycles_min = 1;
    end
    if ( stall_cycles_min > stall_cycles_max ) begin
        stall_cycles_max = stall_cycles_min;
    end
end
`ifdef NO_PLI
`else
// randomization globals
`ifdef SIMTOP_RANDOMIZE_STALLS
  always @( `SIMTOP_RANDOMIZE_STALLS.global_stall_event ) begin
    if ( ! $test$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_fifo_stall_probability" ) ) stall_probability = `SIMTOP_RANDOMIZE_STALLS.global_stall_fifo_probability;
    if ( ! $test$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_fifo_stall_cycles_min" ) ) stall_cycles_min = `SIMTOP_RANDOMIZE_STALLS.global_stall_fifo_cycles_min;
    if ( ! $test$plusargs( "NV_NVDLA_MCIF_READ_EG_lat_fifo_fifo_stall_cycles_max" ) ) stall_cycles_max = `SIMTOP_RANDOMIZE_STALLS.global_stall_fifo_cycles_max;
  end
`endif
`endif
always @( negedge nvdla_core_clk or negedge nvdla_core_rstn ) begin
    if ( !nvdla_core_rstn ) begin
        stall_cycles_left <= 0;
    end else begin
`ifdef NO_PLI
            stall_cycles_left <= 0;
`else
            if ( rq_wr_pvld && !(!rq_wr_prdy)
                 && stall_probability != 0 ) begin
                if ( prand_inst0(1, 100) <= stall_probability ) begin
                    stall_cycles_left <= prand_inst1(stall_cycles_min, stall_cycles_max);
                end else if ( stall_cycles_left !== 0 ) begin
                    stall_cycles_left <= stall_cycles_left - 1;
                end
            end else if ( stall_cycles_left !== 0 ) begin
                stall_cycles_left <= stall_cycles_left - 1;
            end
`endif
    end
end
assign wr_pause_rand = (stall_cycles_left !== 0) ;
// VCS coverage on
`endif
`endif
// synopsys translate_on
// VCS coverage on
// leda W339 ON
// leda W372 ON
// leda W373 ON
// leda W599 ON
// leda W430 ON
// leda W182 ON
// leda W639 ON
// leda DCVER_274_NV ON
//
// Histogram of fifo depth (from write side's perspective)
//
// NOTE: it will reference `SIMTOP.perfmon_enabled, so that
// has to at least be defined, though not initialized.
// tbgen testbenches have it already and various
// ways to turn it on and off.
//
`ifdef PERFMON_HISTOGRAM
// synopsys translate_off
`ifndef SYNTH_LEVEL1_COMPILE
`ifndef SYNTHESIS
perfmon_histogram perfmon (
      .clk ( nvdla_core_clk )
    , .max ( {29'd0, (wr_limit_reg == 3'd0) ? 3'd4 : wr_limit_reg} )
    , .curr ( {29'd0, rq_wr_count} )
    );
`endif
`endif
// synopsys translate_on
`endif
// spyglass disable_block W164a W164b W116 W484 W504
`ifdef SPYGLASS
`else
`ifdef FV_ASSERT_ON
`else
// synopsys translate_off
`endif
`ifdef ASSERT_ON
`ifdef SPYGLASS
wire disable_assert_plusarg = 1'b0;
`else
`ifdef FV_ASSERT_ON
wire disable_assert_plusarg = 1'b0;
`else
wire disable_assert_plusarg = $test$plusargs("DISABLE_NESS_FLOW_ASSERTIONS");
`endif
`endif
wire assert_enabled = 1'b1 && !disable_assert_plusarg;
`endif
`ifdef FV_ASSERT_ON
`else
// synopsys translate_on
`endif
`ifdef ASSERT_ON
//synopsys translate_off
`ifndef SYNTH_LEVEL1_COMPILE
`ifndef SYNTHESIS
always @(assert_enabled) begin
    if ( assert_enabled === 1'b0 ) begin
        $display("Asserts are disabled for %m");
    end
end
`endif
`endif
//synopsys translate_on
`endif
`endif
// spyglass enable_block W164a W164b W116 W484 W504
//The NV_BLKBOX_SRC0 module is only present when the FIFOGEN_MODULE_SEARCH
// define is set. This is to aid fifogen team search for fifogen fifo
// instance and module names in a given design.
`ifdef FIFOGEN_MODULE_SEARCH
NV_BLKBOX_SRC0 dummy_breadcrumb_fifogen_blkbox (.Y());
`endif
// spyglass enable_block W401 -- clock is not input to module
// synopsys dc_script_begin
// set_boundary_optimization find(design, "NV_NVDLA_MCIF_READ_EG_lat_fifo") true
// synopsys dc_script_end
`ifdef SYNTH_LEVEL1_COMPILE
`else
`ifdef SYNTHESIS
`else
`ifdef PRAND_VERILOG
// Only verilog needs any local variables
reg [47:0] prand_local_seed0;
reg prand_initialized0;
reg prand_no_rollpli0;
`endif
`endif
`endif
function [31:0] prand_inst0;
//VCS coverage off
    input [31:0] min;
    input [31:0] max;
    reg [32:0] diff;
    begin
`ifdef SYNTH_LEVEL1_COMPILE
        prand_inst0 = min;
`else
`ifdef SYNTHESIS
        prand_inst0 = min;
`else
`ifdef PRAND_VERILOG
        if (prand_initialized0 !== 1'b1) begin
            prand_no_rollpli0 = $test$plusargs("NO_ROLLPLI");
            if (!prand_no_rollpli0)
                prand_local_seed0 = {$prand_get_seed(0), 16'b0};
            prand_initialized0 = 1'b1;
        end
        if (prand_no_rollpli0) begin
            prand_inst0 = min;
        end else begin
            diff = max - min + 1;
            prand_inst0 = min + prand_local_seed0[47:16] % diff;
// magic numbers taken from Java's random class (same as lrand48)
            prand_local_seed0 = prand_local_seed0 * 48'h5deece66d + 48'd11;
        end
`else
`ifdef PRAND_OFF
        prand_inst0 = min;
`else
        prand_inst0 = $RollPLI(min, max, "auto");
`endif
`endif
`endif
`endif
    end
//VCS coverage on
endfunction
`ifdef SYNTH_LEVEL1_COMPILE
`else
`ifdef SYNTHESIS
`else
`ifdef PRAND_VERILOG
// Only verilog needs any local variables
reg [47:0] prand_local_seed1;
reg prand_initialized1;
reg prand_no_rollpli1;
`endif
`endif
`endif
function [31:0] prand_inst1;
//VCS coverage off
    input [31:0] min;
    input [31:0] max;
    reg [32:0] diff;
    begin
`ifdef SYNTH_LEVEL1_COMPILE
        prand_inst1 = min;
`else
`ifdef SYNTHESIS
        prand_inst1 = min;
`else
`ifdef PRAND_VERILOG
        if (prand_initialized1 !== 1'b1) begin
            prand_no_rollpli1 = $test$plusargs("NO_ROLLPLI");
            if (!prand_no_rollpli1)
                prand_local_seed1 = {$prand_get_seed(1), 16'b0};
            prand_initialized1 = 1'b1;
        end
        if (prand_no_rollpli1) begin
            prand_inst1 = min;
        end else begin
            diff = max - min + 1;
            prand_inst1 = min + prand_local_seed1[47:16] % diff;
// magic numbers taken from Java's random class (same as lrand48)
            prand_local_seed1 = prand_local_seed1 * 48'h5deece66d + 48'd11;
        end
`else
`ifdef PRAND_OFF
        prand_inst1 = min;
`else
        prand_inst1 = $RollPLI(min, max, "auto");
`endif
`endif
`endif
`endif
    end
//VCS coverage on
endfunction
endmodule // NV_NVDLA_MCIF_READ_EG_lat_fifo
//
// Flop-Based RAM
//
module NV_NVDLA_MCIF_READ_EG_lat_fifo_flopram_rwsa_4x64 (
      clk
    , pwrbus_ram_pd
    , di
    , we
    , wa
    , ra
    , dout
    );
input clk; // write clock
input [31 : 0] pwrbus_ram_pd;
input [63:0] di;
input we;
input [1:0] wa;
input [1:0] ra;
output [63:0] dout;
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_0 (.A(pwrbus_ram_pd[0]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_1 (.A(pwrbus_ram_pd[1]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_2 (.A(pwrbus_ram_pd[2]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_3 (.A(pwrbus_ram_pd[3]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_4 (.A(pwrbus_ram_pd[4]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_5 (.A(pwrbus_ram_pd[5]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_6 (.A(pwrbus_ram_pd[6]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_7 (.A(pwrbus_ram_pd[7]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_8 (.A(pwrbus_ram_pd[8]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_9 (.A(pwrbus_ram_pd[9]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_10 (.A(pwrbus_ram_pd[10]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_11 (.A(pwrbus_ram_pd[11]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_12 (.A(pwrbus_ram_pd[12]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_13 (.A(pwrbus_ram_pd[13]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_14 (.A(pwrbus_ram_pd[14]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_15 (.A(pwrbus_ram_pd[15]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_16 (.A(pwrbus_ram_pd[16]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_17 (.A(pwrbus_ram_pd[17]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_18 (.A(pwrbus_ram_pd[18]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_19 (.A(pwrbus_ram_pd[19]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_20 (.A(pwrbus_ram_pd[20]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_21 (.A(pwrbus_ram_pd[21]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_22 (.A(pwrbus_ram_pd[22]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_23 (.A(pwrbus_ram_pd[23]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_24 (.A(pwrbus_ram_pd[24]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_25 (.A(pwrbus_ram_pd[25]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_26 (.A(pwrbus_ram_pd[26]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_27 (.A(pwrbus_ram_pd[27]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_28 (.A(pwrbus_ram_pd[28]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_29 (.A(pwrbus_ram_pd[29]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_30 (.A(pwrbus_ram_pd[30]));
`endif
`ifndef FPGA
NV_BLKBOX_SINK UJ_BBOX2UNIT_UNUSED_pwrbus_31 (.A(pwrbus_ram_pd[31]));
`endif
`ifdef EMU
// we use an emulation ram here to save flops on the emulation board
// so that the monstrous chip can fit :-)
//
reg [1:0] Wa0_vmw;
reg we0_vmw;
reg [63:0] Di0_vmw;
always @( posedge clk ) begin
    Wa0_vmw <= wa;
    we0_vmw <= we;
    Di0_vmw <= di;
end
vmw_NV_NVDLA_MCIF_READ_EG_lat_fifo_flopram_rwsa_4x64 emu_ram (
     .Wa0( Wa0_vmw )
   , .we0( we0_vmw )
   , .Di0( Di0_vmw )
   , .Ra0( ra )
   , .Do0( dout )
   );
`else
reg [63:0] ram_ff0;
reg [63:0] ram_ff1;
reg [63:0] ram_ff2;
reg [63:0] ram_ff3;
always @( posedge clk ) begin
    if ( we && wa == 2'd0 ) begin
 ram_ff0 <= di;
    end
    if ( we && wa == 2'd1 ) begin
 ram_ff1 <= di;
    end
    if ( we && wa == 2'd2 ) begin
 ram_ff2 <= di;
    end
    if ( we && wa == 2'd3 ) begin
 ram_ff3 <= di;
    end
end
reg [63:0] dout;
always @(*) begin
    case( ra )
    2'd0: dout = ram_ff0;
    2'd1: dout = ram_ff1;
    2'd2: dout = ram_ff2;
    2'd3: dout = ram_ff3;
//VCS coverage off
    default: dout = {64{`x_or_0}};
//VCS coverage on
    endcase
end
`endif // EMU
endmodule // NV_NVDLA_MCIF_READ_EG_lat_fifo_flopram_rwsa_4x64
// emulation model of flopram guts
//
`ifdef EMU
module vmw_NV_NVDLA_MCIF_READ_EG_lat_fifo_flopram_rwsa_4x64 (
   Wa0, we0, Di0,
   Ra0, Do0
   );
input [1:0] Wa0;
input we0;
input [63:0] Di0;
input [1:0] Ra0;
output [63:0] Do0;
// Only visible during Spyglass to avoid blackboxes.
`ifdef SPYGLASS_FLOPRAM
assign Do0 = 64'd0;
wire dummy = 1'b0 | (|Wa0) | (|we0) | (|Di0) | (|Ra0);
`endif
// synopsys translate_off
`ifndef SYNTH_LEVEL1_COMPILE
`ifndef SYNTHESIS
reg [63:0] mem[3:0];
// expand mem for debug ease
`ifdef EMU_EXPAND_FLOPRAM_MEM
wire [63:0] Q0 = mem[0];
wire [63:0] Q1 = mem[1];
wire [63:0] Q2 = mem[2];
wire [63:0] Q3 = mem[3];
`endif
// asynchronous ram writes
always @(*) begin
  if ( we0 == 1'b1 ) begin
    #0.1;
    mem[Wa0] = Di0;
  end
end
assign Do0 = mem[Ra0];
`endif
`endif
// synopsys translate_on
// synopsys dc_script_begin
// synopsys dc_script_end
endmodule // vmw_NV_NVDLA_MCIF_READ_EG_lat_fifo_flopram_rwsa_4x64
`endif // EMU
