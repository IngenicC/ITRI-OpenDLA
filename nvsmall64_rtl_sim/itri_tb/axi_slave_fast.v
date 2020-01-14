/**
 * $Id: axi_slave.v 961 2014-01-21 11:40:39Z matej.oblak $
 *
 * @brief Red Pitaya symplified AXI slave.
 *
 * @Author Matej Oblak
 *
 * (c) Red Pitaya  http://www.redpitaya.com
 *
 * This part of code is written in Verilog hardware description language (HDL).
 * Please visit http://en.wikipedia.org/wiki/Verilog
 * for more details on the language used herein.
 */



/**
 * GENERAL DESCRIPTION:
 *
 * AXI slave used also for simple bus master.
 *
 *
 *                     /------\
 *   WR ADDRESS  ----> |  WR  |
 *   WR DATA     ----> |      | ----------- 
 *   WR RESPONSE <---- |  CH  |            |
 *                     \------/       /--------\
 *                                    | SIMPLE | ---> WR/RD ADDRRESS
 *   AXI                              |        | ---> WR DATA
 *                                    |   RP   | <--- RD DATA
 *                                    |  BUS   | <--- ACKNOWLEDGE
 *                     /------\       \--------/
 *   RD ADDRESS  ----> |  RD  |            |
 *   RD DATA     <---- |  CH  | -----------
 *                     \------/
 *
 *
 * Because AXI bus is quite complex simplier bus was created.
 * 
 * It combines write and read channel, where write has bigger priority. Command
 * is then send forward to red pitaya bus. When wite or read acknowledge is
 * received AXI response is created and new AXI is accepted.
 *
 * To prevent AXI lockups because no response is received, this slave creates its
 * own after 32 cycles (ack_cnt).
 * 
 */


module axi_slave #(parameter ADDR_WIDTH = 32,
                   parameter DATA_WIDTH = 32,
                   parameter MEM_START = 32'h8000_0000,
                   parameter MEM_SIZE = (2**25))(
 // global signals
   input                         axi_clk_i      ,  //!< AXI global clock
   input                         axi_rstn_i     ,  //!< AXI global reset

 // axi write address channel
   input                   [7:0] axi_awid_i     ,  //!< AXI write address ID
   input        [ADDR_WIDTH-1:0] axi_awaddr_i   ,  //!< AXI write address
   input                   [3:0] axi_awlen_i    ,  //!< AXI write burst length
   input                   [2:0] axi_awsize_i   ,  //!< AXI write burst size
   input                   [1:0] axi_awburst_i  ,  //!< AXI write burst type
   input                   [1:0] axi_awlock_i   ,  //!< AXI write lock type
   input                   [3:0] axi_awcache_i  ,  //!< AXI write cache type
   input                   [2:0] axi_awprot_i   ,  //!< AXI write protection type
   input                         axi_awvalid_i  ,  //!< AXI write address valid
   output                        axi_awready_o  ,  //!< AXI write ready

 // axi write data channel
   input                   [7:0] axi_wid_i      ,  //!< AXI write data ID
   input        [DATA_WIDTH-1:0] axi_wdata_i    ,  //!< AXI write data
   input      [DATA_WIDTH/8-1:0] axi_wstrb_i    ,  //!< AXI write strobes
   input                         axi_wlast_i    ,  //!< AXI write last
   input                         axi_wvalid_i   ,  //!< AXI write valid
   output                        axi_wready_o   ,  //!< AXI write ready

 // axi write response channel
   output                  [7:0] axi_bid_o      ,  //!< AXI write response ID
   output reg              [1:0] axi_bresp_o    ,  //!< AXI write response
   output                        axi_bvalid_o   ,  //!< AXI write response valid
   input                         axi_bready_i   ,  //!< AXI write response ready

 // axi read address channel
   input                   [7:0] axi_arid_i     ,  //!< AXI read address ID
   input        [ADDR_WIDTH-1:0] axi_araddr_i   ,  //!< AXI read address
   input                   [3:0] axi_arlen_i    ,  //!< AXI read burst length
   input                   [2:0] axi_arsize_i   ,  //!< AXI read burst size
   input                   [1:0] axi_arburst_i  ,  //!< AXI read burst type
   input                   [1:0] axi_arlock_i   ,  //!< AXI read lock type
   input                   [3:0] axi_arcache_i  ,  //!< AXI read cache type
   input                   [2:0] axi_arprot_i   ,  //!< AXI read protection type
   input                         axi_arvalid_i  ,  //!< AXI read address valid
   output                        axi_arready_o  ,  //!< AXI read address ready
    
 // axi read data channel
   output                  [7:0] axi_rid_o      ,  //!< AXI read response ID
   output       [DATA_WIDTH-1:0] axi_rdata_o    ,  //!< AXI read data
   output                  [1:0] axi_rresp_o    ,  //!< AXI read response
   output                        axi_rlast_o    ,  //!< AXI read last
   output                        axi_rvalid_o   ,  //!< AXI read response valid
   input                         axi_rready_i   ,  //!< AXI read response ready

 // RP system read/write channel
   output       [ADDR_WIDTH-1:0] sys_addr_o     ,  //!< system bus read/write address.
   output       [DATA_WIDTH-1:0] sys_wdata_o    ,  //!< system bus write data.
   output reg [ADDR_WIDTH/8-1:0] sys_sel_o      ,  //!< system bus write byte select.
   output reg                    sys_wen_o      ,  //!< system bus write enable.
   output reg                    sys_ren_o      ,  //!< system bus read enable.
   input        [DATA_WIDTH-1:0] sys_rdata_i    ,  //!< system bus read data.
   input                         sys_err_i      ,  //!< system bus error indicator.
   input                         sys_ack_i         //!< system bus acknowledge signal.
);


//---------------------------------------------------------------------------------
//
//  AXI slave Module
wire                  ack         ;
reg ack_r;
//reg   [      6-1: 0] ack_cnt     ;

reg                   rd_do       ;
reg             [7:0] rd_arid     ;
reg [ADDR_WIDTH-1: 0] rd_araddr   ;
reg                   rd_error    ;
wire                  rd_errorw   ;

reg                   wr_do       ;
reg             [7:0] wr_awid     ;
reg  [ADDR_WIDTH-1:0] wr_awaddr   ;
reg             [7:0] wr_wid      ;
reg  [DATA_WIDTH-1:0] wr_wdata    ;
reg                   wr_error    ;
wire                  wr_errorw   ;

reg arvalid_r;
reg awvalid_r;

//assign wr_errorw = (axi_awaddr_i < MEM_START) || (axi_awaddr_i >= MEM_START + MEM_SIZE);
//assign wr_errorw = (wr_awaddr < MEM_START) || (wr_awaddr >= MEM_START + MEM_SIZE);
assign wr_errorw = (axi_awaddr_i < MEM_START) || (axi_awaddr_i >= MEM_START + MEM_SIZE);
// assign wr_errorw = (axi_awlen_i != 4'h0) || (axi_awsize_i != 3'b010); // error if write burst and more/less than 4B transfer
//assign rd_errorw = (axi_araddr_i < MEM_START) || (axi_araddr_i >= MEM_START + MEM_SIZE);
assign rd_errorw = (rd_araddr < MEM_START) || (rd_araddr >= MEM_START + MEM_SIZE);
// assign rd_errorw = (axi_arlen_i != 4'h0) || (axi_arsize_i != 3'b010); // error if read burst and more/less than 4B transfer

always @(posedge axi_clk_i) begin
   if (axi_rstn_i == 1'b0) begin
      rd_do    <= 1'b0 ;
      rd_error <= 1'b0 ;
      arvalid_r <= 1'b0;
      rd_araddr <= 0;
   end
   else begin
      if (axi_arvalid_i && !rd_do && !axi_awvalid_i && !wr_do && !ack) // accept just one read request - write has priority
         rd_do  <= 1'b1 ;
      else if (axi_rready_i && rd_do && ack)
//      else if (ack && rd_do)
//      else if (axi_rready_i && rd_do)
         rd_do  <= 1'b0 ;

      if (axi_arvalid_i && axi_arready_o) begin // latch ID and address
         rd_arid   <= axi_arid_i   ;
         rd_araddr <= axi_araddr_i ;
         rd_error  <= rd_errorw    ;
      end

//      arvalid_r <= axi_arvalid_i;
      if (!rd_do)
          arvalid_r <= axi_arvalid_i;
   end
end


always @(posedge axi_clk_i) begin
   if (axi_rstn_i == 1'b0) begin
      wr_do    <= 1'b0 ;
      wr_error <= 1'b0 ;
      awvalid_r <= 1'b0;
      wr_awaddr <= 0;
   end
   else begin
      if (axi_awvalid_i && !wr_do && !rd_do && !ack) // accept just one write request - if idle
         wr_do  <= 1'b1 ;
      else if (axi_bready_i && wr_do && ack)
//      else if (axi_bready_i && wr_do)
         wr_do  <= 1'b0 ;

      if (axi_awvalid_i && axi_awready_o) begin // latch ID and address
         wr_awid   <= axi_awid_i   ;
         wr_awaddr <= axi_awaddr_i ;
         wr_error  <= wr_errorw    ;
      end

      if (axi_wvalid_i && wr_do) begin // latch ID and write data
         wr_wid    <= axi_wid_i    ;
         wr_wdata  <= axi_wdata_i  ;
      end
      else
         awvalid_r <= axi_awvalid_i;
   end
end





assign axi_awready_o = !wr_do && !rd_do && !ack                     ;
assign axi_wready_o  = (wr_do && axi_wvalid_i && ack) || (wr_errorw && axi_wvalid_i)    ;
assign axi_bid_o     = wr_awid                               ;
//assign axi_bresp_o   = {wr_error,1'b0}                       ;  // 2'b10 SLVERR 
//assign axi_bvalid_o  = (sys_wen_o && axi_bready_i) || (wr_error && axi_bready_i)      ;

assign axi_arready_o = !rd_do && !wr_do && !axi_awvalid_i && !ack    ;
assign axi_rid_o     = rd_arid                                ;
//assign axi_rdata_o   = sys_rdata_i                            ;

always @(posedge axi_clk_i) begin
   if (axi_rstn_i == 1'b0) begin
//      axi_bvalid_o  <= 1'b0 ;
      axi_bresp_o   <= 2'h0 ;
//      axi_rlast_o   <= 1'b0 ;
//      axi_rvalid_o  <= 1'b0 ;
//      axi_rresp_o   <= 2'h0 ;
   end
   else begin
//      axi_bvalid_o  <= wr_do && ack  ;
//      axi_bresp_o   <= {(wr_error || ack_cnt[5]),1'b0} ;  // 2'b10 SLVERR    2'b00 OK
      axi_bresp_o   <= {wr_error,1'b0} ;  // 2'b10 SLVERR    2'b00 OK
//      axi_rlast_o   <= rd_do && ack  ;
//      axi_rvalid_o  <= rd_do && ack  ;
//      axi_rvalid_o  <= rd_do && axi_rready_i  ;
//      axi_rresp_o   <= {(rd_error || ack_cnt[5]),1'b0} ;  // 2'b10 SLVERR    2'b00 OK
//      axi_rresp_o   <= {rd_error,1'b0} ;  // 2'b10 SLVERR    2'b00 OK
//      axi_rdata_o   <= sys_rdata_i   ;
   end
end

assign axi_bvalid_o = wr_do && ack;
assign axi_rlast_o = rd_do && ack;
assign axi_rvalid_o = rd_do && ack;
assign axi_rresp_o = {rd_error,1'b0};
assign axi_rdata_o = sys_rdata_i;

// acknowledge protection
//always @(posedge axi_clk_i) begin
//   if (axi_rstn_i == 1'b0) begin
//      ack_cnt   <= 6'h0 ;
//   end
//   else begin
//      if ((axi_arvalid_i && axi_arready_o) || (axi_awvalid_i && axi_awready_o))  // rd || wr request
//         ack_cnt <= 6'h1 ;
//      else if (ack)
//         ack_cnt <= 6'h0 ;
//      else if (|ack_cnt)
//         ack_cnt <= ack_cnt + 6'h1 ;
//   end
//end

//assign ack = sys_ack_i || ack_cnt[5] || (rd_do && rd_errorw) || (wr_do && wr_errorw); // bus acknowledge or timeout or error
//assign ack = sys_ack_i || (rd_do && rd_errorw) || (wr_do && wr_errorw); // bus acknowledge or timeout or error
assign ack = sys_ack_i || ack_r || (rd_do && rd_errorw) || (wr_do && wr_errorw); // bus acknowledge or timeout or error

always @(posedge axi_clk_i) begin
    if (!axi_rstn_i)
        ack_r <= 1'b0;

    else if (sys_ack_i && (rd_do && !axi_rready_i) || (wr_do && !axi_bready_i))
        ack_r <= 1'b1;

//    else if (axi_rready_i)
    else if ((rd_do &&axi_rready_i) || (wr_do && axi_bready_i))
        ack_r <= 1'b0;
end



//------------------------------------------
//  Simple slave interface

always @(posedge axi_clk_i) begin
   if (axi_rstn_i == 1'b0) begin
      sys_wen_o  <= 1'b0 ;
      sys_ren_o  <= 1'b0 ;
      sys_sel_o  <= {(ADDR_WIDTH/8){1'b0}} ;

   end else if (sys_wen_o || sys_ren_o) begin
       sys_wen_o <= 1'b0;
       sys_ren_o <= 1'b0;

   end else begin
//      sys_wen_o  <= wr_do && axi_wvalid_i && !wr_errorw ;
//      sys_wen_o  <= wr_do && awvalid_r && !wr_errorw ;
      sys_wen_o  <= wr_do && awvalid_r && !wr_errorw && !ack;
//      sys_ren_o  <= axi_arvalid_i && axi_arready_o && !rd_errorw ;
//      sys_ren_o  <= axi_arvalid_i && rd_do && !rd_errorw ;
//      sys_ren_o  <= arvalid_r && rd_do && !rd_errorw ;
      sys_ren_o  <= arvalid_r && rd_do && !rd_errorw && !ack;
      sys_sel_o  <= {(ADDR_WIDTH/8){1'b1}} ;
   end
end

/*
always @*
begin
      sys_wen_o  = wr_do && awvalid_r && !wr_errorw ;
//      sys_ren_o  <= axi_arvalid_i && axi_arready_o && !rd_errorw ;
//      sys_ren_o  <= axi_arvalid_i && rd_do && !rd_errorw ;
      sys_ren_o  = arvalid_r && rd_do && !rd_errorw ;
      sys_sel_o  = {(ADDR_WIDTH/8){1'b1}} ;
end
*/
assign sys_addr_o  = rd_do ? rd_araddr : wr_awaddr  ;
assign sys_wdata_o = wr_wdata                       ;





endmodule

