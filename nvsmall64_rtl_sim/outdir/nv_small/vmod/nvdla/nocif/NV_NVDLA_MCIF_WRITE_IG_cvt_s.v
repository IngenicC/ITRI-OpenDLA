// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_MCIF_WRITE_IG_cvt_s.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_MCIF_define.h
`include "simulate_x_tick.vh"
module NV_NVDLA_MCIF_WRITE_IG_cvt_s (
   nvdla_core_clk //|< i
  ,nvdla_core_rstn //|< i
  ,cq_wr_prdy //|< i
  ,eg2ig_axi_len //|< i
  ,eg2ig_axi_vld //|< i
  ,mcif2noc_axi_aw_awready //|< i
  ,mcif2noc_axi_w_wready //|< i
  ,reg2dp_wr_os_cnt //|< i
  ,spt2cvt_cmd_pd //|< i
  ,spt2cvt_cmd_valid //|< i
  ,spt2cvt_dat_pd //|< i
  ,spt2cvt_dat_valid //|< i
  ,cq_wr_pd //|> o
  ,cq_wr_pvld //|> o
  ,cq_wr_thread_id //|> o
  ,mcif2noc_axi_aw_awaddr //|> o
  ,mcif2noc_axi_aw_awid //|> o
  ,mcif2noc_axi_aw_awlen //|> o
  ,mcif2noc_axi_aw_awvalid //|> o
  ,mcif2noc_axi_w_wdata //|> o
  ,mcif2noc_axi_w_wlast //|> o
  ,mcif2noc_axi_w_wstrb //|> o
  ,mcif2noc_axi_w_wvalid //|> o
  ,spt2cvt_cmd_ready //|> o
  ,spt2cvt_dat_ready //|> o
  );
////////////////////////////////////////////////////////////////
// NV_NVDLA_MCIF_WRITE_IG_cvt_ports.v
//
input nvdla_core_clk;
input nvdla_core_rstn;
input spt2cvt_cmd_valid; /* data valid */
output spt2cvt_cmd_ready; /* data return handshake */
input [44:0] spt2cvt_cmd_pd;
input spt2cvt_dat_valid; /* data valid */
output spt2cvt_dat_ready; /* data return handshake */
input [64 +1 -1:0] spt2cvt_dat_pd;
output cq_wr_pvld; /* data valid */
input cq_wr_prdy; /* data return handshake */
output [2:0] cq_wr_thread_id;
output [2:0] cq_wr_pd;
output mcif2noc_axi_aw_awvalid; /* data valid */
input mcif2noc_axi_aw_awready; /* data return handshake */
output [7:0] mcif2noc_axi_aw_awid;
output [3:0] mcif2noc_axi_aw_awlen;
output [31:0] mcif2noc_axi_aw_awaddr;
output mcif2noc_axi_w_wvalid; /* data valid */
input mcif2noc_axi_w_wready; /* data return handshake */
output [64 -1:0] mcif2noc_axi_w_wdata;
output [31:0] mcif2noc_axi_w_wstrb;
output mcif2noc_axi_w_wlast;
//&Ports /streamid/;
input [1:0] eg2ig_axi_len;
input eg2ig_axi_vld;
input [7:0] reg2dp_wr_os_cnt;
////////////////////////////////////////////////////////////////
reg [1:0] eg2ig_axi_len_d;
reg eg2ig_axi_vld_d;
wire os_adv;
reg [8:0] os_cnt_cur;
wire [10:0] os_cnt_nxt;
wire all_downs_rdy;
wire [31:0] axi_addr;
//wire [37:0] axi_aw_pd;
wire [3:0] axi_axid;
wire axi_both_rdy;
wire [37:0] axi_cmd_pd;
wire axi_cmd_rdy;
wire axi_cmd_vld;
wire [64 +32:0] axi_dat_pd;
wire axi_dat_rdy;
wire axi_dat_vld;
wire [64 -1:0] axi_data;
wire axi_last;
wire [1:0] axi_len;
wire [31:0] axi_strb;
//wire [64 +32:0] axi_w_pd;
wire [7:0] cfg_wr_os_cnt;
wire [31:0] cmd_addr;
wire [3:0] cmd_axid;
wire cmd_ftran;
wire cmd_inc;
wire cmd_ltran;
wire cmd_odd;
wire cmd_rdy;
wire cmd_require_ack;
wire [2:0] cmd_size;
wire cmd_swizzle;
wire [76:0] cmd_vld_pd;
wire [1:0] cq_wr_len;
wire cq_wr_require_ack;
wire [64 -1:0] dat_data;
//wire [64 +1 -1:0] dat_pd;
wire dat_rdy;
//wire dat_vld;
wire is_first_cmd_dat_vld;
wire mon_end_pos_c;
wire [0:0] mon_thread_id_c;
wire [31:0] opipe_axi_addr;
wire [3:0] opipe_axi_axid;
wire [64 -1:0] opipe_axi_data;
wire opipe_axi_last;
wire [1:0] opipe_axi_len;
wire [31:0] opipe_axi_strb;
wire os_cmd_vld;
wire [2:0] os_cnt_add;
wire os_cnt_add_en;
wire os_cnt_cen;
wire os_cnt_full;
wire [2:0] os_cnt_sub;
wire [2:0] os_inp_add_nxt;
wire [9:0] os_inp_nxt;
wire [2:0] os_inp_sub_nxt;
////////////////////////////////////////////////////////////////
//: my $k = 64 +1;
//: &eperl::pipe(" -wid  45 -do cmd_pd -vo cmd_vld -ri cmd_rdy -di  spt2cvt_cmd_pd -vi spt2cvt_cmd_valid -ro spt2cvt_cmd_ready ");
//: &eperl::pipe(" -wid  $k -do dat_pd -vo dat_vld -ri dat_rdy -di  spt2cvt_dat_pd -vi spt2cvt_dat_valid -ro spt2cvt_dat_ready ");
//| eperl: generated_beg (DO NOT EDIT BELOW)
// Reg
reg pipe_spt2cvt_cmd_valid;
reg [45-1:0] pipe_spt2cvt_cmd_pd;
// Wire
wire spt2cvt_cmd_ready;
wire pipe_spt2cvt_cmd_ready;
wire cmd_vld;
wire [45-1:0] cmd_pd;
// Code
// PIPE READY
assign spt2cvt_cmd_ready = pipe_spt2cvt_cmd_ready || !pipe_spt2cvt_cmd_valid;

// PIPE VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        pipe_spt2cvt_cmd_valid <= 1'b0;
    end else begin
        if (spt2cvt_cmd_ready) begin
            pipe_spt2cvt_cmd_valid <= spt2cvt_cmd_valid;
        end
    end
end

// PIPE DATA
always @(posedge nvdla_core_clk) begin
    if (spt2cvt_cmd_ready && spt2cvt_cmd_valid) begin
        pipe_spt2cvt_cmd_pd[45-1:0] <= spt2cvt_cmd_pd[45-1:0];
    end
end


// PIPE OUTPUT
assign pipe_spt2cvt_cmd_ready = cmd_rdy;
assign cmd_vld = pipe_spt2cvt_cmd_valid;
assign cmd_pd = pipe_spt2cvt_cmd_pd;
// Reg
reg pipe_spt2cvt_dat_valid;
reg [65-1:0] pipe_spt2cvt_dat_pd;
// Wire
wire spt2cvt_dat_ready;
wire pipe_spt2cvt_dat_ready;
wire dat_vld;
wire [65-1:0] dat_pd;
// Code
// PIPE READY
assign spt2cvt_dat_ready = pipe_spt2cvt_dat_ready || !pipe_spt2cvt_dat_valid;

// PIPE VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        pipe_spt2cvt_dat_valid <= 1'b0;
    end else begin
        if (spt2cvt_dat_ready) begin
            pipe_spt2cvt_dat_valid <= spt2cvt_dat_valid;
        end
    end
end

// PIPE DATA
always @(posedge nvdla_core_clk) begin
    if (spt2cvt_dat_ready && spt2cvt_dat_valid) begin
        pipe_spt2cvt_dat_pd[65-1:0] <= spt2cvt_dat_pd[65-1:0];
    end
end


// PIPE OUTPUT
assign pipe_spt2cvt_dat_ready = dat_rdy;
assign dat_vld = pipe_spt2cvt_dat_valid;
assign dat_pd = pipe_spt2cvt_dat_pd;

//| eperl: generated_end (DO NOT EDIT ABOVE)
assign os_cmd_vld = cmd_vld & !os_cnt_full;
assign dat_rdy = (os_cmd_vld & all_downs_rdy);
assign cmd_rdy = dat_vld & all_downs_rdy & !os_cnt_full;
assign cmd_vld_pd = {45{cmd_vld}} & cmd_pd;
assign cmd_axid[3:0] = cmd_vld_pd[3:0];
assign cmd_require_ack = cmd_vld_pd[4];
assign cmd_addr[31:0] = cmd_vld_pd[36:5];
assign cmd_size[2:0] = cmd_vld_pd[39:37];
assign cmd_swizzle = cmd_vld_pd[40];
assign cmd_odd = cmd_vld_pd[41];
assign cmd_inc = cmd_vld_pd[42];
assign cmd_ltran = cmd_vld_pd[43];
assign cmd_ftran = cmd_vld_pd[44];
assign dat_data[64 -1:0] = dat_pd[64 -1:0];
//assign dat_mask[1:0] = dat_pd[64 +1:64];
//==============
// AXI: AXID
assign axi_axid = cmd_axid[3:0];
//==============
// AXI: ADDR
assign axi_addr = cmd_addr;
//=========================================================================================
// NOTICE
// each axi cmd need be sent together with the first beat of data in that transaction,
// and push "ack" into OQ in the same cycle
//=========================================================================================
// beat_count is to count the data per cmd
//==============
// AXI: LEN
//==============
//assign {mon_axi_len_c,axi_len[1:0]} = cmd_size[2:1] + cmd_inc;
assign axi_len[1:0] = cmd_size[1:0];
assign is_first_cmd_dat_vld = os_cmd_vld & dat_vld;
assign axi_data = dat_data;
assign axi_last = is_first_cmd_dat_vld;
assign axi_strb = {8{1'b1}}; //{{32{dat_mask[1]}},{32{dat_mask[0]}}};
//=====================================
// AXI Output Pipe
//=====================================
assign os_inp_add_nxt[2:0] = cmd_vld ? (axi_len + 1) : 3'd0;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
  if (!nvdla_core_rstn) begin
    eg2ig_axi_vld_d <= 1'b0;
  end else begin
  eg2ig_axi_vld_d <= eg2ig_axi_vld;
  end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
  if (!nvdla_core_rstn) begin
    eg2ig_axi_len_d <= {2{1'b0}};
  end else if (eg2ig_axi_vld) begin
    eg2ig_axi_len_d <= eg2ig_axi_len;
  end
end
assign os_inp_sub_nxt[2:0] = eg2ig_axi_vld_d ? (eg2ig_axi_len_d+1) : 3'd0;
assign os_inp_nxt[9:0] = os_cnt_cur + os_inp_add_nxt - os_inp_sub_nxt;
// IG_cvt=== 256 outstanding trans
assign os_cnt_add_en = axi_cmd_vld & axi_cmd_rdy;
assign os_cnt_cen = os_cnt_add_en | eg2ig_axi_vld_d;
assign os_cnt_add = os_cnt_add_en ? (axi_len + 1) : 3'd0;
assign os_cnt_sub = eg2ig_axi_vld_d ? (eg2ig_axi_len_d+1) : 3'd0;
assign cfg_wr_os_cnt = reg2dp_wr_os_cnt[7:0];
assign os_cnt_full = os_inp_nxt>({{1{1'b0}}, cfg_wr_os_cnt}+1);
// os adv logic
assign os_adv = os_cnt_add[2:0] != os_cnt_sub[2:0];
assign os_cnt_nxt[10:0] = (os_adv)? (os_cnt_cur + os_cnt_add[2:0] - os_cnt_sub[2:0]) : {1'b0, 1'b0, os_cnt_cur};
// os flops
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
  if (!nvdla_core_rstn) begin
    os_cnt_cur[8:0] <= 0;
  end else if (os_cnt_cen) begin
  os_cnt_cur[8:0] <= os_cnt_nxt[8:0];
  end
end
//IG_cvt=== PIPE for $NOC ADDR Channel
// cmd will be pushed into pipe with the 1st beat of data in that cmd,
// and when *_beat_vld is high, *_cmd_vld should always be there.
// addr+streamid+user_size
assign axi_cmd_vld = is_first_cmd_dat_vld & cq_wr_prdy & axi_dat_rdy;
//: &eperl::pipe(" -wid 38 -is -do axi_aw_pd -vo mcif2noc_axi_aw_awvalid -ri mcif2noc_axi_aw_awready -di axi_cmd_pd -vi axi_cmd_vld -ro axi_cmd_rdy_f ");
//| eperl: generated_beg (DO NOT EDIT BELOW)
// Reg
reg axi_cmd_rdy_f;
reg skid_flop_axi_cmd_rdy_f;
reg skid_flop_axi_cmd_vld;
reg [38-1:0] skid_flop_axi_cmd_pd;
reg pipe_skid_axi_cmd_vld;
reg [38-1:0] pipe_skid_axi_cmd_pd;
// Wire
wire skid_axi_cmd_vld;
wire [38-1:0] skid_axi_cmd_pd;
wire skid_axi_cmd_rdy_f;
wire pipe_skid_axi_cmd_rdy_f;
wire mcif2noc_axi_aw_awvalid;
wire [38-1:0] axi_aw_pd;
// Code
// SKID READY
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       axi_cmd_rdy_f <= 1'b1;
       skid_flop_axi_cmd_rdy_f <= 1'b1;
   end else begin
       axi_cmd_rdy_f <= skid_axi_cmd_rdy_f;
       skid_flop_axi_cmd_rdy_f <= skid_axi_cmd_rdy_f;
   end
end

// SKID VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        skid_flop_axi_cmd_vld <= 1'b0;
    end else begin
        if (skid_flop_axi_cmd_rdy_f) begin
            skid_flop_axi_cmd_vld <= axi_cmd_vld;
        end
   end
end
assign skid_axi_cmd_vld = (skid_flop_axi_cmd_rdy_f) ? axi_cmd_vld : skid_flop_axi_cmd_vld;

// SKID DATA
always @(posedge nvdla_core_clk) begin
    if (skid_flop_axi_cmd_rdy_f & axi_cmd_vld) begin
        skid_flop_axi_cmd_pd[38-1:0] <= axi_cmd_pd[38-1:0];
    end
end
assign skid_axi_cmd_pd[38-1:0] = (skid_flop_axi_cmd_rdy_f) ? axi_cmd_pd[38-1:0] : skid_flop_axi_cmd_pd[38-1:0];


// PIPE READY
assign skid_axi_cmd_rdy_f = pipe_skid_axi_cmd_rdy_f || !pipe_skid_axi_cmd_vld;

// PIPE VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        pipe_skid_axi_cmd_vld <= 1'b0;
    end else begin
        if (skid_axi_cmd_rdy_f) begin
            pipe_skid_axi_cmd_vld <= skid_axi_cmd_vld;
        end
    end
end

// PIPE DATA
always @(posedge nvdla_core_clk) begin
    if (skid_axi_cmd_rdy_f && skid_axi_cmd_vld) begin
        pipe_skid_axi_cmd_pd[38-1:0] <= skid_axi_cmd_pd[38-1:0];
    end
end


// PIPE OUTPUT
assign pipe_skid_axi_cmd_rdy_f = mcif2noc_axi_aw_awready;
assign mcif2noc_axi_aw_awvalid = pipe_skid_axi_cmd_vld;
assign axi_aw_pd = pipe_skid_axi_cmd_pd;

//| eperl: generated_end (DO NOT EDIT ABOVE)
assign axi_cmd_rdy = axi_cmd_rdy_f;
// first beat of data also need cq and cmd rdy, this is because we also need push ack/cmd into cq fifo and cmd pipe on first beat of data
assign axi_dat_vld = dat_vld & (os_cmd_vld & cq_wr_prdy & axi_cmd_rdy);
//`ifdef DBB_AGENT_OK
//: my $k = 64 +33;
//: &eperl::pipe(" -wid $k -is -do axi_w_pd -vo mcif2noc_axi_w_wvalid -ri mcif2noc_axi_w_wready -di axi_dat_pd -vi axi_dat_vld -ro axi_dat_rdy_f ");
//| eperl: generated_beg (DO NOT EDIT BELOW)
// Reg
reg axi_dat_rdy_f;
reg skid_flop_axi_dat_rdy_f;
reg skid_flop_axi_dat_vld;
reg [97-1:0] skid_flop_axi_dat_pd;
reg pipe_skid_axi_dat_vld;
reg [97-1:0] pipe_skid_axi_dat_pd;
// Wire
wire skid_axi_dat_vld;
wire [97-1:0] skid_axi_dat_pd;
wire skid_axi_dat_rdy_f;
wire pipe_skid_axi_dat_rdy_f;
wire mcif2noc_axi_w_wvalid;
wire [97-1:0] axi_w_pd;
// Code
// SKID READY
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       axi_dat_rdy_f <= 1'b1;
       skid_flop_axi_dat_rdy_f <= 1'b1;
   end else begin
       axi_dat_rdy_f <= skid_axi_dat_rdy_f;
       skid_flop_axi_dat_rdy_f <= skid_axi_dat_rdy_f;
   end
end

// SKID VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        skid_flop_axi_dat_vld <= 1'b0;
    end else begin
        if (skid_flop_axi_dat_rdy_f) begin
            skid_flop_axi_dat_vld <= axi_dat_vld;
        end
   end
end
assign skid_axi_dat_vld = (skid_flop_axi_dat_rdy_f) ? axi_dat_vld : skid_flop_axi_dat_vld;

// SKID DATA
always @(posedge nvdla_core_clk) begin
    if (skid_flop_axi_dat_rdy_f & axi_dat_vld) begin
        skid_flop_axi_dat_pd[97-1:0] <= axi_dat_pd[97-1:0];
    end
end
assign skid_axi_dat_pd[97-1:0] = (skid_flop_axi_dat_rdy_f) ? axi_dat_pd[97-1:0] : skid_flop_axi_dat_pd[97-1:0];


// PIPE READY
assign skid_axi_dat_rdy_f = pipe_skid_axi_dat_rdy_f || !pipe_skid_axi_dat_vld;

// PIPE VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        pipe_skid_axi_dat_vld <= 1'b0;
    end else begin
        if (skid_axi_dat_rdy_f) begin
            pipe_skid_axi_dat_vld <= skid_axi_dat_vld;
        end
    end
end

// PIPE DATA
always @(posedge nvdla_core_clk) begin
    if (skid_axi_dat_rdy_f && skid_axi_dat_vld) begin
        pipe_skid_axi_dat_pd[97-1:0] <= skid_axi_dat_pd[97-1:0];
    end
end


// PIPE OUTPUT
assign pipe_skid_axi_dat_rdy_f = mcif2noc_axi_w_wready;
assign mcif2noc_axi_w_wvalid = pipe_skid_axi_dat_vld;
assign axi_w_pd = pipe_skid_axi_dat_pd;

//| eperl: generated_end (DO NOT EDIT ABOVE)
/*`else
wire  axi_w_pvld;
wire  axi_w_prdy;
reg   axi_cmd_send;
//  my $k = MEM_BW+33;
//  &eperl::pipe(" -wid $k -is -do axi_w_pd -vo axi_w_pvld -ri axi_w_prdy -di axi_dat_pd -vi axi_dat_vld -ro axi_dat_rdy_f ");
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
  if (!nvdla_core_rstn) 
      axi_cmd_send <= 1'b0;
  else if (mcif2noc_axi_w_wvalid & mcif2noc_axi_w_wready) 
      axi_cmd_send <= 1'b0;
  else if (mcif2noc_axi_aw_awvalid & mcif2noc_axi_aw_awready) 
      axi_cmd_send <= 1'b1;
end
assign mcif2noc_axi_w_wvalid = axi_w_pvld & axi_cmd_send;
assign axi_w_prdy = mcif2noc_axi_w_wready & axi_cmd_send;
`endif */
assign axi_dat_rdy = axi_dat_rdy_f;
assign axi_cmd_pd = {axi_axid,axi_addr,axi_len};
assign {opipe_axi_axid,opipe_axi_addr,opipe_axi_len} = axi_aw_pd;
assign axi_dat_pd = {axi_data,axi_strb,axi_last};
assign {opipe_axi_data,opipe_axi_strb,opipe_axi_last} = axi_w_pd;
// IG_cvt===AXI OUT ZERO EXT
assign mcif2noc_axi_aw_awid = {{4{1'b0}}, opipe_axi_axid};
assign mcif2noc_axi_aw_awaddr = opipe_axi_addr;
assign mcif2noc_axi_aw_awlen = {{2{1'b0}}, opipe_axi_len};
assign mcif2noc_axi_w_wlast = opipe_axi_last;
assign mcif2noc_axi_w_wdata = opipe_axi_data;
assign mcif2noc_axi_w_wstrb = opipe_axi_strb;
//=====================================
// DownStream readiness
//=====================================
assign axi_both_rdy = axi_cmd_rdy & axi_dat_rdy;
assign all_downs_rdy = cq_wr_prdy & axi_both_rdy;
//=====================================
// Outstanding Queue
//=====================================
// IG_cvt===valid for axi_cmd and oq, inter-lock
assign cq_wr_pvld = is_first_cmd_dat_vld & axi_both_rdy & !os_cnt_full;
assign cq_wr_require_ack = cmd_ltran & cmd_require_ack;
assign cq_wr_len = axi_len;
assign cq_wr_pd[0] = cq_wr_require_ack ;
assign cq_wr_pd[2:1] = cq_wr_len[1:0];
assign {mon_thread_id_c[0:0],cq_wr_thread_id[2:0]} = cmd_axid;
endmodule // NV_NVDLA_MCIF_WRITE_IG_cvt
