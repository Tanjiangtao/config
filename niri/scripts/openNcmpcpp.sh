#!/usr/bin/env fish

# 脚本文件名：~/mpd-check.fish

# 检查 mpd 是否运行
if not pgrep -x mpd > /dev/null
    # 使用 systemctl 启动用户级的 mpd 服务
    systemctl --user start mpd
end
# 使用 Alacritty 打开 ncmpcpp
alacritty -e ncmpcpp &
