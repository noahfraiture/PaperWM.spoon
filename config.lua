local Config = {
    -- number of fingers to detect a horizontal swipe, set to 0 to disable
    swipe_fingers = 3,
    -- increase this number to make windows move futher when swiping
    swipe_gain = 1,
    -- size of the on-screen margin to place off-screen windows
    screen_margin = 1,
    -- ratios to use when cycling widths and heights, golden ratio by default
    window_ratios = { 0.33, 0.5, 0.66 },
    -- window gaps: can be set as a single number or a table with top, bottom, left, right values
    window_gap = {
        top = 8,
        bottom = 8,
        left = 8,
        right = 8,
    },
    -- filter for windows to manage
    window_filter = WindowFilter.new():setOverrideFilter({
        visible = true,
        fullscreen = false,
        hasTitlebar = true,
        allowRoles = "AXStandardWindow"
    }),
    ---@alias Mapping { [string]: (table | string)[]}
    default_hotkeys = {
        stop_events          = { { "alt", "cmd", "shift" }, "q" },
        refresh_windows      = { { "alt", "cmd", "shift" }, "r" },
        toggle_floating      = { { "alt", "cmd", "shift" }, "escape" },
        focus_left           = { { "alt", "cmd" }, "left" },
        focus_right          = { { "alt", "cmd" }, "right" },
        focus_up             = { { "alt", "cmd" }, "up" },
        focus_down           = { { "alt", "cmd" }, "down" },
        swap_left            = { { "alt", "cmd", "shift" }, "left" },
        swap_right           = { { "alt", "cmd", "shift" }, "right" },
        swap_up              = { { "alt", "cmd", "shift" }, "up" },
        swap_down            = { { "alt", "cmd", "shift" }, "down" },
        center_window        = { { "alt", "cmd" }, "c" },
        full_width           = { { "alt", "cmd" }, "f" },
        cycle_width          = { { "alt", "cmd" }, "r" },
        cycle_height         = { { "alt", "cmd", "shift" }, "r" },
        reverse_cycle_width  = { { "ctrl", "alt", "cmd" }, "r" },
        reverse_cycle_height = { { "ctrl", "alt", "cmd", "shift" }, "r" },
        slurp_in             = { { "alt", "cmd" }, "i" },
        barf_out             = { { "alt", "cmd" }, "o" },
        switch_space_l       = { { "alt", "cmd" }, "," },
        switch_space_r       = { { "alt", "cmd" }, "." },
        switch_space_1       = { { "alt", "cmd" }, "1" },
        switch_space_2       = { { "alt", "cmd" }, "2" },
        switch_space_3       = { { "alt", "cmd" }, "3" },
        switch_space_4       = { { "alt", "cmd" }, "4" },
        switch_space_5       = { { "alt", "cmd" }, "5" },
        switch_space_6       = { { "alt", "cmd" }, "6" },
        switch_space_7       = { { "alt", "cmd" }, "7" },
        switch_space_8       = { { "alt", "cmd" }, "8" },
        switch_space_9       = { { "alt", "cmd" }, "9" },
        move_window_1        = { { "alt", "cmd", "shift" }, "1" },
        move_window_2        = { { "alt", "cmd", "shift" }, "2" },
        move_window_3        = { { "alt", "cmd", "shift" }, "3" },
        move_window_4        = { { "alt", "cmd", "shift" }, "4" },
        move_window_5        = { { "alt", "cmd", "shift" }, "5" },
        move_window_6        = { { "alt", "cmd", "shift" }, "6" },
        move_window_7        = { { "alt", "cmd", "shift" }, "7" },
        move_window_8        = { { "alt", "cmd", "shift" }, "8" },
        move_window_9        = { { "alt", "cmd", "shift" }, "9" }
    }
}

Config.__index = Config

return Config
