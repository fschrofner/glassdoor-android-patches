#! /usr/bin/env ruby

require 'fileutils'

FileUtils.mkdir_p("./system");
system("./scripts/mount_system.sh");
FileUtils.cp_r(Dir.glob("./patches/*"), "./system", :remove_destination => true);

#fixing permissions
FileUtils.chown_R("root", 2000, Dir.glob("./system/bin/*"));
FileUtils.chown_R("root", 2000, Dir.glob("./system/etc"));
FileUtils.chown_R("root", 0, Dir.glob("./system/etc/init.d"));

FileUtils.chmod_R("+x", Dir.glob("./system/bin/*"));
FileUtils.chmod_R(0777, Dir.glob("./system/etc/init.d"));

system("sync");
system("./scripts/unmount_system.sh");
