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
- fsck
- resizefs

####Image Requirements
- x86_64

###Instructions
TODO

####Setting up the emulator
You need to complete the setup using the option to "not use any network".
Don't mind the Google App crashing all the time during this process.
After completing you can finally disable (Settings -> Apps -> Google App -> Disable) the Google App and the crashes should be gone.  
I'm currently working on a way to automatically disable the app, however it is mysteriously not working with the startup scripts right now.

###Tested & Working Images
- Android 7.1.1 (API 25) - Google APIs Intel x86 Atom_64
