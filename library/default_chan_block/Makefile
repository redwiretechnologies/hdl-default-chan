# SPDX-License-Identifier: Apache-2.0

LIB_NAME = default_chan_block

M_DEPS = \
  ../cic_filter/src/cic_filter.v \
  $(ADI_LIB_DIR)/axi_adc_decimate/axi_adc_decimate_filter.v \
  src/default_chan_block.v \
  src/default_chan_block_user.v \
  src/default_chan_block_adc.v \
  src/default_chan_block_dac.v \
  src/default_chan_block_dac_hold.v \
  src/default_chan_block_regs.v \
  default_chan_block_constr.xdc \
  default_chan_block_ip.tcl \
  ../common/rwt_common_adc_if.v \
  ../common/rwt_common_dac_if.v \
  ../common/rwt_common_regs.v \
  ../common/rwt_tag_extract.v \
  ../common/rwt_tag_insert.v \
  ../common/rwt_tag_insert_escape.v \
  ../common/rwt_sample_pack.v \
  ../common/sample_clk.v \
  ../common/rwt_tag_insert_mux.v \
  ../common/sim/rwt_tag_insert_tb.sv \
  ../common/sim/rwt_tag_extract_tb.sv \
  ../common/sim/rwt_sample_pack_tb.sv \
  ../sim/rwt_adc_lib.sv \
  ../sim/rwt_axi4lite_lib.sv \
  ../sim/rwt_axis.sv \
  ../sim/rwt_axis_tag_pkt.sv \
  ../sim/rwt_dac_lib.sv \
  ../sim/rwt_lib_tb.sv \
  ../sim/rwt_parse_utils.sv \
  ../sim/rwt.sv \
  ../sim/rwt_up_lib.sv \
  ../channelizer_m/src/axi_fifo_18.v \
  ../channelizer_m/src/axi_fifo_19.v \
  ../channelizer_m/src/axi_fifo_2.v \
  ../channelizer_m/src/axi_fifo_3.v \
  ../channelizer_m/src/axi_fifo_51.v \
  ../channelizer_m/src/axi_fifo_64.v \
  ../channelizer_m/src/channelizer_m.v \
  ../channelizer_m/src/chan_top_128M_16iw_16ow_32tps.v \
  ../channelizer_m/src/cic_M256_N1_R1_iw5_0_correction_sp_rom.v \
  ../channelizer_m/src/cic_M256_N1_R1_iw5_0_offset_sp_rom.v \
  ../channelizer_m/src/cic_M256_N1_R1_iw5_0.v \
  ../channelizer_m/src/comb_M256_N1_iw5_0.v \
  ../channelizer_m/src/count_cycle_cw16_18.v \
  ../channelizer_m/src/count_cycle_cw16_65.v \
  ../channelizer_m/src/count_cycle_cw16_8.v \
  ../channelizer_m/src/downselect_128.v \
  ../channelizer_m/src/dp_block_read_first_ram.v \
  ../channelizer_m/src/dp_block_write_first_ram.v \
  ../channelizer_m/src/dsp48_cic_M256_N1_R1_iw5_0_corr.v \
  ../channelizer_m/src/dsp48_cic_M256_N1_R1_iw5_0.v \
  ../channelizer_m/src/dsp48_comb_M256_N1_iw5_0.v \
  ../channelizer_m/src/dsp48_pfb_mac_0.v \
  ../channelizer_m/src/dsp48_pfb_mac.v \
  ../channelizer_m/src/dsp48_pfb_rnd.v \
  ../channelizer_m/src/exp_shifter_128Mmax_16iw_256avg_len.v \
  ../channelizer_m/src/input_buffer_1x.v \
  ../channelizer_m/src/mem_ctrl_pfb_128Mmax_16iw_16ow_32tps.v \
  ../channelizer_m/src/pfb_128Mmax_16iw_16ow_32tps_dp_rom.v \
  ../channelizer_m/src/pfb_128Mmax_16iw_16ow_32tps.v \
  ../channelizer_m/src/pipe_mux_128_1.v \
  ../channelizer_m/src/slicer_48_13.v \
  ../channelizer_m/ip/downselect_mask_reload_fifo/downselect_mask_reload_fifo.xci \
  ../channelizer_m/ip/xfft_128/xfft_128.xci \
  ../channelizer_m/ip/coefficient_reload_fifo/coefficient_reload_fifo.xci

include ../scripts/library.mk
