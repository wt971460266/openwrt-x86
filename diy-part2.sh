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
# 下面是修改feeds.conf.default并加入如下内容
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
#echo 'src-git ddnsgo https://github.com/sirpdboy/luci-app-ddns-go' >>feeds.conf.default
# 下面是直接拉取
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
# 更新
./scripts/feeds update -a
./scripts/feeds install -a
# 更新
# ./scripts/feeds update -a && ./scripts/feeds install -a
# Modify default IP
sed -i 's/192.168.1.1/192.168.101.251/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci/Makefile
