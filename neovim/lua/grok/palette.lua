-- Grok palettes — exact tokens from palette.toml / Ghostty / Herdr
-- Spirit: near-black chrome, muted grays, bright accents only for status/syntax.
-- Source: xai-org/grok-build (GrokNight / GrokDay)

local M = {}

M.night = {
  -- Backgrounds (darkest → lightest surface)
  bg_terminal = "#0a0a0a", -- ANSI black / deepest void
  bg_dark = "#0c0c0c", -- sidebar, status, inactive chrome
  bg_storm = "#111111",
  bg = "#141414", -- main editor / Ghostty background
  bg_highlight = "#242424", -- selection, cursorline, subtle panels
  bg_visual = "#242424", -- match Ghostty selection-background
  bg_popup = "#0c0c0c",
  bg_float = "#0c0c0c",
  bg_statusline = "#0c0c0c",
  -- Explorer/panel: near editor bg (#141414), soft step not pure void
  bg_sidebar = "#121212",
  surface0 = "#1c1c1c", -- Herdr surface0
  surface1 = "#242424", -- Herdr surface1
  surface2 = "#333333", -- explorer selection (lifts off sidebar)

  -- Text / grays (restrained — not washed-out bright UI)
  fg = "#e1e1e1",
  fg_secondary = "#c8c8c8",
  fg_gutter = "#414141",
  fg_dark = "#787878",
  comment = "#6c6c6c",
  dark3 = "#5a5a5a",
  dark5 = "#787878",

  -- Accents (TokyoNight on neutral gray)
  blue = "#7aa2f7",
  blue0 = "#3d59a1",
  blue1 = "#3A95AB",
  cyan = "#7dcfff",
  green = "#9ece6a",
  green1 = "#73daca",
  magenta = "#bb9af7",
  orange = "#ff9e64",
  purple = "#9d7cd8",
  red = "#f7768e",
  red1 = "#db4b4b",
  teal = "#1abc9c",
  yellow = "#e0af68", -- primary focus accent (cursor, active tab, border)
  plan = "#FFDB8D",
  link = "#7aa6da",

  git_add = "#9ece6a",
  git_change = "#e0af68",
  git_delete = "#f7768e",
  diff_add = "#063806",
  diff_delete = "#420e14",
  diff_change = "#1a1810",
  diff_text = "#2a2418",

  none = "NONE",
}

M.day = {
  bg_terminal = "#f5f5f5",
  bg_dark = "#f0f0f0",
  bg_storm = "#eaeaea",
  bg = "#eeeeee",
  bg_highlight = "#dedede",
  bg_visual = "#dedede",
  bg_popup = "#f0f0f0",
  bg_float = "#f0f0f0",
  bg_statusline = "#eaeaea",
  bg_sidebar = "#eaeaea",
  surface0 = "#eaeaea",
  surface1 = "#dedede",
  surface2 = "#d0d0d0",

  fg = "#262626",
  fg_secondary = "#444444",
  fg_gutter = "#b2b2b2",
  fg_dark = "#626262",
  comment = "#767676",
  dark3 = "#8e8e8e",
  dark5 = "#626262",

  blue = "#2F64D2",
  blue0 = "#28448A",
  blue1 = "#0F87A2",
  cyan = "#0082AA",
  green = "#378E23",
  green1 = "#0C947C",
  magenta = "#7D4BC6",
  orange = "#C3691E",
  purple = "#6C3EB2",
  red = "#CD3048",
  red1 = "#AF2323",
  teal = "#0A8E70",
  yellow = "#A27612",
  plan = "#A8780A",
  link = "#2F64D2",

  git_add = "#378E23",
  git_change = "#A27612",
  git_delete = "#CD3048",
  diff_add = "#DAF2DC",
  diff_delete = "#F5DADE",
  diff_change = "#F5EED8",
  diff_text = "#E8DCB8",

  none = "NONE",
}

---@param style "night"|"day"|nil
---@return table
function M.get(style)
  style = style or "night"
  return M[style] or M.night
end

return M
