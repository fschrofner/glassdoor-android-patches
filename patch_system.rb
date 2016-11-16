#! /usr/bin/env ruby

require 'fileutils'

FileUtils.mkdir_p("./system");
system("mount -t ext4 -o loop ./system.img ./system");
FileUtils.cp_r(Dir.glob("./patches/*"), "./system", :remove_destination => true);
FileUtils.chown_R("root", 2000, Dir.glob("./system/bin/*"));
FileUtils.chmod_R("+x", Dir.glob(".system/bin/*"));
system("sync");
system("umount ./system");
