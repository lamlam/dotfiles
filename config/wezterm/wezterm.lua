local wezterm = require 'wezterm';

return {
  font = wezterm.font("Cica"),
  use_ime = true,
  font_size = 20.0,
  color_scheme = "Dracula (Official)",
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  initial_cols = 100,
  initial_rows = 30,
}

