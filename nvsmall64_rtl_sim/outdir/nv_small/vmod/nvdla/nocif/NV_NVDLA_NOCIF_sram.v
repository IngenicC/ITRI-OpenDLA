// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_NOCIF_sram.v
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
module NV_NVDLA_NOCIF_sram (
   nvdla_core_clk
  ,nvdla_core_rstn
  ,pwrbus_ram_pd
//: my $k = 7;
//: my $i = 0;
//: for($i=0; $i<$k; $i++) {
//: print("  ,client${i}2cvif_rd_cdt_lat_fifo_pop\n");
//: print("  ,client${i}2cvif_rd_req_valid\n");
//: print("  ,client${i}2cvif_rd_req_pd\n");
//: print("  ,client${i}2cvif_rd_req_ready\n");
//: print("  ,client${i}2cvif_rd_axid\n");
//: print("  ,cvif2client${i}_rd_rsp_valid\n");
//: print("  ,cvif2client${i}_rd_rsp_ready\n");
//: print("  ,cvif2client${i}_rd_rsp_pd\n");
//: print("  ,client${i}2cvif_lat_fifo_depth\n");
//: }
//: my $k = 3;
//: my $i = 0;
//: for($i=0; $i<$k; $i++) {
//: print("  ,client${i}2cvif_wr_req_pd\n");
//: print("  ,client${i}2cvif_wr_req_valid\n");
//: print("  ,client${i}2cvif_wr_req_ready\n");
//: print("  ,client${i}2cvif_wr_axid\n");
//: print("  ,cvif2client${i}_wr_rsp_complete\n");
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
  ,client02cvif_rd_cdt_lat_fifo_pop
  ,client02cvif_rd_req_valid
  ,client02cvif_rd_req_pd
  ,client02cvif_rd_req_ready
  ,client02cvif_rd_axid
  ,cvif2client0_rd_rsp_valid
  ,cvif2client0_rd_rsp_ready
  ,cvif2client0_rd_rsp_pd
  ,client02cvif_lat_fifo_depth
  ,client12cvif_rd_cdt_lat_fifo_pop
  ,client12cvif_rd_req_valid
  ,client12cvif_rd_req_pd
  ,client12cvif_rd_req_ready
  ,client12cvif_rd_axid
  ,cvif2client1_rd_rsp_valid
  ,cvif2client1_rd_rsp_ready
  ,cvif2client1_rd_rsp_pd
  ,client12cvif_lat_fifo_depth
  ,client22cvif_rd_cdt_lat_fifo_pop
  ,client22cvif_rd_req_valid
  ,client22cvif_rd_req_pd
  ,client22cvif_rd_req_ready
  ,client22cvif_rd_axid
  ,cvif2client2_rd_rsp_valid
  ,cvif2client2_rd_rsp_ready
  ,cvif2client2_rd_rsp_pd
  ,client22cvif_lat_fifo_depth
  ,client32cvif_rd_cdt_lat_fifo_pop
  ,client32cvif_rd_req_valid
  ,client32cvif_rd_req_pd
  ,client32cvif_rd_req_ready
  ,client32cvif_rd_axid
  ,cvif2client3_rd_rsp_valid
  ,cvif2client3_rd_rsp_ready
  ,cvif2client3_rd_rsp_pd
  ,client32cvif_lat_fifo_depth
  ,client42cvif_rd_cdt_lat_fifo_pop
  ,client42cvif_rd_req_valid
  ,client42cvif_rd_req_pd
  ,client42cvif_rd_req_ready
  ,client42cvif_rd_axid
  ,cvif2client4_rd_rsp_valid
  ,cvif2client4_rd_rsp_ready
  ,cvif2client4_rd_rsp_pd
  ,client42cvif_lat_fifo_depth
  ,client52cvif_rd_cdt_lat_fifo_pop
  ,client52cvif_rd_req_valid
  ,client52cvif_rd_req_pd
  ,client52cvif_rd_req_ready
  ,client52cvif_rd_axid
  ,cvif2client5_rd_rsp_valid
  ,cvif2client5_rd_rsp_ready
  ,cvif2client5_rd_rsp_pd
  ,client52cvif_lat_fifo_depth
  ,client62cvif_rd_cdt_lat_fifo_pop
  ,client62cvif_rd_req_valid
  ,client62cvif_rd_req_pd
  ,client62cvif_rd_req_ready
  ,client62cvif_rd_axid
  ,cvif2client6_rd_rsp_valid
  ,cvif2client6_rd_rsp_ready
  ,cvif2client6_rd_rsp_pd
  ,client62cvif_lat_fifo_depth
  ,client02cvif_wr_req_pd
  ,client02cvif_wr_req_valid
  ,client02cvif_wr_req_ready
  ,client02cvif_wr_axid
  ,cvif2client0_wr_rsp_complete
  ,client12cvif_wr_req_pd
  ,client12cvif_wr_req_valid
  ,client12cvif_wr_req_ready
  ,client12cvif_wr_axid
  ,cvif2client1_wr_rsp_complete
  ,client22cvif_wr_req_pd
  ,client22cvif_wr_req_valid
  ,client22cvif_wr_req_ready
  ,client22cvif_wr_axid
  ,cvif2client2_wr_rsp_complete

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,csb2cvif_req_pd //|< i
  ,csb2cvif_req_pvld //|< i
  ,csb2cvif_req_prdy //|> o
  ,noc2cvif_axi_b_bid //|< i
  ,noc2cvif_axi_b_bvalid //|< i
  ,noc2cvif_axi_r_rdata //|< i
  ,noc2cvif_axi_r_rid //|< i
  ,noc2cvif_axi_r_rlast //|< i
  ,noc2cvif_axi_r_rvalid //|< i
  ,cvif2noc_axi_ar_arready //|< i
  ,cvif2noc_axi_aw_awready //|< i
  ,cvif2noc_axi_w_wready //|< i
  ,cvif2csb_resp_pd //|> o
  ,cvif2csb_resp_valid //|> o
  ,cvif2noc_axi_ar_araddr //|> o
  ,cvif2noc_axi_ar_arid //|> o
  ,cvif2noc_axi_ar_arlen //|> o
  ,cvif2noc_axi_ar_arvalid //|> o
  ,cvif2noc_axi_aw_awaddr //|> o
  ,cvif2noc_axi_aw_awid //|> o
  ,cvif2noc_axi_aw_awlen //|> o
  ,cvif2noc_axi_aw_awvalid //|> o
  ,cvif2noc_axi_w_wdata //|> o
  ,cvif2noc_axi_w_wlast //|> o
  ,cvif2noc_axi_w_wstrb //|> o
  ,cvif2noc_axi_w_wvalid //|> o
  ,noc2cvif_axi_b_bready //|> o
  ,noc2cvif_axi_r_rready //|> o
);
//:my $k = 7;
//:my $i = 0;
//:for ($i=0;$i<$k;$i++) {
//: print ("input client${i}2cvif_rd_cdt_lat_fifo_pop;\n");
//: print ("input [3:0] client${i}2cvif_rd_axid;\n");
//: print("input client${i}2cvif_rd_req_valid;\n");
//: print qq(
//: input [32 +14:0] client${i}2cvif_rd_req_pd;
//: );
//: print("output client${i}2cvif_rd_req_ready;\n");
//: print("output cvif2client${i}_rd_rsp_valid;\n");
//: print("input cvif2client${i}_rd_rsp_ready;\n");
//: print qq(
//: output [64 +(( 64 )/8/8)-1:0] cvif2client${i}_rd_rsp_pd;
//: );
//: print("input [7:0] client${i}2cvif_lat_fifo_depth;\n");
//: }
//:my $k = 3;
//:my $i = 0;
//:for ($i=0;$i<$k;$i++) {
//: print qq(
//: input [64 +(( 64 )/8/8):0] client${i}2cvif_wr_req_pd;
//: );
//: print ("input [3:0] client${i}2cvif_wr_axid;\n");
//: print("input client${i}2cvif_wr_req_valid;\n");
//: print("output client${i}2cvif_wr_req_ready;\n");
//: print("output cvif2client${i}_wr_rsp_complete;\n");
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
input client02cvif_rd_cdt_lat_fifo_pop;
input [3:0] client02cvif_rd_axid;
input client02cvif_rd_req_valid;

input [32 +14:0] client02cvif_rd_req_pd;
output client02cvif_rd_req_ready;
output cvif2client0_rd_rsp_valid;
input cvif2client0_rd_rsp_ready;

output [64 +(( 64 )/8/8)-1:0] cvif2client0_rd_rsp_pd;
input [7:0] client02cvif_lat_fifo_depth;
input client12cvif_rd_cdt_lat_fifo_pop;
input [3:0] client12cvif_rd_axid;
input client12cvif_rd_req_valid;

input [32 +14:0] client12cvif_rd_req_pd;
output client12cvif_rd_req_ready;
output cvif2client1_rd_rsp_valid;
input cvif2client1_rd_rsp_ready;

output [64 +(( 64 )/8/8)-1:0] cvif2client1_rd_rsp_pd;
input [7:0] client12cvif_lat_fifo_depth;
input client22cvif_rd_cdt_lat_fifo_pop;
input [3:0] client22cvif_rd_axid;
input client22cvif_rd_req_valid;

input [32 +14:0] client22cvif_rd_req_pd;
output client22cvif_rd_req_ready;
output cvif2client2_rd_rsp_valid;
input cvif2client2_rd_rsp_ready;

output [64 +(( 64 )/8/8)-1:0] cvif2client2_rd_rsp_pd;
input [7:0] client22cvif_lat_fifo_depth;
input client32cvif_rd_cdt_lat_fifo_pop;
input [3:0] client32cvif_rd_axid;
input client32cvif_rd_req_valid;

input [32 +14:0] client32cvif_rd_req_pd;
output client32cvif_rd_req_ready;
output cvif2client3_rd_rsp_valid;
input cvif2client3_rd_rsp_ready;

output [64 +(( 64 )/8/8)-1:0] cvif2client3_rd_rsp_pd;
input [7:0] client32cvif_lat_fifo_depth;
input client42cvif_rd_cdt_lat_fifo_pop;
input [3:0] client42cvif_rd_axid;
input client42cvif_rd_req_valid;

input [32 +14:0] client42cvif_rd_req_pd;
output client42cvif_rd_req_ready;
output cvif2client4_rd_rsp_valid;
input cvif2client4_rd_rsp_ready;

output [64 +(( 64 )/8/8)-1:0] cvif2client4_rd_rsp_pd;
input [7:0] client42cvif_lat_fifo_depth;
input client52cvif_rd_cdt_lat_fifo_pop;
input [3:0] client52cvif_rd_axid;
input client52cvif_rd_req_valid;

input [32 +14:0] client52cvif_rd_req_pd;
output client52cvif_rd_req_ready;
output cvif2client5_rd_rsp_valid;
input cvif2client5_rd_rsp_ready;

output [64 +(( 64 )/8/8)-1:0] cvif2client5_rd_rsp_pd;
input [7:0] client52cvif_lat_fifo_depth;
input client62cvif_rd_cdt_lat_fifo_pop;
input [3:0] client62cvif_rd_axid;
input client62cvif_rd_req_valid;

input [32 +14:0] client62cvif_rd_req_pd;
output client62cvif_rd_req_ready;
output cvif2client6_rd_rsp_valid;
input cvif2client6_rd_rsp_ready;

output [64 +(( 64 )/8/8)-1:0] cvif2client6_rd_rsp_pd;
input [7:0] client62cvif_lat_fifo_depth;

input [64 +(( 64 )/8/8):0] client02cvif_wr_req_pd;
input [3:0] client02cvif_wr_axid;
input client02cvif_wr_req_valid;
output client02cvif_wr_req_ready;
output cvif2client0_wr_rsp_complete;

input [64 +(( 64 )/8/8):0] client12cvif_wr_req_pd;
input [3:0] client12cvif_wr_axid;
input client12cvif_wr_req_valid;
output client12cvif_wr_req_ready;
output cvif2client1_wr_rsp_complete;

input [64 +(( 64 )/8/8):0] client22cvif_wr_req_pd;
input [3:0] client22cvif_wr_axid;
input client22cvif_wr_req_valid;
output client22cvif_wr_req_ready;
output cvif2client2_wr_rsp_complete;

//| eperl: generated_end (DO NOT EDIT ABOVE)
input nvdla_core_clk;
input nvdla_core_rstn;
input [31:0] pwrbus_ram_pd;
input csb2cvif_req_pvld; /* data valid */
output csb2cvif_req_prdy; /* data return handshake */
input [62:0] csb2cvif_req_pd;
output cvif2csb_resp_valid; /* data valid */
output [33:0] cvif2csb_resp_pd; /* pkt_id_width=1 pkt_widths=33,33  */
output cvif2noc_axi_ar_arvalid; /* data valid */
input cvif2noc_axi_ar_arready; /* data return handshake */
output [7:0] cvif2noc_axi_ar_arid;
output [3:0] cvif2noc_axi_ar_arlen;
output [32 -1:0] cvif2noc_axi_ar_araddr;
output cvif2noc_axi_aw_awvalid; /* data valid */
input cvif2noc_axi_aw_awready; /* data return handshake */
output [7:0] cvif2noc_axi_aw_awid;
output [3:0] cvif2noc_axi_aw_awlen;
output [32 -1:0] cvif2noc_axi_aw_awaddr;
output cvif2noc_axi_w_wvalid; /* data valid */
input cvif2noc_axi_w_wready; /* data return handshake */
output [512 -1:0] cvif2noc_axi_w_wdata;
output [512/8-1:0] cvif2noc_axi_w_wstrb;
output cvif2noc_axi_w_wlast;
input noc2cvif_axi_b_bvalid; /* data valid */
output noc2cvif_axi_b_bready; /* data return handshake */
input [7:0] noc2cvif_axi_b_bid;
input noc2cvif_axi_r_rvalid; /* data valid */
output noc2cvif_axi_r_rready; /* data return handshake */
input [7:0] noc2cvif_axi_r_rid;
input noc2cvif_axi_r_rlast;
input [512 -1:0] noc2cvif_axi_r_rdata;
//:my $i;
//:my $nindex=0;
//: my @dma_index = (0, 1, 1,1, 1,0, 1, 1, 0, 1,0,0,0,0,0,0);
//: my @dma_name = ("bdma","cdma_dat","cdma_wt","cdp","pdp","rbk","sdp","sdp_b","sdp_e","sdp_n","na","na","na","na","na","na");
//: for ($i=0;$i<16;$i++) {
//: if ($dma_index[$i]) {
//: print qq(
//: wire [7:0] reg2dp_rd_weight_$dma_name[$i];
//: wire [7:0] client${nindex}2cvif_rd_wt = reg2dp_rd_weight_$dma_name[$i];
//:);
//:$nindex++;
//:}
//:else {
//: if ($dma_name[$i] ne "na") {
//: print qq(wire [7:0] reg2dp_rd_weight_$dma_name[$i];);
//: }
//:}
//:}
//:my $i;
//:my $nindex=0;
//: my @dma_index = (0, 1,1, 1, 0, 0,0,0,0,0,0);
//: my @dma_name=("bdma","sdp","cdp","pdp","rbk","na","na","na","na","na","na","na","na","na","na","na");
//: for ($i=0;$i<16;$i++) {
//: if ($dma_index[$i]) {
//: print qq(
//: wire [7:0] reg2dp_wr_weight_$dma_name[$i];
//: wire [7:0] client${nindex}2cvif_wr_wt = reg2dp_wr_weight_$dma_name[$i];
//:);
//:$nindex++;
//:}
//:else {
//: if ($dma_name[$i] ne "na") {
//: print qq(wire [7:0] reg2dp_wr_weight_$dma_name[$i];);
//: }
//:}
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)
wire [7:0] reg2dp_rd_weight_bdma;
wire [7:0] reg2dp_rd_weight_cdma_dat;
wire [7:0] client02cvif_rd_wt = reg2dp_rd_weight_cdma_dat;

wire [7:0] reg2dp_rd_weight_cdma_wt;
wire [7:0] client12cvif_rd_wt = reg2dp_rd_weight_cdma_wt;

wire [7:0] reg2dp_rd_weight_cdp;
wire [7:0] client22cvif_rd_wt = reg2dp_rd_weight_cdp;

wire [7:0] reg2dp_rd_weight_pdp;
wire [7:0] client32cvif_rd_wt = reg2dp_rd_weight_pdp;
wire [7:0] reg2dp_rd_weight_rbk;
wire [7:0] reg2dp_rd_weight_sdp;
wire [7:0] client42cvif_rd_wt = reg2dp_rd_weight_sdp;

wire [7:0] reg2dp_rd_weight_sdp_b;
wire [7:0] client52cvif_rd_wt = reg2dp_rd_weight_sdp_b;
wire [7:0] reg2dp_rd_weight_sdp_e;
wire [7:0] reg2dp_rd_weight_sdp_n;
wire [7:0] client62cvif_rd_wt = reg2dp_rd_weight_sdp_n;
wire [7:0] reg2dp_wr_weight_bdma;
wire [7:0] reg2dp_wr_weight_sdp;
wire [7:0] client02cvif_wr_wt = reg2dp_wr_weight_sdp;

wire [7:0] reg2dp_wr_weight_cdp;
wire [7:0] client12cvif_wr_wt = reg2dp_wr_weight_cdp;

wire [7:0] reg2dp_wr_weight_pdp;
wire [7:0] client22cvif_wr_wt = reg2dp_wr_weight_pdp;
wire [7:0] reg2dp_wr_weight_rbk;
//| eperl: generated_end (DO NOT EDIT ABOVE)
wire [7:0] reg2dp_rd_os_cnt;
wire [7:0] reg2dp_wr_os_cnt;
NV_NVDLA_CVIF_csb u_csb (
   .nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< i
  ,.csb2cvif_req_pvld (csb2cvif_req_pvld) //|< i
  ,.csb2cvif_req_prdy (csb2cvif_req_prdy) //|> o
  ,.csb2cvif_req_pd (csb2cvif_req_pd[62:0]) //|< i
  ,.cvif2csb_resp_valid (cvif2csb_resp_valid) //|> o
  ,.cvif2csb_resp_pd (cvif2csb_resp_pd[33:0]) //|> o
  ,.dp2reg_idle ({1{1'b1}}) //|< ?
  ,.reg2dp_rd_os_cnt (reg2dp_rd_os_cnt[7:0]) //|> w
  ,.reg2dp_rd_weight_bdma (reg2dp_rd_weight_bdma[7:0]) //|> w
  ,.reg2dp_rd_weight_cdma_dat (reg2dp_rd_weight_cdma_dat[7:0]) //|> w
  ,.reg2dp_rd_weight_cdma_wt (reg2dp_rd_weight_cdma_wt[7:0]) //|> w
  ,.reg2dp_rd_weight_cdp (reg2dp_rd_weight_cdp[7:0]) //|> w
  ,.reg2dp_rd_weight_pdp (reg2dp_rd_weight_pdp[7:0]) //|> w
  ,.reg2dp_rd_weight_rbk (reg2dp_rd_weight_rbk[7:0]) //|> w
  ,.reg2dp_rd_weight_rsv_0 () //|> ?
  ,.reg2dp_rd_weight_rsv_1 () //|> ?
  ,.reg2dp_rd_weight_sdp (reg2dp_rd_weight_sdp[7:0]) //|> w
  ,.reg2dp_rd_weight_sdp_b (reg2dp_rd_weight_sdp_b[7:0]) //|> w
  ,.reg2dp_rd_weight_sdp_e (reg2dp_rd_weight_sdp_e[7:0]) //|> w
  ,.reg2dp_rd_weight_sdp_n (reg2dp_rd_weight_sdp_n[7:0]) //|> w
  ,.reg2dp_wr_os_cnt (reg2dp_wr_os_cnt[7:0]) //|> w
  ,.reg2dp_wr_weight_bdma (reg2dp_wr_weight_bdma[7:0]) //|> w
  ,.reg2dp_wr_weight_cdp (reg2dp_wr_weight_cdp[7:0]) //|> w
  ,.reg2dp_wr_weight_pdp (reg2dp_wr_weight_pdp[7:0]) //|> w
  ,.reg2dp_wr_weight_rbk (reg2dp_wr_weight_rbk[7:0]) //|> w
  ,.reg2dp_wr_weight_rsv_0 () //|> ?
  ,.reg2dp_wr_weight_rsv_1 () //|> ?
  ,.reg2dp_wr_weight_rsv_2 () //|> ?
  ,.reg2dp_wr_weight_sdp (reg2dp_wr_weight_sdp[7:0]) //|> w
  );
NV_NVDLA_NOCIF_SRAM_read u_read (
   .reg2dp_rd_os_cnt (reg2dp_rd_os_cnt[7:0]) //|< w
  ,.nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< i
  ,.pwrbus_ram_pd (pwrbus_ram_pd)
//:my $k=7;
//:my $i;
//:for ($i=0;$i<$k;$i++) {
//: print(",.client${i}2cvif_rd_cdt_lat_fifo_pop(client${i}2cvif_rd_cdt_lat_fifo_pop)\n");
//: print(",.client${i}2cvif_rd_req_valid (client${i}2cvif_rd_req_valid)\n");
//: print(",.client${i}2cvif_rd_req_ready (client${i}2cvif_rd_req_ready)\n");
//: print(",.client${i}2cvif_rd_req_pd (client${i}2cvif_rd_req_pd)\n");
//: print(",.cvif2client${i}_rd_rsp_valid (cvif2client${i}_rd_rsp_valid)\n");
//: print(",.cvif2client${i}_rd_rsp_ready (cvif2client${i}_rd_rsp_ready)\n");
//: print(",.cvif2client${i}_rd_rsp_pd (cvif2client${i}_rd_rsp_pd)\n"),
//: print(",.client${i}2cvif_rd_wt (client${i}2cvif_rd_wt)\n"),
//: print(",.client${i}2cvif_rd_axid (client${i}2cvif_rd_axid)\n"),
//: print(",.client${i}2cvif_lat_fifo_depth (client${i}2cvif_lat_fifo_depth)\n"),
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
,.client02cvif_rd_cdt_lat_fifo_pop(client02cvif_rd_cdt_lat_fifo_pop)
,.client02cvif_rd_req_valid (client02cvif_rd_req_valid)
,.client02cvif_rd_req_ready (client02cvif_rd_req_ready)
,.client02cvif_rd_req_pd (client02cvif_rd_req_pd)
,.cvif2client0_rd_rsp_valid (cvif2client0_rd_rsp_valid)
,.cvif2client0_rd_rsp_ready (cvif2client0_rd_rsp_ready)
,.cvif2client0_rd_rsp_pd (cvif2client0_rd_rsp_pd)
,.client02cvif_rd_wt (client02cvif_rd_wt)
,.client02cvif_rd_axid (client02cvif_rd_axid)
,.client02cvif_lat_fifo_depth (client02cvif_lat_fifo_depth)
,.client12cvif_rd_cdt_lat_fifo_pop(client12cvif_rd_cdt_lat_fifo_pop)
,.client12cvif_rd_req_valid (client12cvif_rd_req_valid)
,.client12cvif_rd_req_ready (client12cvif_rd_req_ready)
,.client12cvif_rd_req_pd (client12cvif_rd_req_pd)
,.cvif2client1_rd_rsp_valid (cvif2client1_rd_rsp_valid)
,.cvif2client1_rd_rsp_ready (cvif2client1_rd_rsp_ready)
,.cvif2client1_rd_rsp_pd (cvif2client1_rd_rsp_pd)
,.client12cvif_rd_wt (client12cvif_rd_wt)
,.client12cvif_rd_axid (client12cvif_rd_axid)
,.client12cvif_lat_fifo_depth (client12cvif_lat_fifo_depth)
,.client22cvif_rd_cdt_lat_fifo_pop(client22cvif_rd_cdt_lat_fifo_pop)
,.client22cvif_rd_req_valid (client22cvif_rd_req_valid)
,.client22cvif_rd_req_ready (client22cvif_rd_req_ready)
,.client22cvif_rd_req_pd (client22cvif_rd_req_pd)
,.cvif2client2_rd_rsp_valid (cvif2client2_rd_rsp_valid)
,.cvif2client2_rd_rsp_ready (cvif2client2_rd_rsp_ready)
,.cvif2client2_rd_rsp_pd (cvif2client2_rd_rsp_pd)
,.client22cvif_rd_wt (client22cvif_rd_wt)
,.client22cvif_rd_axid (client22cvif_rd_axid)
,.client22cvif_lat_fifo_depth (client22cvif_lat_fifo_depth)
,.client32cvif_rd_cdt_lat_fifo_pop(client32cvif_rd_cdt_lat_fifo_pop)
,.client32cvif_rd_req_valid (client32cvif_rd_req_valid)
,.client32cvif_rd_req_ready (client32cvif_rd_req_ready)
,.client32cvif_rd_req_pd (client32cvif_rd_req_pd)
,.cvif2client3_rd_rsp_valid (cvif2client3_rd_rsp_valid)
,.cvif2client3_rd_rsp_ready (cvif2client3_rd_rsp_ready)
,.cvif2client3_rd_rsp_pd (cvif2client3_rd_rsp_pd)
,.client32cvif_rd_wt (client32cvif_rd_wt)
,.client32cvif_rd_axid (client32cvif_rd_axid)
,.client32cvif_lat_fifo_depth (client32cvif_lat_fifo_depth)
,.client42cvif_rd_cdt_lat_fifo_pop(client42cvif_rd_cdt_lat_fifo_pop)
,.client42cvif_rd_req_valid (client42cvif_rd_req_valid)
,.client42cvif_rd_req_ready (client42cvif_rd_req_ready)
,.client42cvif_rd_req_pd (client42cvif_rd_req_pd)
,.cvif2client4_rd_rsp_valid (cvif2client4_rd_rsp_valid)
,.cvif2client4_rd_rsp_ready (cvif2client4_rd_rsp_ready)
,.cvif2client4_rd_rsp_pd (cvif2client4_rd_rsp_pd)
,.client42cvif_rd_wt (client42cvif_rd_wt)
,.client42cvif_rd_axid (client42cvif_rd_axid)
,.client42cvif_lat_fifo_depth (client42cvif_lat_fifo_depth)
,.client52cvif_rd_cdt_lat_fifo_pop(client52cvif_rd_cdt_lat_fifo_pop)
,.client52cvif_rd_req_valid (client52cvif_rd_req_valid)
,.client52cvif_rd_req_ready (client52cvif_rd_req_ready)
,.client52cvif_rd_req_pd (client52cvif_rd_req_pd)
,.cvif2client5_rd_rsp_valid (cvif2client5_rd_rsp_valid)
,.cvif2client5_rd_rsp_ready (cvif2client5_rd_rsp_ready)
,.cvif2client5_rd_rsp_pd (cvif2client5_rd_rsp_pd)
,.client52cvif_rd_wt (client52cvif_rd_wt)
,.client52cvif_rd_axid (client52cvif_rd_axid)
,.client52cvif_lat_fifo_depth (client52cvif_lat_fifo_depth)
,.client62cvif_rd_cdt_lat_fifo_pop(client62cvif_rd_cdt_lat_fifo_pop)
,.client62cvif_rd_req_valid (client62cvif_rd_req_valid)
,.client62cvif_rd_req_ready (client62cvif_rd_req_ready)
,.client62cvif_rd_req_pd (client62cvif_rd_req_pd)
,.cvif2client6_rd_rsp_valid (cvif2client6_rd_rsp_valid)
,.cvif2client6_rd_rsp_ready (cvif2client6_rd_rsp_ready)
,.cvif2client6_rd_rsp_pd (cvif2client6_rd_rsp_pd)
,.client62cvif_rd_wt (client62cvif_rd_wt)
,.client62cvif_rd_axid (client62cvif_rd_axid)
,.client62cvif_lat_fifo_depth (client62cvif_lat_fifo_depth)

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,.cvif2noc_axi_ar_arvalid (cvif2noc_axi_ar_arvalid) //|> o
  ,.cvif2noc_axi_ar_arready (cvif2noc_axi_ar_arready) //|< i
  ,.cvif2noc_axi_ar_arid (cvif2noc_axi_ar_arid) //|> o
  ,.cvif2noc_axi_ar_arlen (cvif2noc_axi_ar_arlen) //|> o
  ,.cvif2noc_axi_ar_araddr (cvif2noc_axi_ar_araddr) //|> o
  ,.noc2cvif_axi_r_rvalid (noc2cvif_axi_r_rvalid) //|< i
  ,.noc2cvif_axi_r_rready (noc2cvif_axi_r_rready) //|> o
  ,.noc2cvif_axi_r_rid (noc2cvif_axi_r_rid) //|< i
  ,.noc2cvif_axi_r_rlast (noc2cvif_axi_r_rlast) //|< i
  ,.noc2cvif_axi_r_rdata (noc2cvif_axi_r_rdata) //|< i
);
NV_NVDLA_NOCIF_SRAM_write u_write (
  .nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< i
  ,.pwrbus_ram_pd (pwrbus_ram_pd)
  ,.reg2dp_wr_os_cnt (reg2dp_wr_os_cnt)
//:my $k=3;
//:my $i;
//:for ($i=0;$i<$k;$i++) {
//: print(",.client${i}2cvif_wr_req_valid(client${i}2cvif_wr_req_valid)\n");
//: print(",.client${i}2cvif_wr_req_ready(client${i}2cvif_wr_req_ready)\n");
//: print(",.client${i}2cvif_wr_req_pd(client${i}2cvif_wr_req_pd)\n");
//: print(",.client${i}2cvif_wr_wt(client${i}2cvif_wr_wt)\n");
//: print(",.client${i}2cvif_wr_axid(client${i}2cvif_wr_axid)\n");
//: print(",.cvif2client${i}_wr_rsp_complete(cvif2client${i}_wr_rsp_complete)\n");
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)
,.client02cvif_wr_req_valid(client02cvif_wr_req_valid)
,.client02cvif_wr_req_ready(client02cvif_wr_req_ready)
,.client02cvif_wr_req_pd(client02cvif_wr_req_pd)
,.client02cvif_wr_wt(client02cvif_wr_wt)
,.client02cvif_wr_axid(client02cvif_wr_axid)
,.cvif2client0_wr_rsp_complete(cvif2client0_wr_rsp_complete)
,.client12cvif_wr_req_valid(client12cvif_wr_req_valid)
,.client12cvif_wr_req_ready(client12cvif_wr_req_ready)
,.client12cvif_wr_req_pd(client12cvif_wr_req_pd)
,.client12cvif_wr_wt(client12cvif_wr_wt)
,.client12cvif_wr_axid(client12cvif_wr_axid)
,.cvif2client1_wr_rsp_complete(cvif2client1_wr_rsp_complete)
,.client22cvif_wr_req_valid(client22cvif_wr_req_valid)
,.client22cvif_wr_req_ready(client22cvif_wr_req_ready)
,.client22cvif_wr_req_pd(client22cvif_wr_req_pd)
,.client22cvif_wr_wt(client22cvif_wr_wt)
,.client22cvif_wr_axid(client22cvif_wr_axid)
,.cvif2client2_wr_rsp_complete(cvif2client2_wr_rsp_complete)

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,.cvif2noc_axi_aw_awvalid (cvif2noc_axi_aw_awvalid) //|> o
  ,.cvif2noc_axi_aw_awready (cvif2noc_axi_aw_awready) //|< i
  ,.cvif2noc_axi_aw_awid (cvif2noc_axi_aw_awid) //|> o
  ,.cvif2noc_axi_aw_awlen (cvif2noc_axi_aw_awlen) //|> o
  ,.cvif2noc_axi_aw_awaddr (cvif2noc_axi_aw_awaddr) //|> o
  ,.cvif2noc_axi_w_wvalid (cvif2noc_axi_w_wvalid) //|> o
  ,.cvif2noc_axi_w_wready (cvif2noc_axi_w_wready) //|< i
  ,.cvif2noc_axi_w_wdata (cvif2noc_axi_w_wdata) //|> o
  ,.cvif2noc_axi_w_wstrb (cvif2noc_axi_w_wstrb) //|> o
  ,.cvif2noc_axi_w_wlast (cvif2noc_axi_w_wlast) //|> o
  ,.noc2cvif_axi_b_bvalid (noc2cvif_axi_b_bvalid) //|< i
  ,.noc2cvif_axi_b_bready (noc2cvif_axi_b_bready) //|> o
  ,.noc2cvif_axi_b_bid (noc2cvif_axi_b_bid) //|< i
);
endmodule
