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
# ============================================================
# 说明: 此脚本在 feeds update 和 config 加载之后执行
# 主要用途: 下载预编译内核/固件, 修改默认设置等编译前的最后调整
# ============================================================

# -------------------- 修改默认IP地址 --------------------
# 作用: 修改路由器默认登录IP地址
# 默认: 192.168.1.1
# 示例: 将默认IP改为 192.168.50.5
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# -------------------- 修改默认主机名 --------------------
# 作用: 修改路由器默认主机名(显示在浏览器标签和终端提示符)
# 默认: OpenWrt
# 示例: 将主机名改为 JDCloud
#sed -i 's/hostname=.*/hostname=JDCloud/g' package/base-files/files/bin/config_generate

# -------------------- 修改默认时区 --------------------
# 作用: 修改路由器默认时区
# 默认: UTC
# 示例: 改为中国标准时间(CST-8)
#sed -i "s/'UTC'/'CST-8'/g" package/base-files/files/bin/config_generate

# -------------------- 修改默认用户名和密码 --------------------
# 作用: 修改root用户的默认密码
# 默认: 无密码(首次登录强制设置)
# 说明: OpenWrt默认无密码,首次登录需设置。如需预设密码,使用以下方法:
#
# 方法1: 使用明文密码(不推荐,密码会明文存储在固件中)
#sed -i 's/root::0:0:99999:7:::/root:你的明文密码:0:0:99999:7:::/g' package/base-files/files/etc/shadow
#
# 方法2: 使用加密密码(推荐)
# 步骤:
# 1. 在Linux系统中使用 openssl 生成加密密码:
#    openssl passwd -1 你的密码
#    输出示例: $1$xyz123$abc456def789
# 2. 将加密后的字符串填入:
#sed -i 's/root::0:0:99999:7:::/root:$1$xyz123$abc456def789:0:0:99999:7:::/g' package/base-files/files/etc/shadow
#
# 注意: 修改密码后首次登录仍需输入密码,只是不需要再设置新密码

# -------------------- 设置默认主题 --------------------
# 作用: 将 luci-theme-argon 设置为默认主题
# 说明: 修改 feeds/luci/collections/luci/Makefile, 将默认主题从 bootstrap 改为 argon
# 注意: 必须在 feeds install 之后执行, 否则文件不存在
# 由于 .config 中已只保留 argon 主题，此处必须设置 argon 为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
# 同时修改默认登录页面背景为 argon 主题样式
sed -i 's/ Bootstrap theme/ Argon theme/g' feeds/luci/collections/luci/Makefile

##----------------- 下载 OpenClash Meta 内核 -----------------
## OpenClash 需要配合 Clash 内核才能工作
## Meta 内核支持更多协议 (如 TUIC/Hysteria/Reality 等)
## arm64 架构对应高通 IPQ60xx 平台
curl -sL -m 30 --retry 2 https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz -o /tmp/clash.tar.gz
tar zxvf /tmp/clash.tar.gz -C /tmp >/dev/null 2>&1
chmod +x /tmp/clash >/dev/null 2>&1
mkdir -p package/kenzo/luci-app-openclash/root/etc/openclash/core
mv /tmp/clash package/kenzo/luci-app-openclash/root/etc/openclash/core/clash_meta >/dev/null 2>&1
rm -rf /tmp/clash.tar.gz >/dev/null 2>&1
