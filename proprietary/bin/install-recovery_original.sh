#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 12623872 469b42a65eda5b8832c8f432a86b84d3a5994ed5 8896512 638c762fe912d719dfe13611a27687724649bcc8
fi

if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:12623872:469b42a65eda5b8832c8f432a86b84d3a5994ed5; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:8896512:638c762fe912d719dfe13611a27687724649bcc8 EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery 469b42a65eda5b8832c8f432a86b84d3a5994ed5 12623872 638c762fe912d719dfe13611a27687724649bcc8:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
