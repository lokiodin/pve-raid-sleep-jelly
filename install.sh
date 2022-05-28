#!/bin/bash
set -o nounset -o pipefail -o errexit

install -m 755 -v pve-raid-sleep-jelly /usr/local/sbin
install -m 644 -v pve-raid-sleep-jelly.service /etc/systemd/system

test -f /etc/pve-raid-sleep-jelly.conf || install -m 644 -v pve-raid-sleep-jelly.conf /etc/pve-raid-sleep-jelly.conf

systemctl daemon-reload
systemctl enable pve-raid-sleep-jelly.service
systemctl restart pve-raid-sleep-jelly.service
systemctl status pve-raid-sleep-jelly.service --no-pager -l
