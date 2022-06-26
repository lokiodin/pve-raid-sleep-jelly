# Raid Sleep Jellyfin on proxmox and truenas infrastructure
> Power down RAID disks and shutdown Truenas SCALE VM if no user is connected to Jellyfin server.

This script is inspired from https://github.com/thomask77/raid-sleep.

This can break your system !
This script is written for MY use-case, so change as you need before executing.

Drives are powered up/down with `hdparm -y` at the same time.

## Requirements

* Tested on 
  * Proxmox 7.2 (Debian 11 Bullseye):
  * Truenas SCALE API v2.0
  * Jellyfin API v10.7.7
  * `python3` >= 3.9.2 (see requirement.txt)
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

## +
- Get an accurate way to determine if users are connected to Jellyfin. Today, it use the endpoint `/Sessions` to get the current sessions but there are not really coherent with user connection (The session is still ON on Jellyfin when the user close his window ...)

## Dev

Go into `venv` if you want. Install packages in requirement.txt.
```
python3 -m pip install -r requirement.txt
```