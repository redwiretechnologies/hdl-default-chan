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
  "$script_dir/src/axi_fifo_18.v" \
  "$script_dir/src/axi_fifo_19.v" \
  "$script_dir/src/axi_fifo_2.v" \
  "$script_dir/src/axi_fifo_3.v" \
  "$script_dir/src/axi_fifo_51.v" \
  "$script_dir/src/axi_fifo_64.v" \
  "$script_dir/src/channelizer_m.v" \
  "$script_dir/src/chan_top_128M_16iw_16ow_32tps.v" \
  "$script_dir/src/cic_M256_N1_R1_iw5_0_correction_sp_rom.v" \
  "$script_dir/src/cic_M256_N1_R1_iw5_0_offset_sp_rom.v" \
  "$script_dir/src/cic_M256_N1_R1_iw5_0.v" \
  "$script_dir/src/comb_M256_N1_iw5_0.v" \
  "$script_dir/src/count_cycle_cw16_18.v" \
  "$script_dir/src/count_cycle_cw16_65.v" \
  "$script_dir/src/count_cycle_cw16_8.v" \
  "$script_dir/src/downselect_128.v" \
  "$script_dir/src/dp_block_read_first_ram.v" \
  "$script_dir/src/dp_block_write_first_ram.v" \
  "$script_dir/src/dsp48_cic_M256_N1_R1_iw5_0_corr.v" \
  "$script_dir/src/dsp48_cic_M256_N1_R1_iw5_0.v" \
  "$script_dir/src/dsp48_comb_M256_N1_iw5_0.v" \
  "$script_dir/src/dsp48_pfb_mac_0.v" \
  "$script_dir/src/dsp48_pfb_mac.v" \
  "$script_dir/src/dsp48_pfb_rnd.v" \
  "$script_dir/src/exp_shifter_128Mmax_16iw_256avg_len.v" \
  "$script_dir/src/input_buffer_1x.v" \
  "$script_dir/src/mem_ctrl_pfb_128Mmax_16iw_16ow_32tps.v" \
  "$script_dir/src/pfb_128Mmax_16iw_16ow_32tps_dp_rom.v" \
  "$script_dir/src/pfb_128Mmax_16iw_16ow_32tps.v" \
  "$script_dir/src/pipe_mux_128_1.v" \
  "$script_dir/src/slicer_48_13.v" \
  "$script_dir/ip/downselect_mask_reload_fifo/downselect_mask_reload_fifo.xci" \
  "$script_dir/ip/xfft_128/xfft_128.xci" \
  "$script_dir/ip/coefficient_reload_fifo/coefficient_reload_fifo.xci" \
  ]
set sim_files [list \
  "$script_dir/sim/chan_top_128M_16iw_16ow_32tps_tb.v" \
  "$script_dir/sim/channelizer_m_tb.v" \
  "$script_dir/sim/chan_sim.vh" \
  "$script_dir/sim/grc_word_reader.sv" \
  "$script_dir/sim/grc_word_reader2.sv" \
  "$script_dir/sim/grc_word_writer.sv" \
  "$script_dir/sim/downselect_sim.sv" \
  ]

adi_ip_create channelizer_m
adi_ip_files channelizer_m $src_files
add_files -norecurse -scan_for_includes -fileset [get_filesets sim_1] $sim_files

adi_ip_properties_lite channelizer_m

set_property vendor redwiretechnology.com [ipx::current_core]
set_property library user [ipx::current_core]
set_property taxonomy /RWT [ipx::current_core]
set_property vendor_display_name {RWT} [ipx::current_core]
set_property company_url {http://www.redwiretechnology.com} [ipx::current_core]

ipx::infer_bus_interface clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]

ipx::save_core [ipx::current_core]
