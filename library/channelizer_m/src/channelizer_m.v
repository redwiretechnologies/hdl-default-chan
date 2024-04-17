module channelizer_m
(
    input clk,
    input resetn,

    input s_axis_tvalid,
    input [31:0] s_axis_tdata,
    output s_axis_tready,

    // Register Interface
    input [31:0] cfg_reload_data,
    input        cfg_reload_update,
    input        cfg_reload_last,
    input [31:0] cfg_downselect_data,
    input        cfg_downselect_update,
    input        cfg_downselect_last,
    input [7:0]  cfg_fft_size,
    input [8:0]  cfg_avg_len,
    input [15:0] cfg_payload_length,
    input        cfg_chan_bypass,
    input [7:0]  cfg_chan_first_num,

    output eob_tag,
    output first_channel,

    output m_axis_tvalid,
    output [31:0] m_axis_tdata,
    output [15:0] m_axis_tuser,
    output m_axis_tlast,
    input m_axis_tready
);

    // Reload interface
    wire s_axis_reload_tvalid;
    wire [31:0] s_axis_reload_tdata;
    wire s_axis_reload_tlast;
    wire s_axis_reload_tready;
    reg  coeff_valid, next_coeff_valid;
    reg  coeff_last, next_coeff_last;
    reg  [31:0] coeff_data, next_coeff_data;
    reg  prev_coeff_update;

    // Down selection FIFO interface
    wire s_axis_select_tvalid;
    wire [31:0] s_axis_select_tdata;
    wire s_axis_select_tlast;
    wire s_axis_select_tready;
    reg  select_valid, next_select_valid;
    reg  select_last, next_select_last;
    reg  [31:0] select_data, next_select_data;
    reg  prev_select_update;

    //For bypassing
    wire        m_axis_tvalid_buf;
    wire [31:0] m_axis_tdata_buf;
    wire [15:0] m_axis_tuser_buf;
    wire        m_axis_tlast_buf;
    wire        s_axis_tready_buf;
    reg         m_axis_tvalid_out;
    reg [31:0]  m_axis_tdata_out;
    reg [15:0]  m_axis_tuser_out;
    reg         m_axis_tlast_out;
    reg         s_axis_tready_out;
    reg         first_channel_reg;

    //Bypass for the channelizer
    always @(negedge clk) begin
        if (cfg_chan_bypass == 1'b1) begin
            m_axis_tvalid_out <= s_axis_tvalid;
            m_axis_tdata_out  <= s_axis_tdata;
            m_axis_tuser_out  <= 16'd0;
            m_axis_tlast_out  <= 1'b1;
            s_axis_tready_out <= m_axis_tready;
            first_channel_reg <= 1'b0;
        end else begin
            m_axis_tvalid_out <= m_axis_tvalid_buf;
            m_axis_tdata_out  <= m_axis_tdata_buf;
            m_axis_tuser_out  <= m_axis_tuser_buf;
            m_axis_tlast_out  <= m_axis_tlast_buf;
            s_axis_tready_out <= s_axis_tready_buf;
            if (m_axis_tuser_buf[7:0] == cfg_chan_first_num)
                first_channel_reg <= 1'b1;
            else
                first_channel_reg <= 1'b0;
        end
    end
    assign s_axis_tready = s_axis_tready_out;
    assign m_axis_tvalid = m_axis_tvalid_out;
    assign m_axis_tdata  = m_axis_tdata_out;
    assign m_axis_tuser  = m_axis_tuser_out;
    assign m_axis_tlast  = m_axis_tlast_out;
    assign first_channel = first_channel_reg;

    // Method of buffering the signal to send it out (reload)
    always @(negedge clk)
    begin
        coeff_valid = next_coeff_valid;
        coeff_last  = next_coeff_last;
        coeff_data  = next_coeff_data;

        next_coeff_data = cfg_reload_data;
        next_coeff_valid = prev_coeff_update ^ cfg_reload_update;
        prev_coeff_update = cfg_reload_update;
        next_coeff_last = cfg_reload_last;
    end

    coefficient_reload_fifo coeff_int(
        .s_axis_aresetn(resetn),
        .s_axis_aclk(clk),
        .s_axis_tvalid(coeff_valid),
        .s_axis_tready(),
        .s_axis_tdata(coeff_data),
        .s_axis_tlast(coeff_last),
        .m_axis_tvalid(s_axis_reload_tvalid),
        .m_axis_tready(s_axis_reload_tready),
        .m_axis_tdata(s_axis_reload_tdata),
        .m_axis_tlast(s_axis_reload_tlast)
    );

    // Method of buffering the signal to send it out (down selection)

    always @(negedge clk)
    begin
        select_valid = next_select_valid;
        select_last  = next_select_last;
        select_data  = next_select_data;

        next_select_data = cfg_downselect_data;
        next_select_valid = prev_select_update ^ cfg_downselect_update;
        prev_select_update = cfg_downselect_update;
        next_select_last = cfg_downselect_last;
    end

    downselect_mask_reload_fifo downselect_int(
        .s_axis_aresetn(resetn),
        .s_axis_aclk(clk),
        .s_axis_tvalid(select_valid),
        .s_axis_tready(),
        .s_axis_tdata(select_data),
        .s_axis_tlast(select_last),
        .m_axis_tvalid(s_axis_select_tvalid),
        .m_axis_tready(s_axis_select_tready),
        .m_axis_tdata(s_axis_select_tdata),
        .m_axis_tlast(s_axis_select_tlast)
    );

    chan_top_128M_16iw_16ow_32tps channelizer (
        .clk(clk),
        .sync_reset(~resetn),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready_buf),
        .s_axis_reload_tvalid(s_axis_reload_tvalid),
        .s_axis_reload_tdata(s_axis_reload_tdata),
        .s_axis_reload_tlast(s_axis_reload_tlast),
        .s_axis_reload_tready(s_axis_reload_tready),
        .s_axis_select_tvalid(s_axis_select_tvalid),
        .s_axis_select_tdata(s_axis_select_tdata),
        .s_axis_select_tlast(s_axis_select_tlast),
        .s_axis_select_tready(s_axis_select_tready),
        .fft_size(cfg_fft_size),
        .avg_len(cfg_avg_len),
        .payload_length(cfg_payload_length),
        .eob_tag(eob_tag),
        .m_axis_tvalid(m_axis_tvalid_buf),
        .m_axis_tdata(m_axis_tdata_buf),
        .m_axis_tuser(m_axis_tuser_buf),
        .m_axis_tlast(m_axis_tlast_buf),
        .m_axis_tready(m_axis_tready)
    );

endmodule
