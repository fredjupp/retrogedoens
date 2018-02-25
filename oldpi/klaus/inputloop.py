#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import errno
import time
import re
import argparse
from luma.led_matrix.device import max7219
from luma.core.interface.serial import spi, noop
from luma.core.render import canvas
from luma.core.virtual import viewport
from luma.core.legacy import text, show_message
from luma.core.legacy.font import proportional, CP437_FONT, TINY_FONT, SINCLAIR_FONT, LCD_FONT, UKR_FONT, SEG7_FONT
import random

# initialize random
random.seed()
myint=random.randint(0, 9)
print myint

bufferSize = 100;
PATH = "pipe";
shutdown_cmd = "###SHUTDOWN###"
pipe = os.open(PATH, os.O_RDONLY | os.O_NONBLOCK);
#
# create matrix device
serial = spi(port=0, device=0, gpio=noop())
device = max7219(serial, cascaded=8, block_orientation=-90, rotate=0)
print("Created device")
#
while True:
    try:
        input = os.read(pipe,bufferSize);
    except OSError as err:
        if err.errno == 11:
            continue;
        else:
            raise err;
    if input[:14] == shutdown_cmd :
        break;

    if input:
        print(input);
        myfont=random.choice(["CP437_FONT", "TINY_FONT", "SINCLAIR_FONT", "LCD_FONT", "UKR_FONT", "SEG7_FONT"])
        mynum=random.uniform(.005, .06 );
        mybrightness=random.randint(1,255);
        input.strip()
        # output=myfont + ":" + input
        output=" " + input + " "
        print myfont;
        print mynum;
        print mybrightness;
        device.contrast(mybrightness);
        #show_message(device, input, fill="white", font=proportional(CP437_FONT), scroll_delay=0.05);
        show_message(device, output, fill="white", font=proportional(eval(myfont)), scroll_delay=mynum);
    #Other functions
    time.sleep(1);
os.close(pipe)

