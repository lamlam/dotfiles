local wezterm = require 'wezterm';

return {
  font = wezterm.font("Cica"), -- 自分の好きなフォントいれる
  use_ime = true, -- wezは日本人じゃないのでこれがないとIME動かない
  font_size = 20.0,
  color_scheme = "OneHalfDark", -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
  -- color_scheme = "iceberg-dark",
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  initial_cols = 100,
  initial_rows = 30,
}

