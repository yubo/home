#!/bin/sh
/usr/sbin/ntpdate ntp.fudan.edu.cn | logger -t NTP
