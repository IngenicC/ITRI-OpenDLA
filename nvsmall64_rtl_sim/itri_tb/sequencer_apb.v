`define MAX_CMD 100000

`define CMD_REG_WRITE     8'h00
`define CMD_REG_READ      8'h10
`define CMD_REG_READ_EXP  8'h20
`define CMD_POLL_REG      8'h30
`define CMD_SYNC_WAIT     8'h40
`define CMD_SYNC_NOTIFY   8'h50
`define CMD_INTR_NOTIFY   8'h60
`define CMD_CHECK_NOTHING 8'h70
`define CMD_CHECK_CRC     8'h80
`define CMD_CHECK_FILE    8'h90
`define CMD_POLL_FIELD    8'ha0

`define COND_EQUAL        4'h0
`define COND_GREATER      4'h1
`define COND_LESS         4'h2
`define COND_NOT_EQUAL    4'h3
`define COND_NOT_GREATER  4'h4
`define COND_NOT_LESS     4'h5

module sequencer #(
    parameter CMD_FILE = "trace_parser_cmd_seq.log"
)(
    input clk_i,
    input rst_n_i,
    input irq_i,
    input start_run_i,
    output reg nvdla_done_o,

    output reg psel_o,
    output reg penable_o,
    output reg pwrite_o,
    output reg [31:0] paddr_o,
    output reg [31:0] pwdata_o,
    input [31:0] prdata_i,
    input pready_i
);
reg [87:0] cmd_pool[0:`MAX_CMD-1];
reg [87:0] curr_cmd;
reg [31:0] reg_rdata;
reg [31:0] intr_mask;
reg [31:0] intr_status;
integer cmd_idx;
integer intr_idx;
reg [7:0] shift_bit;
integer apb_token;  // token = 1 indicates csb is controlled by cmd sequence, 2 indicates csb is controlled by irq
reg irq_done;
//reg irq_r;

integer sync_id[0:31];  // sync_id[interrupt_src] = id
integer clk_cnt;

always @(posedge clk_i)
begin
    if (!rst_n_i)
        irq_done <= 0;
//        irq_r <= 0;

//    else if (irq_i && !irq_r) begin
    else if (irq_i) begin
        reg_read_irq(16'h403, intr_status);  // read glb - intr_status (100c/4)
        reg_read_irq(16'h401, intr_mask);  // read glb - intr_mask (1004/4)
        reg_rdata = intr_status & (~intr_mask);
        shift_bit = 0;

        $display("intr_status=0x%x, intr_mask=0x%x, intr=0x%x",intr_status, intr_mask, reg_rdata);
        while (!(reg_rdata & (1 << shift_bit))) begin
            shift_bit = shift_bit + 1;
        end
        $display("****IRQ src=0x%x, sync_id=0x%x, clk_cnt=%x", shift_bit, sync_id[shift_bit], clk_cnt);
        $check_result(sync_id[shift_bit]);

        reg_write_irq(16'h403, (1 << shift_bit));  // write glb - intr_status to clear interrupt
        sync_id[shift_bit] = -1;

        poll_reg_irq(`COND_EQUAL, 16'h403, (1 << shift_bit), 0);

        irq_done <= 1;

        for (shift_bit = 0; shift_bit < 32; shift_bit = shift_bit + 1) begin
            if (sync_id[shift_bit] != -1) begin
$display("sync_id[%x]=%x", shift_bit, sync_id[shift_bit]);
                irq_done <= 0;
            end
        end

    end

//    irq_r <= irq_i;
end

initial
begin
    nvdla_done_o = 0;
    apb_token = 0;

    psel_o = 0;
    penable_o = 0;
    pwrite_o = 0;
    paddr_o = 0;
    pwdata_o = 0;

    for (cmd_idx = 0; cmd_idx < `MAX_CMD; cmd_idx = cmd_idx + 1)
        cmd_pool[cmd_idx] = 88'hff_ffff_ffff_ffff_ffff_ffff;

    for (cmd_idx = 0; cmd_idx < 32; cmd_idx = cmd_idx + 1)
        sync_id[cmd_idx] = -1;

    wait(start_run_i);  // wait for parse_cfg

    $readmemh(CMD_FILE, cmd_pool);

    @(posedge clk_i);

    cmd_idx = 0;
    curr_cmd = cmd_pool[0];

    while (curr_cmd[87:80] != 8'hff) begin

        case ({curr_cmd[87:84], 4'h0})
        `CMD_REG_WRITE: begin
            $display("cmd reg_write: %x, %x", curr_cmd[79:64], curr_cmd[63:32]);
            reg_write(curr_cmd[79:64], curr_cmd[63:32]);
        end
        `CMD_REG_READ: begin
            $display("cmd reg_read: %x, %x", curr_cmd[79:64], curr_cmd[63:32]);
            reg_read(curr_cmd[79:64], curr_cmd[63:32], 0, reg_rdata);
        end
        `CMD_REG_READ_EXP: begin
            $display("cmd reg_read: %x, %x", curr_cmd[79:64], curr_cmd[63:32]);
            reg_read(curr_cmd[79:64], curr_cmd[63:32], 1, reg_rdata);
        end
        `CMD_POLL_REG: begin
            $display("cmd poll_reg: cond:%x - %x, %x", curr_cmd[83:80], curr_cmd[79:64], curr_cmd[63:32]);
            poll_reg(curr_cmd[83:80], curr_cmd[79:64], 32'hffffffff, curr_cmd[63:32]);
        end
        `CMD_INTR_NOTIFY: begin
            $display("cmd intr_notify: intr[%x] = sync_id(%x)", curr_cmd[79:64], curr_cmd[63:32]);
            intr_idx = curr_cmd[79:64];
            sync_id[intr_idx] = curr_cmd[63:32];
            irq_done = 0;
//cmd_idx = `MAX_CMD-1;
        end
        `CMD_POLL_FIELD: begin
            $display("cmd poll_field: cond:%x - %x & %x, %x", curr_cmd[83:80], curr_cmd[79:64], curr_cmd[63:32], curr_cmd[31:0]);
            poll_reg(curr_cmd[83:80], curr_cmd[79:64], curr_cmd[63:32], curr_cmd[31:0]);
        end
        endcase

        cmd_idx = cmd_idx + 1;

        if (cmd_idx >= `MAX_CMD) begin
            $display("Error!! cmd poll capacity is not enough");
            $finish;
        end

        curr_cmd = cmd_pool[cmd_idx];

        @(posedge clk_i);
    end

    wait (irq_done == 1);
    nvdla_done_o = 1;
end

task reg_write;
    input [15:0] address;
    input [31:0] wdata;

    begin
        wait (apb_token == 0);
        apb_token = 1;

        @(posedge clk_i)
        #1;
        psel_o = 1;
        pwrite_o = 1;
        paddr_o = address*4;
        pwdata_o = wdata;

        @(posedge clk_i)
        #1;
        penable_o = 1;

        @(posedge clk_i)
        #1;
        while (pready_i == 0) begin
            @(posedge clk_i);
        #1;
        end

        penable_o = 0;
        psel_o = 0;
        pwrite_o = 0;

        apb_token = 0;
    end
endtask

task reg_read;
    input [15:0] address;
    input [31:0] ref_data;
    input check;
    output [31:0] out_data;

    begin
        wait (apb_token == 0);
        apb_token = 1;

        @(posedge clk_i)
        psel_o = 1;
        pwrite_o = 0;
        paddr_o = address*4;

        @(posedge clk_i)
        penable_o = 1;

        @(posedge clk_i)
        while (pready_i == 0) begin
            @(negedge clk_i);
            out_data = prdata_i;
            @(posedge clk_i);
        end

        penable_o = 0;
        psel_o = 0;

        if (check) begin
            if (ref_data === out_data) begin
                $display("    --> reg_read_exp pass [%x] = %x (ref:%x)", address, out_data, ref_data);
            end else begin
                $display("    --> reg_read_exp fail [%x] = %x (ref:%x)", address, out_data, ref_data);
            end

        end else begin
            $display("    --> reg_read [%x] = %x", address, out_data);
        end

        apb_token = 0;
    end
endtask

task poll_reg;
    input [3:0] cond;
    input [15:0] address;
    input [31:0] mask;
    input [31:0] ref_data;
    reg detect;
    integer clk_count;
    reg [31:0] rdata;

    begin
        detect = 0;

        while (detect == 0) begin

            wait (apb_token == 0);
            apb_token = 1;
//$display("address=%x",address);

            @(posedge clk_i)
            psel_o = 1;
            pwrite_o = 0;
            paddr_o = address*4;

            @(posedge clk_i)
            penable_o = 1;

            @(posedge clk_i)
            while (pready_i == 0) begin
                @(negedge clk_i);
                rdata = prdata_i;
                @(posedge clk_i);
            end

            penable_o = 0;
            psel_o = 0;

            case (cond)
            `COND_EQUAL:       if ((rdata&mask) === ref_data) detect = 1;
            `COND_GREATER:     if ((rdata&mask) > ref_data) detect = 1;
            `COND_LESS:        if ((rdata&mask) < ref_data) detect = 1;
            `COND_NOT_EQUAL:   if ((rdata&mask) !== ref_data) detect = 1;
            `COND_NOT_GREATER: if ((rdata&mask) <= ref_data) detect = 1;
            `COND_NOT_LESS:    if ((rdata&mask) >= ref_data) detect = 1;
            endcase

            apb_token = 0;
            clk_count = 0;
            while (clk_count != 10) begin    // polling every 10 cycle counts
                @(posedge clk_i);
                clk_count = clk_count + 1;
            end
        end
        $display("    --> poll_reg [%x] = %x & %x (ref:%x)", address, prdata_i, mask, ref_data);
    end
endtask

task reg_read_irq;
    input [15:0] address;
    output [31:0] out_data;

    begin
        wait (apb_token == 0);
        apb_token = 2;

        @(posedge clk_i)
        psel_o = 1;
        pwrite_o = 0;
        paddr_o = address*4;

        @(posedge clk_i)
        penable_o = 1;

        @(posedge clk_i)
        while (pready_i == 0) begin
            @(negedge clk_i);
            out_data = prdata_i;
            @(posedge clk_i);
        end

        penable_o = 0;
        psel_o = 0;

        $display("    --> irq reg_read [%x] = %x", address, out_data);
        apb_token = 0;
    end
endtask

task reg_write_irq;
    input [15:0] address;
    input [31:0] wdata;

    begin
        wait (apb_token == 0);
        apb_token = 2;

        @(posedge clk_i)
        #1;
        psel_o = 1;
        pwrite_o = 1;
        paddr_o = address*4;
        pwdata_o = wdata;

        @(posedge clk_i)
        #1;
        penable_o = 1;

        @(posedge clk_i)
        #1;
        while (pready_i == 0) begin
            @(posedge clk_i);
            #1;
        end

        penable_o = 0;
        psel_o = 0;
        pwrite_o = 0;

        apb_token = 0;
    end
endtask

task poll_reg_irq;
    input [3:0] cond;
    input [15:0] address;
    input [31:0] mask;
    input [31:0] ref_data;
    reg detect;
    integer clk_count;
    reg [31:0] rdata;

    begin
        detect = 0;

        while (detect == 0) begin

            wait (apb_token == 0);
            apb_token = 2;
//$display("address=%x",address);

            @(posedge clk_i)
            psel_o = 1;
            pwrite_o = 0;
            paddr_o = address*4;

            @(posedge clk_i)
            penable_o = 1;

            @(posedge clk_i)
            while (pready_i == 0) begin
                @(negedge clk_i);
                rdata = prdata_i;
                @(posedge clk_i);
            end

            penable_o = 0;
            psel_o = 0;

            case (cond)
            `COND_EQUAL:       if ((rdata&mask) === ref_data) detect = 1;
            `COND_GREATER:     if ((rdata&mask) > ref_data) detect = 1;
            `COND_LESS:        if ((rdata&mask) < ref_data) detect = 1;
            `COND_NOT_EQUAL:   if ((rdata&mask) !== ref_data) detect = 1;
            `COND_NOT_GREATER: if ((rdata&mask) <= ref_data) detect = 1;
            `COND_NOT_LESS:    if ((rdata&mask) >= ref_data) detect = 1;
            endcase

            apb_token = 0;
            clk_count = 0;
            while (clk_count != 10) begin    // polling every 10 cycle counts
                @(posedge clk_i);
                clk_count = clk_count + 1;
            end
        end
        $display("    --> irq poll_reg [%x] = %x & %x (ref:%x)", address, prdata_i, mask, ref_data);
    end
endtask

always @(posedge clk_i)
begin
    if (!rst_n_i) begin
        clk_cnt <= 0;
    end else begin
        clk_cnt <= clk_cnt + 1;
    end
end

endmodule
