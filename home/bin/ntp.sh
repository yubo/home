#!/bin/sh
sudo /usr/sbin/ntpdate cn.pool.ntp.org | logger -t NTP
