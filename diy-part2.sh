#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

#删除原来的argon
rm -rf  package/lean/luci-theme-argon

#添加老竭力的argon主题
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

#添加老竭力的argon.config
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config

sed -i 's/set wireless.default_radio${devidx}.ssid=OpenWrt/set wireless.default_radio0.ssid=RT-ACRH17/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

sed -i '/set wireless.default_radio0.ssid=RT-ACRH17/a\ set wireless.default_radio1.ssid=HS-ACRH17' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#sed -i 's/set wireless.default_radio${devidx}.ssid=OpenWrt/set wireless.default_radio0.ssid=OpenWrt 2.4G/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#sed -i '/set wireless.default_radio0.ssid=OpenWrt 2.4G/a\set wireless.default_radio1.ssid=RT-ACRH17 5G' package/kernel/mac80211/files/lib/wifi/mac80211.sh
