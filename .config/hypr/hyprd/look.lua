local colors = require("hyprd/colors")

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 15,

		border_size = 3,
		col = {
			active_border = colors.primary,
			inactive_border = colors.outline,
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 3,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1,
		inactive_opacity = 1,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 5,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true, -- yeah, please
	},
})

-- Custom bezier curves
-- Smooth modern overshoot curves
hl.curve("smoothOut", {
	type = "bezier",
	points = { { 0.16, 1 }, { 0.3, 1 } },
})

hl.curve("smoothOvershoot", {
	type = "bezier",
	points = { { 0.2, 1.1 }, { 0.35, 1 } },
})

hl.curve("softSlide", {
	type = "bezier",
	points = { { 0.25, 1 }, { 0.45, 1 } },
})
hl.curve("macSmooth", {
	type = "bezier",
	points = { { 0.22, 1 }, { 0.36, 1 } },
})
hl.curve("bounce", {
	type = "bezier",
	points = { { 0.34, 1.3 }, { 0.64, 1 } },
})

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 4,
	bezier = "smoothOvershoot",
	style = "slide",
})

hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 4,
	bezier = "smoothOut",
	style = "slide",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 4,
	bezier = "softSlide",
	style = "slide",
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3.5,
	bezier = "softSlide",
	style = "slide",
})

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})
