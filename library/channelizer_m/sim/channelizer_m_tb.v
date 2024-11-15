// SPDX-License-Identifier: Apache-2.0

// Top level testbench

`timescale 1ns/1ps

module channelizer_m_tb();

function integer clog2;
 //
 // ceiling( log2( x ) )
 //
 input integer x;
 begin
   if (x<=0) clog2 = -1;
   else clog2 = 0;
   x = x - 1;
   while (x>0) begin
     clog2 = clog2 + 1;
     x = x >> 1;
   end

 end
endfunction

localparam stimulus = "/home/jambrose/repos/hdl-reef/library/channelizer_m/sim/chan_signal.bin";
localparam mask_file = "/home/jambrose/repos/hdl-reef/library/channelizer_m/sim/mask.bin";
localparam output_file = "/home/jambrose/repos/hdl-reef/library/channelizer_m/sim/chan_results.bin";

integer input_descr, mask_descr, output_descr;

initial begin
    input_descr = $fopen(stimulus, "rb");
    mask_descr = $fopen(mask_file, "rb");
    output_descr = $fopen(output_file, "wb");
end

reg clk = 1'b0;
reg sync_reset = 1'b0;

always #2.5 clk <= ~clk;

wire s_axis_tvalid, s_axis_tready;
wire m_axis_tvalid, m_axis_tready;
wire [15:0] m_axis_tuser;
wire [31:0] m_axis_tdata;
wire m_axis_tlast;

wire [63:0] word_cnt;
wire [31:0] s_axis_tdata;
wire eob_tag;
reg data_enable = 1'b0;
reg select_enable = 1'b0;

// wire s_axis_reload_tvalid;
// wire [31:0] s_axis_reload_tdata;
// wire s_axis_reload_tlast;
// wire s_axis_reload_tready;

wire s_axis_select_tvalid;
wire [31:0] s_axis_select_tdata;
wire s_axis_select_tlast;
wire s_axis_select_tready;
wire select_update;

reg flow_ctrl = 1'b0;

localparam FFT_SIZE_WIDTH = clog2(512) + 1;
reg [FFT_SIZE_WIDTH-1:0] FFT_SIZE = 512;

// reset signal process.
initial begin
  #10
  sync_reset = 1'b1;
  #100  //repeat(10) @(posedge clk);
  sync_reset = 1'b0;
end

initial begin
    #90000
    select_enable = 1'b1;
    #90000  // wait 90 us to start data flowing -- allows the taps to be written.
    data_enable = 1'b1;
end

// flow ctrl signal
initial begin
    forever begin
        #50 flow_ctrl = 1'b1;
        #100 flow_ctrl = 1'b0;
    end
end


grc_word_reader #(
    .NUM_BYTES(4),
    .FRAME_SIZE(1024)
)
u_data_reader
(
  .clk(clk),
  .sync_reset(sync_reset),
  .enable_i(data_enable),

  .fd(input_descr),

  .valid_o(s_axis_tvalid),
  .word_o(s_axis_tdata),
  .buffer_end_o(),
  .len_o(),
  .word_cnt(),

  .ready_i(s_axis_tready)
);

grc_word_reader2 #(
    .NUM_BYTES(4),
    .FRAME_SIZE(1024)
)
u_mask_reader
(
  .clk(clk),
  .sync_reset(sync_reset),
  .enable_i(select_enable),

  .fd(mask_descr),

  .valid_o(s_axis_select_tvalid),
  .word_o(s_axis_select_tdata),
  .buffer_end_o(s_axis_select_tlast),
  .len_o(),
  .word_cnt(word_cnt),
  .update(select_update),

  .ready_i(1'b1)
);

channelizer_m u_dut
(
    .clk(clk),
    .resetn(~sync_reset),

    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tready(s_axis_tready),

    // Register Interface
    .cfg_reload_data('d0),
    .cfg_reload_update('d0),
    .cfg_reload_last('d0),
    .cfg_downselect_data(s_axis_select_tdata),
    .cfg_downselect_update(select_update),
    .cfg_downselect_last(s_axis_select_tlast),
    .cfg_fft_size(8'd128),
    .cfg_avg_len(9'd128),
    .cfg_payload_length(16'd1024),
    .cfg_chan_bypass(1'b0),
    .cfg_chan_first_num(8'd0),

    .eob_tag(eob_tag),
    .first_channel(),

    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tuser(m_axis_tuser),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tready(m_axis_tready)
);

wire [63:0] store_vec;

assign store_vec = {15'd0, m_axis_tlast, m_axis_tuser, m_axis_tdata};

grc_word_writer #(
	.LISTEN_ONLY(0),
	.ARRAY_LENGTH(1024),
	.NUM_BYTES(8))
u_writer
(
  .clk(clk),
  .sync_reset(sync_reset),
  .enable(1'b1),

  .fd(output_descr),

  .valid(m_axis_tvalid),
  .word(store_vec),

  .wr_file(1'b1),
  .word_cnt(),

  .rdy_i(flow_ctrl),
  .rdy_o(m_axis_tready)
);


endmodule //
