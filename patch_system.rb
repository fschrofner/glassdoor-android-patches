#! /usr/bin/env ruby

require 'fileutils'

size = File.size?("./system.img");

if size == nil
  puts("error: system image not found!");
elsif size < 3000000000
  puts("resizing image, original size: " + size.to_s);
  system("fsck.ext4 -f ./system.img > /dev/null 2>&1");
  system("resize2fs ./system.img 3G > /dev/null 2>&1");
  size = File.size?("./system.img");
  puts("new size: " + size.to_s);
end

#mounting
puts("mounting filesystem")
FileUtils.mkdir_p("./system");
system("./scripts/mount_system.sh");

#copying
puts("copying patches")
FileUtils.cp_r(Dir.glob("./patches/*"), "./system", :remove_destination => true);

#fixing permissions
puts("fixing permissions")
FileUtils.chown_R("root", 2000, Dir.glob("./system/bin/*"));
FileUtils.chown_R("root", 2000, Dir.glob("./system/etc"));
FileUtils.chown_R("root", 0, Dir.glob("./system/etc/init.d"));
FileUtils.chown_R("root", 0, Dir.glob("./system/etc/adb.init.d"));

FileUtils.chmod_R("+x", Dir.glob("./system/bin/*"));
FileUtils.chmod(0755, Dir.glob("./system/etc/iptables.sh"));
FileUtils.chmod_R(0777, Dir.glob("./system/etc/init.d"));
FileUtils.chmod_R(0777, Dir.glob("./system/etc/adb.init.d"));
FileUtils.chmod_R(0777, Dir.glob("./system/priv-app"));

puts("syncing..")
system("sync");
puts("unmounting");
system("./scripts/unmount_system.sh");
