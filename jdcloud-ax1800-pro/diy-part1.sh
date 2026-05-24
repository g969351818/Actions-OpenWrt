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
# 主要用途: 添加第三方软件包源, 使其包含在 feeds 更新和安装过程中
# ============================================================

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# kenzok8/openwrt-packages - 包含大量热门LuCI插件
#   如: OpenClash, PassWall, SSR Plus, Lucky, DDNS Go, 微信推送等
git clone https://github.com/kenzok8/openwrt-packages package/kenzo
# kenzok8/small - 小型补充软件包
#   如: 部分依赖库和工具软件
git clone https://github.com/kenzok8/small package/small

# -------------------- 添加 luci-theme-argon 主题 --------------------
# luci-theme-argon - 最受欢迎的第三方主题, 支持自定义背景/透明度/模糊效果
# 注意: LEDE 源码需使用 18.06 分支
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# luci-app-argon-config - Argon 主题配置插件
#   功能: 在 LuCI 中调整主题颜色/背景/透明度/模糊度等
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# -------------------- 添加其他必备插件源 --------------------
# istore - 应用商店插件 (提供图形化软件包管理)
# 注意: istore 需要特定的 feeds 源支持，LEDE 可能需要额外适配
git clone https://github.com/linkease/istore.git package/istore
# easytier - 异地组网工具 (类似 ZeroTier 的虚拟组网方案)
git clone https://github.com/EasyTier/luci-app-easytier.git package/luci-app-easytier
