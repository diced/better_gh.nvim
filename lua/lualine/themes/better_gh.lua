local P = require("better_gh").get_palette()

local accent_bg = P.accent
local text_on_accent = P.base

return {
  normal = {
    a = { fg = text_on_accent, bg = accent_bg, gui = "bold" },
    b = { fg = P.fg, bg = P.surface_hover },
    c = { fg = P.muted, bg = P.mantle },
  },
  insert = {
    a = { fg = text_on_accent, bg = P.git_add, gui = "bold" },
    b = { fg = P.fg, bg = P.surface_hover },
    c = { fg = P.muted, bg = P.mantle },
  },
  visual = {
    a = { fg = text_on_accent, bg = P.func, gui = "bold" },
    b = { fg = P.fg, bg = P.surface_hover },
    c = { fg = P.muted, bg = P.mantle },
  },
  replace = {
    a = { fg = text_on_accent, bg = P.err, gui = "bold" },
    b = { fg = P.fg, bg = P.surface_hover },
    c = { fg = P.muted, bg = P.mantle },
  },
  command = {
    a = { fg = text_on_accent, bg = P.warn, gui = "bold" },
    b = { fg = P.fg, bg = P.surface_hover },
    c = { fg = P.muted, bg = P.mantle },
  },
  inactive = {
    a = { fg = P.subtle, bg = P.mantle, gui = "bold" },
    b = { fg = P.subtle, bg = P.mantle },
    c = { fg = P.subtle, bg = P.mantle },
  },
}
