// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_NOCIF_SRAM_read.v
`include "simulate_x_tick.vh"
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
module NV_NVDLA_NOCIF_SRAM_read (
  nvdla_core_clk
  ,nvdla_core_rstn
//:my $k=7;
//:my $i;
//:for ($i=0;$i<$k;$i++) {
//: print(",client${i}2cvif_rd_cdt_lat_fifo_pop\n");
//: print(",client${i}2cvif_rd_req_valid\n");
//: print(",client${i}2cvif_rd_req_ready\n");
//: print(",client${i}2cvif_rd_req_pd\n");
//: print(",cvif2client${i}_rd_rsp_valid\n");
//: print(",cvif2client${i}_rd_rsp_ready\n");
//: print(",cvif2client${i}_rd_rsp_pd\n"),
//: print(",client${i}2cvif_rd_wt\n"),
//: print(",client${i}2cvif_rd_axid\n"),
//: print(",client${i}2cvif_lat_fifo_depth\n"),
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
,client02cvif_rd_cdt_lat_fifo_pop
,client02cvif_rd_req_valid
,client02cvif_rd_req_ready
,client02cvif_rd_req_pd
,cvif2client0_rd_rsp_valid
,cvif2client0_rd_rsp_ready
,cvif2client0_rd_rsp_pd
,client02cvif_rd_wt
,client02cvif_rd_axid
,client02cvif_lat_fifo_depth
,client12cvif_rd_cdt_lat_fifo_pop
,client12cvif_rd_req_valid
,client12cvif_rd_req_ready
,client12cvif_rd_req_pd
,cvif2client1_rd_rsp_valid
,cvif2client1_rd_rsp_ready
,cvif2client1_rd_rsp_pd
,client12cvif_rd_wt
,client12cvif_rd_axid
,client12cvif_lat_fifo_depth
,client22cvif_rd_cdt_lat_fifo_pop
,client22cvif_rd_req_valid
,client22cvif_rd_req_ready
,client22cvif_rd_req_pd
,cvif2client2_rd_rsp_valid
,cvif2client2_rd_rsp_ready
,cvif2client2_rd_rsp_pd
,client22cvif_rd_wt
,client22cvif_rd_axid
,client22cvif_lat_fifo_depth
,client32cvif_rd_cdt_lat_fifo_pop
,client32cvif_rd_req_valid
,client32cvif_rd_req_ready
,client32cvif_rd_req_pd
,cvif2client3_rd_rsp_valid
,cvif2client3_rd_rsp_ready
,cvif2client3_rd_rsp_pd
,client32cvif_rd_wt
,client32cvif_rd_axid
,client32cvif_lat_fifo_depth
,client42cvif_rd_cdt_lat_fifo_pop
,client42cvif_rd_req_valid
,client42cvif_rd_req_ready
,client42cvif_rd_req_pd
,cvif2client4_rd_rsp_valid
,cvif2client4_rd_rsp_ready
,cvif2client4_rd_rsp_pd
,client42cvif_rd_wt
,client42cvif_rd_axid
,client42cvif_lat_fifo_depth
,client52cvif_rd_cdt_lat_fifo_pop
,client52cvif_rd_req_valid
,client52cvif_rd_req_ready
,client52cvif_rd_req_pd
,cvif2client5_rd_rsp_valid
,cvif2client5_rd_rsp_ready
,cvif2client5_rd_rsp_pd
,client52cvif_rd_wt
,client52cvif_rd_axid
,client52cvif_lat_fifo_depth
,client62cvif_rd_cdt_lat_fifo_pop
,client62cvif_rd_req_valid
,client62cvif_rd_req_ready
,client62cvif_rd_req_pd
,cvif2client6_rd_rsp_valid
,cvif2client6_rd_rsp_ready
,cvif2client6_rd_rsp_pd
,client62cvif_rd_wt
,client62cvif_rd_axid
,client62cvif_lat_fifo_depth

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,pwrbus_ram_pd
  ,reg2dp_rd_os_cnt
  ,cvif2noc_axi_ar_arvalid
  ,cvif2noc_axi_ar_arready
  ,cvif2noc_axi_ar_arid
  ,cvif2noc_axi_ar_arlen
  ,cvif2noc_axi_ar_araddr
  ,noc2cvif_axi_r_rvalid
  ,noc2cvif_axi_r_rready
  ,noc2cvif_axi_r_rid
  ,noc2cvif_axi_r_rlast
  ,noc2cvif_axi_r_rdata
);
input nvdla_core_clk;
input nvdla_core_rstn;
//:my $k=7;
//:my $w = 64 +(( 64 )/8/8)-1;
//:my $i;
//:for ($i=0;$i<$k;$i++) {
//: print("input client${i}2cvif_rd_cdt_lat_fifo_pop;\n");
//: print("input client${i}2cvif_rd_req_valid;\n");
//: print("output client${i}2cvif_rd_req_ready;\n");
//: print qq(
//: input [32 +14:0] client${i}2cvif_rd_req_pd;
//: );
//: print("output cvif2client${i}_rd_rsp_valid;\n");
//: print("output [$w:0] cvif2client${i}_rd_rsp_pd;\n");
//: print("input cvif2client${i}_rd_rsp_ready;\n");
//: print("input [7:0] client${i}2cvif_rd_wt;\n");
//: print("input [3:0] client${i}2cvif_rd_axid;\n");
//: print("input [7:0] client${i}2cvif_lat_fifo_depth;\n");
//: }
//:my $i;
//:for($i=0;$i<16;$i++) {
//: print qq(
//:wire [6:0] cq_rd${i}_pd;
//:wire cq_rd${i}_prdy;
//:wire cq_rd${i}_pvld;
//: );
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)
input client02cvif_rd_cdt_lat_fifo_pop;
input client02cvif_rd_req_valid;
output client02cvif_rd_req_ready;

input [32 +14:0] client02cvif_rd_req_pd;
output cvif2client0_rd_rsp_valid;
output [64:0] cvif2client0_rd_rsp_pd;
input cvif2client0_rd_rsp_ready;
input [7:0] client02cvif_rd_wt;
input [3:0] client02cvif_rd_axid;
input [7:0] client02cvif_lat_fifo_depth;
input client12cvif_rd_cdt_lat_fifo_pop;
input client12cvif_rd_req_valid;
output client12cvif_rd_req_ready;

input [32 +14:0] client12cvif_rd_req_pd;
output cvif2client1_rd_rsp_valid;
output [64:0] cvif2client1_rd_rsp_pd;
input cvif2client1_rd_rsp_ready;
input [7:0] client12cvif_rd_wt;
input [3:0] client12cvif_rd_axid;
input [7:0] client12cvif_lat_fifo_depth;
input client22cvif_rd_cdt_lat_fifo_pop;
input client22cvif_rd_req_valid;
output client22cvif_rd_req_ready;

input [32 +14:0] client22cvif_rd_req_pd;
output cvif2client2_rd_rsp_valid;
output [64:0] cvif2client2_rd_rsp_pd;
input cvif2client2_rd_rsp_ready;
input [7:0] client22cvif_rd_wt;
input [3:0] client22cvif_rd_axid;
input [7:0] client22cvif_lat_fifo_depth;
input client32cvif_rd_cdt_lat_fifo_pop;
input client32cvif_rd_req_valid;
output client32cvif_rd_req_ready;

input [32 +14:0] client32cvif_rd_req_pd;
output cvif2client3_rd_rsp_valid;
output [64:0] cvif2client3_rd_rsp_pd;
input cvif2client3_rd_rsp_ready;
input [7:0] client32cvif_rd_wt;
input [3:0] client32cvif_rd_axid;
input [7:0] client32cvif_lat_fifo_depth;
input client42cvif_rd_cdt_lat_fifo_pop;
input client42cvif_rd_req_valid;
output client42cvif_rd_req_ready;

input [32 +14:0] client42cvif_rd_req_pd;
output cvif2client4_rd_rsp_valid;
output [64:0] cvif2client4_rd_rsp_pd;
input cvif2client4_rd_rsp_ready;
input [7:0] client42cvif_rd_wt;
input [3:0] client42cvif_rd_axid;
input [7:0] client42cvif_lat_fifo_depth;
input client52cvif_rd_cdt_lat_fifo_pop;
input client52cvif_rd_req_valid;
output client52cvif_rd_req_ready;

input [32 +14:0] client52cvif_rd_req_pd;
output cvif2client5_rd_rsp_valid;
output [64:0] cvif2client5_rd_rsp_pd;
input cvif2client5_rd_rsp_ready;
input [7:0] client52cvif_rd_wt;
input [3:0] client52cvif_rd_axid;
input [7:0] client52cvif_lat_fifo_depth;
input client62cvif_rd_cdt_lat_fifo_pop;
input client62cvif_rd_req_valid;
output client62cvif_rd_req_ready;

input [32 +14:0] client62cvif_rd_req_pd;
output cvif2client6_rd_rsp_valid;
output [64:0] cvif2client6_rd_rsp_pd;
input cvif2client6_rd_rsp_ready;
input [7:0] client62cvif_rd_wt;
input [3:0] client62cvif_rd_axid;
input [7:0] client62cvif_lat_fifo_depth;

wire [6:0] cq_rd0_pd;
wire cq_rd0_prdy;
wire cq_rd0_pvld;

wire [6:0] cq_rd1_pd;
wire cq_rd1_prdy;
wire cq_rd1_pvld;

wire [6:0] cq_rd2_pd;
wire cq_rd2_prdy;
wire cq_rd2_pvld;

wire [6:0] cq_rd3_pd;
wire cq_rd3_prdy;
wire cq_rd3_pvld;

wire [6:0] cq_rd4_pd;
wire cq_rd4_prdy;
wire cq_rd4_pvld;

wire [6:0] cq_rd5_pd;
wire cq_rd5_prdy;
wire cq_rd5_pvld;

wire [6:0] cq_rd6_pd;
wire cq_rd6_prdy;
wire cq_rd6_pvld;

wire [6:0] cq_rd7_pd;
wire cq_rd7_prdy;
wire cq_rd7_pvld;

wire [6:0] cq_rd8_pd;
wire cq_rd8_prdy;
wire cq_rd8_pvld;

wire [6:0] cq_rd9_pd;
wire cq_rd9_prdy;
wire cq_rd9_pvld;

wire [6:0] cq_rd10_pd;
wire cq_rd10_prdy;
wire cq_rd10_pvld;

wire [6:0] cq_rd11_pd;
wire cq_rd11_prdy;
wire cq_rd11_pvld;

wire [6:0] cq_rd12_pd;
wire cq_rd12_prdy;
wire cq_rd12_pvld;

wire [6:0] cq_rd13_pd;
wire cq_rd13_prdy;
wire cq_rd13_pvld;

wire [6:0] cq_rd14_pd;
wire cq_rd14_prdy;
wire cq_rd14_pvld;

wire [6:0] cq_rd15_pd;
wire cq_rd15_prdy;
wire cq_rd15_pvld;

//| eperl: generated_end (DO NOT EDIT ABOVE)
input [7:0] reg2dp_rd_os_cnt;
input noc2cvif_axi_r_rvalid; /* data valid */
output noc2cvif_axi_r_rready; /* data return handshake */
input [7:0] noc2cvif_axi_r_rid;
input noc2cvif_axi_r_rlast;
input [512 -1:0] noc2cvif_axi_r_rdata;
output cvif2noc_axi_ar_arvalid; /* data valid */
input cvif2noc_axi_ar_arready; /* data return handshake */
output [7:0] cvif2noc_axi_ar_arid;
output [3:0] cvif2noc_axi_ar_arlen;
output [32 -1:0] cvif2noc_axi_ar_araddr;
input [31:0] pwrbus_ram_pd;
wire [3:0] cq_wr_thread_id;
wire [6:0] cq_wr_pd;
wire cq_wr_pvld;
wire cq_wr_prdy;
NV_NVDLA_NOCIF_SRAM_READ_ig u_ig (
  .nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< i
  ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
  ,.reg2dp_rd_os_cnt (reg2dp_rd_os_cnt)
  ,.eg2ig_axi_vld (eg2ig_axi_vld) //|> w
//:my $i;
//:my $k=7;
//:for ($i=0;$i<$k;$i++) {
//: print (",.client${i}2cvif_rd_cdt_lat_fifo_pop(client${i}2cvif_rd_cdt_lat_fifo_pop)\n");
//: print (",.client${i}2cvif_rd_req_valid(client${i}2cvif_rd_req_valid)\n");
//: print (",.client${i}2cvif_rd_req_ready(client${i}2cvif_rd_req_ready)\n");
//: print (",.client${i}2cvif_rd_req_pd(client${i}2cvif_rd_req_pd)\n");
//: print (",.client${i}2cvif_rd_wt(client${i}2cvif_rd_wt)\n");
//: print (",.client${i}2cvif_rd_axid(client${i}2cvif_rd_axid)\n");
//: print (",.client${i}2cvif_lat_fifo_depth(client${i}2cvif_lat_fifo_depth)\n");
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)
,.client02cvif_rd_cdt_lat_fifo_pop(client02cvif_rd_cdt_lat_fifo_pop)
,.client02cvif_rd_req_valid(client02cvif_rd_req_valid)
,.client02cvif_rd_req_ready(client02cvif_rd_req_ready)
,.client02cvif_rd_req_pd(client02cvif_rd_req_pd)
,.client02cvif_rd_wt(client02cvif_rd_wt)
,.client02cvif_rd_axid(client02cvif_rd_axid)
,.client02cvif_lat_fifo_depth(client02cvif_lat_fifo_depth)
,.client12cvif_rd_cdt_lat_fifo_pop(client12cvif_rd_cdt_lat_fifo_pop)
,.client12cvif_rd_req_valid(client12cvif_rd_req_valid)
,.client12cvif_rd_req_ready(client12cvif_rd_req_ready)
,.client12cvif_rd_req_pd(client12cvif_rd_req_pd)
,.client12cvif_rd_wt(client12cvif_rd_wt)
,.client12cvif_rd_axid(client12cvif_rd_axid)
,.client12cvif_lat_fifo_depth(client12cvif_lat_fifo_depth)
,.client22cvif_rd_cdt_lat_fifo_pop(client22cvif_rd_cdt_lat_fifo_pop)
,.client22cvif_rd_req_valid(client22cvif_rd_req_valid)
,.client22cvif_rd_req_ready(client22cvif_rd_req_ready)
,.client22cvif_rd_req_pd(client22cvif_rd_req_pd)
,.client22cvif_rd_wt(client22cvif_rd_wt)
,.client22cvif_rd_axid(client22cvif_rd_axid)
,.client22cvif_lat_fifo_depth(client22cvif_lat_fifo_depth)
,.client32cvif_rd_cdt_lat_fifo_pop(client32cvif_rd_cdt_lat_fifo_pop)
,.client32cvif_rd_req_valid(client32cvif_rd_req_valid)
,.client32cvif_rd_req_ready(client32cvif_rd_req_ready)
,.client32cvif_rd_req_pd(client32cvif_rd_req_pd)
,.client32cvif_rd_wt(client32cvif_rd_wt)
,.client32cvif_rd_axid(client32cvif_rd_axid)
,.client32cvif_lat_fifo_depth(client32cvif_lat_fifo_depth)
,.client42cvif_rd_cdt_lat_fifo_pop(client42cvif_rd_cdt_lat_fifo_pop)
,.client42cvif_rd_req_valid(client42cvif_rd_req_valid)
,.client42cvif_rd_req_ready(client42cvif_rd_req_ready)
,.client42cvif_rd_req_pd(client42cvif_rd_req_pd)
,.client42cvif_rd_wt(client42cvif_rd_wt)
,.client42cvif_rd_axid(client42cvif_rd_axid)
,.client42cvif_lat_fifo_depth(client42cvif_lat_fifo_depth)
,.client52cvif_rd_cdt_lat_fifo_pop(client52cvif_rd_cdt_lat_fifo_pop)
,.client52cvif_rd_req_valid(client52cvif_rd_req_valid)
,.client52cvif_rd_req_ready(client52cvif_rd_req_ready)
,.client52cvif_rd_req_pd(client52cvif_rd_req_pd)
,.client52cvif_rd_wt(client52cvif_rd_wt)
,.client52cvif_rd_axid(client52cvif_rd_axid)
,.client52cvif_lat_fifo_depth(client52cvif_lat_fifo_depth)
,.client62cvif_rd_cdt_lat_fifo_pop(client62cvif_rd_cdt_lat_fifo_pop)
,.client62cvif_rd_req_valid(client62cvif_rd_req_valid)
,.client62cvif_rd_req_ready(client62cvif_rd_req_ready)
,.client62cvif_rd_req_pd(client62cvif_rd_req_pd)
,.client62cvif_rd_wt(client62cvif_rd_wt)
,.client62cvif_rd_axid(client62cvif_rd_axid)
,.client62cvif_lat_fifo_depth(client62cvif_lat_fifo_depth)

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,.cq_wr_pvld (cq_wr_pvld) //|> w
  ,.cq_wr_prdy (cq_wr_prdy) //|< w
  ,.cq_wr_thread_id (cq_wr_thread_id[3:0]) //|> w
  ,.cq_wr_pd (cq_wr_pd[6:0]) //|> w
  ,.cvif2noc_axi_ar_arvalid (cvif2noc_axi_ar_arvalid) //|> o
  ,.cvif2noc_axi_ar_arready (cvif2noc_axi_ar_arready) //|< i
  ,.cvif2noc_axi_ar_arid (cvif2noc_axi_ar_arid[7:0]) //|> o
  ,.cvif2noc_axi_ar_arlen (cvif2noc_axi_ar_arlen[3:0]) //|> o
  ,.cvif2noc_axi_ar_araddr (cvif2noc_axi_ar_araddr[32 -1:0]) //|> o
);
NV_NVDLA_NOCIF_SRAM_READ_eg u_eg (
   .nvdla_core_clk (nvdla_core_clk)
  ,.nvdla_core_rstn (nvdla_core_rstn)
//:my $k=7;
//:my $i;
//:for($i=0;$i<$k;$i++) {
//:print(" ,.cvif2client${i}_rd_rsp_valid(cvif2client${i}_rd_rsp_valid)\n");
//:print(" ,.cvif2client${i}_rd_rsp_ready(cvif2client${i}_rd_rsp_ready)\n");
//:print(" ,.cvif2client${i}_rd_rsp_pd(cvif2client${i}_rd_rsp_pd)\n");
//:}
//:my $i;
//:for($i=0;$i<7;$i++) {
//: print qq(
//: ,.cq_rd${i}_prdy(cq_rd${i}_prdy)
//: ,.cq_rd${i}_pvld(cq_rd${i}_pvld)
//: ,.cq_rd${i}_pd(cq_rd${i}_pd[6:0])
//:);
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)
 ,.cvif2client0_rd_rsp_valid(cvif2client0_rd_rsp_valid)
 ,.cvif2client0_rd_rsp_ready(cvif2client0_rd_rsp_ready)
 ,.cvif2client0_rd_rsp_pd(cvif2client0_rd_rsp_pd)
 ,.cvif2client1_rd_rsp_valid(cvif2client1_rd_rsp_valid)
 ,.cvif2client1_rd_rsp_ready(cvif2client1_rd_rsp_ready)
 ,.cvif2client1_rd_rsp_pd(cvif2client1_rd_rsp_pd)
 ,.cvif2client2_rd_rsp_valid(cvif2client2_rd_rsp_valid)
 ,.cvif2client2_rd_rsp_ready(cvif2client2_rd_rsp_ready)
 ,.cvif2client2_rd_rsp_pd(cvif2client2_rd_rsp_pd)
 ,.cvif2client3_rd_rsp_valid(cvif2client3_rd_rsp_valid)
 ,.cvif2client3_rd_rsp_ready(cvif2client3_rd_rsp_ready)
 ,.cvif2client3_rd_rsp_pd(cvif2client3_rd_rsp_pd)
 ,.cvif2client4_rd_rsp_valid(cvif2client4_rd_rsp_valid)
 ,.cvif2client4_rd_rsp_ready(cvif2client4_rd_rsp_ready)
 ,.cvif2client4_rd_rsp_pd(cvif2client4_rd_rsp_pd)
 ,.cvif2client5_rd_rsp_valid(cvif2client5_rd_rsp_valid)
 ,.cvif2client5_rd_rsp_ready(cvif2client5_rd_rsp_ready)
 ,.cvif2client5_rd_rsp_pd(cvif2client5_rd_rsp_pd)
 ,.cvif2client6_rd_rsp_valid(cvif2client6_rd_rsp_valid)
 ,.cvif2client6_rd_rsp_ready(cvif2client6_rd_rsp_ready)
 ,.cvif2client6_rd_rsp_pd(cvif2client6_rd_rsp_pd)

,.cq_rd0_prdy(cq_rd0_prdy)
,.cq_rd0_pvld(cq_rd0_pvld)
,.cq_rd0_pd(cq_rd0_pd[6:0])

,.cq_rd1_prdy(cq_rd1_prdy)
,.cq_rd1_pvld(cq_rd1_pvld)
,.cq_rd1_pd(cq_rd1_pd[6:0])

,.cq_rd2_prdy(cq_rd2_prdy)
,.cq_rd2_pvld(cq_rd2_pvld)
,.cq_rd2_pd(cq_rd2_pd[6:0])

,.cq_rd3_prdy(cq_rd3_prdy)
,.cq_rd3_pvld(cq_rd3_pvld)
,.cq_rd3_pd(cq_rd3_pd[6:0])

,.cq_rd4_prdy(cq_rd4_prdy)
,.cq_rd4_pvld(cq_rd4_pvld)
,.cq_rd4_pd(cq_rd4_pd[6:0])

,.cq_rd5_prdy(cq_rd5_prdy)
,.cq_rd5_pvld(cq_rd5_pvld)
,.cq_rd5_pd(cq_rd5_pd[6:0])

,.cq_rd6_prdy(cq_rd6_prdy)
,.cq_rd6_pvld(cq_rd6_pvld)
,.cq_rd6_pd(cq_rd6_pd[6:0])

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,.noc2cvif_axi_r_rvalid (noc2cvif_axi_r_rvalid) //|< i
  ,.noc2cvif_axi_r_rready (noc2cvif_axi_r_rready) //|> o
  ,.noc2cvif_axi_r_rid (noc2cvif_axi_r_rid[7:0]) //|< i
  ,.noc2cvif_axi_r_rlast (noc2cvif_axi_r_rlast) //|< i
  ,.noc2cvif_axi_r_rdata (noc2cvif_axi_r_rdata[512 -1:0]) //|< i
  ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
  ,.eg2ig_axi_vld (eg2ig_axi_vld) //|> w
  );
NV_NVDLA_NOCIF_SRAM_READ_cq u_cq (
   .nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< i
  ,.cq_wr_prdy (cq_wr_prdy) //|> w
  ,.cq_wr_pvld (cq_wr_pvld) //|< w
  ,.cq_wr_thread_id (cq_wr_thread_id[3:0]) //|< w
  ,.cq_wr_pd (cq_wr_pd[6:0]) //|< w
//:my $i;
//:for($i=0;$i<7;$i++) {
//: print qq(
//: ,.cq_rd${i}_prdy(cq_rd${i}_prdy)
//: ,.cq_rd${i}_pvld(cq_rd${i}_pvld)
//: ,.cq_rd${i}_pd(cq_rd${i}_pd[6:0])
//: );
//:}
//:my $i;
//:for($i=7;$i<16;$i++) {
//: print qq(
//: ,.cq_rd${i}_prdy(1'b1)
//:);
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)

,.cq_rd0_prdy(cq_rd0_prdy)
,.cq_rd0_pvld(cq_rd0_pvld)
,.cq_rd0_pd(cq_rd0_pd[6:0])

,.cq_rd1_prdy(cq_rd1_prdy)
,.cq_rd1_pvld(cq_rd1_pvld)
,.cq_rd1_pd(cq_rd1_pd[6:0])

,.cq_rd2_prdy(cq_rd2_prdy)
,.cq_rd2_pvld(cq_rd2_pvld)
,.cq_rd2_pd(cq_rd2_pd[6:0])

,.cq_rd3_prdy(cq_rd3_prdy)
,.cq_rd3_pvld(cq_rd3_pvld)
,.cq_rd3_pd(cq_rd3_pd[6:0])

,.cq_rd4_prdy(cq_rd4_prdy)
,.cq_rd4_pvld(cq_rd4_pvld)
,.cq_rd4_pd(cq_rd4_pd[6:0])

,.cq_rd5_prdy(cq_rd5_prdy)
,.cq_rd5_pvld(cq_rd5_pvld)
,.cq_rd5_pd(cq_rd5_pd[6:0])

,.cq_rd6_prdy(cq_rd6_prdy)
,.cq_rd6_pvld(cq_rd6_pvld)
,.cq_rd6_pd(cq_rd6_pd[6:0])

,.cq_rd7_prdy(1'b1)

,.cq_rd8_prdy(1'b1)

,.cq_rd9_prdy(1'b1)

,.cq_rd10_prdy(1'b1)

,.cq_rd11_prdy(1'b1)

,.cq_rd12_prdy(1'b1)

,.cq_rd13_prdy(1'b1)

,.cq_rd14_prdy(1'b1)

,.cq_rd15_prdy(1'b1)

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
  );
endmodule
