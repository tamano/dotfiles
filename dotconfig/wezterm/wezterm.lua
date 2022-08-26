local wezterm = require 'wezterm';

return {
  -- Theme
  color_scheme = "Japanesque",

  -- Window
  window_background_opacity = 0.95,
  initial_rows = 48,
  initial_cols = 160,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,

  -- Font
  font = wezterm.font("HackGen35 Console NFJ"),
  -- font = wezterm.font("HackGen35 Console NFJ", { weight = 'Bold'}),
  font_size = 12.0,

  -- Misc
  use_ime = true,
}
