-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Various Per Machine Options
-- config.default_domain = 'WSL:Ubuntu'
-- config.font = wezterm.font 'SauceCodePro NF'
config.font = wezterm.font 'SauceCodePro Nerd Font'
config.font_size = 12

-- Look setup
config.color_scheme = 'Argonaut'
config.colors = {
  cursor_bg = '#52ad70',
  cursor_fg = '#000000',
  selection_bg = '#777777',
  selection_fg = '#ffffff',
}
config.hide_tab_bar_if_only_one_tab = true
config.canonicalize_pasted_newlines = 'None'
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}
config.selection_word_boundary = ',│`|:\" ()[]{}<>\t' .. "'"

config.mouse_bindings = {
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },

  -- Right click pastes
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = act({ PasteFrom = "Clipboard" }),
  },

  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
}

-- and finally, return the configuration to wezterm
return config
