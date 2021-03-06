#!/bin/bash
#  Useful data are passed as arguments to these scripts:
#   from https://retropie.org.uk/docs/Runcommand/
#      $1 - the system (eg: atari2600, nes, snes, megadrive, fba, etc).
#      $2 - the emulator (eg: lr-stella, lr-fceumm, lr-picodrive, pifba, etc).
#      $3 - the full path to the rom file.
#      $4 - the full command line used to launch the emulator.
# install to: /opt/retropie/configs/all
# output info about game on LED
rm -f /tmp/nowplaying 2>/dev/null
echo "End of  - $1 : $(basename $3) - Emulator: $2" | logger -t MYLED
