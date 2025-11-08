#!/usr/bin/env bash
echo "### POLKIT-AGENT STARTING: $(date)" >> /home/samet/polkitagent.log
sleep 10
export QT_QPA_PLATFORM=wayland
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=KDE
export QT_PLUGIN_PATH=/run/current-system/sw/lib/qt-6/plugins
export QML2_IMPORT_PATH=/run/current-system/sw/lib/qt-6/qml
export QML2_IMPORT_PATH=/run/current-system/sw/lib/qt-6/qml:/run/current-system/sw/lib/qt-6/qml
echo "### ENV SET — WAYLAND_DISPLAY=$WAYLAND_DISPLAY" >> /home/samet/polkitagent.log
/run/current-system/sw/libexec/polkit-kde-authentication-agent-1 >> /home/samet/polkitagent.log 2>&1 &
