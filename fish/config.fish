if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
    sleep 0.05;command fcitx5-remote -s keyboard-us
end
function wps
    QT_SCALE_FACTOR=1.8 /usr/bin/wps
end

set -gx MOZ_ENABLE_WAYLAND 1

set -x GTK_THEME Adwaita:dark
set -x GTK_ICON_THEME Papirus
set -x QT_QPA_PLATFORMTHEME gtk2
set -x RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -x RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup

set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx
set -x SDL_IM_MODULE fcitx
