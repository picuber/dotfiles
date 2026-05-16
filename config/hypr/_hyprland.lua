-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/


require("./hyprland.d/monitors.lua")
require("./hyprland.d/autostart.lua")
require("./hyprland.d/env_variables.lua")
require("./hyprland.d/look_and_feel.lua")
require("./hyprland.d/keybinds.lua")
hl.exec_cmd("touch -a $XDG_CONFIG_HOME/hypr/hyprland.d/local_config.lua")
require("./hyprland.d/local_config.lua")




-- ###################
-- ### PERMISSIONS ###
-- ###################
-- See https://wiki.hypr.land/Configuring/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- Example Config: https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.lua
