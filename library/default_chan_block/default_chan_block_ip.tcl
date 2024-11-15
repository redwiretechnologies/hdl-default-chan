# SPDX-License-Identifier: Apache-2.0

# ip

if {$argc < 1} {
    puts "Project directory must be specified"
    exit 1
}

set AD_LIB_DIR [lindex $argv 0]
set script_dir [ file dirname [ file normalize [ info script ] ] ]

puts $script_dir

source $AD_LIB_DIR/scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip_xilinx.tcl

set src_files [list \
  "$ad_hdl_dir/library/common/up_axi.v" \
  "$ad_hdl_dir/library/common/ad_iqcor.v" \
  "$ad_hdl_dir/library/xilinx/common/ad_mul.v" \
  "$ad_hdl_dir/library/common/ad_mem.v" \
  "$ad_hdl_dir/library/common/ad_mem_asym.v" \
  "$ad_hdl_dir/library/util_cdc/sync_bits.v" \
  "$ad_hdl_dir/library/util_cdc/sync_event.v" \
  "$ad_hdl_dir/library/util_cdc/sync_gray.v" \
  "$ad_hdl_dir/library/util_axis_fifo/util_axis_fifo_address_generator.v" \
  "$ad_hdl_dir/library/util_axis_fifo/util_axis_fifo.v" \
  "$script_dir/../cic_filter/src/cic_filter.v" \
  "$ad_hdl_dir/library/axi_adc_decimate/axi_adc_decimate_filter.v" \
  "$ad_hdl_dir/library/axi_adc_decimate/cic_decim.v" \
  "$ad_hdl_dir/library/axi_adc_decimate/fir_decim.v" \
  "$ad_hdl_dir/library/util_cic/cic_int.v" \
  "$ad_hdl_dir/library/util_cic/cic_comb.v" \
  "$script_dir/../common/rwt_common_adc_if.v" \
  "$script_dir/../common/rwt_common_dac_if.v" \
  "$script_dir/../common/rwt_common_regs.v" \
  "$script_dir/../common/rwt_tag_extract.v" \
  "$script_dir/../common/rwt_tag_insert.v" \
  "$script_dir/../common/rwt_tag_insert_escape.v" \
  "$script_dir/../common/rwt_sample_pack.v" \
  "$script_dir/../common/rwt_sample_unpack.v" \
  "$script_dir/../common/sample_clk.v" \
  "$script_dir/../common/sync_up_bus.v" \
  "$script_dir/../common/axis_flipflop.v" \
  "$script_dir/../common/rwt_tag_insert_mux.v" \
  "$script_dir/../common/rwt_tag_types.vh" \
  "$script_dir/../common/chan_tag_types.vh" \
  "$script_dir/src/default_chan_block_regs.v" \
  "$script_dir/src/default_chan_block_user.v" \
  "$script_dir/src/default_chan_block_adc.v" \
  "$script_dir/src/default_chan_block_dac.v" \
  "$script_dir/src/default_chan_block_dac_hold.v" \
  "$script_dir/default_chan_block_constr.xdc" \
  "$script_dir/src/default_chan_block.v" \
  "$script_dir/../channelizer_m/src/axi_fifo_18.v" \
  "$script_dir/../channelizer_m/src/axi_fifo_19.v" \
  "$script_dir/../channelizer_m/src/axi_fifo_2.v" \
  "$script_dir/../channelizer_m/src/axi_fifo_3.v" \
  "$script_dir/../channelizer_m/src/axi_fifo_51.v" \
  "$script_dir/../channelizer_m/src/axi_fifo_64.v" \
  "$script_dir/../channelizer_m/src/channelizer_m.v" \
  "$script_dir/../channelizer_m/src/chan_top_128M_16iw_16ow_32tps.v" \
  "$script_dir/../channelizer_m/src/cic_M256_N1_R1_iw5_0_correction_sp_rom.v" \
  "$script_dir/../channelizer_m/src/cic_M256_N1_R1_iw5_0_offset_sp_rom.v" \
  "$script_dir/../channelizer_m/src/cic_M256_N1_R1_iw5_0.v" \
  "$script_dir/../channelizer_m/src/comb_M256_N1_iw5_0.v" \
  "$script_dir/../channelizer_m/src/count_cycle_cw16_18.v" \
  "$script_dir/../channelizer_m/src/count_cycle_cw16_65.v" \
  "$script_dir/../channelizer_m/src/count_cycle_cw16_8.v" \
  "$script_dir/../channelizer_m/src/downselect_128.v" \
  "$script_dir/../channelizer_m/src/dp_block_read_first_ram.v" \
  "$script_dir/../channelizer_m/src/dp_block_write_first_ram.v" \
  "$script_dir/../channelizer_m/src/dsp48_cic_M256_N1_R1_iw5_0_corr.v" \
  "$script_dir/../channelizer_m/src/dsp48_cic_M256_N1_R1_iw5_0.v" \
  "$script_dir/../channelizer_m/src/dsp48_comb_M256_N1_iw5_0.v" \
  "$script_dir/../channelizer_m/src/dsp48_pfb_mac_0.v" \
  "$script_dir/../channelizer_m/src/dsp48_pfb_mac.v" \
  "$script_dir/../channelizer_m/src/dsp48_pfb_rnd.v" \
  "$script_dir/../channelizer_m/src/exp_shifter_128Mmax_16iw_256avg_len.v" \
  "$script_dir/../channelizer_m/src/input_buffer_1x.v" \
  "$script_dir/../channelizer_m/src/mem_ctrl_pfb_128Mmax_16iw_16ow_32tps.v" \
  "$script_dir/../channelizer_m/src/pfb_128Mmax_16iw_16ow_32tps_dp_rom.v" \
  "$script_dir/../channelizer_m/src/pfb_128Mmax_16iw_16ow_32tps.v" \
  "$script_dir/../channelizer_m/src/pipe_mux_128_1.v" \
  "$script_dir/../channelizer_m/src/slicer_48_13.v" \
  "$script_dir/../channelizer_m/ip/downselect_mask_reload_fifo/downselect_mask_reload_fifo.xci" \
  "$script_dir/../channelizer_m/ip/xfft_128/xfft_128.xci" \
  "$script_dir/../channelizer_m/ip/coefficient_reload_fifo/coefficient_reload_fifo.xci" \
  ]

set sim_files [list \
  "$script_dir/../sim/rwt_adc_lib.sv" \
  "$script_dir/../sim/rwt_axi4lite_lib.sv" \
  "$script_dir/../sim/rwt_axis.sv" \
  "$script_dir/../sim/rwt_axis_tag_pkt.sv" \
  "$script_dir/../sim/rwt_dac_lib.sv" \
  "$script_dir/../sim/rwt_parse_utils.sv" \
  "$script_dir/../sim/rwt.sv" \
  "$script_dir/../sim/rwt_up_lib.sv" \
  "$script_dir/../sim/rwt_lib_tb.sv" \
  "$script_dir/../common/sim/rwt_tag_extract_tb.sv" \
  "$script_dir/../common/sim/rwt_tag_insert_tb.sv" \
  "$script_dir/../common/sim/rwt_sample_pack_tb.sv" \
  "$script_dir/../common/sim/rwt_sample_unpack_tb.sv"]

adi_ip_create default_chan_block
adi_ip_files default_chan_block $src_files
add_files -norecurse -scan_for_includes -fileset [get_filesets sim_1] $sim_files

adi_ip_properties default_chan_block

set_property vendor redwiretechnologies.com [ipx::current_core]
set_property library user [ipx::current_core]
set_property taxonomy /RWT [ipx::current_core]
set_property vendor_display_name {RWT} [ipx::current_core]
set_property company_url {http://www.redwiretechnologies.com} [ipx::current_core]

adi_add_bus "s_dac_dma" "slave" \
	"xilinx.com:interface:axis_rtl:1.0" \
	"xilinx.com:interface:axis:1.0" \
	[list {"s_dac_dma_ready" "TREADY"} \
	  {"s_dac_dma_valid" "TVALID"} \
	  {"s_dac_dma_data" "TDATA"} \
	  {"s_dac_dma_last" "TLAST"} ]
adi_add_bus_clock "s_dac_dma_aclk" "s_dac_dma"

adi_add_bus "m_adc_dma" "master" \
	"xilinx.com:interface:axis_rtl:1.0" \
	"xilinx.com:interface:axis:1.0" \
	[list {"m_adc_dma_ready" "TREADY"} \
	  {"m_adc_dma_valid" "TVALID"} \
	  {"m_adc_dma_data" "TDATA"} \
      {"m_adc_dma_user" "TUSER"} \
	  {"m_adc_dma_last" "TLAST"} ]
adi_add_bus_clock "m_adc_dma_aclk" "m_adc_dma"

ipx::add_bus_parameter ASSOCIATED_BUSIF [ipx::get_bus_interfaces s_axi_aclk \
                                             -of_objects [ipx::current_core]]
set_property value s_axi [ipx::get_bus_parameters ASSOCIATED_BUSIF \
                              -of_objects [ipx::get_bus_interfaces s_axi_aclk \
                                               -of_objects [ipx::current_core]]]

ipx::infer_bus_interface adc_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface adc_rstn xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface dac_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface dac_rstn xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]

ipx::save_core [ipx::current_core]
