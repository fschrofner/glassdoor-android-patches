#! /bin/sh

emulator -avd glassdoor -debug all -use-system-libs -no-boot-anim -selinux permissive -system ./system.img

# -http-proxy is buggy, so iptables on the emulator are used instead
