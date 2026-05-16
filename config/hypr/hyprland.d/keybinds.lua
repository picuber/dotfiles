-- See https://wiki.hypr.land/Configuring/Basics/Binds/
-- See https://wiki.hypr.land/Configuring/Basics/Dispatchers/

local mod = "SUPER+"
local shift = "SHIFT+"
local ctrl = "CTRL_L+"
local alt = "ALT_L+"


-- commands for dynamically named worspaces
local wsNamesFilter = [[ grep -E "workspace ID (-)?[[:digit:]]+ \(" | sed -e "s/^.*(//;s/).*$//" ]]
-- local defaultCurrent =
local currentWs = [[ hyprctl activeworkspace | $wsNamesFilter | head -n 1 ]]
local allWs = [[ hyprctl workspaces | $wsNamesFilter | grep -v "^[[:digit:]]*$" | sort -n ]]
local workspaceRofiCmd = [[ { $currentWs; $allWs; } | uniq | rofi -dmenu -kb-cancel '' -kb-accept-entry 'Return,KP_Enter,Escape' -select $($currentWs) ]]
