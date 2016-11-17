#glassdoor-android
A simple script to inject the needed files for glassdoor's dynamic analysers into an Android system.img file. The patched file can then be booted with the Android emulator using `./run_emulator.sh`.
Just place the system.img file in this directory and call `patch_system.rb` with superuser permissions to patch.

####Included Modifications
- busybox 1.25.1
- mitmproxy root certificate
- mitmproxy proxy settings

####System Requirements
- ext4
- ruby

####Image Requirements
- x86_64
