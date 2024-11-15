# SPDX-License-Identifier: Apache-2.0

from .. import te0820_soms
from . import oot_builds

default_chan_dict = { "oxygen"      : {
                                          "images"    : ["default-chan"],
                                         },
                    }

oot_builds.merge(oot_builds.supported_oot, default_chan_dict)
