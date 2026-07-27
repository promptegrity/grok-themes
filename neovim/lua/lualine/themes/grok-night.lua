-- Lualine — GrokNight (muted void + yellow focus)
local p = require("grok.palette").night

return {
  normal = {
    a = { fg = p.bg, bg = p.yellow, gui = "bold" },
    b = { fg = p.fg_secondary, bg = p.bg_dark },
    c = { fg = p.comment, bg = p.bg_statusline },
  },
  insert = {
    a = { fg = p.bg, bg = p.green, gui = "bold" },
    b = { fg = p.fg_secondary, bg = p.bg_dark },
    c = { fg = p.comment, bg = p.bg_statusline },
  },
  visual = {
    a = { fg = p.bg, bg = p.magenta, gui = "bold" },
    b = { fg = p.fg_secondary, bg = p.bg_dark },
    c = { fg = p.comment, bg = p.bg_statusline },
  },
  replace = {
    a = { fg = p.bg, bg = p.red, gui = "bold" },
    b = { fg = p.fg_secondary, bg = p.bg_dark },
    c = { fg = p.comment, bg = p.bg_statusline },
  },
  command = {
    a = { fg = p.bg, bg = p.orange, gui = "bold" },
    b = { fg = p.fg_secondary, bg = p.bg_dark },
    c = { fg = p.comment, bg = p.bg_statusline },
  },
  terminal = {
    a = { fg = p.bg, bg = p.teal, gui = "bold" },
    b = { fg = p.fg_secondary, bg = p.bg_dark },
    c = { fg = p.comment, bg = p.bg_statusline },
  },
  inactive = {
    a = { fg = p.fg_gutter, bg = p.bg_statusline },
    b = { fg = p.fg_gutter, bg = p.bg_statusline },
    c = { fg = p.fg_gutter, bg = p.bg_statusline },
  },
}
