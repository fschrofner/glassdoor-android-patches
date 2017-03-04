#! /bin/bash

emulator -avd glassdoor -debug all -use-system-libs -no-boot-anim -selinux permissive -http-proxy 127.0.0.1:8989 -system $1 > /dev/null 2> /dev/null &

adb wait-for-device

echo "device booted"

adb shell "su -c adb-sysinit &" > /dev/null
