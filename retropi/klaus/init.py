#!/usr/bin/env python
# -*- coding: utf-8 -*-
from luma.led_matrix.device import max7219
from luma.core.interface.serial import spi, noop
from luma.core.render import canvas
from luma.core.virtual import viewport
from luma.core.legacy import text, show_message
from luma.core.legacy.font import proportional, CP437_FONT, TINY_FONT, SINCLAIR_FONT, LCD_FONT
#
# create matrix device to init
serial = spi(port=0, device=0, gpio=noop())
device = max7219(serial, cascaded=8, block_orientation=-90, rotate=0)
show_message(device, "--------", fill="white", font=proportional(CP437_FONT), scroll_delay=0.01)
