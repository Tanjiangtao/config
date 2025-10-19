#!/bin/bash
# 启动 footclient
footclient &
# 等待窗口出现
sleep 0.06
# 确保浮动模式并调整大小
niri msg action set-window-width "70%"
niri msg action set-window-height "70%"
sleep 0.001
niri msg action center-window
# 可选：移动到指定位置（参考你的 move-floating-window -x 100 -y 200）
# niri msg action move-floating-window -x 4 -y 4
