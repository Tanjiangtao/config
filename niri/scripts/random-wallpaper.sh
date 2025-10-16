#!/bin/bash

# -------------- 配置部分 --------------
# 1. 替换为你的壁纸目录（绝对路径）
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
# 检查壁纸目录是否存在
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "错误：壁纸目录 $WALLPAPER_DIR 不存在！"
    exit 1
fi

# 从目录中随机选择一张壁纸（支持 jpg/png 格式，可扩展其他格式）
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

# 检查是否找到壁纸
if [ -z "$WALLPAPER" ]; then
    echo "错误：在 $WALLPAPER_DIR 中未找到 jpg/png 格式的壁纸！"
    exit 1
fi

# 获取当前连接的屏幕
SCREENS=$(wlr-randr | grep -oP '^\S+' | grep -E 'eDP-1|HDMI-A-1')

# 检查是否有屏幕可用
if [ -z "$SCREENS" ]; then
    echo "错误：未检测到任何屏幕！"
    exit 1
fi

# 遍历所有检测到的屏幕并设置壁纸
while IFS= read -r screen; do
    echo "为屏幕 $screen 设置壁纸：$WALLPAPER"
    qs -c noctalia-shell ipc call wallpaper set "$WALLPAPER" "$screen"
done <<< "$SCREENS"

echo "随机壁纸设置完成！"
