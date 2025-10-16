#!/bin/bash

# 检查电源状态
POWER_STATUS=$(cat /sys/class/power_supply/BAT0/status)

# Noctalia-shell 锁屏命令
LOCK_CMD="qs -c noctalia-shell ipc call lockScreen toggle"

if [ "$POWER_STATUS" = "Discharging" ]; then
    # 电池模式：3min锁屏，4min关闭显示器，10min混合睡眠，1h休眠
    swayidle -w \
        timeout 180 "$LOCK_CMD" \
        timeout 240 'niri msg action power-off-monitors' \
        timeout 600 'systemctl hybrid-sleep' \
#        timeout 3600 'systemctl hibernate' \
        before-sleep "$LOCK_CMD"
else
    # 电源模式：5min锁屏，6min关闭显示器，15min混合睡眠，2h休眠
    swayidle -w \
        timeout 300 "$LOCK_CMD" \
        timeout 360 'niri msg action power-off-monitors' \
        timeout 900 'systemctl hybrid-sleep' \
#        timeout 7200 'systemctl hibernate' \
        before-sleep "$LOCK_CMD"
fi
