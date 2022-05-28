# Raid Sleep Jellyfin on proxmox and truenas infrastructure
> Power down RAID disks and shutdown Truenas SCALE VM if no user is connected to Jellyfin server.

This script is inspired from https://github.com/thomask77/raid-sleep.

This can break your system !
This script is written for MY use-case, so change as you need before executing.

Drives are powered up/down with `hdparm -y` at the same time.

## Requirements

* Tested on Proxmox 7.2 (Debian 11 Bullseye): 
  * `python3` >= 3.9.2
    * os
    * argparse
    * time
    * textwrap
    * subprocess
    * requests
    * json
  * `hdparm` >= 9.43

## Install

1. Edit `raid-sleep.conf`:
    * Use `find /dev/disk/by-id` and `blkid` to find out your disk IDs
2. Read and Execute `sudo ./install.sh`
    * This will set up a `systemd` service to start the program
