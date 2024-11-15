# SPDX-License-Identifier: Apache-2.0

M_CUSTOM_LIBS += concat_9361
M_CUSTOM_LIBS += default_chan_block
M_CUSTOM_LIBS += cic_filter

M_DEPS += ../../scripts/default_chan_bd.tcl

M_REPOS += hdl-default-chan

include ../../../common/scripts/common_deps.mk
include ../../../common/scripts/axi_ad9361.mk
include ../../../common/scripts/project.mk
