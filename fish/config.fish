if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
    sleep 0.05;command fcitx5-remote -s keyboard-us
end
function wps
    QT_SCALE_FACTOR=1.8 /usr/bin/wps
end

set -gx MOZ_ENABLE_WAYLAND 1
