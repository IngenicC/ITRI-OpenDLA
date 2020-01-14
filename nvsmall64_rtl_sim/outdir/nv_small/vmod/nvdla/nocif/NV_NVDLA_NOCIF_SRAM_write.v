// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_NOCIF_SRAM_write.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_define.h
///////////////////////////////////////////////////
//
module NV_NVDLA_NOCIF_SRAM_write (
    nvdla_core_clk
   ,nvdla_core_rstn
   ,pwrbus_ram_pd
//:my $i;
//:for($i=0;$i<3;$i++) {
//:print qq(
//:,client${i}2cvif_wr_req_pd
//:,client${i}2cvif_wr_req_valid
//:,client${i}2cvif_wr_wt
//:,client${i}2cvif_wr_axid
//:,client${i}2cvif_wr_req_ready
//:,cvif2client${i}_wr_rsp_complete
//:);
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)

,client02cvif_wr_req_pd
,client02cvif_wr_req_valid
,client02cvif_wr_wt
,client02cvif_wr_axid
,client02cvif_wr_req_ready
,cvif2client0_wr_rsp_complete

,client12cvif_wr_req_pd
,client12cvif_wr_req_valid
,client12cvif_wr_wt
,client12cvif_wr_axid
,client12cvif_wr_req_ready
,cvif2client1_wr_rsp_complete

,client22cvif_wr_req_pd
,client22cvif_wr_req_valid
,client22cvif_wr_wt
,client22cvif_wr_axid
,client22cvif_wr_req_ready
,cvif2client2_wr_rsp_complete

//| eperl: generated_end (DO NOT EDIT ABOVE)
    ,reg2dp_wr_os_cnt
    ,noc2cvif_axi_b_bid //|< i
    ,noc2cvif_axi_b_bvalid //|< i
  ,cvif2noc_axi_aw_awaddr //|> o
  ,cvif2noc_axi_aw_awid //|> o
  ,cvif2noc_axi_aw_awlen //|> o
  ,cvif2noc_axi_aw_awready //|< i
  ,cvif2noc_axi_w_wready //|< i
  ,cvif2noc_axi_aw_awvalid //|> o
  ,cvif2noc_axi_w_wdata //|> o
  ,cvif2noc_axi_w_wlast //|> o
  ,cvif2noc_axi_w_wstrb //|> o
  ,cvif2noc_axi_w_wvalid //|> o
  ,noc2cvif_axi_b_bready //|> o
);
//:my $i;
//:for($i=0;$i<3;$i++) {
//:print qq(
//:input [64 +(( 64 )/8/8):0] client${i}2cvif_wr_req_pd;
//:input client${i}2cvif_wr_req_valid;
//:output client${i}2cvif_wr_req_ready;
//:input [7:0] client${i}2cvif_wr_wt;
//:input [3:0] client${i}2cvif_wr_axid;
//:output cvif2client${i}_wr_rsp_complete;
//:);
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)

input [64 +(( 64 )/8/8):0] client02cvif_wr_req_pd;
input client02cvif_wr_req_valid;
output client02cvif_wr_req_ready;
input [7:0] client02cvif_wr_wt;
input [3:0] client02cvif_wr_axid;
output cvif2client0_wr_rsp_complete;

input [64 +(( 64 )/8/8):0] client12cvif_wr_req_pd;
input client12cvif_wr_req_valid;
output client12cvif_wr_req_ready;
input [7:0] client12cvif_wr_wt;
input [3:0] client12cvif_wr_axid;
output cvif2client1_wr_rsp_complete;

input [64 +(( 64 )/8/8):0] client22cvif_wr_req_pd;
input client22cvif_wr_req_valid;
output client22cvif_wr_req_ready;
input [7:0] client22cvif_wr_wt;
input [3:0] client22cvif_wr_axid;
output cvif2client2_wr_rsp_complete;

//| eperl: generated_end (DO NOT EDIT ABOVE)
  output cvif2noc_axi_aw_awvalid; /* data valid */
input cvif2noc_axi_aw_awready; /* data return handshake */
output [7:0] cvif2noc_axi_aw_awid;
output [3:0] cvif2noc_axi_aw_awlen;
output [32 -1:0] cvif2noc_axi_aw_awaddr;
output cvif2noc_axi_w_wvalid; /* data valid */
input cvif2noc_axi_w_wready; /* data return handshake */
output [512 -1:0] cvif2noc_axi_w_wdata;
output [(512/8)-1:0] cvif2noc_axi_w_wstrb;
output cvif2noc_axi_w_wlast;
input noc2cvif_axi_b_bvalid; /* data valid */
output noc2cvif_axi_b_bready; /* data return handshake */
input [7:0] noc2cvif_axi_b_bid;
input [7:0] reg2dp_wr_os_cnt;
input [31:0] pwrbus_ram_pd;
input nvdla_core_clk;
input nvdla_core_rstn;
wire [1:0] eg2ig_axi_len;
wire [3:0] cq_wr_thread_id;
wire [2:0] cq_wr_pd;
wire cq_wr_pvld;
wire cq_wr_prdy;
NV_NVDLA_NOCIF_SRAM_WRITE_ig u_ig (
   .nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< i
  ,.pwrbus_ram_pd (pwrbus_ram_pd)
  ,.reg2dp_wr_os_cnt (reg2dp_wr_os_cnt)
//:my $i;
//:for($i=0;$i<3;$i++) {
//:print qq(
//:,.client${i}2cvif_wr_req_valid(client${i}2cvif_wr_req_valid)
//:,.client${i}2cvif_wr_req_ready(client${i}2cvif_wr_req_ready)
//:,.client${i}2cvif_wr_req_pd(client${i}2cvif_wr_req_pd)
//:,.client${i}2cvif_wr_wt(client${i}2cvif_wr_wt)
//:,.client${i}2cvif_wr_axid(client${i}2cvif_wr_axid)
//:);
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)

,.client02cvif_wr_req_valid(client02cvif_wr_req_valid)
,.client02cvif_wr_req_ready(client02cvif_wr_req_ready)
,.client02cvif_wr_req_pd(client02cvif_wr_req_pd)
,.client02cvif_wr_wt(client02cvif_wr_wt)
,.client02cvif_wr_axid(client02cvif_wr_axid)

,.client12cvif_wr_req_valid(client12cvif_wr_req_valid)
,.client12cvif_wr_req_ready(client12cvif_wr_req_ready)
,.client12cvif_wr_req_pd(client12cvif_wr_req_pd)
,.client12cvif_wr_wt(client12cvif_wr_wt)
,.client12cvif_wr_axid(client12cvif_wr_axid)

,.client22cvif_wr_req_valid(client22cvif_wr_req_valid)
,.client22cvif_wr_req_ready(client22cvif_wr_req_ready)
,.client22cvif_wr_req_pd(client22cvif_wr_req_pd)
,.client22cvif_wr_wt(client22cvif_wr_wt)
,.client22cvif_wr_axid(client22cvif_wr_axid)

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,.cq_wr_pvld (cq_wr_pvld) //|> w
  ,.cq_wr_prdy (cq_wr_prdy) //|< w
  ,.cq_wr_thread_id (cq_wr_thread_id[3:0]) //|> w
  ,.cq_wr_pd (cq_wr_pd[2:0]) //|> w
  ,.cvif2noc_axi_aw_awvalid (cvif2noc_axi_aw_awvalid) //|> o
  ,.cvif2noc_axi_aw_awready (cvif2noc_axi_aw_awready) //|< i
  ,.cvif2noc_axi_aw_awid (cvif2noc_axi_aw_awid[7:0]) //|> o
  ,.cvif2noc_axi_aw_awlen (cvif2noc_axi_aw_awlen[3:0]) //|> o
  ,.cvif2noc_axi_aw_awaddr (cvif2noc_axi_aw_awaddr[32 -1:0]) //|> o
  ,.cvif2noc_axi_w_wvalid (cvif2noc_axi_w_wvalid) //|> o
  ,.cvif2noc_axi_w_wready (cvif2noc_axi_w_wready) //|< i
  ,.cvif2noc_axi_w_wdata (cvif2noc_axi_w_wdata) //|> o
  ,.cvif2noc_axi_w_wstrb (cvif2noc_axi_w_wstrb[(512/8)-1:0]) //|> o
  ,.cvif2noc_axi_w_wlast (cvif2noc_axi_w_wlast) //|> o
  ,.eg2ig_axi_len (eg2ig_axi_len[1:0]) //|< w
  ,.eg2ig_axi_vld (eg2ig_axi_vld) //|< w
);
//:my $i;
//:for($i=0;$i<3;$i++) {
//:print qq(
//:wire [2:0] cq_rd${i}_pd;
//:wire cq_rd${i}_pvld;
//:wire cq_rd${i}_prdy;
//:);
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [2:0] cq_rd0_pd;
wire cq_rd0_pvld;
wire cq_rd0_prdy;

wire [2:0] cq_rd1_pd;
wire cq_rd1_pvld;
wire cq_rd1_prdy;

wire [2:0] cq_rd2_pd;
wire cq_rd2_pvld;
wire cq_rd2_prdy;

//| eperl: generated_end (DO NOT EDIT ABOVE)
NV_NVDLA_NOCIF_SRAM_WRITE_eg u_eg (
   .nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< i
//:my $i;
//:for($i=0;$i<3;$i++) {
//:print qq(
//:,.cvif2client${i}_wr_rsp_complete(cvif2client${i}_wr_rsp_complete)
//:);
//:}
//:for($i=0;$i<3;$i++) {
//:print qq(
//:,.cq_rd${i}_pd (cq_rd${i}_pd) //|< w
//:,.cq_rd${i}_pvld (cq_rd${i}_pvld) //|< w
//:,.cq_rd${i}_prdy (cq_rd${i}_prdy) //|> w
//:);
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)

,.cvif2client0_wr_rsp_complete(cvif2client0_wr_rsp_complete)

,.cvif2client1_wr_rsp_complete(cvif2client1_wr_rsp_complete)

,.cvif2client2_wr_rsp_complete(cvif2client2_wr_rsp_complete)

,.cq_rd0_pd (cq_rd0_pd) //|< w
,.cq_rd0_pvld (cq_rd0_pvld) //|< w
,.cq_rd0_prdy (cq_rd0_prdy) //|> w

,.cq_rd1_pd (cq_rd1_pd) //|< w
,.cq_rd1_pvld (cq_rd1_pvld) //|< w
,.cq_rd1_prdy (cq_rd1_prdy) //|> w

,.cq_rd2_pd (cq_rd2_pd) //|< w
,.cq_rd2_pvld (cq_rd2_pvld) //|< w
,.cq_rd2_prdy (cq_rd2_prdy) //|> w

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,.noc2cvif_axi_b_bvalid (noc2cvif_axi_b_bvalid) //|< i
  ,.noc2cvif_axi_b_bready (noc2cvif_axi_b_bready) //|> o
  ,.noc2cvif_axi_b_bid (noc2cvif_axi_b_bid[7:0]) //|< i
  ,.eg2ig_axi_len (eg2ig_axi_len[1:0]) //|> w
  ,.eg2ig_axi_vld (eg2ig_axi_vld) //|> w
  );
NV_NVDLA_NOCIF_SRAM_WRITE_cq u_cq (
   .nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< i
  ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0])
  ,.cq_wr_prdy (cq_wr_prdy) //|> w
  ,.cq_wr_pvld (cq_wr_pvld) //|< w
  ,.cq_wr_thread_id (cq_wr_thread_id[3:0]) //|< w
  ,.cq_wr_pd (cq_wr_pd[2:0]) //|< w
//:my $i;
//:for($i=0;$i<3;$i++) {
//:print qq(
//:,.cq_rd${i}_pd (cq_rd${i}_pd) //|< w
//:,.cq_rd${i}_pvld (cq_rd${i}_pvld) //|< w
//:,.cq_rd${i}_prdy (cq_rd${i}_prdy) //|> w
//:);
//:}
//:my $i;
//:for($i=3;$i<16;$i++) {
//:print qq(
//:,.cq_rd${i}_prdy (1'b1) //|< w
//:);
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)

,.cq_rd0_pd (cq_rd0_pd) //|< w
,.cq_rd0_pvld (cq_rd0_pvld) //|< w
,.cq_rd0_prdy (cq_rd0_prdy) //|> w

,.cq_rd1_pd (cq_rd1_pd) //|< w
,.cq_rd1_pvld (cq_rd1_pvld) //|< w
,.cq_rd1_prdy (cq_rd1_prdy) //|> w

,.cq_rd2_pd (cq_rd2_pd) //|< w
,.cq_rd2_pvld (cq_rd2_pvld) //|< w
,.cq_rd2_prdy (cq_rd2_prdy) //|> w

,.cq_rd3_prdy (1'b1) //|< w

,.cq_rd4_prdy (1'b1) //|< w

,.cq_rd5_prdy (1'b1) //|< w

,.cq_rd6_prdy (1'b1) //|< w

,.cq_rd7_prdy (1'b1) //|< w

,.cq_rd8_prdy (1'b1) //|< w

,.cq_rd9_prdy (1'b1) //|< w

,.cq_rd10_prdy (1'b1) //|< w

,.cq_rd11_prdy (1'b1) //|< w

,.cq_rd12_prdy (1'b1) //|< w

,.cq_rd13_prdy (1'b1) //|< w

,.cq_rd14_prdy (1'b1) //|< w

,.cq_rd15_prdy (1'b1) //|< w

//| eperl: generated_end (DO NOT EDIT ABOVE)
);
endmodule
