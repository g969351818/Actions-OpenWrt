# Actions-OpenWrt

借助 GitHub Actions 自动编译 OpenWrt 固件。

## 支持设备

| 设备 | 源码 | 平台 | 架构 |
|------|------|------|------|
| Phicomm K3 | ImmortalWrt | bcm53xx | BCM4908 |
| 玩客云 (OneCloud) | ImmortalWrt | meson8b | S805 |
| x86_64 软路由 | ImmortalWrt | x86_64 | amd64 |
| JDCloud AX1800 Pro / AX6600 | Lean's LEDE | qualcommax | IPQ60xx |

## 使用方法

1. Fork 本仓库
2. 进入 Actions 页面
3. 选择对应的 workflow
4. 点击 "Run workflow"
5. 等待编译完成，在 Artifacts 或 Releases 中下载固件

## 目录结构

```
.
├── .github/workflows/
│   ├── build-openwrt.yml      # 通用编译工作流
│   ├── phicomm-k3.yml
│   ├── onecloud.yml
│   ├── x86-64.yml
│   ├── jdcloud-ax1800-pro.yml
│   └── delete-older-releases.yml
├── phicomm-k3/
│   ├── .config
│   ├── diy-part1.sh
│   └── diy-part2.sh
├── onecloud/
│   └── ...
├── x86-64/
│   └── ...
├── jdcloud-ax1800-pro/
│   ├── .config
│   ├── diy-part1.sh
│   ├── diy-part2.sh
│   └── jdcloud-ax1800-pro.patch
├── feeds.conf.default
└── README.md
```

## 感谢

- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
- [immortalwrt/immortalwrt](https://github.com/immortalwrt/immortalwrt)
- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
