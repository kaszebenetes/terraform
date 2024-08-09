# Terraform

1. block terraform
2. provider config


## Usage

```
terraform init

(if not credentials provided, first auth to cloud provider (az login))
terraform plan

terraform apply

terraform destroy

terraform validate

terraform fmt -recursive .

ansible-playbook -i inventories/inventory-azure.yaml playbook-azure.yaml

ssh -i ~/.ssh/terraform_project/id_rsa -J adminuser@$(terraform output --raw lb_pip):31415 adminuser@10.0.0.4

ssh -i ~/.ssh/terraform_project/id_rsa -p 31415 adminuser@$(terraform output --raw lb_pip)
```

```
git checkout main
git fetch
git pull origin main
git checkout -b branch
git checkout -b branch_backup
git checkout -
git reset --hard main
git merge --squash branch_backup
git push origin branch --force

git config pull.rebase false
```


## Azure Function

os_type             = "Linux"
sku_name            = "Y1"

powershell_core_version = "7.2"

### Info

func azure functionapp publish kaszebe-function-app2

docker run -i -t --rm mcr.microsoft.io/azure-cli


lsb_release -a
 Distributor ID:	Debian
 Description:	Debian GNU/Linux 11 (bullseye)
 Release:	11
 Codename:	bullsey

free -m
                total        used        free      shared  buff/cache   available
 Mem:            2088         486        1203           0         398        1466
 Swap:              0           0           0

/proc/cpuinfo

processor	: 0 vendor_id	: AuthenticAMD cpu family	: 25 model		: 1 model name	: AMD EPYC 7763 64-Core Processor stepping	: 1 microcode	: 0xffffffff cpu MHz		: 2445.434 cache size	: 512 KB physical id	: 0 siblings	: 2 core id		: 0 cpu cores	: 1 apicid		: 0 initial apicid	: 0 fpu		: yes fpu_exception	: yes cpuid level	: 13 wp		: yes flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext invpcid_single vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves clzero xsaveerptr arat umip vaes vpclmulqdq rdpid fsrm bugs		: sysret_ss_attrs null_seg spectre_v1 spectre_v2 spec_store_bypass bogomips	: 4890.86 TLB size	: 2560 4K pages clflush size	: 64 cache_alignment	: 64 address sizes	: 48 bits physical, 48 bits virtual power management:
processor	: 1 vendor_id	: AuthenticAMD cpu family	: 25 model		: 1 model name	: AMD EPYC 7763 64-Core Processor stepping	: 1 microcode	: 0xffffffff cpu MHz		: 2445.434 cache size	: 512 KB physical id	: 0 siblings	: 2 core id		: 0 cpu cores	: 1 apicid		: 1 initial apicid	: 1 fpu		: yes fpu_exception	: yes cpuid level	: 13 wp		: yes flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext invpcid_single vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves clzero xsaveerptr arat umip vaes vpclmulqdq rdpid fsrm bugs		: sysret_ss_attrs null_seg spectre_v1 spectre_v2 spec_store_bypass bogomips	: 4890.86 TLB size	: 2560 4K pages clflush size	: 64 cache_alignment	: 64 address sizes	: 48 bits physical, 48 bits virtual power management:

id
uid=1000(app) gid=1000(app) groups=1000(app)

df -h
Filesystem                                                         Size  Used Avail Use% Mounted on
overlay                                                             50G  500K   47G   1% /
tmpfs                                                               64M     0   64M   0% /dev
shm                                                                 64M  8.0K   64M   1% /dev/shm
/dev/sdc                                                            50G  500K   47G   1% /etc/hosts
tmpfs                                                              1.1G     0  1.1G   0% /sys/fs/cgroup
//{{ storage_account_samba }}/                                     100T   64K  100T   1% /home
fuse-zip                                                            47G     0   47G   0% /home/site/wwwroot

//kaszebefuncst1.file.core.windows.net/kaszebe-function-app2-905a

UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 22:59 ?        00:00:00 /pause
root        14     0  0 22:59 ?        00:00:00 /bin/bash /root/mesh/launch.sh
root        20     0  0 22:59 ?        00:00:00 tail -f /dev/null
root        25    14  0 22:59 ?        00:00:00 /root/mesh/init
root        36     1  0 22:59 ?        00:00:00 nginx: master process nginx
root        39     0  0 22:59 ?        00:00:00 /bin/sh ./LinuxConsumptionStartup.sh LinuxConsumption
root        43    14  0 22:59 ?        00:00:00 /bin/sh /root/mesh/run.sh
root        52    43  0 22:59 ?        00:00:00 sudo -Eu app /azure-functions-host/Microsoft.Azure.WebJobs.Script.WebHost
root        55    39  0 22:59 ?        00:00:00 /bin/sh ./Startup.sh LinuxConsumption
root        59    55  0 22:59 ?        00:00:01 dotnet Microsoft.Azure.AppService.TokenService.dll LinuxConsumption
app         60    52  1 22:59 ?        00:00:04 /azure-functions-host/Microsoft.Azure.WebJobs.Script.WebHost
app        244    36  0 23:02 ?        00:00:00 nginx: worker process
root       250     1  0 23:02 ?        00:00:00 fuse-zip -ononempty,allow_other,uid=1000,gid=1000 /tmp/20240807230207-22197ddf-2df8-4be8-9df5-8885cd492fa5.zip /home/site/wwwroot
app        251    60  2 23:02 ?        00:00:03 dotnet /azure-functions-host/workers/powershell/7.2/Microsoft.Azure.Functions.PowerShellWorker.dll --host 127.0.0.1 --port 33521 --workerId 8773a164-fcbc-4dfe-ad1f-a5cd42c9b097 --requestId 1b9eadd5-f6c8-4cd4-8e6c-2facea965d3a --grpcMaxMessageLength 2147483647 --functions-uri http://127.0.0.1:33521/ --functions-worker-id 8773a164-fcbc-4dfe-ad1f-a5cd42c9b097 --functions-request-id 1b9eadd5-f6c8-4cd4-8e6c-2facea965d3a --functions-grpc-max-message-length 2147483647
root       415    14  0 23:05 ?        00:00:00 sleep 10
root       417    39  0 23:05 ?        00:00:00 sleep 10
app        420   251  0 23:05 ?        00:00:00 /bin/ps -ef

python --version
Python 3.9.19

pip3 --version
pip 23.0.1 from /usr/local/lib/python3.9/site-packages/pip (python 3.9)

ls /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
/bin: bash bunzip2 bzcat bzcmp bzdiff bzegrep bzexe bzfgrep bzgrep bzip2 bzip2recover bzless bzmore cat chgrp chmod chown cp dash date dd df dir dmesg dnsdomainname domainname echo egrep false fgrep findmnt fuser fusermount grep gunzip gzexe gzip hostname ip journalctl kill ln login loginctl ls lsblk mkdir mknod mktemp more mount mountpoint mv networkctl nisdomainname pidof ps pwd rbash readlink rm rmdir run-parts sed sh sleep ss stty su sync systemctl systemd systemd-ask-password systemd-escape systemd-inhibit systemd-machine-id-setup systemd-notify systemd-sysusers systemd-tmpfiles systemd-tty-ask-password-agent tar tempfile touch true ulockmgr_server umount uname uncompress vdir wdctl ypdomainname zcat zcmp zdiff zegrep zfgrep zforce zgrep zless zmore znew

/sbin: agetty badblocks blkdeactivate blkdiscard blkid blkzone blockdev bridge capsh chcpu ctrlaltdel debugfs devlink dmsetup dmstats dumpe2fs e2fsck e2image e2label e2mmpstatus e2scrub e2scrub_all e2undo findfs fsck fsck.cramfs fsck.ext2 fsck.ext3 fsck.ext4 fsck.minix fsfreeze fstab-decode fstrim getcap getpcaps getty halt hwclock init installkernel ip isosize killall5 ldconfig logsave losetup mke2fs mkfs mkfs.bfs mkfs.cramfs mkfs.ext2 mkfs.ext3 mkfs.ext4 mkfs.minix mkhomedir_helper mkswap mount.fuse pivot_root poweroff raw reboot resize2fs rtacct rtmon runlevel runuser setcap shadowconfig shutdown start-stop-daemon sulogin swaplabel swapoff swapon switch_root sysctl tc telinit tipc tune2fs unix_chkpwd unix_update wipefs zramctl

/usr/bin: GET HEAD POST X11 Xvfb [ aclocal aclocal-1.16 addpart addr2line appres apropos apt apt-cache apt-cdrom apt-config apt-get apt-key apt-mark ar arch aria2c as autoconf autoheader autom4te automake automake-1.16 autopoint autoreconf autoscan autoupdate awk b2sum base32 base64 basename basenc bashbug bdftopcf bdftruncate bootctl broadwayd busctl c++ c++filt c89 c89-gcc c99 c99-gcc c_rehash captoinfo catchsegv catman cc chage chattr chcon chfn choom chrt chsh cksum clear clear_console cmp col colcrt colrm column comm corelist corepack cpan cpan5.32-x86_64-linux-gnu cpio-filter cpp cpp-10 crc32 csplit ctstat curl cut cvtsudoers dbus-cleanup-sockets dbus-daemon dbus-monitor dbus-run-session dbus-send dbus-update-activation-environment dbus-uuidgen deb-systemd-helper deb-systemd-invoke debconf debconf-apt-progress debconf-communicate debconf-copydb debconf-escape debconf-gettextize debconf-set-selections debconf-show debconf-updatepo delpart derb dh dh_auto_build dh_auto_clean dh_auto_configure dh_auto_install dh_auto_test dh_autoreconf dh_autoreconf_clean dh_autotools-dev_restoreconfig dh_autotools-dev_updateconfig dh_bugfiles dh_builddeb dh_clean dh_compress dh_dwz dh_fixperms dh_gconf dh_gencontrol dh_icons dh_install dh_installalternatives dh_installcatalogs dh_installchangelogs dh_installcron dh_installdeb dh_installdebconf dh_installdirs dh_installdocs dh_installemacsen dh_installexamples dh_installgsettings dh_installifupdown dh_installinfo dh_installinit dh_installinitramfs dh_installlogcheck dh_installlogrotate dh_installman dh_installmanpages dh_installmenu dh_installmime dh_installmodules dh_installpam dh_installppp dh_installsystemd dh_installsystemduser dh_installsysusers dh_installtmpfiles dh_installudev dh_installwm dh_installxfonts dh_link dh_lintian dh_listpackages dh_makeshlibs dh_md5sums dh_missing dh_movefiles dh_perl dh_perl_openssl dh_prep dh_shlibdeps dh_strip dh_strip_nondeterminism dh_systemd_enable dh_systemd_start dh_testdir dh_testroot dh_ucf dh_update_autotools_config dh_usrlocal diff diff3 dircolors dirmngr dirmngr-client dirname dotnet dpkg dpkg-architecture dpkg-buildflags dpkg-buildpackage dpkg-checkbuilddeps dpkg-deb dpkg-distaddfile dpkg-divert dpkg-genbuildinfo dpkg-genchanges dpkg-gencontrol dpkg-gensymbols dpkg-maintscript-helper dpkg-mergechangelogs dpkg-name dpkg-parsechangelog dpkg-query dpkg-realpath dpkg-scanpackages dpkg-scansources dpkg-shlibdeps dpkg-source dpkg-split dpkg-statoverride dpkg-trigger dpkg-vendor du dwp dwz editres elfedit enc2xs encguess env envsubst eqn expand expiry expr factor faillog faked-sysv faked-tcp fakeroot fakeroot-sysv fakeroot-tcp fallocate fc-cache fc-cat fc-conflist fc-list fc-match fc-pattern fc-query fc-scan fc-validate file fincore find flock fmt fold fonttosfnt free funzip fuse-zip g++ g++-10 gapplication gcc gcc-10 gcc-ar gcc-ar-10 gcc-nm gcc-nm-10 gcc-ranlib gcc-ranlib-10 gcov gcov-10 gcov-dump gcov-dump-10 gcov-tool gcov-tool-10 gdbus gdbus-codegen gdk-pixbuf-csource gdk-pixbuf-pixdata gdk-pixbuf-thumbnailer genbrk gencat gencfu gencnval gendict genrb geqn getconf getent getopt gettext gettext.sh gettextize gio gio-querymodules glib-compile-resources glib-compile-schemas glib-genmarshal glib-gettextize glib-mkenums gmake gobject-query gold gpasswd gpg gpg-agent gpg-connect-agent gpg-wks-server gpg-zip gpgcompose gpgconf gpgparsemail gpgsm gpgsplit gpgtar gpgv gpic gprof gresource groff grog grops grotty groups gsettings gtbl gtester gtester-report gtk-builder-convert gtk-builder-tool gtk-encode-symbolic-svg gtk-launch gtk-query-settings gtk-update-icon-cache h2ph h2xs hd head hexdump hostid hostnamectl i386 iceauth iconv icuinfo id ifnames infocmp infotocap install instmodsh ionice ipcmk ipcrm ipcs ischroot isql iusql join jq json_pp kbxutil kernel-install killall last lastb lastlog lcf ld ld.bfd ld.gold ldd lexgrog libnetcfg libpng-config libpng16-config libtoolize link linux32 linux64 listres lnstat locale localectl localedef logger logname look lsattr lsb_release lscpu lsipc lslocks lslogins lsmem lsns lspgpot lto-dump-10 luit lwp-download lwp-dump lwp-mirror lwp-request lzcat lzcmp lzdiff lzegrep lzfgrep lzgrep lzless lzma lzmainfo lzmore m4 make make-first-existing-target makeconv man man-recode mandb manpath mariadb-config mariadb_config mawk mcookie md5sum md5sum.textutils memusage memusagestat mesa-overlay-control.py mesg migrate-pubring-from-classic-gpg mimeopen mimetype mkfifo mkfontdir mkfontscale mksquashfs msgattrib msgcat msgcmp msgcomm msgconv msgen msgexec msgfilter msgfmt msggrep msginit msgmerge msgunfmt msguniq mtrace mysql_config namei nawk neqn newgrp ngettext nice nl nm node nohup npm nproc npx nroff nsenter nstat numfmt objcopy objdump od odbcinst open openssl pager pango-list pango-view partx passwd paste patch pathchk pcre-config pcre2-config pdb3 pdb3.9 peekfd perl perl5.32-x86_64-linux-gnu perl5.32.1 perlbug perldoc perlivp perlthanks pgrep pic piconv pidwait pinentry pinentry-curses pinky pkg-config pkgdata pkill pl2pm pldd pmap png-fix-itxt pngfix po2debconf pod2html pod2man pod2text pod2usage podchecker podebconf-display-po podebconf-report-po pr preconv printenv printf prlimit prove prtstat pslog pstree pstree.x11 ptar ptardiff ptargrep ptx pwdx py3clean py3compile py3versions pydoc3 pydoc3.9 pygettext3 pygettext3.9 python3 python3.9 ranlib rdma readelf realpath recode-sr-latin renice reset resizepart resolvectl rev rgrep routef routel rpcgen rtstat runcon savelog script scriptlive scriptreplay sdiff select-editor sensible-browser sensible-editor sensible-pager seq sessreg setarch setpriv setsid setterm setxkbmap sg sha1sum sha224sum sha256sum sha384sum sha512sum shasum showrgb shred shuf size skill slabtop snice soelim sort sotruss splain split sprof stat stdbuf streamzip strings strip sudo sudoedit sudoreplay sum systemd-analyze systemd-cat systemd-cgls systemd-cgtop systemd-delta systemd-detect-virt systemd-id128 systemd-mount systemd-path systemd-resolve systemd-run systemd-socket-activate systemd-stdio-bridge systemd-umount tabs tac tail taskset tbl tee termit test tic timedatectl timeout tload toe top touch tput tr troff truncate tset tsort tty tzselect ucf ucfq ucfr uconv ucs2any ul unexpand uniq unlink unlzma unshare unsquashfs unxz unzip unzipsfx update-alternatives update-mime-database uptime users utmpdump viewres vmstat w wall watch watchgnupg wc wget whatis whereis which who whoami write write.ul x-terminal-emulator x86_64 x86_64-linux-gnu-addr2line x86_64-linux-gnu-ar x86_64-linux-gnu-as x86_64-linux-gnu-c++filt x86_64-linux-gnu-cpp x86_64-linux-gnu-cpp-10 x86_64-linux-gnu-dwp x86_64-linux-gnu-elfedit x86_64-linux-gnu-g++ x86_64-linux-gnu-g++-10 x86_64-linux-gnu-gcc x86_64-linux-gnu-gcc-10 x86_64-linux-gnu-gcc-ar x86_64-linux-gnu-gcc-ar-10 x86_64-linux-gnu-gcc-nm x86_64-linux-gnu-gcc-nm-10 x86_64-linux-gnu-gcc-ranlib x86_64-linux-gnu-gcc-ranlib-10 x86_64-linux-gnu-gcov x86_64-linux-gnu-gcov-10 x86_64-linux-gnu-gcov-dump x86_64-linux-gnu-gcov-dump-10 x86_64-linux-gnu-gcov-tool x86_64-linux-gnu-gcov-tool-10 x86_64-linux-gnu-gold x86_64-linux-gnu-gprof x86_64-linux-gnu-ld x86_64-linux-gnu-ld.bfd x86_64-linux-gnu-ld.gold x86_64-linux-gnu-lto-dump-10 x86_64-linux-gnu-nm x86_64-linux-gnu-objcopy x86_64-linux-gnu-objdump x86_64-linux-gnu-pkg-config x86_64-linux-gnu-ranlib x86_64-linux-gnu-readelf x86_64-linux-gnu-size x86_64-linux-gnu-strings x86_64-linux-gnu-strip x86_64-pc-linux-gnu-pkg-config xargs xauth xcmsdb xdg-desktop-icon xdg-desktop-menu xdg-email xdg-icon-resource xdg-mime xdg-open xdg-screensaver xdg-settings xdg-user-dir xdg-user-dirs-update xdpyinfo xdriinfo xev xfd xfontsel xgamma xgettext xhost xkbbell xkbcomp xkbevd xkbprint xkbvleds xkbwatch xkeystone xkill xlsatoms xlsclients xlsfonts xmessage xmlcatalog xmllint xmodmap xprop xrandr xrdb xrefresh xset xsetmode xsetpointer xsetroot xstdcmap xsubpp xvfb-run xvidtune xvinfo xwininfo xz xzcat xzcmp xzdiff xzegrep xzfgrep xzgrep xzless xzmore yes zdump zipdetails zipgrep zipinfo

/usr/local/bin: 2to3 2to3-3.9 idle idle3 idle3.9 pip pip3 pip3.9 pydoc pydoc3 pydoc3.9 python python-config python3 python3-config python3.9 python3.9-config wheel

/usr/local/sbin:

/usr/sbin: accessdb add-shell addgnupghome addgroup adduser applygnupgdefaults arpd chgpasswd chmem chpasswd chroot cpgr cppw delgroup deluser dpkg-fsys-usrunmess dpkg-preconfigure dpkg-reconfigure e2freefrag e4crypt e4defrag escapesrc faillock fdformat filefrag genccode gencmn genl gennorm2 gensprep groupadd groupdel groupmems groupmod grpck grpconv grpunconv iconvconfig icupkg invoke-rc.d ldattach locale-gen mklost+found newusers nginx nologin pam-auth-update pam_getenv pam_timestamp_check policy-rc.d pwck pwconv pwunconv readprofile remove-shell rmt rmt-tar rtcwake service sudo_logsrvd sudo_sendlog tarcat tzconfig update-ca-certificates update-fonts-alias update-fonts-dir update-fonts-scale update-icon-caches update-locale update-passwd update-rc.d useradd userdel usermod validlocale vigr vipw visudo zic

apt list --installed
Listing...
 adduser/oldstable,now 3.118+deb11u1 all [installed,automatic]
 adwaita-icon-theme/oldstable,now 3.38.0-1 all [installed,automatic]
 alsa-topology-conf/oldstable,now 1.2.4-1 all [installed,automatic]
 alsa-ucm-conf/oldstable,now 1.2.4-2 all [installed,automatic]
 apt-transport-https/oldstable,now 2.2.4 all [installed]
 apt/oldstable,now 2.2.4 amd64 [installed,automatic]
 aria2/oldstable,now 1.35.0-3 amd64 [installed]
 at-spi2-core/oldstable,now 2.38.0-4+deb11u1 amd64 [installed,automatic]
 autoconf/oldstable,now 2.69-14 all [installed,automatic]
 automake/oldstable,now 1:1.16.3-2 all [installed,automatic]
 autopoint/oldstable,now 0.21-4 all [installed,automatic]
 autotools-dev/oldstable,now 20180224.1+nmu1 all [installed,automatic]
 base-files/oldstable,now 11.1+deb11u9 amd64 [installed,automatic]
 base-passwd/oldstable,now 3.5.51 amd64 [installed,automatic]
 bash/oldstable,now 5.1-2+deb11u1 amd64 [installed,automatic]
 binutils-common/oldstable,now 2.35.2-2 amd64 [installed,automatic]
 binutils-x86-64-linux-gnu/oldstable,now 2.35.2-2 amd64 [installed,automatic]
 binutils/oldstable,now 2.35.2-2 amd64 [installed]
 bsdextrautils/oldstable-security,oldstable-security,now 2.36.1-8+deb11u2 amd64 [installed,automatic]
 bsdutils/oldstable-security,oldstable-security,now 1:2.36.1-8+deb11u2 amd64 [installed,automatic]
 build-essential/oldstable,now 12.9 amd64 [installed,automatic]
 bzip2/oldstable,now 1.0.8-4 amd64 [installed,automatic]
 ca-certificates/oldstable,now 20210119 all [installed]
 coreutils/oldstable,now 8.32-4+b1 amd64 [installed,automatic]
 cpp-10/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 cpp/oldstable,now 4:10.2.1-1 amd64 [installed,automatic]
 curl/oldstable,oldstable-security,oldstable-security,now 7.74.0-1.3+deb11u11 amd64 [installed]
 dash/oldstable,now 0.5.11+git20200708+dd9ef66-5 amd64 [installed,automatic]
 dbus-user-session/oldstable,now 1.12.28-0+deb11u1 amd64 [installed,automatic]
 dbus/oldstable,now 1.12.28-0+deb11u1 amd64 [installed,automatic]
 dconf-gsettings-backend/oldstable,now 0.38.0-2 amd64 [installed,automatic]
 dconf-service/oldstable,now 0.38.0-2 amd64 [installed,automatic]
 debconf/oldstable,now 1.5.77 all [installed,automatic]
 debhelper/oldstable,now 13.3.4 all [installed,automatic]
 debian-archive-keyring/oldstable,now 2021.1.1+deb11u1 all [installed,automatic]
 debianutils/oldstable,now 4.11.2 amd64 [installed,automatic]
 default-libmysqlclient-dev/oldstable,now 1.0.7 amd64 [installed]
 dh-autoreconf/oldstable,now 20 all [installed,automatic]
 dh-strip-nondeterminism/oldstable,now 1.12.0-1 all [installed,automatic]
 diffutils/oldstable,now 1:3.7-5 amd64 [installed,automatic]
 dirmngr/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 amd64 [installed,automatic]
 distro-info-data/oldstable,now 0.51+deb11u5 all [installed,automatic]
 dmsetup/oldstable,now 2:1.02.175-2.1 amd64 [installed,automatic]
 dpkg-dev/oldstable,now 1.20.13 all [installed,automatic]
 dpkg/oldstable,now 1.20.13 amd64 [installed,automatic]
 dwz/oldstable,now 0.13+20210201-1 amd64 [installed,automatic]
 e2fsprogs/oldstable,now 1.46.2-2 amd64 [installed,automatic]
 fakeroot/oldstable,now 1.25.3-1.1 amd64 [installed,automatic]
 file/oldstable,oldstable-security,oldstable-security,now 1:5.39-3+deb11u1 amd64 [installed,automatic]
 findutils/oldstable,now 4.8.0-1 amd64 [installed,automatic]
 fontconfig-config/oldstable,now 2.13.1-4.2 all [installed,automatic]
 fontconfig/oldstable,now 2.13.1-4.2 amd64 [installed,automatic]
 fonts-dejavu-core/oldstable,now 2.37-2 all [installed,automatic]
 fonts-liberation/oldstable,now 1:1.07.4-11 all [installed]
 fuse-zip/oldstable,now 0.5.0-1+b1 amd64 [installed]
 fuse/oldstable,now 2.9.9-5 amd64 [installed,automatic]
 g++-10/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 g++/oldstable,now 4:10.2.1-1 amd64 [installed,automatic]
 gcc-10-base/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 gcc-10/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 gcc-9-base/oldstable,now 9.3.0-22 amd64 [installed,automatic]
 gcc/oldstable,now 4:10.2.1-1 amd64 [installed,automatic]
 gconf-service/oldstable,now 3.2.6-7 amd64 [installed]
 gconf2-common/oldstable,now 3.2.6-7 all [installed,automatic]
 geoip-database/oldstable,now 20191224-3 all [installed,automatic]
 gettext-base/oldstable,now 0.21-4 amd64 [installed,automatic]
 gettext/oldstable,now 0.21-4 amd64 [installed,automatic]
 gir1.2-atk-1.0/oldstable,now 2.36.0-2 amd64 [installed,automatic]
 gir1.2-ayatanaappindicator-0.1/oldstable,now 0.5.5-2+deb11u2 amd64 [installed,automatic]
 gir1.2-dbusmenu-glib-0.4/oldstable,now 18.10.20180917~bzr492+repack1-2 amd64 [installed,automatic]
 gir1.2-freedesktop/oldstable,now 1.66.1-1+b1 amd64 [installed,automatic]
 gir1.2-gdkpixbuf-2.0/oldstable,oldstable-security,oldstable-security,now 2.42.2+dfsg-1+deb11u1 amd64 [installed,automatic]
 gir1.2-glib-2.0/oldstable,now 1.66.1-1+b1 amd64 [installed,automatic]
 gir1.2-gtk-2.0/oldstable,now 2.24.33-2 amd64 [installed,automatic]
 gir1.2-harfbuzz-0.0/oldstable,now 2.7.4-1 amd64 [installed,automatic]
 gir1.2-pango-1.0/oldstable,now 1.46.2-3 amd64 [installed,automatic]
 glib-networking-common/oldstable,now 2.66.0-2 all [installed,automatic]
 glib-networking-services/oldstable,now 2.66.0-2 amd64 [installed,automatic]
 glib-networking/oldstable,now 2.66.0-2 amd64 [installed,automatic]
 gnupg-l10n/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 all [installed,automatic]
 gnupg-utils/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 amd64 [installed,automatic]
 gnupg/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 all [installed]
 gpg-agent/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 amd64 [installed,automatic]
 gpg-wks-client/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 amd64 [installed,automatic]
 gpg-wks-server/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 amd64 [installed,automatic]
 gpg/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 amd64 [installed,automatic]
 gpgconf/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 amd64 [installed,automatic]
 gpgsm/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 amd64 [installed,automatic]
 gpgv/oldstable,oldstable-security,oldstable-security,now 2.2.27-2+deb11u2 amd64 [installed,automatic]
 grep/oldstable,now 3.6-1+deb11u1 amd64 [installed,automatic]
 groff-base/oldstable,now 1.22.4-6 amd64 [installed,automatic]
 gsettings-desktop-schemas/oldstable,now 3.38.0-2 all [installed,automatic]
 gtk-update-icon-cache/oldstable,now 3.24.24-4+deb11u3 amd64 [installed,automatic]
 gzip/oldstable,oldstable-security,oldstable-security,now 1.10-4+deb11u1 amd64 [installed,automatic]
 hicolor-icon-theme/oldstable,now 0.17-2 all [installed,automatic]
 hostname/oldstable,now 3.23 amd64 [installed,automatic]
 icu-devtools/oldstable,now 67.1-7 amd64 [installed,automatic]
 init-system-helpers/oldstable,now 1.60 all [installed,automatic]
 intltool-debian/oldstable,now 0.35.0+20060710.5 all [installed,automatic]
 iproute2/oldstable,now 5.10.0-4 amd64 [installed,automatic]
 jq/oldstable,now 1.6-2.1 amd64 [installed]
 libacl1/oldstable,now 2.2.53-10 amd64 [installed,automatic]
 libalgorithm-diff-perl/oldstable,now 1.201-1 all [installed,automatic]
 libalgorithm-diff-xs-perl/oldstable,now 0.04-6+b1 amd64 [installed,automatic]
 libalgorithm-merge-perl/oldstable,now 0.08-3 all [installed,automatic]
 libapparmor1/oldstable,now 2.13.6-10 amd64 [installed,automatic]
 libapt-pkg6.0/oldstable,now 2.2.4 amd64 [installed,automatic]
 libarchive-cpio-perl/oldstable,now 0.10-1.1 all [installed,automatic]
 libarchive-zip-perl/oldstable,now 1.68-1 all [installed,automatic]
 libargon2-1/oldstable,now 0~20171227-0.2 amd64 [installed,automatic]
 libaria2-0/oldstable,now 1.35.0-3 amd64 [installed,automatic]
 libasan6/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 libasound2-data/oldstable,now 1.2.4-1.1 all [installed,automatic]
 libasound2/oldstable,now 1.2.4-1.1 amd64 [installed]
 libassuan0/oldstable,now 2.5.3-7.1 amd64 [installed,automatic]
 libatk-bridge2.0-0/oldstable,now 2.38.0-1 amd64 [installed,automatic]
 libatk1.0-0/oldstable,now 2.36.0-2 amd64 [installed]
 libatk1.0-data/oldstable,now 2.36.0-2 all [installed,automatic]
 libatk1.0-dev/oldstable,now 2.36.0-2 amd64 [installed,automatic]
 libatm1/oldstable,now 1:2.5.1-4 amd64 [installed,automatic]
 libatomic1/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 libatspi2.0-0/oldstable,now 2.38.0-4+deb11u1 amd64 [installed,automatic]
 libattr1/oldstable,now 1:2.4.48-6 amd64 [installed,automatic]
 libaudit-common/oldstable,now 1:3.0-2 all [installed,automatic]
 libaudit1/oldstable,now 1:3.0-2 amd64 [installed,automatic]
 libauthen-sasl-perl/oldstable,now 2.1600-1.1 all [installed,automatic]
 libavahi-client3/oldstable,now 0.8-5+deb11u2 amd64 [installed,automatic]
 libavahi-common-data/oldstable,now 0.8-5+deb11u2 amd64 [installed,automatic]
 libavahi-common3/oldstable,now 0.8-5+deb11u2 amd64 [installed,automatic]
 libayatana-appindicator-dev/oldstable,now 0.5.5-2+deb11u2 amd64 [installed]
 libayatana-appindicator1/oldstable,now 0.5.5-2+deb11u2 amd64 [installed,automatic]
 libayatana-indicator-dev/oldstable,now 0.8.4-1+deb11u2 amd64 [installed,automatic]
 libayatana-indicator7/oldstable,now 0.8.4-1+deb11u2 amd64 [installed,automatic]
 libbinutils/oldstable,now 2.35.2-2 amd64 [installed,automatic]
 libblkid-dev/oldstable-security,oldstable-security,now 2.36.1-8+deb11u2 amd64 [installed,automatic]
 libblkid1/oldstable-security,oldstable-security,now 2.36.1-8+deb11u2 amd64 [installed,automatic]
 libbpf0/oldstable,now 1:0.3-2 amd64 [installed,automatic]
 libbrotli-dev/oldstable,now 1.0.9-2+b2 amd64 [installed,automatic]
 libbrotli1/oldstable,now 1.0.9-2+b2 amd64 [installed,automatic]
 libbsd0/oldstable,now 0.11.3-1+deb11u1 amd64 [installed,automatic]
 libbz2-1.0/oldstable,now 1.0.8-4 amd64 [installed]
 libc-ares2/oldstable,oldstable-security,oldstable-security,now 1.17.1-1+deb11u3 amd64 [installed,automatic]
 libc-bin/oldstable-security,oldstable-security,now 2.31-13+deb11u10 amd64 [installed,automatic]
 libc-dev-bin/oldstable-security,oldstable-security,now 2.31-13+deb11u10 amd64 [installed,automatic]
 libc-devtools/oldstable-security,oldstable-security,now 2.31-13+deb11u10 amd64 [installed,automatic]
 libc-l10n/oldstable-security,oldstable-security,now 2.31-13+deb11u10 all [installed,automatic]
 libc6-dev/oldstable-security,oldstable-security,now 2.31-13+deb11u10 amd64 [installed,automatic]
 libc6/oldstable-security,oldstable-security,now 2.31-13+deb11u10 amd64 [installed]
 libcairo-gobject2/oldstable,now 1.16.0-5 amd64 [installed,automatic]
 libcairo-script-interpreter2/oldstable,now 1.16.0-5 amd64 [installed,automatic]
 libcairo2-dev/oldstable,now 1.16.0-5 amd64 [installed,automatic]
 libcairo2/oldstable,now 1.16.0-5 amd64 [installed]
 libcap-ng0/oldstable,now 0.7.9-2.2+b1 amd64 [installed,automatic]
 libcap2-bin/oldstable,now 1:2.44-1 amd64 [installed,automatic]
 libcap2/oldstable,now 1:2.44-1 amd64 [installed,automatic]
 libcc1-0/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 libclone-perl/oldstable,now 0.45-1+b1 amd64 [installed,automatic]
 libcolord2/oldstable,now 1.4.5-3 amd64 [installed,automatic]
 libcom-err2/oldstable,now 1.46.2-2 amd64 [installed]
 libcrypt-dev/oldstable,now 1:4.4.18-4 amd64 [installed,automatic]
 libcrypt1/oldstable,now 1:4.4.18-4 amd64 [installed]
 libcryptsetup12/oldstable,oldstable-security,oldstable-security,now 2:2.3.7-1+deb11u1 amd64 [installed,automatic]
 libctf-nobfd0/oldstable,now 2.35.2-2 amd64 [installed,automatic]
 libctf0/oldstable,now 2.35.2-2 amd64 [installed,automatic]
 libcups2/oldstable,now 2.3.3op2-3+deb11u6 amd64 [installed]
 libcurl4/oldstable,oldstable-security,oldstable-security,now 7.74.0-1.3+deb11u11 amd64 [installed,automatic]
 libdata-dump-perl/oldstable,now 1.23-1.1 all [installed,automatic]
 libdatrie-dev/oldstable,now 0.2.13-1 amd64 [installed,automatic]
 libdatrie1/oldstable,now 0.2.13-1 amd64 [installed,automatic]
 libdb5.3/oldstable,now 5.3.28+dfsg1-0.8 amd64 [installed]
 libdbus-1-3/oldstable,now 1.12.28-0+deb11u1 amd64 [installed]
 libdbus-glib-1-2/oldstable,now 0.110-6 amd64 [installed,automatic]
 libdbusmenu-glib-dev/oldstable,now 18.10.20180917~bzr492+repack1-2 amd64 [installed,automatic]
 libdbusmenu-glib4/oldstable,now 18.10.20180917~bzr492+repack1-2 amd64 [installed,automatic]
 libdbusmenu-gtk4/oldstable,now 18.10.20180917~bzr492+repack1-2 amd64 [installed,automatic]
 libdconf1/oldstable,now 0.38.0-2 amd64 [installed,automatic]
 libdebconfclient0/oldstable,now 0.260 amd64 [installed,automatic]
 libdebhelper-perl/oldstable,now 13.3.4 all [installed,automatic]
 libdeflate0/oldstable,now 1.7-1 amd64 [installed,automatic]
 libdevmapper1.02.1/oldstable,now 2:1.02.175-2.1 amd64 [installed,automatic]
 libdpkg-perl/oldstable,now 1.20.13 all [installed,automatic]
 libdrm-amdgpu1/oldstable,now 2.4.104-1 amd64 [installed,automatic]
 libdrm-common/oldstable,now 2.4.104-1 all [installed,automatic]
 libdrm-intel1/oldstable,now 2.4.104-1 amd64 [installed,automatic]
 libdrm-nouveau2/oldstable,now 2.4.104-1 amd64 [installed,automatic]
 libdrm-radeon1/oldstable,now 2.4.104-1 amd64 [installed,automatic]
 libdrm2/oldstable,now 2.4.104-1 amd64 [installed,automatic]
 libedit2/oldstable,now 3.1-20191231-2+b1 amd64 [installed,automatic]
 libelf1/oldstable,now 0.183-1 amd64 [installed,automatic]
 libencode-locale-perl/oldstable,now 1.05-1.1 all [installed,automatic]
 libepoxy0/oldstable,now 1.5.5-1 amd64 [installed,automatic]
 libexpat1-dev/oldstable,oldstable-security,oldstable-security,now 2.2.10-2+deb11u5 amd64 [installed,automatic]
 libexpat1/oldstable,oldstable-security,oldstable-security,now 2.2.10-2+deb11u5 amd64 [installed]
 libext2fs2/oldstable,now 1.46.2-2 amd64 [installed,automatic]
 libfakeroot/oldstable,now 1.25.3-1.1 amd64 [installed,automatic]
 libffi-dev/oldstable,now 3.3-6 amd64 [installed,automatic]
 libffi7/oldstable,now 3.3-6 amd64 [installed]
 libfile-basedir-perl/oldstable,now 0.08-1 all [installed,automatic]
 libfile-desktopentry-perl/oldstable,now 0.22-2 all [installed,automatic]
 libfile-fcntllock-perl/oldstable,now 0.22-3+b7 amd64 [installed,automatic]
 libfile-listing-perl/oldstable,now 6.14-1 all [installed,automatic]
 libfile-mimeinfo-perl/oldstable,now 0.30-1 all [installed,automatic]
 libfile-stripnondeterminism-perl/oldstable,now 1.12.0-1 all [installed,automatic]
 libfont-afm-perl/oldstable,now 1.20-3 all [installed,automatic]
 libfontconfig-dev/oldstable,now 2.13.1-4.2 amd64 [installed,automatic]
 libfontconfig1-dev/oldstable,now 2.13.1-4.2 amd64 [installed,automatic]
 libfontconfig1/oldstable,now 2.13.1-4.2 amd64 [installed]
 libfontenc1/oldstable,now 1:1.1.4-1 amd64 [installed,automatic]
 libfreetype-dev/oldstable,now 2.10.4+dfsg-1+deb11u1 amd64 [installed,automatic]
 libfreetype6-dev/oldstable,now 2.10.4+dfsg-1+deb11u1 amd64 [installed,automatic]
 libfreetype6/oldstable,now 2.10.4+dfsg-1+deb11u1 amd64 [installed,automatic]
 libfribidi-dev/oldstable,now 1.0.8-2+deb11u1 amd64 [installed,automatic]
 libfribidi0/oldstable,now 1.0.8-2+deb11u1 amd64 [installed,automatic]
 libfuse2/oldstable,now 2.9.9-5 amd64 [installed,automatic]
 libgail-common/oldstable,now 2.24.33-2 amd64 [installed,automatic]
 libgail18/oldstable,now 2.24.33-2 amd64 [installed,automatic]
 libgbm1/oldstable,now 20.3.5-1 amd64 [installed]
 libgcc-10-dev/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 libgcc-s1/oldstable,now 10.2.1-6 amd64 [installed]
 libgconf-2-4/oldstable,now 3.2.6-7 amd64 [installed]
 libgcrypt20/oldstable,now 1.8.7-6 amd64 [installed,automatic]
 libgd3/oldstable,now 2.3.0-2 amd64 [installed,automatic]
 libgdbm-compat4/oldstable,now 1.19-2 amd64 [installed,automatic]
 libgdbm6/oldstable,now 1.19-2 amd64 [installed]
 libgdk-pixbuf-2.0-0/oldstable,oldstable-security,oldstable-security,now 2.42.2+dfsg-1+deb11u1 amd64 [installed,automatic]
 libgdk-pixbuf-2.0-dev/oldstable,oldstable-security,oldstable-security,now 2.42.2+dfsg-1+deb11u1 amd64 [installed,automatic]
 libgdk-pixbuf-xlib-2.0-0/oldstable,now 2.40.2-2 amd64 [installed,automatic]
 libgdk-pixbuf2.0-0/oldstable,now 2.40.2-2 amd64 [installed]
 libgdk-pixbuf2.0-bin/oldstable,oldstable-security,oldstable-security,now 2.42.2+dfsg-1+deb11u1 amd64 [installed,automatic]
 libgdk-pixbuf2.0-common/oldstable,oldstable-security,oldstable-security,now 2.42.2+dfsg-1+deb11u1 all [installed,automatic]
 libgeoip1/oldstable,now 1.6.12-7 amd64 [installed,automatic]
 libgirepository-1.0-1/oldstable,now 1.66.1-1+b1 amd64 [installed,automatic]
 libgl1-mesa-dri/oldstable,now 20.3.5-1 amd64 [installed,automatic]
 libgl1/oldstable,now 1.3.2-1 amd64 [installed,automatic]
 libglapi-mesa/oldstable,now 20.3.5-1 amd64 [installed,automatic]
 libglib2.0-0/oldstable-security,oldstable-security,now 2.66.8-1+deb11u3 amd64 [installed]
 libglib2.0-bin/oldstable-security,oldstable-security,now 2.66.8-1+deb11u3 amd64 [installed,automatic]
 libglib2.0-data/oldstable-security,oldstable-security,now 2.66.8-1+deb11u3 all [installed,automatic]
 libglib2.0-dev-bin/oldstable-security,oldstable-security,now 2.66.8-1+deb11u3 amd64 [installed,automatic]
 libglib2.0-dev/oldstable-security,oldstable-security,now 2.66.8-1+deb11u3 amd64 [installed,automatic]
 libglvnd0/oldstable,now 1.3.2-1 amd64 [installed,automatic]
 libglx-mesa0/oldstable,now 20.3.5-1 amd64 [installed,automatic]
 libglx0/oldstable,now 1.3.2-1 amd64 [installed,automatic]
 libgmp10/oldstable,now 2:6.2.1+dfsg-1+deb11u1 amd64 [installed,automatic]
 libgnutls30/oldstable,now 3.7.1-5+deb11u4 amd64 [installed,automatic]
 libgomp1/oldstable,now 10.2.1-6 amd64 [installed]
 libgpg-error0/oldstable,now 1.38-2 amd64 [installed,automatic]
 libgpm2/oldstable,now 1.20.7-8 amd64 [installed,automatic]
 libgraphite2-3/oldstable,now 1.3.14-1 amd64 [installed,automatic]
 libgraphite2-dev/oldstable,now 1.3.14-1 amd64 [installed,automatic]
 libgssapi-krb5-2/oldstable,now 1.18.3-6+deb11u4 amd64 [installed]
 libgtk-3-0/oldstable,now 3.24.24-4+deb11u3 amd64 [installed]
 libgtk-3-bin/oldstable,now 3.24.24-4+deb11u3 amd64 [installed,automatic]
 libgtk-3-common/oldstable,now 3.24.24-4+deb11u3 all [installed,automatic]
 libgtk2.0-0/oldstable,now 2.24.33-2 amd64 [installed,automatic]
 libgtk2.0-bin/oldstable,now 2.24.33-2 amd64 [installed,automatic]
 libgtk2.0-common/oldstable,now 2.24.33-2 all [installed,automatic]
 libgtk2.0-dev/oldstable,now 2.24.33-2 amd64 [installed,automatic]
 libharfbuzz-dev/oldstable,now 2.7.4-1 amd64 [installed,automatic]
 libharfbuzz-gobject0/oldstable,now 2.7.4-1 amd64 [installed,automatic]
 libharfbuzz-icu0/oldstable,now 2.7.4-1 amd64 [installed,automatic]
 libharfbuzz0b/oldstable,now 2.7.4-1 amd64 [installed,automatic]
 libhogweed6/oldstable,now 3.7.3-1 amd64 [installed,automatic]
 libhtml-form-perl/oldstable,now 6.07-1 all [installed,automatic]
 libhtml-format-perl/oldstable,now 2.12-1.1 all [installed,automatic]
 libhtml-parser-perl/oldstable,now 3.75-1+b1 amd64 [installed,automatic]
 libhtml-tagset-perl/oldstable,now 3.20-4 all [installed,automatic]
 libhtml-tree-perl/oldstable,now 5.07-2 all [installed,automatic]
 libhttp-cookies-perl/oldstable,now 6.10-1 all [installed,automatic]
 libhttp-daemon-perl/oldstable,now 6.12-1+deb11u1 all [installed,automatic]
 libhttp-date-perl/oldstable,now 6.05-1 all [installed,automatic]
 libhttp-message-perl/oldstable,now 6.28-1 all [installed,automatic]
 libhttp-negotiate-perl/oldstable,now 6.01-1 all [installed,automatic]
 libice-dev/oldstable,now 2:1.0.10-1 amd64 [installed,automatic]
 libice6/oldstable,now 2:1.0.10-1 amd64 [installed,automatic]
 libicu-dev/oldstable,now 67.1-7 amd64 [installed,automatic]
 libicu67/oldstable,now 67.1-7 amd64 [installed]
 libidn2-0/oldstable,now 2.3.0-5 amd64 [installed,automatic]
 libio-html-perl/oldstable,now 1.004-2 all [installed,automatic]
 libio-socket-ssl-perl/oldstable,now 2.069-1 all [installed,automatic]
 libio-stringy-perl/oldstable,now 2.111-3 all [installed,automatic]
 libip4tc2/oldstable,now 1.8.7-1 amd64 [installed,automatic]
 libipc-system-simple-perl/oldstable,now 1.30-1 all [installed,automatic]
 libisl23/oldstable,now 0.23-1 amd64 [installed,automatic]
 libitm1/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 libjbig0/oldstable,now 2.1-3.1+b2 amd64 [installed,automatic]
 libjpeg62-turbo/oldstable,now 1:2.0.6-4 amd64 [installed,automatic]
 libjq1/oldstable,now 1.6-2.1 amd64 [installed,automatic]
 libjson-c5/oldstable,oldstable-security,oldstable-security,now 0.15-2+deb11u1 amd64 [installed,automatic]
 libjson-glib-1.0-0/oldstable,now 1.6.2-1 amd64 [installed,automatic]
 libjson-glib-1.0-common/oldstable,now 1.6.2-1 all [installed,automatic]
 libk5crypto3/oldstable,now 1.18.3-6+deb11u4 amd64 [installed]
 libkeyutils1/oldstable,now 1.6.1-2 amd64 [installed]
 libkmod2/oldstable,now 28-1 amd64 [installed,automatic]
 libkrb5-3/oldstable,now 1.18.3-6+deb11u4 amd64 [installed]
 libkrb5support0/oldstable,now 1.18.3-6+deb11u4 amd64 [installed]
 libksba8/oldstable,oldstable-security,oldstable-security,now 1.5.0-3+deb11u2 amd64 [installed,automatic]
 liblcms2-2/oldstable,now 2.12~rc1-2 amd64 [installed,automatic]
 libldap-2.4-2/oldstable,oldstable-security,oldstable-security,now 2.4.57+dfsg-3+deb11u1 amd64 [installed,automatic]
 libldap-common/oldstable,oldstable-security,oldstable-security,now 2.4.57+dfsg-3+deb11u1 all [installed,automatic]
 libllvm11/oldstable,now 1:11.0.1-2 amd64 [installed,automatic]
 liblocale-gettext-perl/oldstable,now 1.07-4+b1 amd64 [installed,automatic]
 liblsan0/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 libltdl-dev/oldstable,now 2.4.6-15 amd64 [installed,automatic]
 libltdl7/oldstable,now 2.4.6-15 amd64 [installed,automatic]
 liblttng-ust-ctl4/oldstable,now 2.12.1-1 amd64 [installed,automatic]
 liblttng-ust0/oldstable,now 2.12.1-1 amd64 [installed]
 liblua5.3-0/oldstable,now 5.3.3-1.1+deb11u1 amd64 [installed,automatic]
 liblwp-mediatypes-perl/oldstable,now 6.04-1 all [installed,automatic]
 liblwp-protocol-https-perl/oldstable,now 6.10-1 all [installed,automatic]
 liblz4-1/oldstable,now 1.9.3-2 amd64 [installed]
 liblzma5/oldstable,oldstable-security,oldstable-security,now 5.2.5-2.1~deb11u1 amd64 [installed]
 liblzo2-2/oldstable,now 2.10-2 amd64 [installed]
 libmagic-mgc/oldstable,oldstable-security,oldstable-security,now 1:5.39-3+deb11u1 amd64 [installed,automatic]
 libmagic1/oldstable,oldstable-security,oldstable-security,now 1:5.39-3+deb11u1 amd64 [installed,automatic]
 libmail-sendmail-perl/oldstable,now 0.80-1.1 all [installed,automatic]
 libmailtools-perl/oldstable,now 2.21-1 all [installed,automatic]
 libmariadb-dev-compat/oldstable,now 1:10.5.23-0+deb11u1 amd64 [installed,automatic]
 libmariadb-dev/oldstable,now 1:10.5.23-0+deb11u1 amd64 [installed,automatic]
 libmariadb3/oldstable,now 1:10.5.23-0+deb11u1 amd64 [installed,automatic]
 libmd0/oldstable,now 1.0.3-3 amd64 [installed,automatic]
 libmnl0/oldstable,now 1.0.4-3 amd64 [installed,automatic]
 libmount-dev/oldstable-security,oldstable-security,now 2.36.1-8+deb11u2 amd64 [installed,automatic]
 libmount1/oldstable-security,oldstable-security,now 2.36.1-8+deb11u2 amd64 [installed,automatic]
 libmpc3/oldstable,now 1.2.0-1 amd64 [installed,automatic]
 libmpdec3/oldstable,now 2.5.1-1 amd64 [installed,automatic]
 libmpfr6/oldstable,now 4.1.0-3 amd64 [installed,automatic]
 libncurses6/oldstable,now 6.2+20201114-2+deb11u2 amd64 [installed,automatic]
 libncursesw6/oldstable,now 6.2+20201114-2+deb11u2 amd64 [installed]
 libnet-dbus-perl/oldstable,now 1.2.0-1+b1 amd64 [installed,automatic]
 libnet-http-perl/oldstable,now 6.20-1 all [installed,automatic]
 libnet-smtp-ssl-perl/oldstable,now 1.04-1 all [installed,automatic]
 libnet-ssleay-perl/oldstable,now 1.88-3+b1 amd64 [installed,automatic]
 libnettle8/oldstable,now 3.7.3-1 amd64 [installed,automatic]
 libnghttp2-14/oldstable,oldstable-security,oldstable-security,now 1.43.0-1+deb11u1 amd64 [installed,automatic]
 libnginx-mod-http-geoip/oldstable,oldstable-security,oldstable-security,now 1.18.0-6.1+deb11u3 amd64 [installed,automatic]
 libnginx-mod-http-image-filter/oldstable,oldstable-security,oldstable-security,now 1.18.0-6.1+deb11u3 amd64 [installed,automatic]
 libnginx-mod-http-xslt-filter/oldstable,oldstable-security,oldstable-security,now 1.18.0-6.1+deb11u3 amd64 [installed,automatic]
 libnginx-mod-mail/oldstable,oldstable-security,oldstable-security,now 1.18.0-6.1+deb11u3 amd64 [installed,automatic]
 libnginx-mod-stream-geoip/oldstable,oldstable-security,oldstable-security,now 1.18.0-6.1+deb11u3 amd64 [installed,automatic]
 libnginx-mod-stream/oldstable,oldstable-security,oldstable-security,now 1.18.0-6.1+deb11u3 amd64 [installed,automatic]
 libnpth0/oldstable,now 1.6-3 amd64 [installed,automatic]
 libnsl-dev/oldstable,now 1.3.0-2 amd64 [installed,automatic]
 libnsl2/oldstable,now 1.3.0-2 amd64 [installed]
 libnspr4/oldstable,now 2:4.29-1 amd64 [installed]
 libnss-systemd/oldstable,oldstable-updates,now 247.3-7+deb11u4 amd64 [installed,automatic]
 libnss3/oldstable,oldstable-security,oldstable-security,now 2:3.61-1+deb11u3 amd64 [installed]
 libnuma1/oldstable,now 2.0.12-1+b1 amd64 [installed,automatic]
 libodbc1/bullseye,now 2.3.11-3 amd64 [installed,automatic]
 libonig5/oldstable,now 6.9.6-1.1 amd64 [installed,automatic]
 libp11-kit0/oldstable,now 0.23.22-1 amd64 [installed,automatic]
 libpam-cap/oldstable,now 1:2.44-1 amd64 [installed,automatic]
 libpam-modules-bin/oldstable,now 1.4.0-9+deb11u1 amd64 [installed,automatic]
 libpam-modules/oldstable,now 1.4.0-9+deb11u1 amd64 [installed,automatic]
 libpam-runtime/oldstable,now 1.4.0-9+deb11u1 all [installed,automatic]
 libpam-systemd/oldstable,oldstable-updates,now 247.3-7+deb11u4 amd64 [installed,automatic]
 libpam0g/oldstable,now 1.4.0-9+deb11u1 amd64 [installed,automatic]
 libpango-1.0-0/oldstable,now 1.46.2-3 amd64 [installed]
 libpango1.0-dev/oldstable,now 1.46.2-3 amd64 [installed,automatic]
 libpangocairo-1.0-0/oldstable,now 1.46.2-3 amd64 [installed]
 libpangoft2-1.0-0/oldstable,now 1.46.2-3 amd64 [installed,automatic]
 libpangoxft-1.0-0/oldstable,now 1.46.2-3 amd64 [installed,automatic]
 libpciaccess0/oldstable,now 0.16-1 amd64 [installed,automatic]
 libpcre16-3/oldstable,now 2:8.39-13 amd64 [installed,automatic]
 libpcre2-16-0/oldstable,now 10.36-2+deb11u1 amd64 [installed,automatic]
 libpcre2-32-0/oldstable,now 10.36-2+deb11u1 amd64 [installed,automatic]
 libpcre2-8-0/oldstable,now 10.36-2+deb11u1 amd64 [installed,automatic]
 libpcre2-dev/oldstable,now 10.36-2+deb11u1 amd64 [installed,automatic]
 libpcre2-posix2/oldstable,now 10.36-2+deb11u1 amd64 [installed,automatic]
 libpcre3-dev/oldstable,now 2:8.39-13 amd64 [installed,automatic]
 libpcre32-3/oldstable,now 2:8.39-13 amd64 [installed,automatic]
 libpcre3/oldstable,now 2:8.39-13 amd64 [installed,automatic]
 libpcrecpp0v5/oldstable,now 2:8.39-13 amd64 [installed,automatic]
 libperl5.32/oldstable,now 5.32.1-4+deb11u3 amd64 [installed,automatic]
 libpipeline1/oldstable,now 1.5.3-1 amd64 [installed,automatic]
 libpixman-1-0/oldstable,oldstable-security,oldstable-security,now 0.40.0-1.1~deb11u1 amd64 [installed,automatic]
 libpixman-1-dev/oldstable,oldstable-security,oldstable-security,now 0.40.0-1.1~deb11u1 amd64 [installed,automatic]
 libpng-dev/oldstable,now 1.6.37-3 amd64 [installed,automatic]
 libpng-tools/oldstable,now 1.6.37-3 amd64 [installed,automatic]
 libpng16-16/oldstable,now 1.6.37-3 amd64 [installed,automatic]
 libprocps8/oldstable,now 2:3.3.17-5 amd64 [installed,automatic]
 libproxy1v5/oldstable,now 0.4.17-1 amd64 [installed,automatic]
 libpsl5/oldstable,now 0.21.0-1.2 amd64 [installed,automatic]
 libpthread-stubs0-dev/oldstable,now 0.4-1 amd64 [installed,automatic]
 libpython3-stdlib/oldstable,now 3.9.2-3 amd64 [installed,automatic]
 libpython3.9-minimal/oldstable,now 3.9.2-1 amd64 [installed,automatic]
 libpython3.9-stdlib/oldstable,now 3.9.2-1 amd64 [installed,automatic]
 libquadmath0/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 libreadline8/oldstable,now 8.1-1 amd64 [installed]
 librest-0.7-0/oldstable,now 0.8.1-1.1 amd64 [installed,automatic]
 librsvg2-2/oldstable,oldstable-security,oldstable-security,now 2.50.3+dfsg-1+deb11u1 amd64 [installed,automatic]
 librsvg2-common/oldstable,oldstable-security,oldstable-security,now 2.50.3+dfsg-1+deb11u1 amd64 [installed,automatic]
 librtmp1/oldstable,now 2.4+20151223.gitfa8646d.1-2+b2 amd64 [installed,automatic]
 libsasl2-2/oldstable,oldstable-security,oldstable-security,now 2.1.27+dfsg-2.1+deb11u1 amd64 [installed,automatic]
 libsasl2-modules-db/oldstable,oldstable-security,oldstable-security,now 2.1.27+dfsg-2.1+deb11u1 amd64 [installed,automatic]
 libsasl2-modules/oldstable,oldstable-security,oldstable-security,now 2.1.27+dfsg-2.1+deb11u1 amd64 [installed,automatic]
 libseccomp2/oldstable,now 2.5.1-1+deb11u1 amd64 [installed,automatic]
 libselinux1-dev/oldstable,now 3.1-3 amd64 [installed,automatic]
 libselinux1/oldstable,now 3.1-3 amd64 [installed,automatic]
 libsemanage-common/oldstable,now 3.1-1 all [installed,automatic]
 libsemanage1/oldstable,now 3.1-1+b2 amd64 [installed,automatic]
 libsensors-config/oldstable,now 1:3.6.0-7 all [installed,automatic]
 libsensors5/oldstable,now 1:3.6.0-7 amd64 [installed,automatic]
 libsepol1-dev/oldstable,now 3.1-1 amd64 [installed,automatic]
 libsepol1/oldstable,now 3.1-1 amd64 [installed,automatic]
 libsigsegv2/oldstable,now 2.13-1 amd64 [installed,automatic]
 libsm-dev/oldstable,now 2:1.2.3-1 amd64 [installed,automatic]
 libsm6/oldstable,now 2:1.2.3-1 amd64 [installed]
 libsmartcols1/oldstable-security,oldstable-security,now 2.36.1-8+deb11u2 amd64 [installed,automatic]
 libsoup-gnome2.4-1/oldstable,now 2.72.0-2 amd64 [installed,automatic]
 libsoup2.4-1/oldstable,now 2.72.0-2 amd64 [installed,automatic]
 libsqlite3-0/oldstable,now 3.34.1-3 amd64 [installed]
 libss2/oldstable,now 1.46.2-2 amd64 [installed,automatic]
 libssh2-1/oldstable,now 1.9.0-2 amd64 [installed,automatic]
 libssl-dev/oldstable,now 1.1.1w-0+deb11u1 amd64 [installed,automatic]
 libssl1.1/oldstable,now 1.1.1w-0+deb11u1 amd64 [installed]
 libstdc++-10-dev/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 libstdc++6/oldstable,now 10.2.1-6 amd64 [installed]
 libsub-override-perl/oldstable,now 0.09-2 all [installed,automatic]
 libsys-hostname-long-perl/oldstable,now 1.5-2 all [installed,automatic]
 libsystemd0/oldstable,oldstable-updates,now 247.3-7+deb11u4 amd64 [installed,automatic]
 libtasn1-6/oldstable,now 4.16.0-2+deb11u1 amd64 [installed,automatic]
 libtext-iconv-perl/oldstable,now 1.7-7+b1 amd64 [installed,automatic]
 libthai-data/oldstable,now 0.1.28-3 all [installed,automatic]
 libthai-dev/oldstable,now 0.1.28-3 amd64 [installed,automatic]
 libthai0/oldstable,now 0.1.28-3 amd64 [installed,automatic]
 libtie-ixhash-perl/oldstable,now 1.23-2.1 all [installed,automatic]
 libtiff5/oldstable,oldstable-security,oldstable-security,now 4.2.0-1+deb11u5 amd64 [installed,automatic]
 libtimedate-perl/oldstable,now 2.3300-2 all [installed,automatic]
 libtinfo6/oldstable,now 6.2+20201114-2+deb11u2 amd64 [installed]
 libtirpc-common/oldstable,oldstable-security,oldstable-security,now 1.3.1-1+deb11u1 all [installed,automatic]
 libtirpc-dev/oldstable,oldstable-security,oldstable-security,now 1.3.1-1+deb11u1 amd64 [installed,automatic]
 libtirpc3/oldstable,oldstable-security,oldstable-security,now 1.3.1-1+deb11u1 amd64 [installed]
 libtool/oldstable,now 2.4.6-15 all [installed,automatic]
 libtry-tiny-perl/oldstable,now 0.30-1 all [installed,automatic]
 libtsan0/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 libubsan1/oldstable,now 10.2.1-6 amd64 [installed,automatic]
 libuchardet0/oldstable,now 0.0.7-1 amd64 [installed,automatic]
 libudev1/oldstable,oldstable-updates,now 247.3-7+deb11u4 amd64 [installed,automatic]
 libunistring2/oldstable,now 0.9.10-4 amd64 [installed,automatic]
 libunwind8/oldstable,now 1.3.2-2 amd64 [installed,automatic]
 liburcu6/oldstable,now 0.12.2-1 amd64 [installed,automatic]
 liburi-perl/oldstable,now 5.08-1 all [installed,automatic]
 libuuid1/oldstable-security,oldstable-security,now 2.36.1-8+deb11u2 amd64 [installed]
 libvte-2.91-0/oldstable,now 0.62.3-1 amd64 [installed,automatic]
 libvte-2.91-common/oldstable,now 0.62.3-1 amd64 [installed,automatic]
 libvulkan1/oldstable,now 1.2.162.0-1 amd64 [installed,automatic]
 libwayland-client0/oldstable,now 1.18.0-2~exp1.1 amd64 [installed,automatic]
 libwayland-cursor0/oldstable,now 1.18.0-2~exp1.1 amd64 [installed,automatic]
 libwayland-egl1/oldstable,now 1.18.0-2~exp1.1 amd64 [installed,automatic]
 libwayland-server0/oldstable,now 1.18.0-2~exp1.1 amd64 [installed,automatic]
 libwebp6/oldstable,oldstable-security,oldstable-security,now 0.6.1-2.1+deb11u2 amd64 [installed,automatic]
 libwww-perl/oldstable,now 6.52-1 all [installed,automatic]
 libwww-robotrules-perl/oldstable,now 6.02-1 all [installed,automatic]
 libx11-6/oldstable,oldstable-security,oldstable-security,now 2:1.7.2-1+deb11u2 amd64 [installed]
 libx11-data/oldstable,oldstable-security,oldstable-security,now 2:1.7.2-1+deb11u2 all [installed,automatic]
 libx11-dev/oldstable,oldstable-security,oldstable-security,now 2:1.7.2-1+deb11u2 amd64 [installed,automatic]
 libx11-protocol-perl/oldstable,now 0.56-7.1 all [installed,automatic]
 libx11-xcb1/oldstable,oldstable-security,oldstable-security,now 2:1.7.2-1+deb11u2 amd64 [installed]
 libxau-dev/oldstable,now 1:1.0.9-1 amd64 [installed,automatic]
 libxau6/oldstable,now 1:1.0.9-1 amd64 [installed,automatic]
 libxaw7/oldstable,now 2:1.0.13-1.1 amd64 [installed,automatic]
 libxcb-dri2-0/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-dri3-0/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-glx0/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-present0/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-randr0/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-render0-dev/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-render0/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-shape0/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-shm0-dev/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-shm0/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-sync1/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb-xfixes0/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb1-dev/oldstable,now 1.14-3 amd64 [installed,automatic]
 libxcb1/oldstable,now 1.14-3 amd64 [installed]
 libxcomposite-dev/oldstable,now 1:0.4.5-1 amd64 [installed,automatic]
 libxcomposite1/oldstable,now 1:0.4.5-1 amd64 [installed]
 libxcursor-dev/oldstable,now 1:1.2.0-2 amd64 [installed,automatic]
 libxcursor1/oldstable,now 1:1.2.0-2 amd64 [installed]
 libxdamage-dev/oldstable,now 1:1.1.5-2 amd64 [installed,automatic]
 libxdamage1/oldstable,now 1:1.1.5-2 amd64 [installed]
 libxdmcp-dev/oldstable,now 1:1.1.2-3 amd64 [installed,automatic]
 libxdmcp6/oldstable,now 1:1.1.2-3 amd64 [installed,automatic]
 libxext-dev/oldstable,now 2:1.3.3-1.1 amd64 [installed,automatic]
 libxext6/oldstable,now 2:1.3.3-1.1 amd64 [installed]
 libxfixes-dev/oldstable,now 1:5.0.3-2 amd64 [installed,automatic]
 libxfixes3/oldstable,now 1:5.0.3-2 amd64 [installed]
 libxfont2/oldstable,now 1:2.0.4-1 amd64 [installed,automatic]
 libxft-dev/oldstable,now 2.3.2-2 amd64 [installed,automatic]
 libxft2/oldstable,now 2.3.2-2 amd64 [installed,automatic]
 libxi-dev/oldstable,now 2:1.7.10-1 amd64 [installed,automatic]
 libxi6/oldstable,now 2:1.7.10-1 amd64 [installed]
 libxinerama-dev/oldstable,now 2:1.1.4-2 amd64 [installed,automatic]
 libxinerama1/oldstable,now 2:1.1.4-2 amd64 [installed,automatic]
 libxkbcommon0/oldstable,now 1.0.3-2 amd64 [installed,automatic]
 libxkbfile1/oldstable,now 1:1.1.0-1 amd64 [installed,automatic]
 libxml-parser-perl/oldstable,now 2.46-2 amd64 [installed,automatic]
 libxml-twig-perl/oldstable,now 1:3.52-1 all [installed,automatic]
 libxml-xpathengine-perl/oldstable,now 0.14-1 all [installed,automatic]
 libxml2-utils/oldstable,oldstable-security,oldstable-security,now 2.9.10+dfsg-6.7+deb11u4 amd64 [installed,automatic]
 libxml2/oldstable,oldstable-security,oldstable-security,now 2.9.10+dfsg-6.7+deb11u4 amd64 [installed,automatic]
 libxmu6/oldstable,now 2:1.1.2-2+b3 amd64 [installed,automatic]
 libxmuu1/oldstable,now 2:1.1.2-2+b3 amd64 [installed,automatic]
 libxpm4/oldstable,oldstable-security,oldstable-security,now 1:3.5.12-1.1+deb11u1 amd64 [installed,automatic]
 libxrandr-dev/oldstable,now 2:1.5.1-1 amd64 [installed,automatic]
 libxrandr2/oldstable,now 2:1.5.1-1 amd64 [installed]
 libxrender-dev/oldstable,now 1:0.9.10-1 amd64 [installed]
 libxrender1/oldstable,now 1:0.9.10-1 amd64 [installed]
 libxshmfence1/oldstable,now 1.3-1 amd64 [installed,automatic]
 libxslt1.1/oldstable,oldstable-security,oldstable-security,now 1.1.34-4+deb11u1 amd64 [installed,automatic]
 libxss1/oldstable,now 1:1.2.3-1 amd64 [installed]
 libxt6/oldstable,now 1:1.2.0-1 amd64 [installed,automatic]
 libxtables12/oldstable,now 1.8.7-1 amd64 [installed,automatic]
 libxtst6/oldstable,now 2:1.2.3-1 amd64 [installed]
 libxv1/oldstable,now 2:1.0.11-1 amd64 [installed,automatic]
 libxxf86dga1/oldstable,now 2:1.1.4-1+b3 amd64 [installed,automatic]
 libxxf86vm1/oldstable,now 1:1.1.4-1+b2 amd64 [installed,automatic]
 libxxhash0/oldstable,now 0.8.0-2 amd64 [installed,automatic]
 libz3-4/oldstable,now 4.8.10-1 amd64 [installed,automatic]
 libzip4/oldstable,now 1.7.3-1 amd64 [installed,automatic]
 libzstd1/oldstable,now 1.4.8+dfsg-2.1 amd64 [installed,automatic]
 linux-libc-dev/oldstable-security,oldstable-security,now 5.10.216-1 amd64 [installed,automatic]
 locales/oldstable-security,oldstable-security,now 2.31-13+deb11u10 all [installed]
 login/oldstable,now 1:4.8.1-1 amd64 [installed,automatic]
 logsave/oldstable,now 1.46.2-2 amd64 [installed,automatic]
 lsb-base/oldstable,now 11.1.0 all [installed,automatic]
 lsb-release/oldstable,now 11.1.0 all [installed]
 m4/oldstable,now 1.4.18-5 amd64 [installed,automatic]
 make/oldstable,now 4.3-4.1 amd64 [installed,automatic]
 man-db/oldstable,now 2.9.4-2 amd64 [installed,automatic]
 manpages-dev/oldstable,now 5.10-1 all [installed,automatic]
 manpages/oldstable,now 5.10-1 all [installed,automatic]
 mariadb-common/oldstable,now 1:10.5.23-0+deb11u1 all [installed,automatic]
 mawk/oldstable,now 1.3.4.20200120-2 amd64 [installed,automatic]
 media-types/oldstable,now 4.0.0 all [installed,automatic]
 mesa-vulkan-drivers/oldstable,now 20.3.5-1 amd64 [installed,automatic]
 mount/oldstable-security,oldstable-security,now 2.36.1-8+deb11u2 amd64 [installed,automatic]
 msodbcsql17/bullseye,now 17.10.6.1-1 amd64 [installed]
 mssql-tools/bullseye,now 17.10.1.1-1 amd64 [installed]
 mysql-common/oldstable,now 5.8+1.0.7 all [installed,automatic]
 ncurses-base/oldstable,now 6.2+20201114-2+deb11u2 all [installed,automatic]
 ncurses-bin/oldstable,now 6.2+20201114-2+deb11u2 amd64 [installed,automatic]
 netbase/oldstable,now 6.3 all [installed]
 nginx-common/oldstable,oldstable-security,oldstable-security,now 1.18.0-6.1+deb11u3 all [installed,automatic]
 nginx-core/oldstable,oldstable-security,oldstable-security,now 1.18.0-6.1+deb11u3 amd64 [installed,automatic]
 nginx/oldstable,oldstable-security,oldstable-security,now 1.18.0-6.1+deb11u3 all [installed]
 nodejs/unknown,now 14.21.3-deb-1nodesource1 amd64 [installed]
 odbcinst1debian2/bullseye,now 2.3.11-3 amd64 [installed,automatic]
 odbcinst/bullseye,now 2.3.11-3 amd64 [installed,automatic]
 openssl/oldstable,now 1.1.1w-0+deb11u1 amd64 [installed,automatic]
 pango1.0-tools/oldstable,now 1.46.2-3 amd64 [installed,automatic]
 passwd/oldstable,now 1:4.8.1-1 amd64 [installed,automatic]
 patch/oldstable,now 2.7.6-7 amd64 [installed,automatic]
 perl-base/oldstable,now 5.32.1-4+deb11u3 amd64 [installed,automatic]
 perl-modules-5.32/oldstable,now 5.32.1-4+deb11u3 all [installed,automatic]
 perl-openssl-defaults/oldstable,now 5 amd64 [installed,automatic]
 perl/oldstable,now 5.32.1-4+deb11u3 amd64 [installed,automatic]
 pinentry-curses/oldstable,now 1.1.0-4 amd64 [installed,automatic]
 pkg-config/oldstable,now 0.29.2-1 amd64 [installed,automatic]
 po-debconf/oldstable,now 1.0.21+nmu1 all [installed,automatic]
 procps/oldstable,now 2:3.3.17-5 amd64 [installed]
 psmisc/oldstable,now 23.4-2 amd64 [installed,automatic]
 publicsuffix/oldstable,now 20220811.1734-0+deb11u1 all [installed,automatic]
 python3-distutils/oldstable,now 3.9.2-1 all [installed,automatic]
 python3-lib2to3/oldstable,now 3.9.2-1 all [installed,automatic]
 python3-minimal/oldstable,now 3.9.2-3 amd64 [installed,automatic]
 python3.9-minimal/oldstable,now 3.9.2-1 amd64 [installed,automatic]
 python3.9/oldstable,now 3.9.2-1 amd64 [installed,automatic]
 python3/oldstable,now 3.9.2-3 amd64 [installed,automatic]
 readline-common/oldstable,now 8.1-1 all [installed,automatic]
 sed/oldstable,now 4.7-1 amd64 [installed,automatic]
 sensible-utils/oldstable,now 0.0.14 all [installed,automatic]
 shared-mime-info/oldstable,now 2.0-1 amd64 [installed,automatic]
 squashfs-tools/oldstable,oldstable-security,oldstable-security,now 1:4.4-2+deb11u2 amd64 [installed]
 sudo/oldstable,oldstable-security,oldstable-security,now 1.9.5p2-3+deb11u1 amd64 [installed]
 systemd-sysv/oldstable,oldstable-updates,now 247.3-7+deb11u4 amd64 [installed,automatic]
 systemd-timesyncd/oldstable,oldstable-updates,now 247.3-7+deb11u4 amd64 [installed,automatic]
 systemd/oldstable,oldstable-updates,now 247.3-7+deb11u4 amd64 [installed,automatic]
 sysvinit-utils/oldstable,now 2.96-7+deb11u1 amd64 [installed,automatic]
 tar/oldstable,now 1.34+dfsg-1+deb11u1 amd64 [installed,automatic]
 termit/oldstable,now 3.1-1 amd64 [installed,automatic]
 tzdata/oldstable,now 2024a-0+deb11u1 all [installed]
 ucf/oldstable,now 3.0043 all [installed,automatic]
 unixodbc/bullseye,now 2.3.11-3 amd64 [installed]
 unzip/oldstable,oldstable-security,oldstable-security,now 6.0-26+deb11u1 amd64 [installed]
 util-linux/oldstable-security,oldstable-security,now 2.36.1-8+deb11u2 amd64 [installed,automatic]
 uuid-dev/oldstable-security,oldstable-security,now 2.36.1-8+deb11u2 amd64 [installed,automatic]
 wget/oldstable,now 1.21-1+deb11u1 amd64 [installed]
 x11-common/oldstable,now 1:7.7+22 all [installed,automatic]
 x11-utils/oldstable,now 7.7+5 amd64 [installed,automatic]
 x11-xkb-utils/oldstable,now 7.7+5 amd64 [installed,automatic]
 x11-xserver-utils/oldstable,now 7.7+8 amd64 [installed,automatic]
 x11proto-dev/oldstable,now 2020.1-1 all [installed,automatic]
 x11proto-input-dev/oldstable,now 2020.1-1 all [installed,automatic]
 x11proto-randr-dev/oldstable,now 2020.1-1 all [installed,automatic]
 x11proto-xext-dev/oldstable,now 2020.1-1 all [installed,automatic]
 x11proto-xinerama-dev/oldstable,now 2020.1-1 all [installed,automatic]
 xauth/oldstable,now 1:1.1-1 amd64 [installed,automatic]
 xdg-user-dirs/oldstable,now 0.17-2 amd64 [installed,automatic]
 xdg-utils/oldstable,now 1.1.3-4.1 all [installed]
 xfonts-base/oldstable,now 1:1.0.5 all [installed,automatic]
 xfonts-encodings/oldstable,now 1:1.0.4-2.1 all [installed,automatic]
 xfonts-utils/oldstable,now 1:7.7+6 amd64 [installed,automatic]
 xkb-data/oldstable,now 2.29-2 all [installed,automatic]
 xorg-sgml-doctools/oldstable,now 1:1.11-1.1 all [installed,automatic]
 xserver-common/oldstable-security,oldstable-security,now 2:1.20.11-1+deb11u13 all [installed,automatic]
 xtrans-dev/oldstable,now 1.4.0-1 all [installed,automatic]
 xvfb/oldstable-security,oldstable-security,now 2:1.20.11-1+deb11u13 amd64 [installed]
 xz-utils/oldstable,oldstable-security,oldstable-security,now 5.2.5-2.1~deb11u1 amd64 [installed,automatic]
 zlib1g-dev/oldstable,oldstable-security,oldstable-security,now 1:1.2.11.dfsg-2+deb11u2 amd64 [installed,automatic]
 zlib1g/oldstable,oldstable-security,oldstable-security,now 1:1.2.11.dfsg-2+deb11u2 amd64 [installed]


uname -a
Linux SandboxHost-638586683115116529 5.10.102.2-microsoft-standard #1 SMP Mon Mar 7 17:36:34 UTC 2022 x86_64 GNU/Linux

### Issues

1. 7.4 PS core is failing
2. Docker based azure function is not available in basic tiers
3. MSI_ENDPOINT is different on azure function (probably also on webapp) than on VM
   1. https://learn.microsoft.com/en-us/azure/app-service/overview-managed-identity?tabs=portal%2Cpython#obtain-tokens-for-azure-resources
      1. client_id needs to provided when user assigned identity is used
   2. https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-to-use-vm-token
4. core tools only for x64 linux, and packaged only for debian
5. debian 11
6. function runs in a container as nonroot/nonsudo user
7. Timeout 230s - 4 mins
   1. https://learn.microsoft.com/en-us/azure/azure-functions/functions-scale#timeout
8. 2vcpus, 2gb RAM
9. `az login --identity` uses accesstoken underneath but it's not available as standalone option
   1.  https://github.com/Azure/azure-cli/issues/28484
   2.  https://github.com/Azure/azure-cli/blob/7748d5066e2feecde225a27aac03a438733baf71/src/azure-cli-core/azure/cli/core/auth/util.py#L170
   3.  https://github.com/Azure/azure-cli/blob/7748d5066e2feecde225a27aac03a438733baf71/src/azure-cli-core/azure/cli/core/_profile.py#L727


https://github.com/antstanley/msilocal/blob/master/src/fetchToken.js

pip3 install --no-dependencies azure-cli && pip3 install azure-cli-core azure-common azure-mgmt-resource
