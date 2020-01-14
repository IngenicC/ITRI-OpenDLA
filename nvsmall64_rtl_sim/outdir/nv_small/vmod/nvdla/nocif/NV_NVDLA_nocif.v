// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_nocif.v
module NV_NVDLA_nocif (
   nvdla_core_clk
  ,nvdla_core_rstn
//: my $k = 7;
//: my $i = 0;
//: for($i=0; $i<$k; $i++) {
//: print("  ,client${i}2cvif_rd_cdt_lat_fifo_pop\n");
//: print("  ,client${i}2cvif_rd_req_valid\n");
//: print("  ,client${i}2cvif_rd_req_pd\n");
//: print("  ,client${i}2cvif_rd_req_ready\n");
//: print("  ,cvif2client${i}_rd_rsp_valid\n");
//: print("  ,cvif2client${i}_rd_rsp_pd\n");
//: print("  ,cvif2client${i}_rd_rsp_ready\n");
//: print("  ,client${i}2cvif_lat_fifo_depth\n");
//: print("  ,client${i}2cvif_rd_axid\n");
//: }
//: my $k = 3;
//: my $i = 0;
//: for($i=0; $i<$k; $i++) {
//: print("  ,client${i}2cvif_wr_req_pd\n");
//: print("  ,client${i}2cvif_wr_req_valid\n");
//: print("  ,client${i}2cvif_wr_req_ready\n");
//: print("  ,cvif2client${i}_wr_rsp_complete\n");
//: print("  ,client${i}2cvif_wr_axid\n");
//: }
//: my $k = 7;
//: my $i = 0;
//: for($i=0; $i<$k; $i++) {
//: print("  ,client${i}2mcif_rd_cdt_lat_fifo_pop\n");
//: print("  ,client${i}2mcif_rd_req_valid\n");
//: print("  ,client${i}2mcif_rd_req_pd\n");
//: print("  ,client${i}2mcif_rd_req_ready\n");
//: print("  ,mcif2client${i}_rd_rsp_valid\n");
//: print("  ,mcif2client${i}_rd_rsp_pd\n");
//: print("  ,mcif2client${i}_rd_rsp_ready\n");
//: print("  ,client${i}2mcif_lat_fifo_depth\n");
//: print("  ,client${i}2mcif_rd_axid\n");
//: }
//: my $k = 3;
//: my $i = 0;
//: for($i=0; $i<$k; $i++) {
//: print("  ,client${i}2mcif_wr_req_pd\n");
//: print("  ,client${i}2mcif_wr_req_valid\n");
//: print("  ,client${i}2mcif_wr_req_ready\n");
//: print("  ,mcif2client${i}_wr_rsp_complete\n");
//: print("  ,client${i}2mcif_wr_axid\n");
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
  ,client02cvif_rd_cdt_lat_fifo_pop
  ,client02cvif_rd_req_valid
  ,client02cvif_rd_req_pd
  ,client02cvif_rd_req_ready
  ,cvif2client0_rd_rsp_valid
  ,cvif2client0_rd_rsp_pd
  ,cvif2client0_rd_rsp_ready
  ,client02cvif_lat_fifo_depth
  ,client02cvif_rd_axid
  ,client12cvif_rd_cdt_lat_fifo_pop
  ,client12cvif_rd_req_valid
  ,client12cvif_rd_req_pd
  ,client12cvif_rd_req_ready
  ,cvif2client1_rd_rsp_valid
  ,cvif2client1_rd_rsp_pd
  ,cvif2client1_rd_rsp_ready
  ,client12cvif_lat_fifo_depth
  ,client12cvif_rd_axid
  ,client22cvif_rd_cdt_lat_fifo_pop
  ,client22cvif_rd_req_valid
  ,client22cvif_rd_req_pd
  ,client22cvif_rd_req_ready
  ,cvif2client2_rd_rsp_valid
  ,cvif2client2_rd_rsp_pd
  ,cvif2client2_rd_rsp_ready
  ,client22cvif_lat_fifo_depth
  ,client22cvif_rd_axid
  ,client32cvif_rd_cdt_lat_fifo_pop
  ,client32cvif_rd_req_valid
  ,client32cvif_rd_req_pd
  ,client32cvif_rd_req_ready
  ,cvif2client3_rd_rsp_valid
  ,cvif2client3_rd_rsp_pd
  ,cvif2client3_rd_rsp_ready
  ,client32cvif_lat_fifo_depth
  ,client32cvif_rd_axid
  ,client42cvif_rd_cdt_lat_fifo_pop
  ,client42cvif_rd_req_valid
  ,client42cvif_rd_req_pd
  ,client42cvif_rd_req_ready
  ,cvif2client4_rd_rsp_valid
  ,cvif2client4_rd_rsp_pd
  ,cvif2client4_rd_rsp_ready
  ,client42cvif_lat_fifo_depth
  ,client42cvif_rd_axid
  ,client52cvif_rd_cdt_lat_fifo_pop
  ,client52cvif_rd_req_valid
  ,client52cvif_rd_req_pd
  ,client52cvif_rd_req_ready
  ,cvif2client5_rd_rsp_valid
  ,cvif2client5_rd_rsp_pd
  ,cvif2client5_rd_rsp_ready
  ,client52cvif_lat_fifo_depth
  ,client52cvif_rd_axid
  ,client62cvif_rd_cdt_lat_fifo_pop
  ,client62cvif_rd_req_valid
  ,client62cvif_rd_req_pd
  ,client62cvif_rd_req_ready
  ,cvif2client6_rd_rsp_valid
  ,cvif2client6_rd_rsp_pd
  ,cvif2client6_rd_rsp_ready
  ,client62cvif_lat_fifo_depth
  ,client62cvif_rd_axid
  ,client02cvif_wr_req_pd
  ,client02cvif_wr_req_valid
  ,client02cvif_wr_req_ready
  ,cvif2client0_wr_rsp_complete
  ,client02cvif_wr_axid
  ,client12cvif_wr_req_pd
  ,client12cvif_wr_req_valid
  ,client12cvif_wr_req_ready
  ,cvif2client1_wr_rsp_complete
  ,client12cvif_wr_axid
  ,client22cvif_wr_req_pd
  ,client22cvif_wr_req_valid
  ,client22cvif_wr_req_ready
  ,cvif2client2_wr_rsp_complete
  ,client22cvif_wr_axid
  ,client02mcif_rd_cdt_lat_fifo_pop
  ,client02mcif_rd_req_valid
  ,client02mcif_rd_req_pd
  ,client02mcif_rd_req_ready
  ,mcif2client0_rd_rsp_valid
  ,mcif2client0_rd_rsp_pd
  ,mcif2client0_rd_rsp_ready
  ,client02mcif_lat_fifo_depth
  ,client02mcif_rd_axid
  ,client12mcif_rd_cdt_lat_fifo_pop
  ,client12mcif_rd_req_valid
  ,client12mcif_rd_req_pd
  ,client12mcif_rd_req_ready
  ,mcif2client1_rd_rsp_valid
  ,mcif2client1_rd_rsp_pd
  ,mcif2client1_rd_rsp_ready
  ,client12mcif_lat_fifo_depth
  ,client12mcif_rd_axid
  ,client22mcif_rd_cdt_lat_fifo_pop
  ,client22mcif_rd_req_valid
  ,client22mcif_rd_req_pd
  ,client22mcif_rd_req_ready
  ,mcif2client2_rd_rsp_valid
  ,mcif2client2_rd_rsp_pd
  ,mcif2client2_rd_rsp_ready
  ,client22mcif_lat_fifo_depth
  ,client22mcif_rd_axid
  ,client32mcif_rd_cdt_lat_fifo_pop
  ,client32mcif_rd_req_valid
  ,client32mcif_rd_req_pd
  ,client32mcif_rd_req_ready
  ,mcif2client3_rd_rsp_valid
  ,mcif2client3_rd_rsp_pd
  ,mcif2client3_rd_rsp_ready
  ,client32mcif_lat_fifo_depth
  ,client32mcif_rd_axid
  ,client42mcif_rd_cdt_lat_fifo_pop
  ,client42mcif_rd_req_valid
  ,client42mcif_rd_req_pd
  ,client42mcif_rd_req_ready
  ,mcif2client4_rd_rsp_valid
  ,mcif2client4_rd_rsp_pd
  ,mcif2client4_rd_rsp_ready
  ,client42mcif_lat_fifo_depth
  ,client42mcif_rd_axid
  ,client52mcif_rd_cdt_lat_fifo_pop
  ,client52mcif_rd_req_valid
  ,client52mcif_rd_req_pd
  ,client52mcif_rd_req_ready
  ,mcif2client5_rd_rsp_valid
  ,mcif2client5_rd_rsp_pd
  ,mcif2client5_rd_rsp_ready
  ,client52mcif_lat_fifo_depth
  ,client52mcif_rd_axid
  ,client62mcif_rd_cdt_lat_fifo_pop
  ,client62mcif_rd_req_valid
  ,client62mcif_rd_req_pd
  ,client62mcif_rd_req_ready
  ,mcif2client6_rd_rsp_valid
  ,mcif2client6_rd_rsp_pd
  ,mcif2client6_rd_rsp_ready
  ,client62mcif_lat_fifo_depth
  ,client62mcif_rd_axid
  ,client02mcif_wr_req_pd
  ,client02mcif_wr_req_valid
  ,client02mcif_wr_req_ready
  ,mcif2client0_wr_rsp_complete
  ,client02mcif_wr_axid
  ,client12mcif_wr_req_pd
  ,client12mcif_wr_req_valid
  ,client12mcif_wr_req_ready
  ,mcif2client1_wr_rsp_complete
  ,client12mcif_wr_axid
  ,client22mcif_wr_req_pd
  ,client22mcif_wr_req_valid
  ,client22mcif_wr_req_ready
  ,mcif2client2_wr_rsp_complete
  ,client22mcif_wr_axid

//| eperl: generated_end (DO NOT EDIT ABOVE)
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
  ,noc2mcif_axi_b_bid //|< i
  ,noc2mcif_axi_b_bvalid //|< i
  ,noc2mcif_axi_r_rdata //|< i
  ,noc2mcif_axi_r_rid //|< i
  ,noc2mcif_axi_r_rlast //|< i
  ,noc2mcif_axi_r_rvalid //|< i
  ,mcif2noc_axi_ar_arready //|< i
  ,mcif2noc_axi_aw_awready //|< i
  ,mcif2noc_axi_w_wready //|< i
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
  ,noc2mcif_axi_b_bready //|> o
  ,noc2mcif_axi_r_rready //|> o
);
//:my $k = 7;
//:my $i = 0;
//:for ($i=0;$i<$k;$i++) {
//: print ("input client${i}2cvif_rd_cdt_lat_fifo_pop;\n");
//: print("input client${i}2cvif_rd_req_valid;\n");
//: print qq(input [32 +14:0] client${i}2cvif_rd_req_pd;);
//: print("output client${i}2cvif_rd_req_ready;\n");
//: print("output cvif2client${i}_rd_rsp_valid;\n");
//: print("input cvif2client${i}_rd_rsp_ready;\n");
//: print qq(output [512 +1:0] cvif2client${i}_rd_rsp_pd;);
//: print("input [7:0] client${i}2cvif_lat_fifo_depth;\n");
//: print("input [3:0] client${i}2cvif_rd_axid;\n");
//: }
//:my $k = 3;
//:my $i = 0;
//:for ($i=0;$i<$k;$i++) {
//: print qq(input [512 +2:0] client${i}2cvif_wr_req_pd;);
//: print("input client${i}2cvif_wr_req_valid;\n");
//: print("output client${i}2cvif_wr_req_ready;\n");
//: print("output cvif2client${i}_wr_rsp_complete;\n");
//: print("input [3:0] client${i}2cvif_wr_axid;\n");
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
input client02cvif_rd_cdt_lat_fifo_pop;
input client02cvif_rd_req_valid;
input [32 +14:0] client02cvif_rd_req_pd;output client02cvif_rd_req_ready;
output cvif2client0_rd_rsp_valid;
input cvif2client0_rd_rsp_ready;
output [512 +1:0] cvif2client0_rd_rsp_pd;input [7:0] client02cvif_lat_fifo_depth;
input [3:0] client02cvif_rd_axid;
input client12cvif_rd_cdt_lat_fifo_pop;
input client12cvif_rd_req_valid;
input [32 +14:0] client12cvif_rd_req_pd;output client12cvif_rd_req_ready;
output cvif2client1_rd_rsp_valid;
input cvif2client1_rd_rsp_ready;
output [512 +1:0] cvif2client1_rd_rsp_pd;input [7:0] client12cvif_lat_fifo_depth;
input [3:0] client12cvif_rd_axid;
input client22cvif_rd_cdt_lat_fifo_pop;
input client22cvif_rd_req_valid;
input [32 +14:0] client22cvif_rd_req_pd;output client22cvif_rd_req_ready;
output cvif2client2_rd_rsp_valid;
input cvif2client2_rd_rsp_ready;
output [512 +1:0] cvif2client2_rd_rsp_pd;input [7:0] client22cvif_lat_fifo_depth;
input [3:0] client22cvif_rd_axid;
input client32cvif_rd_cdt_lat_fifo_pop;
input client32cvif_rd_req_valid;
input [32 +14:0] client32cvif_rd_req_pd;output client32cvif_rd_req_ready;
output cvif2client3_rd_rsp_valid;
input cvif2client3_rd_rsp_ready;
output [512 +1:0] cvif2client3_rd_rsp_pd;input [7:0] client32cvif_lat_fifo_depth;
input [3:0] client32cvif_rd_axid;
input client42cvif_rd_cdt_lat_fifo_pop;
input client42cvif_rd_req_valid;
input [32 +14:0] client42cvif_rd_req_pd;output client42cvif_rd_req_ready;
output cvif2client4_rd_rsp_valid;
input cvif2client4_rd_rsp_ready;
output [512 +1:0] cvif2client4_rd_rsp_pd;input [7:0] client42cvif_lat_fifo_depth;
input [3:0] client42cvif_rd_axid;
input client52cvif_rd_cdt_lat_fifo_pop;
input client52cvif_rd_req_valid;
input [32 +14:0] client52cvif_rd_req_pd;output client52cvif_rd_req_ready;
output cvif2client5_rd_rsp_valid;
input cvif2client5_rd_rsp_ready;
output [512 +1:0] cvif2client5_rd_rsp_pd;input [7:0] client52cvif_lat_fifo_depth;
input [3:0] client52cvif_rd_axid;
input client62cvif_rd_cdt_lat_fifo_pop;
input client62cvif_rd_req_valid;
input [32 +14:0] client62cvif_rd_req_pd;output client62cvif_rd_req_ready;
output cvif2client6_rd_rsp_valid;
input cvif2client6_rd_rsp_ready;
output [512 +1:0] cvif2client6_rd_rsp_pd;input [7:0] client62cvif_lat_fifo_depth;
input [3:0] client62cvif_rd_axid;
input [512 +2:0] client02cvif_wr_req_pd;input client02cvif_wr_req_valid;
output client02cvif_wr_req_ready;
output cvif2client0_wr_rsp_complete;
input [3:0] client02cvif_wr_axid;
input [512 +2:0] client12cvif_wr_req_pd;input client12cvif_wr_req_valid;
output client12cvif_wr_req_ready;
output cvif2client1_wr_rsp_complete;
input [3:0] client12cvif_wr_axid;
input [512 +2:0] client22cvif_wr_req_pd;input client22cvif_wr_req_valid;
output client22cvif_wr_req_ready;
output cvif2client2_wr_rsp_complete;
input [3:0] client22cvif_wr_axid;

//| eperl: generated_end (DO NOT EDIT ABOVE)
//
//:my $k = 7;
//:my $i = 0;
//:for ($i=0;$i<$k;$i++) {
//: print ("input client${i}2mcif_rd_cdt_lat_fifo_pop;\n");
//: print("input client${i}2mcif_rd_req_valid;\n");
//: print qq(input [32 +14:0] client${i}2mcif_rd_req_pd;);
//: print("output client${i}2mcif_rd_req_ready;\n");
//: print("output mcif2client${i}_rd_rsp_valid;\n");
//: print("input mcif2client${i}_rd_rsp_ready;\n");
//: print qq(output [512 +1:0] mcif2client${i}_rd_rsp_pd;);
//: print("input [7:0] client${i}2mcif_lat_fifo_depth;\n");
//: print("input [3:0] client${i}2mcif_rd_axid;\n");
//: }
//:my $k = 3;
//:my $i = 0;
//:for ($i=0;$i<$k;$i++) {
//: print qq(input [512 +2:0] client${i}2mcif_wr_req_pd;);
//: print("input client${i}2mcif_wr_req_valid;\n");
//: print("output client${i}2mcif_wr_req_ready;\n");
//: print("output mcif2client${i}_wr_rsp_complete;\n");
//: print("input [3:0] client${i}2mcif_wr_axid;\n");
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
input client02mcif_rd_cdt_lat_fifo_pop;
input client02mcif_rd_req_valid;
input [32 +14:0] client02mcif_rd_req_pd;output client02mcif_rd_req_ready;
output mcif2client0_rd_rsp_valid;
input mcif2client0_rd_rsp_ready;
output [512 +1:0] mcif2client0_rd_rsp_pd;input [7:0] client02mcif_lat_fifo_depth;
input [3:0] client02mcif_rd_axid;
input client12mcif_rd_cdt_lat_fifo_pop;
input client12mcif_rd_req_valid;
input [32 +14:0] client12mcif_rd_req_pd;output client12mcif_rd_req_ready;
output mcif2client1_rd_rsp_valid;
input mcif2client1_rd_rsp_ready;
output [512 +1:0] mcif2client1_rd_rsp_pd;input [7:0] client12mcif_lat_fifo_depth;
input [3:0] client12mcif_rd_axid;
input client22mcif_rd_cdt_lat_fifo_pop;
input client22mcif_rd_req_valid;
input [32 +14:0] client22mcif_rd_req_pd;output client22mcif_rd_req_ready;
output mcif2client2_rd_rsp_valid;
input mcif2client2_rd_rsp_ready;
output [512 +1:0] mcif2client2_rd_rsp_pd;input [7:0] client22mcif_lat_fifo_depth;
input [3:0] client22mcif_rd_axid;
input client32mcif_rd_cdt_lat_fifo_pop;
input client32mcif_rd_req_valid;
input [32 +14:0] client32mcif_rd_req_pd;output client32mcif_rd_req_ready;
output mcif2client3_rd_rsp_valid;
input mcif2client3_rd_rsp_ready;
output [512 +1:0] mcif2client3_rd_rsp_pd;input [7:0] client32mcif_lat_fifo_depth;
input [3:0] client32mcif_rd_axid;
input client42mcif_rd_cdt_lat_fifo_pop;
input client42mcif_rd_req_valid;
input [32 +14:0] client42mcif_rd_req_pd;output client42mcif_rd_req_ready;
output mcif2client4_rd_rsp_valid;
input mcif2client4_rd_rsp_ready;
output [512 +1:0] mcif2client4_rd_rsp_pd;input [7:0] client42mcif_lat_fifo_depth;
input [3:0] client42mcif_rd_axid;
input client52mcif_rd_cdt_lat_fifo_pop;
input client52mcif_rd_req_valid;
input [32 +14:0] client52mcif_rd_req_pd;output client52mcif_rd_req_ready;
output mcif2client5_rd_rsp_valid;
input mcif2client5_rd_rsp_ready;
output [512 +1:0] mcif2client5_rd_rsp_pd;input [7:0] client52mcif_lat_fifo_depth;
input [3:0] client52mcif_rd_axid;
input client62mcif_rd_cdt_lat_fifo_pop;
input client62mcif_rd_req_valid;
input [32 +14:0] client62mcif_rd_req_pd;output client62mcif_rd_req_ready;
output mcif2client6_rd_rsp_valid;
input mcif2client6_rd_rsp_ready;
output [512 +1:0] mcif2client6_rd_rsp_pd;input [7:0] client62mcif_lat_fifo_depth;
input [3:0] client62mcif_rd_axid;
input [512 +2:0] client02mcif_wr_req_pd;input client02mcif_wr_req_valid;
output client02mcif_wr_req_ready;
output mcif2client0_wr_rsp_complete;
input [3:0] client02mcif_wr_axid;
input [512 +2:0] client12mcif_wr_req_pd;input client12mcif_wr_req_valid;
output client12mcif_wr_req_ready;
output mcif2client1_wr_rsp_complete;
input [3:0] client12mcif_wr_axid;
input [512 +2:0] client22mcif_wr_req_pd;input client22mcif_wr_req_valid;
output client22mcif_wr_req_ready;
output mcif2client2_wr_rsp_complete;
input [3:0] client22mcif_wr_axid;

//| eperl: generated_end (DO NOT EDIT ABOVE)
input nvdla_core_clk;
input nvdla_core_rstn;
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
output mcif2noc_axi_ar_arvalid; /* data valid */
input mcif2noc_axi_ar_arready; /* data return handshake */
output [7:0] mcif2noc_axi_ar_arid;
output [3:0] mcif2noc_axi_ar_arlen;
output [32 -1:0] mcif2noc_axi_ar_araddr;
output mcif2noc_axi_aw_awvalid; /* data valid */
input mcif2noc_axi_aw_awready; /* data return handshake */
output [7:0] mcif2noc_axi_aw_awid;
output [3:0] mcif2noc_axi_aw_awlen;
output [32 -1:0] mcif2noc_axi_aw_awaddr;
output mcif2noc_axi_w_wvalid; /* data valid */
input mcif2noc_axi_w_wready; /* data return handshake */
output [64 -1:0] mcif2noc_axi_w_wdata;
output [64/8-1:0] mcif2noc_axi_w_wstrb;
output mcif2noc_axi_w_wlast;
input noc2mcif_axi_b_bvalid; /* data valid */
output noc2mcif_axi_b_bready; /* data return handshake */
input [7:0] noc2mcif_axi_b_bid;
input noc2mcif_axi_r_rvalid; /* data valid */
output noc2mcif_axi_r_rready; /* data return handshake */
input [7:0] noc2mcif_axi_r_rid;
input noc2mcif_axi_r_rlast;
input [64 -1:0] noc2mcif_axi_r_rdata;
output [33:0] cvif2csb_resp_pd;
output cvif2csb_resp_valid;
output [33:0] mcif2csb_resp_pd;
output mcif2csb_resp_valid;
NV_NVDLA_NOCIF_sram u_sram (
    .nvdla_core_clk(nvdla_core_clk)
    ,.nvdla_core_rstn(nvdla_core_rstn)
//: my $k = 7;
//: my $i = 0;
//: for($i=0; $i<$k; $i++) {
//: print("  ,.client${i}2cvif_rd_cdt_lat_fifo_pop(client${i}2cvif_rd_cdt_lat_fifo_pop)\n");
//: print("  ,.client${i}2cvif_rd_req_valid(client${i}2cvif_rd_req_valid)\n");
//: print("  ,.client${i}2cvif_rd_req_pd(client${i}2cvif_rd_req_pd)\n");
//: print("  ,.client${i}2cvif_rd_req_ready(client${i}2cvif_rd_req_ready)\n");
//: print("  ,.cvif2client${i}_rd_rsp_valid(cvif2client${i}_rd_rsp_valid)\n");
//: print("  ,.cvif2client${i}_rd_rsp_pd(cvif2client${i}_rd_rsp_pd)\n");
//: print("  ,.cvif2client${i}_rd_rsp_ready(cvif2client${i}_rd_rsp_ready)\n");
//: print("  ,.client${i}2cvif_rd_axid(client${i}2cvif_rd_axid)\n");
//: print("  ,.client${i}2cvif_lat_fifo_depth(client${i}2cvif_lat_fifo_depth)\n");
//: }
//: my $k = 3;
//: my $i = 0;
//: for($i=0; $i<$k; $i++) {
//: print("  ,.client${i}2cvif_wr_req_pd(client${i}2cvif_wr_req_pd)\n");
//: print("  ,.client${i}2cvif_wr_req_valid(client${i}2cvif_wr_req_valid)\n");
//: print("  ,.client${i}2cvif_wr_req_ready(client${i}2cvif_wr_req_ready)\n");
//: print("  ,.cvif2client${i}_wr_rsp_complete(cvif2client${i}_wr_rsp_complete)\n");
//: print("  ,.client${i}2cvif_wr_axid(client${i}2cvif_wr_axid)\n");
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
  ,.client02cvif_rd_cdt_lat_fifo_pop(client02cvif_rd_cdt_lat_fifo_pop)
  ,.client02cvif_rd_req_valid(client02cvif_rd_req_valid)
  ,.client02cvif_rd_req_pd(client02cvif_rd_req_pd)
  ,.client02cvif_rd_req_ready(client02cvif_rd_req_ready)
  ,.cvif2client0_rd_rsp_valid(cvif2client0_rd_rsp_valid)
  ,.cvif2client0_rd_rsp_pd(cvif2client0_rd_rsp_pd)
  ,.cvif2client0_rd_rsp_ready(cvif2client0_rd_rsp_ready)
  ,.client02cvif_rd_axid(client02cvif_rd_axid)
  ,.client02cvif_lat_fifo_depth(client02cvif_lat_fifo_depth)
  ,.client12cvif_rd_cdt_lat_fifo_pop(client12cvif_rd_cdt_lat_fifo_pop)
  ,.client12cvif_rd_req_valid(client12cvif_rd_req_valid)
  ,.client12cvif_rd_req_pd(client12cvif_rd_req_pd)
  ,.client12cvif_rd_req_ready(client12cvif_rd_req_ready)
  ,.cvif2client1_rd_rsp_valid(cvif2client1_rd_rsp_valid)
  ,.cvif2client1_rd_rsp_pd(cvif2client1_rd_rsp_pd)
  ,.cvif2client1_rd_rsp_ready(cvif2client1_rd_rsp_ready)
  ,.client12cvif_rd_axid(client12cvif_rd_axid)
  ,.client12cvif_lat_fifo_depth(client12cvif_lat_fifo_depth)
  ,.client22cvif_rd_cdt_lat_fifo_pop(client22cvif_rd_cdt_lat_fifo_pop)
  ,.client22cvif_rd_req_valid(client22cvif_rd_req_valid)
  ,.client22cvif_rd_req_pd(client22cvif_rd_req_pd)
  ,.client22cvif_rd_req_ready(client22cvif_rd_req_ready)
  ,.cvif2client2_rd_rsp_valid(cvif2client2_rd_rsp_valid)
  ,.cvif2client2_rd_rsp_pd(cvif2client2_rd_rsp_pd)
  ,.cvif2client2_rd_rsp_ready(cvif2client2_rd_rsp_ready)
  ,.client22cvif_rd_axid(client22cvif_rd_axid)
  ,.client22cvif_lat_fifo_depth(client22cvif_lat_fifo_depth)
  ,.client32cvif_rd_cdt_lat_fifo_pop(client32cvif_rd_cdt_lat_fifo_pop)
  ,.client32cvif_rd_req_valid(client32cvif_rd_req_valid)
  ,.client32cvif_rd_req_pd(client32cvif_rd_req_pd)
  ,.client32cvif_rd_req_ready(client32cvif_rd_req_ready)
  ,.cvif2client3_rd_rsp_valid(cvif2client3_rd_rsp_valid)
  ,.cvif2client3_rd_rsp_pd(cvif2client3_rd_rsp_pd)
  ,.cvif2client3_rd_rsp_ready(cvif2client3_rd_rsp_ready)
  ,.client32cvif_rd_axid(client32cvif_rd_axid)
  ,.client32cvif_lat_fifo_depth(client32cvif_lat_fifo_depth)
  ,.client42cvif_rd_cdt_lat_fifo_pop(client42cvif_rd_cdt_lat_fifo_pop)
  ,.client42cvif_rd_req_valid(client42cvif_rd_req_valid)
  ,.client42cvif_rd_req_pd(client42cvif_rd_req_pd)
  ,.client42cvif_rd_req_ready(client42cvif_rd_req_ready)
  ,.cvif2client4_rd_rsp_valid(cvif2client4_rd_rsp_valid)
  ,.cvif2client4_rd_rsp_pd(cvif2client4_rd_rsp_pd)
  ,.cvif2client4_rd_rsp_ready(cvif2client4_rd_rsp_ready)
  ,.client42cvif_rd_axid(client42cvif_rd_axid)
  ,.client42cvif_lat_fifo_depth(client42cvif_lat_fifo_depth)
  ,.client52cvif_rd_cdt_lat_fifo_pop(client52cvif_rd_cdt_lat_fifo_pop)
  ,.client52cvif_rd_req_valid(client52cvif_rd_req_valid)
  ,.client52cvif_rd_req_pd(client52cvif_rd_req_pd)
  ,.client52cvif_rd_req_ready(client52cvif_rd_req_ready)
  ,.cvif2client5_rd_rsp_valid(cvif2client5_rd_rsp_valid)
  ,.cvif2client5_rd_rsp_pd(cvif2client5_rd_rsp_pd)
  ,.cvif2client5_rd_rsp_ready(cvif2client5_rd_rsp_ready)
  ,.client52cvif_rd_axid(client52cvif_rd_axid)
  ,.client52cvif_lat_fifo_depth(client52cvif_lat_fifo_depth)
  ,.client62cvif_rd_cdt_lat_fifo_pop(client62cvif_rd_cdt_lat_fifo_pop)
  ,.client62cvif_rd_req_valid(client62cvif_rd_req_valid)
  ,.client62cvif_rd_req_pd(client62cvif_rd_req_pd)
  ,.client62cvif_rd_req_ready(client62cvif_rd_req_ready)
  ,.cvif2client6_rd_rsp_valid(cvif2client6_rd_rsp_valid)
  ,.cvif2client6_rd_rsp_pd(cvif2client6_rd_rsp_pd)
  ,.cvif2client6_rd_rsp_ready(cvif2client6_rd_rsp_ready)
  ,.client62cvif_rd_axid(client62cvif_rd_axid)
  ,.client62cvif_lat_fifo_depth(client62cvif_lat_fifo_depth)
  ,.client02cvif_wr_req_pd(client02cvif_wr_req_pd)
  ,.client02cvif_wr_req_valid(client02cvif_wr_req_valid)
  ,.client02cvif_wr_req_ready(client02cvif_wr_req_ready)
  ,.cvif2client0_wr_rsp_complete(cvif2client0_wr_rsp_complete)
  ,.client02cvif_wr_axid(client02cvif_wr_axid)
  ,.client12cvif_wr_req_pd(client12cvif_wr_req_pd)
  ,.client12cvif_wr_req_valid(client12cvif_wr_req_valid)
  ,.client12cvif_wr_req_ready(client12cvif_wr_req_ready)
  ,.cvif2client1_wr_rsp_complete(cvif2client1_wr_rsp_complete)
  ,.client12cvif_wr_axid(client12cvif_wr_axid)
  ,.client22cvif_wr_req_pd(client22cvif_wr_req_pd)
  ,.client22cvif_wr_req_valid(client22cvif_wr_req_valid)
  ,.client22cvif_wr_req_ready(client22cvif_wr_req_ready)
  ,.cvif2client2_wr_rsp_complete(cvif2client2_wr_rsp_complete)
  ,.client22cvif_wr_axid(client22cvif_wr_axid)

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,.noc2cvif_axi_b_bid(noc2cvif_axi_b_bid ) //|< i
  ,.noc2cvif_axi_b_bvalid(noc2cvif_axi_b_bvalid ) //|< i
  ,.noc2cvif_axi_r_rdata(noc2cvif_axi_r_rdata ) //|< i
  ,.noc2cvif_axi_r_rid(noc2cvif_axi_r_rid ) //|< i
  ,.noc2cvif_axi_r_rlast(noc2cvif_axi_r_rlast ) //|< i
  ,.noc2cvif_axi_r_rvalid(noc2cvif_axi_r_rvalid ) //|< i
  ,.cvif2noc_axi_ar_arready(cvif2noc_axi_ar_arready ) //|< i
  ,.cvif2noc_axi_aw_awready(cvif2noc_axi_aw_awready ) //|< i
  ,.cvif2noc_axi_w_wready(cvif2noc_axi_w_wready ) //|< i
  ,.cvif2csb_resp_pd(cvif2csb_resp_pd ) //|> o
  ,.cvif2csb_resp_valid(cvif2csb_resp_valid ) //|> o
  ,.cvif2noc_axi_ar_araddr(cvif2noc_axi_ar_araddr ) //|> o
  ,.cvif2noc_axi_ar_arid(cvif2noc_axi_ar_arid ) //|> o
  ,.cvif2noc_axi_ar_arlen(cvif2noc_axi_ar_arlen ) //|> o
  ,.cvif2noc_axi_ar_arvalid(cvif2noc_axi_ar_arvalid ) //|> o
  ,.cvif2noc_axi_aw_awaddr(cvif2noc_axi_aw_awaddr ) //|> o
  ,.cvif2noc_axi_aw_awid(cvif2noc_axi_aw_awid ) //|> o
  ,.cvif2noc_axi_aw_awlen(cvif2noc_axi_aw_awlen ) //|> o
  ,.cvif2noc_axi_aw_awvalid(cvif2noc_axi_aw_awvalid ) //|> o
  ,.cvif2noc_axi_w_wdata(cvif2noc_axi_w_wdata ) //|> o
  ,.cvif2noc_axi_w_wlast(cvif2noc_axi_w_wlast ) //|> o
  ,.cvif2noc_axi_w_wstrb(cvif2noc_axi_w_wstrb ) //|> o
  ,.cvif2noc_axi_w_wvalid(cvif2noc_axi_w_wvalid ) //|> o
  ,.noc2cvif_axi_b_bready(noc2cvif_axi_b_bready ) //|> o
  ,.noc2cvif_axi_r_rready(noc2cvif_axi_r_rready ) //|> o
);
NV_NVDLA_NOCIF_dram u_dram (
    .nvdla_core_clk(nvdla_core_clk)
    ,.nvdla_core_rstn(nvdla_core_rstn)
//: my $k = 7;
//: my $i = 0;
//: for($i=0; $i<$k; $i++) {
//: print("  ,.client${i}2mcif_rd_cdt_lat_fifo_pop(client${i}2mcif_rd_cdt_lat_fifo_pop)\n");
//: print("  ,.client${i}2mcif_rd_req_valid(client${i}2mcif_rd_req_valid)\n");
//: print("  ,.client${i}2mcif_rd_req_pd(client${i}2mcif_rd_req_pd)\n");
//: print("  ,.client${i}2mcif_rd_req_ready(client${i}2mcif_rd_req_ready)\n");
//: print("  ,.mcif2client${i}_rd_rsp_valid(mcif2client${i}_rd_rsp_valid)\n");
//: print("  ,.mcif2client${i}_rd_rsp_pd(mcif2client${i}_rd_rsp_pd)\n");
//: print("  ,.client${i}2mcif_rd_axid(client${i}2mcif_rd_axid)\n");
//: print("  ,.client${i}2mcif_lat_fifo_depth(client${i}2mcif_lat_fifo_depth)\n");
//: }
//: my $k = 3;
//: my $i = 0;
//: for($i=0; $i<$k; $i++) {
//: print("  ,.client${i}2mcif_wr_req_pd(client${i}2mcif_wr_req_pd)\n");
//: print("  ,.client${i}2mcif_wr_req_valid(client${i}2mcif_wr_req_valid)\n");
//: print("  ,.client${i}2mcif_wr_req_ready(client${i}2mcif_wr_req_ready)\n");
//: print("  ,.mcif2client${i}_wr_rsp_complete(mcif2client${i}_wr_rsp_complete)\n");
//: print("  ,.client${i}2mcif_wr_axid(client${i}2mcif_wr_axid)\n");
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
  ,.client02mcif_rd_cdt_lat_fifo_pop(client02mcif_rd_cdt_lat_fifo_pop)
  ,.client02mcif_rd_req_valid(client02mcif_rd_req_valid)
  ,.client02mcif_rd_req_pd(client02mcif_rd_req_pd)
  ,.client02mcif_rd_req_ready(client02mcif_rd_req_ready)
  ,.mcif2client0_rd_rsp_valid(mcif2client0_rd_rsp_valid)
  ,.mcif2client0_rd_rsp_pd(mcif2client0_rd_rsp_pd)
  ,.client02mcif_rd_axid(client02mcif_rd_axid)
  ,.client02mcif_lat_fifo_depth(client02mcif_lat_fifo_depth)
  ,.client12mcif_rd_cdt_lat_fifo_pop(client12mcif_rd_cdt_lat_fifo_pop)
  ,.client12mcif_rd_req_valid(client12mcif_rd_req_valid)
  ,.client12mcif_rd_req_pd(client12mcif_rd_req_pd)
  ,.client12mcif_rd_req_ready(client12mcif_rd_req_ready)
  ,.mcif2client1_rd_rsp_valid(mcif2client1_rd_rsp_valid)
  ,.mcif2client1_rd_rsp_pd(mcif2client1_rd_rsp_pd)
  ,.client12mcif_rd_axid(client12mcif_rd_axid)
  ,.client12mcif_lat_fifo_depth(client12mcif_lat_fifo_depth)
  ,.client22mcif_rd_cdt_lat_fifo_pop(client22mcif_rd_cdt_lat_fifo_pop)
  ,.client22mcif_rd_req_valid(client22mcif_rd_req_valid)
  ,.client22mcif_rd_req_pd(client22mcif_rd_req_pd)
  ,.client22mcif_rd_req_ready(client22mcif_rd_req_ready)
  ,.mcif2client2_rd_rsp_valid(mcif2client2_rd_rsp_valid)
  ,.mcif2client2_rd_rsp_pd(mcif2client2_rd_rsp_pd)
  ,.client22mcif_rd_axid(client22mcif_rd_axid)
  ,.client22mcif_lat_fifo_depth(client22mcif_lat_fifo_depth)
  ,.client32mcif_rd_cdt_lat_fifo_pop(client32mcif_rd_cdt_lat_fifo_pop)
  ,.client32mcif_rd_req_valid(client32mcif_rd_req_valid)
  ,.client32mcif_rd_req_pd(client32mcif_rd_req_pd)
  ,.client32mcif_rd_req_ready(client32mcif_rd_req_ready)
  ,.mcif2client3_rd_rsp_valid(mcif2client3_rd_rsp_valid)
  ,.mcif2client3_rd_rsp_pd(mcif2client3_rd_rsp_pd)
  ,.client32mcif_rd_axid(client32mcif_rd_axid)
  ,.client32mcif_lat_fifo_depth(client32mcif_lat_fifo_depth)
  ,.client42mcif_rd_cdt_lat_fifo_pop(client42mcif_rd_cdt_lat_fifo_pop)
  ,.client42mcif_rd_req_valid(client42mcif_rd_req_valid)
  ,.client42mcif_rd_req_pd(client42mcif_rd_req_pd)
  ,.client42mcif_rd_req_ready(client42mcif_rd_req_ready)
  ,.mcif2client4_rd_rsp_valid(mcif2client4_rd_rsp_valid)
  ,.mcif2client4_rd_rsp_pd(mcif2client4_rd_rsp_pd)
  ,.client42mcif_rd_axid(client42mcif_rd_axid)
  ,.client42mcif_lat_fifo_depth(client42mcif_lat_fifo_depth)
  ,.client52mcif_rd_cdt_lat_fifo_pop(client52mcif_rd_cdt_lat_fifo_pop)
  ,.client52mcif_rd_req_valid(client52mcif_rd_req_valid)
  ,.client52mcif_rd_req_pd(client52mcif_rd_req_pd)
  ,.client52mcif_rd_req_ready(client52mcif_rd_req_ready)
  ,.mcif2client5_rd_rsp_valid(mcif2client5_rd_rsp_valid)
  ,.mcif2client5_rd_rsp_pd(mcif2client5_rd_rsp_pd)
  ,.client52mcif_rd_axid(client52mcif_rd_axid)
  ,.client52mcif_lat_fifo_depth(client52mcif_lat_fifo_depth)
  ,.client62mcif_rd_cdt_lat_fifo_pop(client62mcif_rd_cdt_lat_fifo_pop)
  ,.client62mcif_rd_req_valid(client62mcif_rd_req_valid)
  ,.client62mcif_rd_req_pd(client62mcif_rd_req_pd)
  ,.client62mcif_rd_req_ready(client62mcif_rd_req_ready)
  ,.mcif2client6_rd_rsp_valid(mcif2client6_rd_rsp_valid)
  ,.mcif2client6_rd_rsp_pd(mcif2client6_rd_rsp_pd)
  ,.client62mcif_rd_axid(client62mcif_rd_axid)
  ,.client62mcif_lat_fifo_depth(client62mcif_lat_fifo_depth)
  ,.client02mcif_wr_req_pd(client02mcif_wr_req_pd)
  ,.client02mcif_wr_req_valid(client02mcif_wr_req_valid)
  ,.client02mcif_wr_req_ready(client02mcif_wr_req_ready)
  ,.mcif2client0_wr_rsp_complete(mcif2client0_wr_rsp_complete)
  ,.client02mcif_wr_axid(client02mcif_wr_axid)
  ,.client12mcif_wr_req_pd(client12mcif_wr_req_pd)
  ,.client12mcif_wr_req_valid(client12mcif_wr_req_valid)
  ,.client12mcif_wr_req_ready(client12mcif_wr_req_ready)
  ,.mcif2client1_wr_rsp_complete(mcif2client1_wr_rsp_complete)
  ,.client12mcif_wr_axid(client12mcif_wr_axid)
  ,.client22mcif_wr_req_pd(client22mcif_wr_req_pd)
  ,.client22mcif_wr_req_valid(client22mcif_wr_req_valid)
  ,.client22mcif_wr_req_ready(client22mcif_wr_req_ready)
  ,.mcif2client2_wr_rsp_complete(mcif2client2_wr_rsp_complete)
  ,.client22mcif_wr_axid(client22mcif_wr_axid)

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,.noc2mcif_axi_b_bid(noc2mcif_axi_b_bid ) //|< i
  ,.noc2mcif_axi_b_bvalid(noc2mcif_axi_b_bvalid ) //|< i
  ,.noc2mcif_axi_r_rdata(noc2mcif_axi_r_rdata ) //|< i
  ,.noc2mcif_axi_r_rid(noc2mcif_axi_r_rid ) //|< i
  ,.noc2mcif_axi_r_rlast(noc2mcif_axi_r_rlast ) //|< i
  ,.noc2mcif_axi_r_rvalid(noc2mcif_axi_r_rvalid ) //|< i
  ,.mcif2noc_axi_ar_arready(mcif2noc_axi_ar_arready ) //|< i
  ,.mcif2noc_axi_aw_awready(mcif2noc_axi_aw_awready ) //|< i
  ,.mcif2noc_axi_w_wready(mcif2noc_axi_w_wready ) //|< i
  ,.mcif2csb_resp_pd(mcif2csb_resp_pd ) //|> o
  ,.mcif2csb_resp_valid(mcif2csb_resp_valid ) //|> o
  ,.mcif2noc_axi_ar_araddr(mcif2noc_axi_ar_araddr ) //|> o
  ,.mcif2noc_axi_ar_arid(mcif2noc_axi_ar_arid ) //|> o
  ,.mcif2noc_axi_ar_arlen(mcif2noc_axi_ar_arlen ) //|> o
  ,.mcif2noc_axi_ar_arvalid(mcif2noc_axi_ar_arvalid ) //|> o
  ,.mcif2noc_axi_aw_awaddr(mcif2noc_axi_aw_awaddr ) //|> o
  ,.mcif2noc_axi_aw_awid(mcif2noc_axi_aw_awid ) //|> o
  ,.mcif2noc_axi_aw_awlen(mcif2noc_axi_aw_awlen ) //|> o
  ,.mcif2noc_axi_aw_awvalid(mcif2noc_axi_aw_awvalid ) //|> o
  ,.mcif2noc_axi_w_wdata(mcif2noc_axi_w_wdata ) //|> o
  ,.mcif2noc_axi_w_wlast(mcif2noc_axi_w_wlast ) //|> o
  ,.mcif2noc_axi_w_wstrb(mcif2noc_axi_w_wstrb ) //|> o
  ,.mcif2noc_axi_w_wvalid(mcif2noc_axi_w_wvalid ) //|> o
  ,.noc2mcif_axi_b_bready(noc2mcif_axi_b_bready ) //|> o
  ,.noc2mcif_axi_r_rready(noc2mcif_axi_r_rready ) //|> o
);
endmodule
