// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_mcif_s.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_MCIF_define.h
module NV_NVDLA_mcif_s (
  nvdla_core_clk //|< i
  ,nvdla_core_rstn //|< i
  ,cdma_dat2mcif_rd_req_pd //|< i
  ,cdma_dat2mcif_rd_req_valid //|< i
  ,cdma_wt2mcif_rd_req_pd //|< i
  ,cdma_wt2mcif_rd_req_valid //|< i
  ,cdp2mcif_rd_cdt_lat_fifo_pop //|< i
  ,cdp2mcif_rd_req_pd //|< i
  ,cdp2mcif_rd_req_valid //|< i
  ,cdp2mcif_wr_req_pd //|< i
  ,cdp2mcif_wr_req_valid //|< i
  ,csb2mcif_req_pd //|< i
  ,csb2mcif_req_pvld //|< i
  ,mcif2cdma_dat_rd_rsp_ready //|< i
  ,mcif2cdma_wt_rd_rsp_ready //|< i
  ,mcif2cdp_rd_rsp_ready //|< i
  ,mcif2noc_axi_ar_arready //|< i
  ,mcif2noc_axi_aw_awready //|< i
  ,mcif2noc_axi_w_wready //|< i
  ,mcif2pdp_rd_rsp_ready //|< i
  ,noc2mcif_axi_b_bid //|< i
  ,noc2mcif_axi_b_bvalid //|< i
  ,noc2mcif_axi_r_rdata //|< i
  ,noc2mcif_axi_r_rid //|< i
  ,noc2mcif_axi_r_rlast //|< i
  ,noc2mcif_axi_r_rvalid //|< i
  ,pdp2mcif_rd_cdt_lat_fifo_pop //|< i
  ,pdp2mcif_rd_req_pd //|< i
  ,pdp2mcif_rd_req_valid //|< i
  ,pdp2mcif_wr_req_pd //|< i
  ,pdp2mcif_wr_req_valid //|< i
  ,pwrbus_ram_pd //|< i
  ,cdma_dat2mcif_rd_req_ready //|> o
  ,cdma_wt2mcif_rd_req_ready //|> o
  ,cdp2mcif_rd_req_ready //|> o
  ,cdp2mcif_wr_req_ready //|> o
  ,csb2mcif_req_prdy //|> o
  ,mcif2cdma_dat_rd_rsp_pd //|> o
  ,mcif2cdma_dat_rd_rsp_valid //|> o
  ,mcif2cdma_wt_rd_rsp_pd //|> o
  ,mcif2cdma_wt_rd_rsp_valid //|> o
  ,mcif2cdp_rd_rsp_pd //|> o
  ,mcif2cdp_rd_rsp_valid //|> o
  ,mcif2cdp_wr_rsp_complete //|> o
  ,mcif2csb_resp_pd //|> o
  ,mcif2csb_resp_valid //|> o
  ,mcif2noc_axi_ar_araddr //|> o
  ,mcif2noc_axi_ar_arid //|> o
  ,mcif2noc_axi_ar_arlen //|> o
  ,mcif2noc_axi_ar_arvalid //|> o
  ,mcif2noc_axi_aw_awaddr //|> o
  ,mcif2noc_axi_aw_awid //|> o
  ,mcif2noc_axi_aw_awlen //|> o
  ,mcif2noc_axi_aw_awvalid //|> o
  ,mcif2noc_axi_w_wdata //|> o
  ,mcif2noc_axi_w_wlast //|> o
  ,mcif2noc_axi_w_wstrb //|> o
  ,mcif2noc_axi_w_wvalid //|> o
  ,mcif2pdp_rd_rsp_pd //|> o
  ,mcif2pdp_rd_rsp_valid //|> o
  ,mcif2pdp_wr_rsp_complete //|> o
  ,noc2mcif_axi_b_bready //|> o
  ,noc2mcif_axi_r_rready //|> o
  ,pdp2mcif_rd_req_ready //|> o
  ,pdp2mcif_wr_req_ready //|> o
  ,sdp2mcif_rd_cdt_lat_fifo_pop //|< i
  ,sdp2mcif_rd_req_pd //|< i
  ,sdp2mcif_rd_req_valid //|< i
  ,sdp2mcif_wr_req_pd //|< i
  ,sdp2mcif_wr_req_valid //|< i
  ,sdp2mcif_rd_req_ready //|> o
  ,sdp2mcif_wr_req_ready //|> o
  ,mcif2sdp_rd_rsp_pd //|> o
  ,mcif2sdp_rd_rsp_valid //|> o
  ,mcif2sdp_rd_rsp_ready //|< i
  ,mcif2sdp_wr_rsp_complete //|> o
  ,sdp_b2mcif_rd_cdt_lat_fifo_pop //|< i
  ,sdp_b2mcif_rd_req_pd //|< i
  ,sdp_b2mcif_rd_req_valid //|< i
  ,sdp_b2mcif_rd_req_ready //|> o
  ,mcif2sdp_b_rd_rsp_pd //|> o
  ,mcif2sdp_b_rd_rsp_valid //|> o
  ,mcif2sdp_b_rd_rsp_ready //|< i
  ,sdp_n2mcif_rd_cdt_lat_fifo_pop //|< i
  ,sdp_n2mcif_rd_req_pd //|< i
  ,sdp_n2mcif_rd_req_valid //|< i
  ,sdp_n2mcif_rd_req_ready //|> o
  ,mcif2sdp_n_rd_rsp_pd //|> o
  ,mcif2sdp_n_rd_rsp_valid //|> o
  ,mcif2sdp_n_rd_rsp_ready //|< i
  );
////////////////////////////////////////////////////
//
// NV_NVDLA_mcif_ports.v
//
input nvdla_core_clk;
input nvdla_core_rstn;
input cdma_dat2mcif_rd_req_valid;
output cdma_dat2mcif_rd_req_ready;
input [47 -1:0] cdma_dat2mcif_rd_req_pd;
output mcif2cdma_dat_rd_rsp_valid;
input mcif2cdma_dat_rd_rsp_ready;
output [64 +1 -1:0] mcif2cdma_dat_rd_rsp_pd;
input cdma_wt2mcif_rd_req_valid;
output cdma_wt2mcif_rd_req_ready;
input [47 -1:0] cdma_wt2mcif_rd_req_pd;
output mcif2cdma_wt_rd_rsp_valid;
input mcif2cdma_wt_rd_rsp_ready;
output [64 +1 -1:0] mcif2cdma_wt_rd_rsp_pd;
input cdp2mcif_rd_cdt_lat_fifo_pop;
input cdp2mcif_rd_req_valid;
output cdp2mcif_rd_req_ready;
input [47 -1:0] cdp2mcif_rd_req_pd;
input cdp2mcif_wr_req_valid;
output cdp2mcif_wr_req_ready;
input [(64 +1 +1)-1:0] cdp2mcif_wr_req_pd;
output mcif2cdp_rd_rsp_valid;
input mcif2cdp_rd_rsp_ready;
output [64 +1 -1:0] mcif2cdp_rd_rsp_pd;
output mcif2cdp_wr_rsp_complete;
input csb2mcif_req_pvld;
output csb2mcif_req_prdy;
input [62:0] csb2mcif_req_pd;
output mcif2csb_resp_valid;
output [33:0] mcif2csb_resp_pd;
output mcif2noc_axi_ar_arvalid;
input mcif2noc_axi_ar_arready;
output [7:0] mcif2noc_axi_ar_arid;
output [3:0] mcif2noc_axi_ar_arlen;
output [31:0] mcif2noc_axi_ar_araddr;//Xavier 64bits
output mcif2noc_axi_aw_awvalid;
input mcif2noc_axi_aw_awready;
output [7:0] mcif2noc_axi_aw_awid;
output [3:0] mcif2noc_axi_aw_awlen;
output [31:0] mcif2noc_axi_aw_awaddr;//Xavier 64bits
output mcif2noc_axi_w_wvalid;
input mcif2noc_axi_w_wready;
output [64 -1:0] mcif2noc_axi_w_wdata;
output [32 -1:0] mcif2noc_axi_w_wstrb;
output mcif2noc_axi_w_wlast;
output mcif2pdp_rd_rsp_valid;
input mcif2pdp_rd_rsp_ready;
output [64 +1 -1:0] mcif2pdp_rd_rsp_pd;
output mcif2pdp_wr_rsp_complete;
input pdp2mcif_rd_cdt_lat_fifo_pop;
input pdp2mcif_rd_req_valid;
output pdp2mcif_rd_req_ready;
input [47 -1:0] pdp2mcif_rd_req_pd;
input pdp2mcif_wr_req_valid;
output pdp2mcif_wr_req_ready;
input [(64 +1 +1)-1:0] pdp2mcif_wr_req_pd;
output mcif2sdp_b_rd_rsp_valid;
input mcif2sdp_b_rd_rsp_ready;
output [64 +1 -1:0] mcif2sdp_b_rd_rsp_pd;
input sdp_b2mcif_rd_cdt_lat_fifo_pop;
input sdp_b2mcif_rd_req_valid;
output sdp_b2mcif_rd_req_ready;
input [47 -1:0] sdp_b2mcif_rd_req_pd;
output mcif2sdp_n_rd_rsp_valid;
input mcif2sdp_n_rd_rsp_ready;
output [64 +1 -1:0] mcif2sdp_n_rd_rsp_pd;
input sdp_n2mcif_rd_cdt_lat_fifo_pop;
input sdp_n2mcif_rd_req_valid;
output sdp_n2mcif_rd_req_ready;
input [47 -1:0] sdp_n2mcif_rd_req_pd;
output mcif2sdp_rd_rsp_valid;
input mcif2sdp_rd_rsp_ready;
output [64 +1 -1:0] mcif2sdp_rd_rsp_pd;
output mcif2sdp_wr_rsp_complete;
input sdp2mcif_rd_cdt_lat_fifo_pop;
input sdp2mcif_rd_req_valid;
output sdp2mcif_rd_req_ready;
input [47 -1:0] sdp2mcif_rd_req_pd;
input sdp2mcif_wr_req_valid;
output sdp2mcif_wr_req_ready;
input [(64 +1 +1)-1:0] sdp2mcif_wr_req_pd;
input noc2mcif_axi_b_bvalid;
output noc2mcif_axi_b_bready;
input [7:0] noc2mcif_axi_b_bid;
input noc2mcif_axi_r_rvalid;
output noc2mcif_axi_r_rready;
input [7:0] noc2mcif_axi_r_rid;
input noc2mcif_axi_r_rlast;
input [64 -1:0] noc2mcif_axi_r_rdata;
input [31:0] pwrbus_ram_pd;
//////////////////////////////////////////////////////////////////
wire [7:0] reg2dp_rd_os_cnt;
wire [7:0] reg2dp_rd_weight_cdma_dat;
wire [7:0] reg2dp_rd_weight_cdma_wt;
wire [7:0] reg2dp_rd_weight_cdp;
wire [7:0] reg2dp_wr_weight_cdp;
wire [7:0] reg2dp_rd_weight_pdp;
wire [7:0] reg2dp_wr_weight_pdp;
wire [7:0] reg2dp_rd_weight_sdp;
wire [7:0] reg2dp_rd_weight_sdp_b;
wire [7:0] reg2dp_rd_weight_sdp_e;
wire [7:0] reg2dp_rd_weight_sdp_n;
wire [7:0] reg2dp_wr_os_cnt;
wire [7:0] reg2dp_wr_weight_sdp;
///////////////////////////////////////////////////
NV_NVDLA_MCIF_read_s u_read (
   .reg2dp_rd_os_cnt (reg2dp_rd_os_cnt[7:0])
  ,.reg2dp_rd_weight_cdma_dat (reg2dp_rd_weight_cdma_dat[7:0])
  ,.reg2dp_rd_weight_cdma_wt (reg2dp_rd_weight_cdma_wt[7:0])
  ,.reg2dp_rd_weight_cdp (reg2dp_rd_weight_cdp[7:0])
  ,.reg2dp_rd_weight_pdp (reg2dp_rd_weight_pdp[7:0])
  ,.reg2dp_rd_weight_sdp (reg2dp_rd_weight_sdp[7:0])
  ,.reg2dp_rd_weight_sdp_b (reg2dp_rd_weight_sdp_b[7:0])
  ,.reg2dp_rd_weight_sdp_e (reg2dp_rd_weight_sdp_e[7:0])
  ,.reg2dp_rd_weight_sdp_n (reg2dp_rd_weight_sdp_n[7:0])
  ,.nvdla_core_clk (nvdla_core_clk)
  ,.nvdla_core_rstn (nvdla_core_rstn)
  ,.cdma_dat2mcif_rd_req_valid (cdma_dat2mcif_rd_req_valid)
  ,.cdma_dat2mcif_rd_req_ready (cdma_dat2mcif_rd_req_ready)
  ,.cdma_dat2mcif_rd_req_pd (cdma_dat2mcif_rd_req_pd )
  ,.cdma_wt2mcif_rd_req_valid (cdma_wt2mcif_rd_req_valid)
  ,.cdma_wt2mcif_rd_req_ready (cdma_wt2mcif_rd_req_ready)
  ,.cdma_wt2mcif_rd_req_pd (cdma_wt2mcif_rd_req_pd)
  ,.cdp2mcif_rd_cdt_lat_fifo_pop (cdp2mcif_rd_cdt_lat_fifo_pop)
  ,.cdp2mcif_rd_req_valid (cdp2mcif_rd_req_valid)
  ,.cdp2mcif_rd_req_ready (cdp2mcif_rd_req_ready)
  ,.cdp2mcif_rd_req_pd (cdp2mcif_rd_req_pd)
  ,.mcif2cdma_dat_rd_rsp_valid (mcif2cdma_dat_rd_rsp_valid)
  ,.mcif2cdma_dat_rd_rsp_ready (mcif2cdma_dat_rd_rsp_ready)
  ,.mcif2cdma_dat_rd_rsp_pd (mcif2cdma_dat_rd_rsp_pd)
  ,.mcif2cdma_wt_rd_rsp_valid (mcif2cdma_wt_rd_rsp_valid)
  ,.mcif2cdma_wt_rd_rsp_ready (mcif2cdma_wt_rd_rsp_ready)
  ,.mcif2cdma_wt_rd_rsp_pd (mcif2cdma_wt_rd_rsp_pd)
  ,.mcif2cdp_rd_rsp_valid (mcif2cdp_rd_rsp_valid)
  ,.mcif2cdp_rd_rsp_ready (mcif2cdp_rd_rsp_ready)
  ,.mcif2cdp_rd_rsp_pd (mcif2cdp_rd_rsp_pd)
  ,.mcif2noc_axi_ar_arvalid (mcif2noc_axi_ar_arvalid)
  ,.mcif2noc_axi_ar_arready (mcif2noc_axi_ar_arready)
  ,.mcif2noc_axi_ar_arid (mcif2noc_axi_ar_arid[7:0])
  ,.mcif2noc_axi_ar_arlen (mcif2noc_axi_ar_arlen[3:0])
  ,.mcif2noc_axi_ar_araddr (mcif2noc_axi_ar_araddr)
  ,.mcif2pdp_rd_rsp_valid (mcif2pdp_rd_rsp_valid)
  ,.mcif2pdp_rd_rsp_ready (mcif2pdp_rd_rsp_ready)
  ,.mcif2pdp_rd_rsp_pd (mcif2pdp_rd_rsp_pd)
  ,.noc2mcif_axi_r_rvalid (noc2mcif_axi_r_rvalid)
  ,.noc2mcif_axi_r_rready (noc2mcif_axi_r_rready)
  ,.noc2mcif_axi_r_rid (noc2mcif_axi_r_rid[7:0])
  ,.noc2mcif_axi_r_rlast (noc2mcif_axi_r_rlast)
  ,.noc2mcif_axi_r_rdata (noc2mcif_axi_r_rdata)
  ,.pdp2mcif_rd_cdt_lat_fifo_pop (pdp2mcif_rd_cdt_lat_fifo_pop)
  ,.pdp2mcif_rd_req_valid (pdp2mcif_rd_req_valid)
  ,.pdp2mcif_rd_req_ready (pdp2mcif_rd_req_ready)
  ,.pdp2mcif_rd_req_pd (pdp2mcif_rd_req_pd)
  ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
  ,.sdp_b2mcif_rd_cdt_lat_fifo_pop (sdp_b2mcif_rd_cdt_lat_fifo_pop)
  ,.sdp_b2mcif_rd_req_valid (sdp_b2mcif_rd_req_valid)
  ,.sdp_b2mcif_rd_req_ready (sdp_b2mcif_rd_req_ready)
  ,.sdp_b2mcif_rd_req_pd (sdp_b2mcif_rd_req_pd)
  ,.mcif2sdp_b_rd_rsp_valid (mcif2sdp_b_rd_rsp_valid)
  ,.mcif2sdp_b_rd_rsp_ready (mcif2sdp_b_rd_rsp_ready)
  ,.mcif2sdp_b_rd_rsp_pd (mcif2sdp_b_rd_rsp_pd)
  ,.sdp_n2mcif_rd_cdt_lat_fifo_pop (sdp_n2mcif_rd_cdt_lat_fifo_pop)
  ,.sdp_n2mcif_rd_req_valid (sdp_n2mcif_rd_req_valid)
  ,.sdp_n2mcif_rd_req_ready (sdp_n2mcif_rd_req_ready)
  ,.sdp_n2mcif_rd_req_pd (sdp_n2mcif_rd_req_pd)
  ,.mcif2sdp_n_rd_rsp_valid (mcif2sdp_n_rd_rsp_valid)
  ,.mcif2sdp_n_rd_rsp_ready (mcif2sdp_n_rd_rsp_ready)
  ,.mcif2sdp_n_rd_rsp_pd (mcif2sdp_n_rd_rsp_pd)
  ,.mcif2sdp_rd_rsp_valid (mcif2sdp_rd_rsp_valid)
  ,.mcif2sdp_rd_rsp_ready (mcif2sdp_rd_rsp_ready)
  ,.mcif2sdp_rd_rsp_pd (mcif2sdp_rd_rsp_pd)
  ,.sdp2mcif_rd_cdt_lat_fifo_pop (sdp2mcif_rd_cdt_lat_fifo_pop)
  ,.sdp2mcif_rd_req_valid (sdp2mcif_rd_req_valid)
  ,.sdp2mcif_rd_req_ready (sdp2mcif_rd_req_ready)
  ,.sdp2mcif_rd_req_pd (sdp2mcif_rd_req_pd)
  );
NV_NVDLA_MCIF_write_s u_write (
   .nvdla_core_clk (nvdla_core_clk)
  ,.nvdla_core_rstn (nvdla_core_rstn)
  ,.cdp2mcif_wr_req_valid (cdp2mcif_wr_req_valid)
  ,.cdp2mcif_wr_req_ready (cdp2mcif_wr_req_ready)
  ,.cdp2mcif_wr_req_pd (cdp2mcif_wr_req_pd)
  ,.mcif2cdp_wr_rsp_complete (mcif2cdp_wr_rsp_complete)
  ,.mcif2noc_axi_aw_awvalid (mcif2noc_axi_aw_awvalid)
  ,.mcif2noc_axi_aw_awready (mcif2noc_axi_aw_awready)
  ,.mcif2noc_axi_aw_awid (mcif2noc_axi_aw_awid[7:0])
  ,.mcif2noc_axi_aw_awlen (mcif2noc_axi_aw_awlen[3:0])
  ,.mcif2noc_axi_aw_awaddr (mcif2noc_axi_aw_awaddr)
  ,.mcif2noc_axi_w_wvalid (mcif2noc_axi_w_wvalid)
  ,.mcif2noc_axi_w_wready (mcif2noc_axi_w_wready)
  ,.mcif2noc_axi_w_wdata (mcif2noc_axi_w_wdata)
  ,.mcif2noc_axi_w_wstrb (mcif2noc_axi_w_wstrb)
  ,.mcif2noc_axi_w_wlast (mcif2noc_axi_w_wlast)
  ,.mcif2pdp_wr_rsp_complete (mcif2pdp_wr_rsp_complete)
  ,.mcif2sdp_wr_rsp_complete (mcif2sdp_wr_rsp_complete)
  ,.noc2mcif_axi_b_bvalid (noc2mcif_axi_b_bvalid)
  ,.noc2mcif_axi_b_bready (noc2mcif_axi_b_bready)
  ,.noc2mcif_axi_b_bid (noc2mcif_axi_b_bid[7:0])
  ,.pdp2mcif_wr_req_valid (pdp2mcif_wr_req_valid)
  ,.pdp2mcif_wr_req_ready (pdp2mcif_wr_req_ready)
  ,.pdp2mcif_wr_req_pd (pdp2mcif_wr_req_pd)
  ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
  ,.sdp2mcif_wr_req_valid (sdp2mcif_wr_req_valid)
  ,.sdp2mcif_wr_req_ready (sdp2mcif_wr_req_ready)
  ,.sdp2mcif_wr_req_pd (sdp2mcif_wr_req_pd)
  ,.reg2dp_wr_os_cnt (reg2dp_wr_os_cnt[7:0])
  ,.reg2dp_wr_weight_cdp (reg2dp_wr_weight_cdp[7:0])
  ,.reg2dp_wr_weight_pdp (reg2dp_wr_weight_pdp[7:0])
  ,.reg2dp_wr_weight_sdp (reg2dp_wr_weight_sdp[7:0])
  );
NV_NVDLA_MCIF_csb u_csb (
   .nvdla_core_clk (nvdla_core_clk)
  ,.nvdla_core_rstn (nvdla_core_rstn)
  ,.csb2mcif_req_pvld (csb2mcif_req_pvld)
  ,.csb2mcif_req_prdy (csb2mcif_req_prdy)
  ,.csb2mcif_req_pd (csb2mcif_req_pd[62:0])
  ,.mcif2csb_resp_valid (mcif2csb_resp_valid)
  ,.mcif2csb_resp_pd (mcif2csb_resp_pd[33:0])
  ,.dp2reg_idle ({1{1'b1}})
  ,.reg2dp_rd_os_cnt (reg2dp_rd_os_cnt[7:0])
  ,.reg2dp_rd_weight_cdma_dat (reg2dp_rd_weight_cdma_dat[7:0])
  ,.reg2dp_rd_weight_cdma_wt (reg2dp_rd_weight_cdma_wt[7:0])
  ,.reg2dp_rd_weight_cdp (reg2dp_rd_weight_cdp[7:0])
  ,.reg2dp_rd_weight_pdp (reg2dp_rd_weight_pdp[7:0])
  ,.reg2dp_rd_weight_rsv_0 ()
  ,.reg2dp_rd_weight_rsv_1 ()
  ,.reg2dp_rd_weight_sdp (reg2dp_rd_weight_sdp[7:0])
  ,.reg2dp_rd_weight_sdp_b (reg2dp_rd_weight_sdp_b[7:0])
  ,.reg2dp_rd_weight_sdp_e (reg2dp_rd_weight_sdp_e[7:0])
  ,.reg2dp_rd_weight_sdp_n (reg2dp_rd_weight_sdp_n[7:0])
  ,.reg2dp_wr_os_cnt (reg2dp_wr_os_cnt[7:0])
  ,.reg2dp_wr_weight_cdp (reg2dp_wr_weight_cdp[7:0])
  ,.reg2dp_wr_weight_pdp (reg2dp_wr_weight_pdp[7:0])
  ,.reg2dp_wr_weight_rsv_0 ()
  ,.reg2dp_wr_weight_rsv_1 ()
  ,.reg2dp_wr_weight_rsv_2 ()
  ,.reg2dp_wr_weight_sdp (reg2dp_wr_weight_sdp[7:0])
  );
endmodule // NV_NVDLA_mcif
