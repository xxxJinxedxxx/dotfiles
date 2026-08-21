------------
--- BIND ---
------------

package.path = package.path .. ";./?.lua;./?/init.lua"
local smw = require("plugins.split-monitor-workspaces")
smw.setup({
	workspace_count = 5, -- This will create 5 persistent workspaces on each monitor at startup
})

local mainMod = "SUPER"
local terminal = "Kitty"
local fileManager = "dolphin"

hl.bind("CTRL + Return", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind("ALT  +  W", hl.dsp.window.close(active))

hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("/home/archi/.config/hypr/scripts/wallpaper_change.sh --new"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("/home/archi/.config/hypr/scripts/wallpaper_change.sh --old"))
hl.bind(mainMod .. " + SHIFT + CTRL + B", hl.dsp.exec_cmd("/home/archi/.config/hypr/scripts/wallpaper_change.sh --del"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("/home/archi/.config/hypr/scripts/toggle_waybar.sh"))

-- Focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

local keys = { "Q", "W", "E", "R", "T" }

for i, key in ipairs(keys) do
	hl.bind(mainMod .. " +" .. key, smw.workspace(tostring(i)))
	hl.bind(mainMod .. " + SHIFT +" .. key, smw.move_to_workspace_silent(tostring(i)))
end

-- Monitor focus
hl.bind(mainMod .. " + A", hl.dsp.focus({ monitor = "HDMI-A-1" }))
hl.bind(mainMod .. " + S", hl.dsp.focus({ monitor = "DP-3" }))
hl.bind(mainMod .. " + D", hl.dsp.focus({ monitor = "DP-2" }))

-- Move Windows to monitor
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ monitor = "HDMI-A-1" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ monitor = "DP-2" }))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ monitor = "DP-1" }))

-- Mouse wheel
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse bindings
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Volume Keys
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

--------------
--- INPUTS ---
--------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "intl",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 0,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
	misc = {
		mouse_move_focuses_monitor = false,
	},
	cursor = {
		no_warps = true,
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
	force_no_accel,
})
