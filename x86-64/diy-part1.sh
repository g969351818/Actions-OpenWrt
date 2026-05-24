#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# ============================================================
# 说明: 此脚本在 feeds update 之前执行
# 主要用途: 添加第三方软件包源
# ============================================================

# Add a feed source
# kenzok8/openwrt-packages - 包含大量热门LuCI插件
git clone https://github.com/kenzok8/openwrt-packages package/kenzo
# kenzok8/small - 小型补充软件包
git clone https://github.com/kenzok8/small package/small

# luci-theme-argon - 最受欢迎的第三方主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# istore - 应用商店插件
git clone https://github.com/linkease/istore.git package/istore

# easytier - 异地组网工具
git clone https://github.com/EasyTier/luci-app-easytier.git package/luci-app-easytier
