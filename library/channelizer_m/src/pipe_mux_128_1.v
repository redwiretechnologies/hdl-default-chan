// SPDX-License-Identifier: Apache-2.0

/*************************************************************************/
//// File        : pipe_mux_128_1.v
// Description : Implements a pipelined multiplexer to be used in high speed design
// This module has a delay of 4 clock cycles//
// -------------------------------------------------------------------
//
/***************************************************************************/


module pipe_mux_128_1
(
    input clk,
    input sync_reset,
    input valid_i,
    input [6:0] sel,
    input [127:0] input_word,
    output valid_o,
    output [6:0] sel_o,
    output output_word
);

(* KEEP = "TRUE" *) reg [6:0] sel_d0_0;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_1;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_2;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_3;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_4;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_5;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_6;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_7;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_8;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_9;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_10;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_11;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_12;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_13;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_14;
(* KEEP = "TRUE" *) reg [6:0] sel_d0_15;
(* KEEP = "TRUE" *) reg [6:0] sel_d1_0;
(* KEEP = "TRUE" *) reg [6:0] sel_d1_1;
(* KEEP = "TRUE" *) reg [6:0] sel_d2_0;
(* KEEP = "TRUE" *) reg [6:0] sel_d3;
reg valid_d0;
reg valid_d1;
reg valid_d2;
reg valid_d3;
reg [0:0] mux_d0_0, next_mux_d0_0;
reg [0:0] mux_d0_1, next_mux_d0_1;
reg [0:0] mux_d0_2, next_mux_d0_2;
reg [0:0] mux_d0_3, next_mux_d0_3;
reg [0:0] mux_d0_4, next_mux_d0_4;
reg [0:0] mux_d0_5, next_mux_d0_5;
reg [0:0] mux_d0_6, next_mux_d0_6;
reg [0:0] mux_d0_7, next_mux_d0_7;
reg [0:0] mux_d0_8, next_mux_d0_8;
reg [0:0] mux_d0_9, next_mux_d0_9;
reg [0:0] mux_d0_10, next_mux_d0_10;
reg [0:0] mux_d0_11, next_mux_d0_11;
reg [0:0] mux_d0_12, next_mux_d0_12;
reg [0:0] mux_d0_13, next_mux_d0_13;
reg [0:0] mux_d0_14, next_mux_d0_14;
reg [0:0] mux_d0_15, next_mux_d0_15;
reg [0:0] mux_d1_0, next_mux_d1_0;
reg [0:0] mux_d1_1, next_mux_d1_1;
reg [0:0] mux_d2_0, next_mux_d2_0;
reg [127:0] input_word_d;

assign output_word = mux_d2_0;
assign valid_o = valid_d3;
assign sel_o = sel_d3;

always @(posedge clk) begin
    if (sync_reset) begin
        valid_d0  <= 0;
        valid_d1  <= 0;
        valid_d2  <= 0;
        valid_d3  <= 0;
    end else begin
        valid_d0  <= valid_i;
        valid_d1  <= valid_d0;
        valid_d2  <= valid_d1;
        valid_d3  <= valid_d2;
    end
end


always @(posedge clk) begin
    input_word_d <= input_word;
    mux_d0_0 <= next_mux_d0_0;
    mux_d0_1 <= next_mux_d0_1;
    mux_d0_2 <= next_mux_d0_2;
    mux_d0_3 <= next_mux_d0_3;
    mux_d0_4 <= next_mux_d0_4;
    mux_d0_5 <= next_mux_d0_5;
    mux_d0_6 <= next_mux_d0_6;
    mux_d0_7 <= next_mux_d0_7;
    mux_d0_8 <= next_mux_d0_8;
    mux_d0_9 <= next_mux_d0_9;
    mux_d0_10 <= next_mux_d0_10;
    mux_d0_11 <= next_mux_d0_11;
    mux_d0_12 <= next_mux_d0_12;
    mux_d0_13 <= next_mux_d0_13;
    mux_d0_14 <= next_mux_d0_14;
    mux_d0_15 <= next_mux_d0_15;
    mux_d1_0 <= next_mux_d1_0;
    mux_d1_1 <= next_mux_d1_1;
    mux_d2_0 <= next_mux_d2_0;
    sel_d0_0 <= sel;
    sel_d0_1 <= sel;
    sel_d0_2 <= sel;
    sel_d0_3 <= sel;
    sel_d0_4 <= sel;
    sel_d0_5 <= sel;
    sel_d0_6 <= sel;
    sel_d0_7 <= sel;
    sel_d0_8 <= sel;
    sel_d0_9 <= sel;
    sel_d0_10 <= sel;
    sel_d0_11 <= sel;
    sel_d0_12 <= sel;
    sel_d0_13 <= sel;
    sel_d0_14 <= sel;
    sel_d0_15 <= sel;
    sel_d1_0 <= sel_d0_15;
    sel_d1_1 <= sel_d0_15;
    sel_d2_0 <= sel_d1_1;
    sel_d3 <= sel_d2_0;
end


always @*
begin
    next_mux_d0_0 = mux_d0_0;
    next_mux_d0_1 = mux_d0_1;
    next_mux_d0_2 = mux_d0_2;
    next_mux_d0_3 = mux_d0_3;
    next_mux_d0_4 = mux_d0_4;
    next_mux_d0_5 = mux_d0_5;
    next_mux_d0_6 = mux_d0_6;
    next_mux_d0_7 = mux_d0_7;
    next_mux_d0_8 = mux_d0_8;
    next_mux_d0_9 = mux_d0_9;
    next_mux_d0_10 = mux_d0_10;
    next_mux_d0_11 = mux_d0_11;
    next_mux_d0_12 = mux_d0_12;
    next_mux_d0_13 = mux_d0_13;
    next_mux_d0_14 = mux_d0_14;
    next_mux_d0_15 = mux_d0_15;
    next_mux_d1_0 = mux_d1_0;
    next_mux_d1_1 = mux_d1_1;
    next_mux_d2_0 = mux_d2_0;

    if (sel_d0_0[2:0] == 0) begin
        next_mux_d0_0 = input_word_d[0];
    end else if (sel_d0_0[2:0] == 1) begin
        next_mux_d0_0 = input_word_d[1];
    end else if (sel_d0_0[2:0] == 2) begin
        next_mux_d0_0 = input_word_d[2];
    end else if (sel_d0_0[2:0] == 3) begin
        next_mux_d0_0 = input_word_d[3];
    end else if (sel_d0_0[2:0] == 4) begin
        next_mux_d0_0 = input_word_d[4];
    end else if (sel_d0_0[2:0] == 5) begin
        next_mux_d0_0 = input_word_d[5];
    end else if (sel_d0_0[2:0] == 6) begin
        next_mux_d0_0 = input_word_d[6];
    end else begin
        next_mux_d0_0 = input_word_d[7];
    end

    if (sel_d0_1[2:0] == 0) begin
        next_mux_d0_1 = input_word_d[8];
    end else if (sel_d0_1[2:0] == 1) begin
        next_mux_d0_1 = input_word_d[9];
    end else if (sel_d0_1[2:0] == 2) begin
        next_mux_d0_1 = input_word_d[10];
    end else if (sel_d0_1[2:0] == 3) begin
        next_mux_d0_1 = input_word_d[11];
    end else if (sel_d0_1[2:0] == 4) begin
        next_mux_d0_1 = input_word_d[12];
    end else if (sel_d0_1[2:0] == 5) begin
        next_mux_d0_1 = input_word_d[13];
    end else if (sel_d0_1[2:0] == 6) begin
        next_mux_d0_1 = input_word_d[14];
    end else begin
        next_mux_d0_1 = input_word_d[15];
    end

    if (sel_d0_2[2:0] == 0) begin
        next_mux_d0_2 = input_word_d[16];
    end else if (sel_d0_2[2:0] == 1) begin
        next_mux_d0_2 = input_word_d[17];
    end else if (sel_d0_2[2:0] == 2) begin
        next_mux_d0_2 = input_word_d[18];
    end else if (sel_d0_2[2:0] == 3) begin
        next_mux_d0_2 = input_word_d[19];
    end else if (sel_d0_2[2:0] == 4) begin
        next_mux_d0_2 = input_word_d[20];
    end else if (sel_d0_2[2:0] == 5) begin
        next_mux_d0_2 = input_word_d[21];
    end else if (sel_d0_2[2:0] == 6) begin
        next_mux_d0_2 = input_word_d[22];
    end else begin
        next_mux_d0_2 = input_word_d[23];
    end

    if (sel_d0_3[2:0] == 0) begin
        next_mux_d0_3 = input_word_d[24];
    end else if (sel_d0_3[2:0] == 1) begin
        next_mux_d0_3 = input_word_d[25];
    end else if (sel_d0_3[2:0] == 2) begin
        next_mux_d0_3 = input_word_d[26];
    end else if (sel_d0_3[2:0] == 3) begin
        next_mux_d0_3 = input_word_d[27];
    end else if (sel_d0_3[2:0] == 4) begin
        next_mux_d0_3 = input_word_d[28];
    end else if (sel_d0_3[2:0] == 5) begin
        next_mux_d0_3 = input_word_d[29];
    end else if (sel_d0_3[2:0] == 6) begin
        next_mux_d0_3 = input_word_d[30];
    end else begin
        next_mux_d0_3 = input_word_d[31];
    end

    if (sel_d0_4[2:0] == 0) begin
        next_mux_d0_4 = input_word_d[32];
    end else if (sel_d0_4[2:0] == 1) begin
        next_mux_d0_4 = input_word_d[33];
    end else if (sel_d0_4[2:0] == 2) begin
        next_mux_d0_4 = input_word_d[34];
    end else if (sel_d0_4[2:0] == 3) begin
        next_mux_d0_4 = input_word_d[35];
    end else if (sel_d0_4[2:0] == 4) begin
        next_mux_d0_4 = input_word_d[36];
    end else if (sel_d0_4[2:0] == 5) begin
        next_mux_d0_4 = input_word_d[37];
    end else if (sel_d0_4[2:0] == 6) begin
        next_mux_d0_4 = input_word_d[38];
    end else begin
        next_mux_d0_4 = input_word_d[39];
    end

    if (sel_d0_5[2:0] == 0) begin
        next_mux_d0_5 = input_word_d[40];
    end else if (sel_d0_5[2:0] == 1) begin
        next_mux_d0_5 = input_word_d[41];
    end else if (sel_d0_5[2:0] == 2) begin
        next_mux_d0_5 = input_word_d[42];
    end else if (sel_d0_5[2:0] == 3) begin
        next_mux_d0_5 = input_word_d[43];
    end else if (sel_d0_5[2:0] == 4) begin
        next_mux_d0_5 = input_word_d[44];
    end else if (sel_d0_5[2:0] == 5) begin
        next_mux_d0_5 = input_word_d[45];
    end else if (sel_d0_5[2:0] == 6) begin
        next_mux_d0_5 = input_word_d[46];
    end else begin
        next_mux_d0_5 = input_word_d[47];
    end

    if (sel_d0_6[2:0] == 0) begin
        next_mux_d0_6 = input_word_d[48];
    end else if (sel_d0_6[2:0] == 1) begin
        next_mux_d0_6 = input_word_d[49];
    end else if (sel_d0_6[2:0] == 2) begin
        next_mux_d0_6 = input_word_d[50];
    end else if (sel_d0_6[2:0] == 3) begin
        next_mux_d0_6 = input_word_d[51];
    end else if (sel_d0_6[2:0] == 4) begin
        next_mux_d0_6 = input_word_d[52];
    end else if (sel_d0_6[2:0] == 5) begin
        next_mux_d0_6 = input_word_d[53];
    end else if (sel_d0_6[2:0] == 6) begin
        next_mux_d0_6 = input_word_d[54];
    end else begin
        next_mux_d0_6 = input_word_d[55];
    end

    if (sel_d0_7[2:0] == 0) begin
        next_mux_d0_7 = input_word_d[56];
    end else if (sel_d0_7[2:0] == 1) begin
        next_mux_d0_7 = input_word_d[57];
    end else if (sel_d0_7[2:0] == 2) begin
        next_mux_d0_7 = input_word_d[58];
    end else if (sel_d0_7[2:0] == 3) begin
        next_mux_d0_7 = input_word_d[59];
    end else if (sel_d0_7[2:0] == 4) begin
        next_mux_d0_7 = input_word_d[60];
    end else if (sel_d0_7[2:0] == 5) begin
        next_mux_d0_7 = input_word_d[61];
    end else if (sel_d0_7[2:0] == 6) begin
        next_mux_d0_7 = input_word_d[62];
    end else begin
        next_mux_d0_7 = input_word_d[63];
    end

    if (sel_d0_8[2:0] == 0) begin
        next_mux_d0_8 = input_word_d[64];
    end else if (sel_d0_8[2:0] == 1) begin
        next_mux_d0_8 = input_word_d[65];
    end else if (sel_d0_8[2:0] == 2) begin
        next_mux_d0_8 = input_word_d[66];
    end else if (sel_d0_8[2:0] == 3) begin
        next_mux_d0_8 = input_word_d[67];
    end else if (sel_d0_8[2:0] == 4) begin
        next_mux_d0_8 = input_word_d[68];
    end else if (sel_d0_8[2:0] == 5) begin
        next_mux_d0_8 = input_word_d[69];
    end else if (sel_d0_8[2:0] == 6) begin
        next_mux_d0_8 = input_word_d[70];
    end else begin
        next_mux_d0_8 = input_word_d[71];
    end

    if (sel_d0_9[2:0] == 0) begin
        next_mux_d0_9 = input_word_d[72];
    end else if (sel_d0_9[2:0] == 1) begin
        next_mux_d0_9 = input_word_d[73];
    end else if (sel_d0_9[2:0] == 2) begin
        next_mux_d0_9 = input_word_d[74];
    end else if (sel_d0_9[2:0] == 3) begin
        next_mux_d0_9 = input_word_d[75];
    end else if (sel_d0_9[2:0] == 4) begin
        next_mux_d0_9 = input_word_d[76];
    end else if (sel_d0_9[2:0] == 5) begin
        next_mux_d0_9 = input_word_d[77];
    end else if (sel_d0_9[2:0] == 6) begin
        next_mux_d0_9 = input_word_d[78];
    end else begin
        next_mux_d0_9 = input_word_d[79];
    end

    if (sel_d0_10[2:0] == 0) begin
        next_mux_d0_10 = input_word_d[80];
    end else if (sel_d0_10[2:0] == 1) begin
        next_mux_d0_10 = input_word_d[81];
    end else if (sel_d0_10[2:0] == 2) begin
        next_mux_d0_10 = input_word_d[82];
    end else if (sel_d0_10[2:0] == 3) begin
        next_mux_d0_10 = input_word_d[83];
    end else if (sel_d0_10[2:0] == 4) begin
        next_mux_d0_10 = input_word_d[84];
    end else if (sel_d0_10[2:0] == 5) begin
        next_mux_d0_10 = input_word_d[85];
    end else if (sel_d0_10[2:0] == 6) begin
        next_mux_d0_10 = input_word_d[86];
    end else begin
        next_mux_d0_10 = input_word_d[87];
    end

    if (sel_d0_11[2:0] == 0) begin
        next_mux_d0_11 = input_word_d[88];
    end else if (sel_d0_11[2:0] == 1) begin
        next_mux_d0_11 = input_word_d[89];
    end else if (sel_d0_11[2:0] == 2) begin
        next_mux_d0_11 = input_word_d[90];
    end else if (sel_d0_11[2:0] == 3) begin
        next_mux_d0_11 = input_word_d[91];
    end else if (sel_d0_11[2:0] == 4) begin
        next_mux_d0_11 = input_word_d[92];
    end else if (sel_d0_11[2:0] == 5) begin
        next_mux_d0_11 = input_word_d[93];
    end else if (sel_d0_11[2:0] == 6) begin
        next_mux_d0_11 = input_word_d[94];
    end else begin
        next_mux_d0_11 = input_word_d[95];
    end

    if (sel_d0_12[2:0] == 0) begin
        next_mux_d0_12 = input_word_d[96];
    end else if (sel_d0_12[2:0] == 1) begin
        next_mux_d0_12 = input_word_d[97];
    end else if (sel_d0_12[2:0] == 2) begin
        next_mux_d0_12 = input_word_d[98];
    end else if (sel_d0_12[2:0] == 3) begin
        next_mux_d0_12 = input_word_d[99];
    end else if (sel_d0_12[2:0] == 4) begin
        next_mux_d0_12 = input_word_d[100];
    end else if (sel_d0_12[2:0] == 5) begin
        next_mux_d0_12 = input_word_d[101];
    end else if (sel_d0_12[2:0] == 6) begin
        next_mux_d0_12 = input_word_d[102];
    end else begin
        next_mux_d0_12 = input_word_d[103];
    end

    if (sel_d0_13[2:0] == 0) begin
        next_mux_d0_13 = input_word_d[104];
    end else if (sel_d0_13[2:0] == 1) begin
        next_mux_d0_13 = input_word_d[105];
    end else if (sel_d0_13[2:0] == 2) begin
        next_mux_d0_13 = input_word_d[106];
    end else if (sel_d0_13[2:0] == 3) begin
        next_mux_d0_13 = input_word_d[107];
    end else if (sel_d0_13[2:0] == 4) begin
        next_mux_d0_13 = input_word_d[108];
    end else if (sel_d0_13[2:0] == 5) begin
        next_mux_d0_13 = input_word_d[109];
    end else if (sel_d0_13[2:0] == 6) begin
        next_mux_d0_13 = input_word_d[110];
    end else begin
        next_mux_d0_13 = input_word_d[111];
    end

    if (sel_d0_14[2:0] == 0) begin
        next_mux_d0_14 = input_word_d[112];
    end else if (sel_d0_14[2:0] == 1) begin
        next_mux_d0_14 = input_word_d[113];
    end else if (sel_d0_14[2:0] == 2) begin
        next_mux_d0_14 = input_word_d[114];
    end else if (sel_d0_14[2:0] == 3) begin
        next_mux_d0_14 = input_word_d[115];
    end else if (sel_d0_14[2:0] == 4) begin
        next_mux_d0_14 = input_word_d[116];
    end else if (sel_d0_14[2:0] == 5) begin
        next_mux_d0_14 = input_word_d[117];
    end else if (sel_d0_14[2:0] == 6) begin
        next_mux_d0_14 = input_word_d[118];
    end else begin
        next_mux_d0_14 = input_word_d[119];
    end

    if (sel_d0_15[2:0] == 0) begin
        next_mux_d0_15 = input_word_d[120];
    end else if (sel_d0_15[2:0] == 1) begin
        next_mux_d0_15 = input_word_d[121];
    end else if (sel_d0_15[2:0] == 2) begin
        next_mux_d0_15 = input_word_d[122];
    end else if (sel_d0_15[2:0] == 3) begin
        next_mux_d0_15 = input_word_d[123];
    end else if (sel_d0_15[2:0] == 4) begin
        next_mux_d0_15 = input_word_d[124];
    end else if (sel_d0_15[2:0] == 5) begin
        next_mux_d0_15 = input_word_d[125];
    end else if (sel_d0_15[2:0] == 6) begin
        next_mux_d0_15 = input_word_d[126];
    end else begin
        next_mux_d0_15 = input_word_d[127];
    end

    if (sel_d1_0[5:3] == 0) begin
        next_mux_d1_0 = mux_d0_0;
    end else if (sel_d1_0[5:3] == 1) begin
        next_mux_d1_0 = mux_d0_1;
    end else if (sel_d1_0[5:3] == 2) begin
        next_mux_d1_0 = mux_d0_2;
    end else if (sel_d1_0[5:3] == 3) begin
        next_mux_d1_0 = mux_d0_3;
    end else if (sel_d1_0[5:3] == 4) begin
        next_mux_d1_0 = mux_d0_4;
    end else if (sel_d1_0[5:3] == 5) begin
        next_mux_d1_0 = mux_d0_5;
    end else if (sel_d1_0[5:3] == 6) begin
        next_mux_d1_0 = mux_d0_6;
    end else begin
        next_mux_d1_0 = mux_d0_7;
    end

    if (sel_d1_1[5:3] == 0) begin
        next_mux_d1_1 = mux_d0_8;
    end else if (sel_d1_1[5:3] == 1) begin
        next_mux_d1_1 = mux_d0_9;
    end else if (sel_d1_1[5:3] == 2) begin
        next_mux_d1_1 = mux_d0_10;
    end else if (sel_d1_1[5:3] == 3) begin
        next_mux_d1_1 = mux_d0_11;
    end else if (sel_d1_1[5:3] == 4) begin
        next_mux_d1_1 = mux_d0_12;
    end else if (sel_d1_1[5:3] == 5) begin
        next_mux_d1_1 = mux_d0_13;
    end else if (sel_d1_1[5:3] == 6) begin
        next_mux_d1_1 = mux_d0_14;
    end else begin
        next_mux_d1_1 = mux_d0_15;
    end

    if (sel_d2_0[6:6] == 0) begin
        next_mux_d2_0 = mux_d1_0;
    end else begin
        next_mux_d2_0 = mux_d1_1;
    end

end

endmodule
