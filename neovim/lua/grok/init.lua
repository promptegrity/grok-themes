local M = {}

M.styles = { "night", "day" }

---@class GrokConfig
---@field style "night"|"day"|nil
---@field transparent boolean|nil
---@field terminal_colors boolean|nil
---@field italic_comments boolean|nil
M.config = {
  style = "night",
  transparent = false,
  terminal_colors = true,
  italic_comments = true,
}

---@param opts GrokConfig|nil
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

---@param style "night"|"day"|nil
function M.load(style)
  style = style or M.config.style or "night"
  if style ~= "night" and style ~= "day" then
    style = "night"
  end

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = style == "day" and "grok-day" or "grok-night"
  vim.o.background = style == "day" and "light" or "dark"

  local palette = require("grok.palette").get(style)
  local groups = require("grok.groups").get(palette)

  if M.config.transparent then
    groups.Normal.bg = palette.none
    groups.NormalNC.bg = palette.none
    groups.SignColumn.bg = palette.none
    groups.FoldColumn.bg = palette.none
    groups.NormalFloat.bg = palette.none
    groups.FloatBorder.bg = palette.none
  end

  if not M.config.italic_comments then
    groups.Comment.italic = false
    groups["@comment"].italic = nil
    groups["@comment.documentation"].italic = nil
  end

  for name, hl in pairs(groups) do
    vim.api.nvim_set_hl(0, name, hl)
  end

  if M.config.terminal_colors then
    M.set_terminal_colors(palette, style)
  end
end

---@param c table
---@param style "night"|"day"
function M.set_terminal_colors(c, style)
  -- Matches ghostty/grok-night and ghostty/grok-day palette indices
  if style == "day" then
    vim.g.terminal_color_0 = c.fg
    vim.g.terminal_color_7 = c.bg
    vim.g.terminal_color_8 = c.comment
    vim.g.terminal_color_15 = c.fg_secondary
  else
    vim.g.terminal_color_0 = c.bg_terminal
    vim.g.terminal_color_7 = c.fg_secondary
    vim.g.terminal_color_8 = c.comment
    vim.g.terminal_color_15 = c.fg
  end
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.magenta
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_9 = c.red
  vim.g.terminal_color_10 = c.green
  vim.g.terminal_color_11 = c.yellow
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = c.magenta
  vim.g.terminal_color_14 = c.cyan
end

return M
