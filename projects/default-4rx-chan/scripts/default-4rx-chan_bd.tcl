# SPDX-License-Identifier: Apache-2.0

create_bd_port -dir I pps

create_bd_port -dir I ref_clk

### Transceiver 0

create_bd_port -dir I tx_output_enable_0

create_bd_port -dir I mssi_sync_0

# adrv9001 interface
create_bd_port -dir I rx1_dclk_in_0_n
create_bd_port -dir I rx1_dclk_in_0_p
create_bd_port -dir I rx1_idata_in_0_n
create_bd_port -dir I rx1_idata_in_0_p
create_bd_port -dir I rx1_qdata_in_0_n
create_bd_port -dir I rx1_qdata_in_0_p
create_bd_port -dir I rx1_strobe_in_0_n
create_bd_port -dir I rx1_strobe_in_0_p

create_bd_port -dir I rx2_dclk_in_0_n
create_bd_port -dir I rx2_dclk_in_0_p
create_bd_port -dir I rx2_idata_in_0_n
create_bd_port -dir I rx2_idata_in_0_p
create_bd_port -dir I rx2_qdata_in_0_n
create_bd_port -dir I rx2_qdata_in_0_p
create_bd_port -dir I rx2_strobe_in_0_n
create_bd_port -dir I rx2_strobe_in_0_p

create_bd_port -dir O tx1_dclk_out_0_n
create_bd_port -dir O tx1_dclk_out_0_p
create_bd_port -dir I tx1_dclk_in_0_n
create_bd_port -dir I tx1_dclk_in_0_p
create_bd_port -dir O tx1_idata_out_0_n
create_bd_port -dir O tx1_idata_out_0_p
create_bd_port -dir O tx1_qdata_out_0_n
create_bd_port -dir O tx1_qdata_out_0_p
create_bd_port -dir O tx1_strobe_out_0_n
create_bd_port -dir O tx1_strobe_out_0_p

create_bd_port -dir O tx2_dclk_out_0_n
create_bd_port -dir O tx2_dclk_out_0_p
create_bd_port -dir I tx2_dclk_in_0_n
create_bd_port -dir I tx2_dclk_in_0_p
create_bd_port -dir O tx2_idata_out_0_n
create_bd_port -dir O tx2_idata_out_0_p
create_bd_port -dir O tx2_qdata_out_0_n
create_bd_port -dir O tx2_qdata_out_0_p
create_bd_port -dir O tx2_strobe_out_0_n
create_bd_port -dir O tx2_strobe_out_0_p

create_bd_port -dir O rx1_enable_0
create_bd_port -dir O rx2_enable_0
create_bd_port -dir O tx1_enable_0
create_bd_port -dir O tx2_enable_0

create_bd_port -dir I gpio_rx1_enable_in_0
create_bd_port -dir I gpio_rx2_enable_in_0
create_bd_port -dir I gpio_tx1_enable_in_0
create_bd_port -dir I gpio_tx2_enable_in_0

create_bd_port -dir I tdd_sync_0
create_bd_port -dir O tdd_sync_cntr_0

### Transceiver 1

create_bd_port -dir I tx_output_enable_1

create_bd_port -dir I mssi_sync_1

# adrv9001 interface
create_bd_port -dir I rx1_dclk_in_1_n
create_bd_port -dir I rx1_dclk_in_1_p
create_bd_port -dir I rx1_idata_in_1_n
create_bd_port -dir I rx1_idata_in_1_p
create_bd_port -dir I rx1_qdata_in_1_n
create_bd_port -dir I rx1_qdata_in_1_p
create_bd_port -dir I rx1_strobe_in_1_n
create_bd_port -dir I rx1_strobe_in_1_p

create_bd_port -dir I rx2_dclk_in_1_n
create_bd_port -dir I rx2_dclk_in_1_p
create_bd_port -dir I rx2_idata_in_1_n
create_bd_port -dir I rx2_idata_in_1_p
create_bd_port -dir I rx2_qdata_in_1_n
create_bd_port -dir I rx2_qdata_in_1_p
create_bd_port -dir I rx2_strobe_in_1_n
create_bd_port -dir I rx2_strobe_in_1_p

create_bd_port -dir O tx1_dclk_out_1_n
create_bd_port -dir O tx1_dclk_out_1_p
create_bd_port -dir I tx1_dclk_in_1_n
create_bd_port -dir I tx1_dclk_in_1_p
create_bd_port -dir O tx1_idata_out_1_n
create_bd_port -dir O tx1_idata_out_1_p
create_bd_port -dir O tx1_qdata_out_1_n
create_bd_port -dir O tx1_qdata_out_1_p
create_bd_port -dir O tx1_strobe_out_1_n
create_bd_port -dir O tx1_strobe_out_1_p

create_bd_port -dir O tx2_dclk_out_1_n
create_bd_port -dir O tx2_dclk_out_1_p
create_bd_port -dir I tx2_dclk_in_1_n
create_bd_port -dir I tx2_dclk_in_1_p
create_bd_port -dir O tx2_idata_out_1_n
create_bd_port -dir O tx2_idata_out_1_p
create_bd_port -dir O tx2_qdata_out_1_n
create_bd_port -dir O tx2_qdata_out_1_p
create_bd_port -dir O tx2_strobe_out_1_n
create_bd_port -dir O tx2_strobe_out_1_p

create_bd_port -dir O rx1_enable_1
create_bd_port -dir O rx2_enable_1
create_bd_port -dir O tx1_enable_1
create_bd_port -dir O tx2_enable_1

create_bd_port -dir I gpio_rx1_enable_in_1
create_bd_port -dir I gpio_rx2_enable_in_1
create_bd_port -dir I gpio_tx1_enable_in_1
create_bd_port -dir I gpio_tx2_enable_in_1

create_bd_port -dir I tdd_sync_1
create_bd_port -dir O tdd_sync_cntr_1

create_bd_port -dir I send_count
create_bd_port -dir I reset_count

### Transceiver 0

# Create Blocks

# adrv9001

ad_ip_instance axi_adrv9001 axi_adrv9001_0
ad_ip_parameter axi_adrv9001_0 CONFIG.CMOS_LVDS_N 0
ad_ip_parameter axi_adrv9001_0 CONFIG.USE_RX_CLK_FOR_TX1 1
ad_ip_parameter axi_adrv9001_0 CONFIG.USE_RX_CLK_FOR_TX2 2
ad_ip_parameter axi_adrv9001_0 CONFIG.IO_DELAY_GROUP dev_if_delay_group_0
ad_ip_parameter axi_adrv9001_0 CONFIG.RX_USE_BUFG 1
ad_ip_parameter axi_adrv9001_0 CONFIG.TX_USE_BUFG 1

ad_ip_instance proc_sys_reset adc_clk_reset_0
ad_ip_instance proc_sys_reset adc_clk_reset_1

ad_ip_instance concat_9002 concat_9002_0
ad_ip_instance concat_9002 concat_9002_1

ad_ip_instance data_order data_order_0
ad_ip_instance data_order data_order_1

create_bd_cell -type inline_hdl -vlnv xilinx.com:inline_hdl:ilvector_logic:1.0 reset_invert_0
set_property -dict [list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}] [get_bd_cells reset_invert_0]

create_bd_cell -type inline_hdl -vlnv xilinx.com:inline_hdl:ilvector_logic:1.0 reset_invert_1
set_property -dict [list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}] [get_bd_cells reset_invert_1]

ad_ip_instance  default_chan_block   default_chan_block_0
ad_ip_parameter default_chan_block_0 CONFIG.CLK_FREQ 100000000
ad_ip_parameter default_chan_block_0 CONFIG.CIC_ENABLE 0

ad_ip_instance  default_chan_block   default_chan_block_1
ad_ip_parameter default_chan_block_1 CONFIG.CLK_FREQ 100000000
ad_ip_parameter default_chan_block_1 CONFIG.CIC_ENABLE 0

# dma for rx1

ad_ip_instance axi_dmac axi_adrv9001_rx1_dma_0
ad_ip_parameter axi_adrv9001_rx1_dma_0 CONFIG.DMA_TYPE_SRC 1
ad_ip_parameter axi_adrv9001_rx1_dma_0 CONFIG.DMA_TYPE_DEST 0
ad_ip_parameter axi_adrv9001_rx1_dma_0 CONFIG.CYCLIC 0
ad_ip_parameter axi_adrv9001_rx1_dma_0 CONFIG.SYNC_TRANSFER_START 1
ad_ip_parameter axi_adrv9001_rx1_dma_0 CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_adrv9001_rx1_dma_0 CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_adrv9001_rx1_dma_0 CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_adrv9001_rx1_dma_0 CONFIG.DMA_DATA_WIDTH_SRC 64
ad_ip_parameter axi_adrv9001_rx1_dma_0 CONFIG.CACHE_COHERENT 1

# dma for rx2

ad_ip_instance axi_dmac axi_adrv9001_rx2_dma_0
ad_ip_parameter axi_adrv9001_rx2_dma_0 CONFIG.DMA_TYPE_SRC 1
ad_ip_parameter axi_adrv9001_rx2_dma_0 CONFIG.DMA_TYPE_DEST 0
ad_ip_parameter axi_adrv9001_rx2_dma_0 CONFIG.CYCLIC 0
ad_ip_parameter axi_adrv9001_rx2_dma_0 CONFIG.SYNC_TRANSFER_START 1
ad_ip_parameter axi_adrv9001_rx2_dma_0 CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_adrv9001_rx2_dma_0 CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_adrv9001_rx2_dma_0 CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_adrv9001_rx2_dma_0 CONFIG.DMA_DATA_WIDTH_SRC 32
ad_ip_parameter axi_adrv9001_rx2_dma_0 CONFIG.CACHE_COHERENT 1

# dma for tx1

ad_ip_instance axi_dmac axi_adrv9001_tx1_dma_0
ad_ip_parameter axi_adrv9001_tx1_dma_0 CONFIG.DMA_TYPE_SRC 0
ad_ip_parameter axi_adrv9001_tx1_dma_0 CONFIG.DMA_TYPE_DEST 1
ad_ip_parameter axi_adrv9001_tx1_dma_0 CONFIG.CYCLIC 1
ad_ip_parameter axi_adrv9001_tx1_dma_0 CONFIG.SYNC_TRANSFER_START 0
ad_ip_parameter axi_adrv9001_tx1_dma_0 CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_adrv9001_tx1_dma_0 CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_adrv9001_tx1_dma_0 CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_adrv9001_tx1_dma_0 CONFIG.DMA_DATA_WIDTH_DEST 64
ad_ip_parameter axi_adrv9001_tx1_dma_0 CONFIG.CACHE_COHERENT 1

# dma for tx2

ad_ip_instance axi_dmac axi_adrv9001_tx2_dma_0
ad_ip_parameter axi_adrv9001_tx2_dma_0 CONFIG.DMA_TYPE_SRC 0
ad_ip_parameter axi_adrv9001_tx2_dma_0 CONFIG.DMA_TYPE_DEST 1
ad_ip_parameter axi_adrv9001_tx2_dma_0 CONFIG.CYCLIC 1
ad_ip_parameter axi_adrv9001_tx2_dma_0 CONFIG.SYNC_TRANSFER_START 0
ad_ip_parameter axi_adrv9001_tx2_dma_0 CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_adrv9001_tx2_dma_0 CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_adrv9001_tx2_dma_0 CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_adrv9001_tx2_dma_0 CONFIG.DMA_DATA_WIDTH_DEST 32
ad_ip_parameter axi_adrv9001_tx2_dma_0 CONFIG.CACHE_COHERENT 1

# ad9001 connections

ad_connect  sys_500m_clk       axi_adrv9001_0/delay_clk

#### STILL UNDER REVIEW
#ad_connect  axi_adrv9001_0/adc_1_clk axi_adrv9001_rx1_dma_0/fifo_wr_clk
#ad_connect  axi_adrv9001_0/adc_2_clk axi_adrv9001_rx2_dma_0/fifo_wr_clk
#ad_connect  axi_adrv9001_0/dac_1_clk axi_adrv9001_tx1_dma_0/m_axis_aclk
#ad_connect  axi_adrv9001_0/dac_2_clk axi_adrv9001_tx2_dma_0/m_axis_aclk
####

ad_connect ref_clk           axi_adrv9001_0/ref_clk

ad_connect tx_output_enable_0  axi_adrv9001_0/tx_output_enable

ad_connect mssi_sync_0         axi_adrv9001_0/mssi_sync_in

ad_connect rx1_dclk_in_0_n     axi_adrv9001_0/rx1_dclk_in_n_NC
ad_connect rx1_dclk_in_0_p     axi_adrv9001_0/rx1_dclk_in_p_dclk_in
ad_connect rx1_idata_in_0_n    axi_adrv9001_0/rx1_idata_in_n_idata0
ad_connect rx1_idata_in_0_p    axi_adrv9001_0/rx1_idata_in_p_idata1
ad_connect rx1_qdata_in_0_n    axi_adrv9001_0/rx1_qdata_in_n_qdata2
ad_connect rx1_qdata_in_0_p    axi_adrv9001_0/rx1_qdata_in_p_qdata3
ad_connect rx1_strobe_in_0_n   axi_adrv9001_0/rx1_strobe_in_n_NC
ad_connect rx1_strobe_in_0_p   axi_adrv9001_0/rx1_strobe_in_p_strobe_in

ad_connect rx2_dclk_in_0_n     axi_adrv9001_0/rx2_dclk_in_n_NC
ad_connect rx2_dclk_in_0_p     axi_adrv9001_0/rx2_dclk_in_p_dclk_in
ad_connect rx2_idata_in_0_n    axi_adrv9001_0/rx2_idata_in_n_idata0
ad_connect rx2_idata_in_0_p    axi_adrv9001_0/rx2_idata_in_p_idata1
ad_connect rx2_qdata_in_0_n    axi_adrv9001_0/rx2_qdata_in_n_qdata2
ad_connect rx2_qdata_in_0_p    axi_adrv9001_0/rx2_qdata_in_p_qdata3
ad_connect rx2_strobe_in_0_n   axi_adrv9001_0/rx2_strobe_in_n_NC
ad_connect rx2_strobe_in_0_p   axi_adrv9001_0/rx2_strobe_in_p_strobe_in

ad_connect tx1_dclk_out_0_n    axi_adrv9001_0/tx1_dclk_out_n_NC
ad_connect tx1_dclk_out_0_p    axi_adrv9001_0/tx1_dclk_out_p_dclk_out
ad_connect tx1_dclk_in_0_n     axi_adrv9001_0/tx1_dclk_in_n_NC
ad_connect tx1_dclk_in_0_p     axi_adrv9001_0/tx1_dclk_in_p_dclk_in
ad_connect tx1_idata_out_0_n   axi_adrv9001_0/tx1_idata_out_n_idata0
ad_connect tx1_idata_out_0_p   axi_adrv9001_0/tx1_idata_out_p_idata1
ad_connect tx1_qdata_out_0_n   axi_adrv9001_0/tx1_qdata_out_n_qdata2
ad_connect tx1_qdata_out_0_p   axi_adrv9001_0/tx1_qdata_out_p_qdata3
ad_connect tx1_strobe_out_0_n  axi_adrv9001_0/tx1_strobe_out_n_NC
ad_connect tx1_strobe_out_0_p  axi_adrv9001_0/tx1_strobe_out_p_strobe_out

ad_connect tx2_dclk_out_0_n    axi_adrv9001_0/tx2_dclk_out_n_NC
ad_connect tx2_dclk_out_0_p    axi_adrv9001_0/tx2_dclk_out_p_dclk_out
ad_connect tx2_dclk_in_0_n     axi_adrv9001_0/tx2_dclk_in_n_NC
ad_connect tx2_dclk_in_0_p     axi_adrv9001_0/tx2_dclk_in_p_dclk_in
ad_connect tx2_idata_out_0_n   axi_adrv9001_0/tx2_idata_out_n_idata0
ad_connect tx2_idata_out_0_p   axi_adrv9001_0/tx2_idata_out_p_idata1
ad_connect tx2_qdata_out_0_n   axi_adrv9001_0/tx2_qdata_out_n_qdata2
ad_connect tx2_qdata_out_0_p   axi_adrv9001_0/tx2_qdata_out_p_qdata3
ad_connect tx2_strobe_out_0_n  axi_adrv9001_0/tx2_strobe_out_n_NC
ad_connect tx2_strobe_out_0_p  axi_adrv9001_0/tx2_strobe_out_p_strobe_out

ad_connect rx1_enable_0        axi_adrv9001_0/rx1_enable
ad_connect rx2_enable_0        axi_adrv9001_0/rx2_enable
ad_connect tx1_enable_0        axi_adrv9001_0/tx1_enable
ad_connect tx2_enable_0        axi_adrv9001_0/tx2_enable

ad_connect gpio_rx1_enable_in_0  axi_adrv9001_0/gpio_rx1_enable_in
ad_connect gpio_rx2_enable_in_0  axi_adrv9001_0/gpio_rx2_enable_in
ad_connect gpio_tx1_enable_in_0  axi_adrv9001_0/gpio_tx1_enable_in
ad_connect gpio_tx2_enable_in_0  axi_adrv9001_0/gpio_tx2_enable_in

ad_connect tdd_sync_0 axi_adrv9001_0/tdd_sync
ad_connect tdd_sync_cntr_0 axi_adrv9001_0/tdd_sync_cntr

# adc clk resets
ad_connect sys_cpu_resetn adc_clk_reset_0/ext_reset_in
ad_connect sys_cpu_resetn adc_clk_reset_1/ext_reset_in
ad_connect axi_adrv9001_0/adc_1_clk adc_clk_reset_0/slowest_sync_clk
ad_connect axi_adrv9001_0/adc_2_clk adc_clk_reset_1/slowest_sync_clk

# ADRV9002 <-> concat_0
ad_connect axi_adrv9001_0/adc_1_enable_i0 concat_9002_0/adc_enable_i0
ad_connect axi_adrv9001_0/adc_1_valid_i0  concat_9002_0/adc_valid_i0
ad_connect axi_adrv9001_0/adc_1_data_i0   concat_9002_0/adc_data_i0
ad_connect axi_adrv9001_0/adc_1_enable_q0 concat_9002_0/adc_enable_q0
ad_connect axi_adrv9001_0/adc_1_valid_q0  concat_9002_0/adc_valid_q0
ad_connect axi_adrv9001_0/adc_1_data_q0   concat_9002_0/adc_data_q0
ad_connect axi_adrv9001_0/adc_1_enable_i1 concat_9002_0/adc_enable_i1
ad_connect axi_adrv9001_0/adc_1_valid_i1  concat_9002_0/adc_valid_i1
ad_connect axi_adrv9001_0/adc_1_data_i1   concat_9002_0/adc_data_i1
ad_connect axi_adrv9001_0/adc_1_enable_q1 concat_9002_0/adc_enable_q1
ad_connect axi_adrv9001_0/adc_1_valid_q1  concat_9002_0/adc_valid_q1
ad_connect axi_adrv9001_0/adc_1_data_q1   concat_9002_0/adc_data_q1

ad_connect axi_adrv9001_0/dac_1_enable_i0 concat_9002_0/dac_enable_i0
ad_connect axi_adrv9001_0/dac_1_valid_i0  concat_9002_0/dac_valid_i0
ad_connect axi_adrv9001_0/dac_1_enable_q0 concat_9002_0/dac_enable_q0
ad_connect axi_adrv9001_0/dac_1_valid_q0  concat_9002_0/dac_valid_q0
ad_connect axi_adrv9001_0/dac_1_enable_i1 concat_9002_0/dac_enable_i1
ad_connect axi_adrv9001_0/dac_1_valid_i1  concat_9002_0/dac_valid_i1
ad_connect axi_adrv9001_0/dac_1_enable_q1 concat_9002_0/dac_enable_q1
ad_connect axi_adrv9001_0/dac_1_valid_q1  concat_9002_0/dac_valid_q1

ad_connect concat_9002_0/dac_data_i0 axi_adrv9001_0/dac_1_data_i0
ad_connect concat_9002_0/dac_data_q0 axi_adrv9001_0/dac_1_data_q0
ad_connect concat_9002_0/dac_data_i1 axi_adrv9001_0/dac_1_data_i1
ad_connect concat_9002_0/dac_data_q1 axi_adrv9001_0/dac_1_data_q1

# ADRV9002 <-> concat_1
ad_connect axi_adrv9001_0/adc_2_enable_i0 concat_9002_1/adc_enable_i0
ad_connect axi_adrv9001_0/adc_2_valid_i0  concat_9002_1/adc_valid_i0
ad_connect axi_adrv9001_0/adc_2_data_i0   concat_9002_1/adc_data_i0
ad_connect axi_adrv9001_0/adc_2_enable_q0 concat_9002_1/adc_enable_q0
ad_connect axi_adrv9001_0/adc_2_valid_q0  concat_9002_1/adc_valid_q0
ad_connect axi_adrv9001_0/adc_2_data_q0   concat_9002_1/adc_data_q0
ad_connect GND                            concat_9002_1/adc_enable_i1
ad_connect GND                            concat_9002_1/adc_valid_i1
ad_connect GND                            concat_9002_1/adc_data_i1
ad_connect GND                            concat_9002_1/adc_enable_q1
ad_connect GND                            concat_9002_1/adc_valid_q1
ad_connect GND                            concat_9002_1/adc_data_q1

ad_connect axi_adrv9001_0/dac_2_enable_i0 concat_9002_1/dac_enable_i0
ad_connect axi_adrv9001_0/dac_2_valid_i0  concat_9002_1/dac_valid_i0
ad_connect axi_adrv9001_0/dac_2_enable_q0 concat_9002_1/dac_enable_q0
ad_connect axi_adrv9001_0/dac_2_valid_q0  concat_9002_1/dac_valid_q0

ad_connect concat_9002_1/dac_data_i0 axi_adrv9001_0/dac_2_data_i0
ad_connect concat_9002_1/dac_data_q0 axi_adrv9001_0/dac_2_data_q0

# default_chan_block_0 -> ADRV9002
ad_connect default_chan_block_0/adc_overflow  axi_adrv9001_0/adc_1_dovf
ad_connect default_chan_block_0/dac_underflow axi_adrv9001_0/dac_1_dunf

# default_chan_block_1 -> ADRV9002
ad_connect default_chan_block_1/adc_overflow  axi_adrv9001_0/adc_2_dovf
ad_connect default_chan_block_1/dac_underflow axi_adrv9001_0/dac_2_dunf

# data_order_0
ad_connect axi_adrv9001_0/adc_1_rst reset_invert_0/Op1
ad_connect reset_invert_0/Res       data_order_0/adc_rstn
ad_connect send_count               data_order_0/send_count
ad_connect reset_count              data_order_0/reset_count

# data_order_1
ad_connect axi_adrv9001_0/adc_2_rst reset_invert_1/Op1
ad_connect reset_invert_1/Res       data_order_1/adc_rstn
ad_connect send_count               data_order_1/send_count
ad_connect reset_count              data_order_1/reset_count

# default_chan_block_0 <-> concat_0
ad_connect concat_9002_0/adc_data   data_order_0/adc_data_in
ad_connect concat_9002_0/adc_enable data_order_0/adc_enable_in
ad_connect concat_9002_0/adc_valid  data_order_0/adc_valid_in

ad_connect data_order_0/adc_data_out   default_chan_block_0/adc_data
ad_connect data_order_0/adc_enable_out default_chan_block_0/adc_enable
ad_connect data_order_0/adc_valid_out  default_chan_block_0/adc_valid

ad_connect default_chan_block_0/dac_data concat_9002_0/dac_data
ad_connect concat_9002_0/dac_enable default_chan_block_0/dac_enable
ad_connect concat_9002_0/dac_valid  default_chan_block_0/dac_valid

# default_chan_block_1 <-> concat_1
ad_connect concat_9002_1/adc_data   data_order_1/adc_data_in
ad_connect concat_9002_1/adc_enable data_order_1/adc_enable_in
ad_connect concat_9002_1/adc_valid  data_order_1/adc_valid_in

ad_connect data_order_1/adc_data_out   default_chan_block_1/adc_data
ad_connect data_order_1/adc_enable_out default_chan_block_1/adc_enable
ad_connect data_order_1/adc_valid_out  default_chan_block_1/adc_valid

ad_connect default_chan_block_1/dac_data concat_9002_1/dac_data
ad_connect concat_9002_1/dac_enable default_chan_block_1/dac_enable
ad_connect concat_9002_1/dac_valid  default_chan_block_1/dac_valid

# DAC_DMA -> default_chan_block
ad_connect axi_adrv9001_tx1_dma_0/m_axis default_chan_block_0/s_dac_dma
ad_connect axi_adrv9001_tx2_dma_0/m_axis default_chan_block_1/s_dac_dma

# default_chan_block -> ADC_DMA
ad_connect default_chan_block_0/m_adc_dma axi_adrv9001_rx1_dma_0/s_axis
ad_connect default_chan_block_1/m_adc_dma axi_adrv9001_rx2_dma_0/s_axis

# pps
ad_connect pps default_chan_block_0/pps
ad_connect pps default_chan_block_1/pps

#### BREAK

# Test Block: Clock and Resets
ad_connect axi_adrv9001_0/adc_1_clk default_chan_block_0/adc_clk
ad_connect axi_adrv9001_0/adc_2_clk default_chan_block_1/adc_clk
ad_connect axi_adrv9001_0/dac_1_clk default_chan_block_0/dac_clk
ad_connect axi_adrv9001_0/dac_2_clk default_chan_block_1/dac_clk
ad_connect axi_adrv9001_0/adc_1_clk data_order_0/adc_clk
ad_connect axi_adrv9001_0/adc_2_clk data_order_1/adc_clk

ad_connect sys_user_clk default_chan_block_0/user_clk
ad_connect sys_user_clk default_chan_block_0/m_adc_dma_aclk
ad_connect sys_user_clk default_chan_block_0/s_dac_dma_aclk
ad_connect sys_user_clk default_chan_block_1/user_clk
ad_connect sys_user_clk default_chan_block_1/m_adc_dma_aclk
ad_connect sys_user_clk default_chan_block_1/s_dac_dma_aclk
ad_connect sys_user_clk axi_adrv9001_rx1_dma_0/s_axis_aclk
ad_connect sys_user_clk axi_adrv9001_rx2_dma_0/s_axis_aclk
ad_connect sys_user_clk axi_adrv9001_tx1_dma_0/m_axis_aclk
ad_connect sys_user_clk axi_adrv9001_tx2_dma_0/m_axis_aclk

ad_connect adc_clk_reset_0/peripheral_aresetn default_chan_block_0/adc_rstn
ad_connect adc_clk_reset_0/peripheral_aresetn default_chan_block_0/dac_rstn
ad_connect adc_clk_reset_1/peripheral_aresetn default_chan_block_1/adc_rstn
ad_connect adc_clk_reset_1/peripheral_aresetn default_chan_block_1/dac_rstn
ad_connect sys_user_resetn default_chan_block_0/user_resetn
ad_connect sys_user_resetn default_chan_block_0/m_adc_dma_aresetn
ad_connect sys_user_resetn default_chan_block_0/s_dac_dma_aresetn
ad_connect sys_user_resetn default_chan_block_1/user_resetn
ad_connect sys_user_resetn default_chan_block_1/m_adc_dma_aresetn
ad_connect sys_user_resetn default_chan_block_1/s_dac_dma_aresetn

# DMA
ad_connect sys_cpu_resetn axi_adrv9001_rx1_dma_0/m_dest_axi_aresetn
ad_connect sys_cpu_resetn axi_adrv9001_rx2_dma_0/m_dest_axi_aresetn

# ADC
ad_connect sys_cpu_resetn axi_adrv9001_tx1_dma_0/m_src_axi_aresetn
ad_connect sys_cpu_resetn axi_adrv9001_tx2_dma_0/m_src_axi_aresetn


### Transceiver 1

# Create Blocks

# adrv9001

ad_ip_instance axi_adrv9001 axi_adrv9001_1
ad_ip_parameter axi_adrv9001_1 CONFIG.ID 1
ad_ip_parameter axi_adrv9001_1 CONFIG.CMOS_LVDS_N 0
ad_ip_parameter axi_adrv9001_1 CONFIG.USE_RX_CLK_FOR_TX1 1
ad_ip_parameter axi_adrv9001_1 CONFIG.USE_RX_CLK_FOR_TX2 2
ad_ip_parameter axi_adrv9001_1 CONFIG.IO_DELAY_GROUP dev_if_delay_group_1
ad_ip_parameter axi_adrv9001_1 CONFIG.RX_USE_BUFG 1
ad_ip_parameter axi_adrv9001_1 CONFIG.TX_USE_BUFG 1

ad_ip_instance proc_sys_reset adc_clk_reset_2
ad_ip_instance proc_sys_reset adc_clk_reset_3

ad_ip_instance concat_9002 concat_9002_2
ad_ip_instance concat_9002 concat_9002_3

ad_ip_instance data_order data_order_2
ad_ip_instance data_order data_order_3

create_bd_cell -type inline_hdl -vlnv xilinx.com:inline_hdl:ilvector_logic:1.0 reset_invert_2
set_property -dict [list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}] [get_bd_cells reset_invert_2]

create_bd_cell -type inline_hdl -vlnv xilinx.com:inline_hdl:ilvector_logic:1.0 reset_invert_3
set_property -dict [list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}] [get_bd_cells reset_invert_3]

ad_ip_instance  default_chan_block   default_chan_block_2
ad_ip_parameter default_chan_block_2 CONFIG.CLK_FREQ 100000000
ad_ip_parameter default_chan_block_2 CONFIG.CIC_ENABLE 0

ad_ip_instance  default_chan_block   default_chan_block_3
ad_ip_parameter default_chan_block_3 CONFIG.CLK_FREQ 100000000
ad_ip_parameter default_chan_block_3 CONFIG.CIC_ENABLE 0

# dma for rx1

ad_ip_instance axi_dmac axi_adrv9001_rx1_dma_1
ad_ip_parameter axi_adrv9001_rx1_dma_1 CONFIG.DMA_TYPE_SRC 1
ad_ip_parameter axi_adrv9001_rx1_dma_1 CONFIG.DMA_TYPE_DEST 0
ad_ip_parameter axi_adrv9001_rx1_dma_1 CONFIG.CYCLIC 0
ad_ip_parameter axi_adrv9001_rx1_dma_1 CONFIG.SYNC_TRANSFER_START 1
ad_ip_parameter axi_adrv9001_rx1_dma_1 CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_adrv9001_rx1_dma_1 CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_adrv9001_rx1_dma_1 CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_adrv9001_rx1_dma_1 CONFIG.DMA_DATA_WIDTH_SRC 64
ad_ip_parameter axi_adrv9001_rx1_dma_1 CONFIG.CACHE_COHERENT 1

# dma for rx2

ad_ip_instance axi_dmac axi_adrv9001_rx2_dma_1
ad_ip_parameter axi_adrv9001_rx2_dma_1 CONFIG.DMA_TYPE_SRC 1
ad_ip_parameter axi_adrv9001_rx2_dma_1 CONFIG.DMA_TYPE_DEST 0
ad_ip_parameter axi_adrv9001_rx2_dma_1 CONFIG.CYCLIC 0
ad_ip_parameter axi_adrv9001_rx2_dma_1 CONFIG.SYNC_TRANSFER_START 1
ad_ip_parameter axi_adrv9001_rx2_dma_1 CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_adrv9001_rx2_dma_1 CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_adrv9001_rx2_dma_1 CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_adrv9001_rx2_dma_1 CONFIG.DMA_DATA_WIDTH_SRC 32
ad_ip_parameter axi_adrv9001_rx2_dma_1 CONFIG.CACHE_COHERENT 1

# dma for tx1

ad_ip_instance axi_dmac axi_adrv9001_tx1_dma_1
ad_ip_parameter axi_adrv9001_tx1_dma_1 CONFIG.DMA_TYPE_SRC 0
ad_ip_parameter axi_adrv9001_tx1_dma_1 CONFIG.DMA_TYPE_DEST 1
ad_ip_parameter axi_adrv9001_tx1_dma_1 CONFIG.CYCLIC 1
ad_ip_parameter axi_adrv9001_tx1_dma_1 CONFIG.SYNC_TRANSFER_START 0
ad_ip_parameter axi_adrv9001_tx1_dma_1 CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_adrv9001_tx1_dma_1 CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_adrv9001_tx1_dma_1 CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_adrv9001_tx1_dma_1 CONFIG.DMA_DATA_WIDTH_DEST 64
ad_ip_parameter axi_adrv9001_tx1_dma_1 CONFIG.CACHE_COHERENT 1

# dma for tx2

ad_ip_instance axi_dmac axi_adrv9001_tx2_dma_1
ad_ip_parameter axi_adrv9001_tx2_dma_1 CONFIG.DMA_TYPE_SRC 0
ad_ip_parameter axi_adrv9001_tx2_dma_1 CONFIG.DMA_TYPE_DEST 1
ad_ip_parameter axi_adrv9001_tx2_dma_1 CONFIG.CYCLIC 1
ad_ip_parameter axi_adrv9001_tx2_dma_1 CONFIG.SYNC_TRANSFER_START 0
ad_ip_parameter axi_adrv9001_tx2_dma_1 CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_adrv9001_tx2_dma_1 CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_adrv9001_tx2_dma_1 CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_adrv9001_tx2_dma_1 CONFIG.DMA_DATA_WIDTH_DEST 32
ad_ip_parameter axi_adrv9001_tx2_dma_1 CONFIG.CACHE_COHERENT 1

# ad9001 connections

ad_connect  sys_500m_clk       axi_adrv9001_1/delay_clk

#### STILL UNDER REVIEW
#ad_connect  axi_adrv9001_1/adc_1_clk axi_adrv9001_rx1_dma_1/fifo_wr_clk
#ad_connect  axi_adrv9001_1/adc_2_clk axi_adrv9001_rx2_dma_1/fifo_wr_clk
#ad_connect  axi_adrv9001_1/dac_1_clk axi_adrv9001_tx1_dma_1/m_axis_aclk
#ad_connect  axi_adrv9001_1/dac_2_clk axi_adrv9001_tx2_dma_1/m_axis_aclk
####

ad_connect ref_clk           axi_adrv9001_1/ref_clk

ad_connect tx_output_enable_1  axi_adrv9001_1/tx_output_enable

ad_connect mssi_sync_1         axi_adrv9001_1/mssi_sync_in

ad_connect rx1_dclk_in_1_n     axi_adrv9001_1/rx1_dclk_in_n_NC
ad_connect rx1_dclk_in_1_p     axi_adrv9001_1/rx1_dclk_in_p_dclk_in
ad_connect rx1_idata_in_1_n    axi_adrv9001_1/rx1_idata_in_n_idata0
ad_connect rx1_idata_in_1_p    axi_adrv9001_1/rx1_idata_in_p_idata1
ad_connect rx1_qdata_in_1_n    axi_adrv9001_1/rx1_qdata_in_n_qdata2
ad_connect rx1_qdata_in_1_p    axi_adrv9001_1/rx1_qdata_in_p_qdata3
ad_connect rx1_strobe_in_1_n   axi_adrv9001_1/rx1_strobe_in_n_NC
ad_connect rx1_strobe_in_1_p   axi_adrv9001_1/rx1_strobe_in_p_strobe_in

ad_connect rx2_dclk_in_1_n     axi_adrv9001_1/rx2_dclk_in_n_NC
ad_connect rx2_dclk_in_1_p     axi_adrv9001_1/rx2_dclk_in_p_dclk_in
ad_connect rx2_idata_in_1_n    axi_adrv9001_1/rx2_idata_in_n_idata0
ad_connect rx2_idata_in_1_p    axi_adrv9001_1/rx2_idata_in_p_idata1
ad_connect rx2_qdata_in_1_n    axi_adrv9001_1/rx2_qdata_in_n_qdata2
ad_connect rx2_qdata_in_1_p    axi_adrv9001_1/rx2_qdata_in_p_qdata3
ad_connect rx2_strobe_in_1_n   axi_adrv9001_1/rx2_strobe_in_n_NC
ad_connect rx2_strobe_in_1_p   axi_adrv9001_1/rx2_strobe_in_p_strobe_in

ad_connect tx1_dclk_out_1_n    axi_adrv9001_1/tx1_dclk_out_n_NC
ad_connect tx1_dclk_out_1_p    axi_adrv9001_1/tx1_dclk_out_p_dclk_out
ad_connect tx1_dclk_in_1_n     axi_adrv9001_1/tx1_dclk_in_n_NC
ad_connect tx1_dclk_in_1_p     axi_adrv9001_1/tx1_dclk_in_p_dclk_in
ad_connect tx1_idata_out_1_n   axi_adrv9001_1/tx1_idata_out_n_idata0
ad_connect tx1_idata_out_1_p   axi_adrv9001_1/tx1_idata_out_p_idata1
ad_connect tx1_qdata_out_1_n   axi_adrv9001_1/tx1_qdata_out_n_qdata2
ad_connect tx1_qdata_out_1_p   axi_adrv9001_1/tx1_qdata_out_p_qdata3
ad_connect tx1_strobe_out_1_n  axi_adrv9001_1/tx1_strobe_out_n_NC
ad_connect tx1_strobe_out_1_p  axi_adrv9001_1/tx1_strobe_out_p_strobe_out

ad_connect tx2_dclk_out_1_n    axi_adrv9001_1/tx2_dclk_out_n_NC
ad_connect tx2_dclk_out_1_p    axi_adrv9001_1/tx2_dclk_out_p_dclk_out
ad_connect tx2_dclk_in_1_n     axi_adrv9001_1/tx2_dclk_in_n_NC
ad_connect tx2_dclk_in_1_p     axi_adrv9001_1/tx2_dclk_in_p_dclk_in
ad_connect tx2_idata_out_1_n   axi_adrv9001_1/tx2_idata_out_n_idata0
ad_connect tx2_idata_out_1_p   axi_adrv9001_1/tx2_idata_out_p_idata1
ad_connect tx2_qdata_out_1_n   axi_adrv9001_1/tx2_qdata_out_n_qdata2
ad_connect tx2_qdata_out_1_p   axi_adrv9001_1/tx2_qdata_out_p_qdata3
ad_connect tx2_strobe_out_1_n  axi_adrv9001_1/tx2_strobe_out_n_NC
ad_connect tx2_strobe_out_1_p  axi_adrv9001_1/tx2_strobe_out_p_strobe_out

ad_connect rx1_enable_1        axi_adrv9001_1/rx1_enable
ad_connect rx2_enable_1        axi_adrv9001_1/rx2_enable
ad_connect tx1_enable_1        axi_adrv9001_1/tx1_enable
ad_connect tx2_enable_1        axi_adrv9001_1/tx2_enable

ad_connect gpio_rx1_enable_in_1  axi_adrv9001_1/gpio_rx1_enable_in
ad_connect gpio_rx2_enable_in_1  axi_adrv9001_1/gpio_rx2_enable_in
ad_connect gpio_tx1_enable_in_1  axi_adrv9001_1/gpio_tx1_enable_in
ad_connect gpio_tx2_enable_in_1  axi_adrv9001_1/gpio_tx2_enable_in

ad_connect tdd_sync_1 axi_adrv9001_1/tdd_sync
ad_connect tdd_sync_cntr_1 axi_adrv9001_1/tdd_sync_cntr

# adc clk resets
ad_connect sys_cpu_resetn adc_clk_reset_2/ext_reset_in
ad_connect sys_cpu_resetn adc_clk_reset_3/ext_reset_in
ad_connect axi_adrv9001_1/adc_1_clk adc_clk_reset_2/slowest_sync_clk
ad_connect axi_adrv9001_1/adc_2_clk adc_clk_reset_3/slowest_sync_clk

# ADRV9002 <-> concat_0
ad_connect axi_adrv9001_1/adc_1_enable_i0 concat_9002_2/adc_enable_i0
ad_connect axi_adrv9001_1/adc_1_valid_i0  concat_9002_2/adc_valid_i0
ad_connect axi_adrv9001_1/adc_1_data_i0   concat_9002_2/adc_data_i0
ad_connect axi_adrv9001_1/adc_1_enable_q0 concat_9002_2/adc_enable_q0
ad_connect axi_adrv9001_1/adc_1_valid_q0  concat_9002_2/adc_valid_q0
ad_connect axi_adrv9001_1/adc_1_data_q0   concat_9002_2/adc_data_q0
ad_connect axi_adrv9001_1/adc_1_enable_i1 concat_9002_2/adc_enable_i1
ad_connect axi_adrv9001_1/adc_1_valid_i1  concat_9002_2/adc_valid_i1
ad_connect axi_adrv9001_1/adc_1_data_i1   concat_9002_2/adc_data_i1
ad_connect axi_adrv9001_1/adc_1_enable_q1 concat_9002_2/adc_enable_q1
ad_connect axi_adrv9001_1/adc_1_valid_q1  concat_9002_2/adc_valid_q1
ad_connect axi_adrv9001_1/adc_1_data_q1   concat_9002_2/adc_data_q1

ad_connect axi_adrv9001_1/dac_1_enable_i0 concat_9002_2/dac_enable_i0
ad_connect axi_adrv9001_1/dac_1_valid_i0  concat_9002_2/dac_valid_i0
ad_connect axi_adrv9001_1/dac_1_enable_q0 concat_9002_2/dac_enable_q0
ad_connect axi_adrv9001_1/dac_1_valid_q0  concat_9002_2/dac_valid_q0
ad_connect axi_adrv9001_1/dac_1_enable_i1 concat_9002_2/dac_enable_i1
ad_connect axi_adrv9001_1/dac_1_valid_i1  concat_9002_2/dac_valid_i1
ad_connect axi_adrv9001_1/dac_1_enable_q1 concat_9002_2/dac_enable_q1
ad_connect axi_adrv9001_1/dac_1_valid_q1  concat_9002_2/dac_valid_q1

ad_connect concat_9002_2/dac_data_i0 axi_adrv9001_1/dac_1_data_i0
ad_connect concat_9002_2/dac_data_q0 axi_adrv9001_1/dac_1_data_q0
ad_connect concat_9002_2/dac_data_i1 axi_adrv9001_1/dac_1_data_i1
ad_connect concat_9002_2/dac_data_q1 axi_adrv9001_1/dac_1_data_q1

# ADRV9002 <-> concat_1
ad_connect axi_adrv9001_1/adc_2_enable_i0 concat_9002_3/adc_enable_i0
ad_connect axi_adrv9001_1/adc_2_valid_i0  concat_9002_3/adc_valid_i0
ad_connect axi_adrv9001_1/adc_2_data_i0   concat_9002_3/adc_data_i0
ad_connect axi_adrv9001_1/adc_2_enable_q0 concat_9002_3/adc_enable_q0
ad_connect axi_adrv9001_1/adc_2_valid_q0  concat_9002_3/adc_valid_q0
ad_connect axi_adrv9001_1/adc_2_data_q0   concat_9002_3/adc_data_q0
ad_connect GND                            concat_9002_3/adc_enable_i1
ad_connect GND                            concat_9002_3/adc_valid_i1
ad_connect GND                            concat_9002_3/adc_data_i1
ad_connect GND                            concat_9002_3/adc_enable_q1
ad_connect GND                            concat_9002_3/adc_valid_q1
ad_connect GND                            concat_9002_3/adc_data_q1

ad_connect axi_adrv9001_1/dac_2_enable_i0 concat_9002_3/dac_enable_i0
ad_connect axi_adrv9001_1/dac_2_valid_i0  concat_9002_3/dac_valid_i0
ad_connect axi_adrv9001_1/dac_2_enable_q0 concat_9002_3/dac_enable_q0
ad_connect axi_adrv9001_1/dac_2_valid_q0  concat_9002_3/dac_valid_q0

ad_connect concat_9002_3/dac_data_i0 axi_adrv9001_1/dac_2_data_i0
ad_connect concat_9002_3/dac_data_q0 axi_adrv9001_1/dac_2_data_q0

# default_chan_block_2 -> ADRV9002
ad_connect default_chan_block_2/adc_overflow  axi_adrv9001_1/adc_1_dovf
ad_connect default_chan_block_2/dac_underflow axi_adrv9001_1/dac_1_dunf

# default_chan_block_3 -> ADRV9002
ad_connect default_chan_block_3/adc_overflow  axi_adrv9001_1/adc_2_dovf
ad_connect default_chan_block_3/dac_underflow axi_adrv9001_1/dac_2_dunf

# data_order_2
ad_connect axi_adrv9001_1/adc_1_rst reset_invert_2/Op1
ad_connect reset_invert_2/Res       data_order_2/adc_rstn
ad_connect send_count               data_order_2/send_count
ad_connect reset_count              data_order_2/reset_count

# data_order_3
ad_connect axi_adrv9001_1/adc_2_rst reset_invert_3/Op1
ad_connect reset_invert_3/Res       data_order_3/adc_rstn
ad_connect send_count               data_order_3/send_count
ad_connect reset_count              data_order_3/reset_count

# default_chan_block_2 <-> concat_0
ad_connect concat_9002_2/adc_data   data_order_2/adc_data_in
ad_connect concat_9002_2/adc_enable data_order_2/adc_enable_in
ad_connect concat_9002_2/adc_valid  data_order_2/adc_valid_in

ad_connect data_order_2/adc_data_out   default_chan_block_2/adc_data
ad_connect data_order_2/adc_enable_out default_chan_block_2/adc_enable
ad_connect data_order_2/adc_valid_out  default_chan_block_2/adc_valid

ad_connect default_chan_block_2/dac_data concat_9002_2/dac_data
ad_connect concat_9002_2/dac_enable default_chan_block_2/dac_enable
ad_connect concat_9002_2/dac_valid  default_chan_block_2/dac_valid

# default_chan_block_3 <-> concat_1
ad_connect concat_9002_3/adc_data   data_order_3/adc_data_in
ad_connect concat_9002_3/adc_enable data_order_3/adc_enable_in
ad_connect concat_9002_3/adc_valid  data_order_3/adc_valid_in

ad_connect data_order_3/adc_data_out   default_chan_block_3/adc_data
ad_connect data_order_3/adc_enable_out default_chan_block_3/adc_enable
ad_connect data_order_3/adc_valid_out  default_chan_block_3/adc_valid

ad_connect default_chan_block_3/dac_data concat_9002_3/dac_data
ad_connect concat_9002_3/dac_enable default_chan_block_3/dac_enable
ad_connect concat_9002_3/dac_valid  default_chan_block_3/dac_valid

# DAC_DMA -> default_chan_block
ad_connect axi_adrv9001_tx1_dma_1/m_axis default_chan_block_2/s_dac_dma
ad_connect axi_adrv9001_tx2_dma_1/m_axis default_chan_block_3/s_dac_dma

# default_chan_block -> ADC_DMA
ad_connect default_chan_block_2/m_adc_dma axi_adrv9001_rx1_dma_1/s_axis
ad_connect default_chan_block_3/m_adc_dma axi_adrv9001_rx2_dma_1/s_axis

# pps
ad_connect pps default_chan_block_2/pps
ad_connect pps default_chan_block_3/pps

#### BREAK

# Test Block: Clock and Resets
ad_connect axi_adrv9001_1/adc_1_clk default_chan_block_2/adc_clk
ad_connect axi_adrv9001_1/adc_2_clk default_chan_block_3/adc_clk
ad_connect axi_adrv9001_1/dac_1_clk default_chan_block_2/dac_clk
ad_connect axi_adrv9001_1/dac_2_clk default_chan_block_3/dac_clk
ad_connect axi_adrv9001_1/adc_1_clk data_order_2/adc_clk
ad_connect axi_adrv9001_1/adc_2_clk data_order_3/adc_clk

ad_connect sys_user_clk default_chan_block_2/user_clk
ad_connect sys_user_clk default_chan_block_2/m_adc_dma_aclk
ad_connect sys_user_clk default_chan_block_2/s_dac_dma_aclk
ad_connect sys_user_clk default_chan_block_3/user_clk
ad_connect sys_user_clk default_chan_block_3/m_adc_dma_aclk
ad_connect sys_user_clk default_chan_block_3/s_dac_dma_aclk
ad_connect sys_user_clk axi_adrv9001_rx1_dma_1/s_axis_aclk
ad_connect sys_user_clk axi_adrv9001_rx2_dma_1/s_axis_aclk
ad_connect sys_user_clk axi_adrv9001_tx1_dma_1/m_axis_aclk
ad_connect sys_user_clk axi_adrv9001_tx2_dma_1/m_axis_aclk

ad_connect adc_clk_reset_2/peripheral_aresetn default_chan_block_2/adc_rstn
ad_connect adc_clk_reset_2/peripheral_aresetn default_chan_block_2/dac_rstn
ad_connect adc_clk_reset_3/peripheral_aresetn default_chan_block_3/adc_rstn
ad_connect adc_clk_reset_3/peripheral_aresetn default_chan_block_3/dac_rstn
ad_connect sys_user_resetn default_chan_block_2/user_resetn
ad_connect sys_user_resetn default_chan_block_2/m_adc_dma_aresetn
ad_connect sys_user_resetn default_chan_block_2/s_dac_dma_aresetn
ad_connect sys_user_resetn default_chan_block_3/user_resetn
ad_connect sys_user_resetn default_chan_block_3/m_adc_dma_aresetn
ad_connect sys_user_resetn default_chan_block_3/s_dac_dma_aresetn

# DMA
ad_connect sys_cpu_resetn axi_adrv9001_rx1_dma_1/m_dest_axi_aresetn
ad_connect sys_cpu_resetn axi_adrv9001_rx2_dma_1/m_dest_axi_aresetn

# ADC
ad_connect sys_cpu_resetn axi_adrv9001_tx1_dma_1/m_src_axi_aresetn
ad_connect sys_cpu_resetn axi_adrv9001_tx2_dma_1/m_src_axi_aresetn

# interconnects

ad_cpu_interconnect 0x44A00000  axi_adrv9001_0
ad_cpu_interconnect 0x44A30000  axi_adrv9001_rx1_dma_0
ad_cpu_interconnect 0x44A40000  axi_adrv9001_rx2_dma_0
ad_cpu_interconnect 0x44A50000  axi_adrv9001_tx1_dma_0
ad_cpu_interconnect 0x44A60000  axi_adrv9001_tx2_dma_0
ad_cpu_interconnect 0x44B00000  axi_adrv9001_1
ad_cpu_interconnect 0x44B30000  axi_adrv9001_rx1_dma_1
ad_cpu_interconnect 0x44B40000  axi_adrv9001_rx2_dma_1
ad_cpu_interconnect 0x44B50000  axi_adrv9001_tx1_dma_1
ad_cpu_interconnect 0x44B60000  axi_adrv9001_tx2_dma_1
ad_cpu_interconnect 0x7B000000  default_chan_block_0
ad_cpu_interconnect 0x7C000000  default_chan_block_1
ad_cpu_interconnect 0x7D000000  default_chan_block_2
ad_cpu_interconnect 0x7E000000  default_chan_block_3

# memory interconnect
ad_mem_hpc0_interconnect sys_cpu_clk sys_ps8/S_AXI_HPC0
ad_mem_hpc0_interconnect sys_cpu_clk axi_adrv9001_rx1_dma_0/m_dest_axi
ad_mem_hpc0_interconnect sys_cpu_clk axi_adrv9001_rx2_dma_0/m_dest_axi
ad_mem_hpc0_interconnect sys_cpu_clk axi_adrv9001_tx1_dma_0/m_src_axi
ad_mem_hpc0_interconnect sys_cpu_clk axi_adrv9001_tx2_dma_0/m_src_axi
ad_mem_hpc0_interconnect sys_cpu_clk axi_adrv9001_rx1_dma_1/m_dest_axi
ad_mem_hpc0_interconnect sys_cpu_clk axi_adrv9001_rx2_dma_1/m_dest_axi
ad_mem_hpc0_interconnect sys_cpu_clk axi_adrv9001_tx1_dma_1/m_src_axi
ad_mem_hpc0_interconnect sys_cpu_clk axi_adrv9001_tx2_dma_1/m_src_axi

# interrupts
ad_cpu_interrupt ps-13 mb-12 axi_adrv9001_rx1_dma_0/irq
ad_cpu_interrupt ps-12 mb-11 axi_adrv9001_rx2_dma_0/irq
ad_cpu_interrupt ps-9  mb-6 axi_adrv9001_tx1_dma_0/irq
ad_cpu_interrupt ps-10 mb-5 axi_adrv9001_tx2_dma_0/irq

ad_cpu_interrupt ps-7 mb-10 axi_adrv9001_rx1_dma_1/irq
ad_cpu_interrupt ps-8 mb-9 axi_adrv9001_rx2_dma_1/irq
ad_cpu_interrupt ps-5 mb-8 axi_adrv9001_tx1_dma_1/irq
ad_cpu_interrupt ps-6 mb-7 axi_adrv9001_tx2_dma_1/irq
