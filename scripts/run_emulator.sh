#! /bin/bash

emulator -avd glassdoor -debug all -use-system-libs -no-boot-anim -selinux permissive -system ./system.img > /dev/null 2> /dev/null &
# -http-proxy is buggy, so iptables on the emulator are used instead

adb wait-for-device

echo "device booted"

#todo: replace sleep with check for readiness
sleep 30

adb shell "su -c adb-sysinit" > /dev/null

echo "ready"
