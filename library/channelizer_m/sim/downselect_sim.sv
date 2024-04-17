module downselect_test_tb;

localparam period=100, iterations=5;

reg clk;

reg cfg_downselect_update = 'b0;
reg cfg_downselect_last;
reg [31:0] cfg_downselect_data;
reg [127:0] downselect_data;
reg rst;

wire [127:0] a_cfg_downselect_data[0:iterations-1];
assign a_cfg_downselect_data[0] = {32'h00000001, 32'h00000002, 32'h00000003, 32'h00000004};
assign a_cfg_downselect_data[1] = {32'h80000000, 32'h00000000, 32'h00000000, 32'h00000001};
assign a_cfg_downselect_data[2] = {32'h80000000, 32'h80000000, 32'h80000000, 32'h80000000};
assign a_cfg_downselect_data[3] = {32'h70000000, 32'h00004000, 32'h02000000, 32'h00000006};
assign a_cfg_downselect_data[4] = {32'hFFFFFFFF, 32'hFFFFFFFF, 32'hFFFFFFFF, 32'hFFFFFFFF};

integer maxcount = 56;
integer count = maxcount-2;
integer completed = -1;

channelizer_m uut
(
    .clk(clk),
    .resetn(rst),

    .s_axis_tvalid(),
    .s_axis_tdata(),
    .s_axis_tready(),

    // Register Interface
    .cfg_reload_data('d0),
    .cfg_reload_update('d0),
    .cfg_reload_last('d0),
    .cfg_downselect_data(cfg_downselect_data),
    .cfg_downselect_update(cfg_downselect_update),
    .cfg_downselect_last(cfg_downselect_last),
    .cfg_fft_size('d128),
    .cfg_avg_len('d64),
    .cfg_payload_length('d64),
    .cfg_chan_bypass('b0),

    .eob_tag(),

    .m_axis_tvalid(),
    .m_axis_tdata(),
    .m_axis_tuser(),
    .m_axis_tlast(),
    .m_axis_tready()
);

//Clock and counter to iterate through test cases
always
begin
    if (count == maxcount)
    begin
        count = 0;
        completed = completed + 1;
        if (completed == iterations+1)
            $stop;
        if (completed != iterations)
        begin
            downselect_data = a_cfg_downselect_data[completed];
            cfg_downselect_data = downselect_data[31:0];
            cfg_downselect_last = 'b0;
        end
    end
    else if (count >= 10 && count < 17)
    begin
        case (count)
            'd12: cfg_downselect_data = downselect_data[63:32];
            'd14: cfg_downselect_data = downselect_data[95:64];
            'd16: cfg_downselect_data = downselect_data[127:96];
            'd10: cfg_downselect_data = downselect_data[31:0];
        endcase
        if (count == 16)
            cfg_downselect_last = 'b1;
        else
            cfg_downselect_last = 'b0;
        case (count)
            'd12: cfg_downselect_update = ~cfg_downselect_update;
            'd14: cfg_downselect_update = ~cfg_downselect_update;
            'd16: cfg_downselect_update = ~cfg_downselect_update;
            'd10: cfg_downselect_update = ~cfg_downselect_update;
        endcase;
    end
    else
        cfg_downselect_last = 'b0;

    clk = 1'b1;
    #(period);
    clk = 1'b0;
    #(period);

    count = count + 1;
end

initial
begin
    rst = 1'b0;
    #(period);
    rst = 1'b1;
    #(period);
end
endmodule
