-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function ()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("nextcloud")
    hl.exec_cmd("wl-paste --watch clipvault store") -- Stores text, image and any other binary data
end)
