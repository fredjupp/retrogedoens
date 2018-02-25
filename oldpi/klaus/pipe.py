#!/usr/bin/env python
import os
import errno
import time

bufferSize = 100;
PATH = "pipe";
shutdown_cmd = "###SHUTDOWN###"
pipe = os.open(PATH, os.O_RDONLY | os.O_NONBLOCK);
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

    #Other functions
    time.sleep(1);
os.close(pipe)
