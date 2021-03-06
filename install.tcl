spawn vax780 tboot.ini

expect "Overwrite last track"
send "y\r"
expect "HALT"

expect "="
send "mkfs\r"
expect "file sys size"
send "7942\r"
expect "file system"
send "hp(0,0)\r"

expect "="
send "restor\r"
expect "Tape"
send "ht(0,1)\r"
expect "Disk"
send "hp(0,0)\r"
expect "Last chance before scribbling on disk"
send "\r"

expect "End of tape"
expect "="
send "boot\r"
expect ":"
send "hp(0,0)vmunix\r"
expect "root device"
send "hp0\r"


expect "#"
send "fsck /dev/rhp0a\r"
expect "#"
send "mkfs /dev/hp0g 145673\r"
expect "#"
send "cd /dev\r"
expect "#"
send "MAKE ht0\r"
expect "#"
send "cd /\r"

expect "#"
send "/etc/mount /dev/hp0g /usr\r"
expect "#"
send "cd /usr\r"
expect "#"
send "mt rew\r"
expect "#"
send "mt fsf 2\r"
expect "#"
send "tar xpb 20\r"
expect "#"
send "mt rew\r"
expect "#"
send "mt fsf 3\r"
expect "#"
send "cd /usr/src\r"
expect "#"
send "tar xpb 20\r"

expect "#"
send "dd if=/usr/mdec/uboot of=/dev/rhp0a bs=1b count=1\r"
expect "#"
send "cp /etc/fstab.rp06 /etc/fstab\r"
expect "#"
send "chmod 755 /usr\r"
expect "#"
send "reboot\r"
expect "sim>"
send "q\r"

exit 0
