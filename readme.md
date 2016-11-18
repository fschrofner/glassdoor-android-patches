#glassdoor-android-patches
A simple script and a collection of patches, needed for glassdoor's dynamic analysers. The script injects the patches into an Android system.img file. The patched file can then be booted with the Android emulator using `./scripts/run_emulator.sh`.
Just place the system.img file in this directory and call `sudo ./patch_system.rb` to patch.

####Included Modifications
- busybox 1.25.1
- init.d like startup script execution (idea based on [ryuinferno](https://github.com/Ryuinferno/Term-init))
- superuser (using binary and apk of [superuser](https://github.com/phhusson/Superuser))
- mitmproxy root certificate

####System Requirements
- ext4
- ruby

####Image Requirements
- x86_64

##Instructions
TODO

##Tested & Working Images
- Android 7.1.1 (API 25) - Google APIs Intel x86 Atom_64
