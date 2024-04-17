
`timescale 1ns/100ps

module default_chan_block_user #(
  parameter CLK_FREQ = 100000000,
  parameter ENABLE_DUAL_CIC = 0,
  parameter ENABLE_DUAL_CHAN = 0
)(
  input         user_clk,
  input         user_resetn,
  input         dac_clk,
  input         dac_rstn,
  input         adc_clk,
  input         adc_rstn,

  input         pps_ext,
  output        adc_overflow,
  output        dac_underflow,

  // Register Interface
  input         up_clk,
  input         up_rstn,
  input         up_wreq,
  input [8:0]   up_waddr,
  input [31:0]  up_wdata,
  output        up_wack,
  input         up_rreq,
  input [8:0]   up_raddr,
  output [31:0] up_rdata,
  output        up_rack,

  // Slave ADC interface -- From 9361
  output        s_adc_aclk,
  output        s_adc_aresetn,
  output        s_adc_ready,
  input         s_adc_valid,
  input [3:0]   s_adc_enables,
  input [63:0]  s_adc_data,
  input [9:0]   s_adc_level,

  // Master ADC interface -- To DMA
  output        m_adc_aclk,
  output        m_adc_aresetn,
  input         m_adc_ready,
  output        m_adc_valid,
  output [63:0] m_adc_data,
  output        m_adc_tag_valid,
  output [6:0]  m_adc_tag_type,
  output        m_adc_last,

  // Slave DAC interface -- From DMA
  output        s_dac_aclk,
  output        s_dac_aresetn,
  output        s_dac_ready,
  input         s_dac_valid,
  input [63:0]  s_dac_data,
  input         s_dac_tag_valid,
  input [6:0]   s_dac_tag_type,
  input         s_dac_last,

  // Master DAC interface -- To 9361
  output        m_dac_aclk,
  output        m_dac_aresetn,
  input         m_dac_ready,
  output        m_dac_valid,
  input [3:0]   m_dac_enables,
  input         m_dac_empty,
  input [9:0]   m_dac_room,
  output [63:0] m_dac_data);


  assign s_adc_aclk = user_clk;
  assign m_adc_aclk = user_clk;
  assign s_dac_aclk = user_clk;
  assign m_dac_aclk = user_clk;

  assign s_adc_aresetn = user_resetn;
  assign m_adc_aresetn = user_resetn;
  assign s_dac_aresetn = user_resetn;
  assign m_dac_aresetn = user_resetn;

  /****************************************************************************
   * User Registers
   ***************************************************************************/
  wire        cfg_which_pps;
  wire [55:0] cfg_sample_idx;
  wire        cfg_sample_idx_updated;
  wire        cfg_pps_tags_enabled;
  wire        cfg_overflow_enabled;
  wire [23:0] cfg_overflow_wait;
  wire        adc_overflow_user;
  wire        dac_underflow_user;
  wire        cfg_hold_enabled;
  wire        status_hold_diff_valid;
  wire [55:0] status_hold_diff;
  wire [55:0] sample_idx_adc;
  wire [55:0] sample_idx_dac;

  //For CIC filter
  wire [31:0] cfg_adc_decimation_ratio;
  wire [ 2:0] cfg_adc_filter_mask;
  wire        cfg_adc_correction_enable_a;
  wire        cfg_adc_correction_enable_b;
  wire [15:0] cfg_adc_correction_coefficient_a;
  wire [15:0] cfg_adc_correction_coefficient_b;
  wire        cfg_adc_filter_reset;
  wire [4:0]  cfg_adc_filter_id;
  wire [63:0] adc_dec_data;
  wire [3:0]  adc_dec_valid;
  wire        cic_2_filter_reset;

  //For Channelizer
  wire [31:0] cfg_reload_data;
  wire        cfg_reload_update;
  wire        cfg_reload_last;
  wire [31:0] cfg_downselect_data;
  wire        cfg_downselect_update;
  wire        cfg_downselect_last;
  wire [7:0]  cfg_fft_size;
  wire [8:0]  cfg_avg_len;
  wire [15:0] cfg_payload_length;
  wire        cfg_chan_bypass;
  wire        cfg_chan_reset;
  wire [63:0] adc_chan_data;
  wire [1:0]  adc_chan_valid;
  wire [31:0] adc_chan_user;
  wire [1:0]  adc_chan_last;
  wire        adc_chan_tready;
  wire        chan_bypass_2;
  wire        first_channel;
  wire        cfg_chan_first_enable;
  wire [7:0]  cfg_chan_first_num;
  wire [31:0] cfg_chan_first_wait;


  default_chan_block_regs #(
    .ASYNC_CLK(1))
  regs (
    .user_clk(user_clk),
    .user_rstn(user_resetn),

    .up_clk(up_clk),
    .up_rstn(up_rstn),
    .up_wreq(up_wreq),
    .up_waddr(up_waddr),
    .up_wdata(up_wdata),
    .up_wack(up_wack),
    .up_rreq(up_rreq),
    .up_raddr(up_raddr),
    .up_rdata(up_rdata),
    .up_rack(up_rack),

    .dac_underflow(dac_underflow_user),
    .adc_overflow(adc_overflow_user),
    .status_hold_diff(status_hold_diff),
    .status_hold_diff_valid(status_hold_diff_valid),
    .status_sample_idx_adc(sample_idx_adc),
    .status_sample_idx_dac(sample_idx_dac),

    .cfg_which_pps(cfg_which_pps),
    .cfg_sample_idx(cfg_sample_idx),
    .cfg_sample_idx_updated(cfg_sample_idx_updated),
    .cfg_pps_tags_enabled(cfg_pps_tags_enabled),
    .cfg_overflow_enabled(cfg_overflow_enabled),
    .cfg_overflow_wait(cfg_overflow_wait),
    .cfg_hold_enabled(cfg_hold_enabled),
    .cfg_sample_idx_mode(cfg_sample_idx_mode),

    //For CIC filter
    .cfg_adc_decimation_ratio(cfg_adc_decimation_ratio),
    .cfg_adc_filter_mask(cfg_adc_filter_mask),
    .cfg_adc_correction_enable_a(cfg_adc_correction_enable_a),
    .cfg_adc_correction_enable_b(cfg_adc_correction_enable_b),
    .cfg_adc_correction_coefficient_a(cfg_adc_correction_coefficient_a),
    .cfg_adc_correction_coefficient_b(cfg_adc_correction_coefficient_b),
    .cfg_adc_filter_reset(cfg_adc_filter_reset),
    .cfg_adc_filter_id(cfg_adc_filter_id),

    //For Channelizer

    .cfg_reload_data(cfg_reload_data),
    .cfg_reload_update(cfg_reload_update),
    .cfg_reload_last(cfg_reload_last),
    .cfg_downselect_data(cfg_downselect_data),
    .cfg_downselect_update(cfg_downselect_update),
    .cfg_downselect_last(cfg_downselect_last),
    .cfg_fft_size(cfg_fft_size),
    .cfg_avg_len(cfg_avg_len),
    .cfg_payload_length(cfg_payload_length),
    .cfg_chan_bypass(cfg_chan_bypass),
    .cfg_chan_reset(cfg_chan_reset),
    .cfg_chan_first_enable(cfg_chan_first_enable),
    .cfg_chan_first_num(cfg_chan_first_num),
    .cfg_chan_first_wait(cfg_chan_first_wait)
  );

  //For CIC filter
  assign s_adc_ready = 1'b1;
  cic_filter
  #( .FILTER_ID('d0))
  cic_0 (
    .adc_clk(s_adc_aclk),
    .adc_rst(!s_adc_aresetn),

    .adc_data_a(s_adc_data[15:0]),
    .adc_data_b(s_adc_data[31:16]),
    .adc_valid_a(s_adc_valid),
    .adc_valid_b(s_adc_valid),
    .adc_enable_a(s_adc_enables[0]),
    .adc_enable_b(s_adc_enables[1]),

    .adc_dec_data_a(adc_dec_data[15:0]),
    .adc_dec_data_b(adc_dec_data[31:16]),
    .adc_dec_valid_a(adc_dec_valid[0]),
    .adc_dec_valid_b(adc_dec_valid[1]),

    .filter_id(cfg_adc_filter_id),
    .decimation_ratio(cfg_adc_decimation_ratio),
    .filter_mask(cfg_adc_filter_mask),
    .adc_correction_enable_a(cfg_adc_correction_enable_a),
    .adc_correction_enable_b(cfg_adc_correction_enable_b),
    .adc_correction_coefficient_a(cfg_adc_correction_coefficient_a),
    .adc_correction_coefficient_b(cfg_adc_correction_coefficient_b),
    .adc_filter_reset(cfg_adc_filter_reset)
  );
  cic_filter
  #( .FILTER_ID('d0))
  cic_1 (
    .adc_clk(s_adc_aclk),
    .adc_rst(!s_adc_aresetn),

    .adc_data_a(s_adc_data[47:32]),
    .adc_data_b(s_adc_data[63:48]),
    .adc_valid_a(s_adc_valid),
    .adc_valid_b(s_adc_valid),
    .adc_enable_a(s_adc_enables[2]),
    .adc_enable_b(s_adc_enables[3]),

    .adc_dec_data_a(adc_dec_data[47:32]),
    .adc_dec_data_b(adc_dec_data[63:48]),
    .adc_dec_valid_a(adc_dec_valid[2]),
    .adc_dec_valid_b(adc_dec_valid[3]),

    .filter_id(cfg_adc_filter_id),
    .decimation_ratio(cfg_adc_decimation_ratio),
    .filter_mask(cfg_adc_filter_mask),
    .adc_correction_enable_a(cfg_adc_correction_enable_a),
    .adc_correction_enable_b(cfg_adc_correction_enable_b),
    .adc_correction_coefficient_a(cfg_adc_correction_coefficient_a),
    .adc_correction_coefficient_b(cfg_adc_correction_coefficient_b),
    .adc_filter_reset(cic_2_filter_reset)
  );

  //By holding the adc_filter_reset line high constantly, we should be able to
  //optimize out the second CIC filter
  generate
      if (ENABLE_DUAL_CIC == 1) begin
          assign cic_2_filter_reset = cfg_adc_filter_reset;
      end else begin
          assign cic_2_filter_reset = 1'b1;
      end
  endgenerate

  channelizer_m chan_1 (
      .clk(s_adc_aclk),
      .resetn(cfg_chan_reset),

      .s_axis_tvalid(adc_dec_valid[0] & adc_dec_valid[1]),
      .s_axis_tdata(adc_dec_data[31:0]),
      .s_axis_tready(),

      // Register Interface
      .cfg_reload_data(cfg_reload_data),
      .cfg_reload_update(cfg_reload_update),
      .cfg_reload_last(cfg_reload_last),
      .cfg_downselect_data(cfg_downselect_data),
      .cfg_downselect_update(cfg_downselect_update),
      .cfg_downselect_last(cfg_downselect_last),
      .cfg_fft_size(cfg_fft_size),
      .cfg_avg_len(cfg_avg_len),
      .cfg_payload_length(cfg_payload_length),
      .cfg_chan_bypass(cfg_chan_bypass),
      .cfg_chan_first_num(cfg_chan_first_num),

      .eob_tag(),
      .first_channel(first_channel),

      .m_axis_tvalid(adc_chan_valid[0]),
      .m_axis_tdata(adc_chan_data[31:0]),
      .m_axis_tuser(adc_chan_user[15:0]),
      .m_axis_tlast(adc_chan_last[0]),
      .m_axis_tready(adc_chan_tready)
  );

  channelizer_m chan_2 (
      .clk(s_adc_aclk),
      .resetn(cfg_chan_reset),

      .s_axis_tvalid(adc_dec_valid[2] & adc_dec_valid[3]),
      .s_axis_tdata(adc_dec_data[63:32]),
      .s_axis_tready(),

      // Register Interface
      .cfg_reload_data(cfg_reload_data),
      .cfg_reload_update(cfg_reload_update),
      .cfg_reload_last(cfg_reload_last),
      .cfg_downselect_data(cfg_downselect_data),
      .cfg_downselect_update(cfg_downselect_update),
      .cfg_downselect_last(cfg_downselect_last),
      .cfg_fft_size(cfg_fft_size),
      .cfg_avg_len(cfg_avg_len),
      .cfg_payload_length(cfg_payload_length),
      .cfg_chan_bypass(chan_bypass_2),
      .cfg_chan_first_num(cfg_chan_first_num),

      .eob_tag(),
      .first_channel(),

      .m_axis_tvalid(adc_chan_valid[1]),
      .m_axis_tdata(adc_chan_data[63:32]),
      .m_axis_tuser(adc_chan_user[31:16]),
      .m_axis_tlast(adc_chan_last[1]),
      .m_axis_tready(adc_chan_tready)
  );

  //By holding the cfg_chan_bypass line high, we should be able to optimize
  //out the second channelizer
  generate
      if (ENABLE_DUAL_CHAN == 1) begin
          assign chan_bypass_2 = cfg_chan_bypass;
      end else begin
          assign chan_bypass_2 = 1'b1;
      end
  endgenerate

  /****************************************************************************
   * sample_clk
   *
   ***************************************************************************/
  wire [111:0] sample_idx;
  wire [1:0]   sample_idx_incr;
  wire         pps_edge;

  sample_clk #(
    .CLK_FREQ(CLK_FREQ),
    .SAMPLE_CLK_WIDTH(56),
    .NUM_SAMPLE_CLKS(2))
  sample_clk (
    .clk(user_clk),
    .aresetn(user_resetn),
    .which_pps(cfg_which_pps),
    .pps_ext(pps_ext),
    .sample_idx_reg(cfg_sample_idx),
    .sample_idx_reg_valid(cfg_sample_idx_updated),
    .sample_idx_incr(sample_idx_incr),
    .sample_idx(sample_idx),
    .pps(),
    .pps_edge(pps_edge));

  assign sample_idx_adc = sample_idx[55:0];
  assign sample_idx_dac = sample_idx[111:56];
  assign sample_idx_incr[0] = s_adc_ready & s_adc_valid;
  assign sample_idx_incr[1] = m_dac_ready & m_dac_valid;

  /****************************************************************************
   * ADC
   ***************************************************************************/
  default_chan_block_adc default_chan_block_adc(
    .clk(user_clk),
    .resetn(user_resetn),

    .pps_edge(pps_edge),
    .first_channel(first_channel),
    .cfg_chan_first_enable(cfg_chan_first_enable),
    .cfg_chan_first_wait(cfg_chan_first_wait),
    .adc_overflow(adc_overflow_user),
    .cfg_overflow_enabled(cfg_overflow_enabled),
    .cfg_pps_tags_enabled(cfg_pps_tags_enabled),
    .cfg_overflow_wait(cfg_overflow_wait),
    .sample_idx(sample_idx_adc),

    .s_rf_ready(adc_chan_tready),
    .s_rf_valid(adc_chan_valid[0] | adc_chan_valid[1]),
    .s_rf_data(adc_chan_data),
    .s_rf_enables({adc_chan_valid[1], adc_chan_valid[1], adc_chan_valid[0], adc_chan_valid[0]}),
    .s_rf_level(s_adc_level),

    .m_dma_ready(m_adc_ready),
    .m_dma_valid(m_adc_valid),
    .m_dma_data(m_adc_data),
    .m_dma_tag_valid(m_adc_tag_valid),
    .m_dma_tag_type(m_adc_tag_type),
    .m_dma_last(m_adc_last));

  // Sync overflow to adc_clk
  sync_event #(
    .NUM_OF_EVENTS(1),
    .ASYNC_CLK(1))
  sync_overflow (
    .in_clk(user_clk),
    .in_event(adc_overflow_user),
    .out_clk(adc_clk),
    .out_event(adc_overflow));

  /****************************************************************************
   * DAC
   ***************************************************************************/
  default_chan_block_dac default_chan_block_dac(
    .clk(user_clk),
    .resetn(user_resetn),

    .sample_idx(sample_idx_dac),
    .cfg_hold_enabled(cfg_hold_enabled),
    .status_hold_diff(status_hold_diff),
    .status_hold_diff_valid(status_hold_diff_valid),
    .dac_underflow(dac_underflow_user),

    .s_dma_ready(s_dac_ready),
    .s_dma_valid(s_dac_valid),
    .s_dma_data(s_dac_data),
    .s_dma_tag_valid(s_dac_tag_valid),
    .s_dma_tag_type(s_dac_tag_type),
    .s_dma_last(s_dac_last),

    .m_rf_ready(m_dac_ready),
    .m_rf_valid(m_dac_valid),
    .m_rf_data(m_dac_data),
    .m_rf_empty(m_dac_empty),
    .m_rf_room(m_dac_room),
    .m_rf_enables(m_dac_enables));

  // Sync underflow from dac_clk to user_clk domain.
  sync_event #(
    .NUM_OF_EVENTS(1),
    .ASYNC_CLK(1))
  sync_underflow (
    .in_clk(user_clk),
    .in_event(dac_underflow_user),
    .out_clk(dac_clk),
    .out_event(dac_underflow));

endmodule
