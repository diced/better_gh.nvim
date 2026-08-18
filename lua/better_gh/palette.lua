-- Syntax & accents: primer/github-vscode-theme `src/theme.js` tokenColors (dark branch)
-- + Primer dark scales from `@primer/primitives` v11.8 (`dist/figma/scales/dark.json`).
-- Chrome overrides via `setup({ colors = { ... } })` — see `BetterGhColorOpts`.

local U = require("better_gh.util")

local M = {}

--- Build palette from defaults merged with color overrides (hex `#RRGGBB`). Fields: see `BetterGhColorOpts` in `init.lua`.
---@param opts BetterGhColorOpts?
---@return table
function M.build(opts)
  opts = opts or {}

  local base = opts.base or "#161616"
  local mantle = opts.mantle or "#111111"
  local surface_hover = opts.surface_hover or "#232323"
  local float_bg = opts.float_bg or U.blend("#ffffff", base, 0.042)
  local float_border = opts.float_border or "#656c76"

  local accent = opts.accent or "#2f81f7"
  local fg = opts.fg or "#e6edf3"
  local muted = opts.muted or "#7d8590"
  local comment = opts.comment or "#8b949e"

  local scale = {
    neutral = {
      [3] = "#212830",
      [4] = "#262c36",
      [5] = "#2a313c",
      [6] = "#2f3742",
      [7] = "#3d444d",
      [8] = "#656c76",
      [9] = "#9198a1",
    },
    blue = {
      [1] = "#a5d6ff",
      [2] = "#79c0ff",
      [3] = "#58a6ff",
      [5] = "#1f6feb",
    },
    green = {
      [1] = "#7ee787",
      [2] = "#56d364",
      [3] = "#3fb950",
      [5] = "#238636",
    },
    yellow = {
      [2] = "#e3b341",
      [3] = "#d29922",
    },
    orange = {
      [2] = "#ffa657",
    },
    red = {
      [2] = "#ffa198",
      [3] = "#ff7b72",
      [4] = "#f85149",
      [5] = "#da3633",
    },
    purple = {
      [2] = "#d2a8ff",
      [5] = "#8957e5",
    },
    pink = {
      [2] = "#ff9bce",
    },
  }

  local border = opts.border or "#30363d"
  --- Slightly lifted fg so float frames match plugin borders (core `FloatBorder`, pickers, cmp).
  local float_border_hi = opts.float_border_hi or U.blend("#ffffff", float_border, 0.14)
  local sel = U.blend(accent, base, 0.22)
  local sel_highlight = U.blend(scale.green[3], base, 0.28)

  local P = {
    none = "NONE",

    base = base,
    mantle = mantle,
    overlay = float_bg,
    float_bg = float_bg,
    surface_hover = surface_hover,

    fg = fg,
    muted = muted,
    subtle = scale.neutral[8],
    comment = comment,

    accent = accent,
    accent_fg = accent,

    keyword = scale.red[3],
    storage = scale.red[3],
    string = scale.blue[1],
    func = scale.purple[2],
    method = scale.purple[2],
    const = scale.blue[2],
    number = scale.blue[2],
    bool = scale.blue[2],
    field = scale.orange[2],
    property = scale.green[1],
    param = fg,
    ident = scale.orange[2],
    type = scale.orange[2],
    tag = scale.green[1],
    builtin = scale.blue[2],
    punct = muted,
    regex = scale.blue[1],
    escape = scale.green[1],
    title = scale.blue[2],
    link = scale.blue[1],

    border = border,
    float_border = float_border,
    float_border_hi = float_border_hi,

    line = U.blend("#ffffff", base, 0.045),
    line_nr = scale.neutral[6],
    line_nr_cur = fg,
    whitespace = scale.neutral[7],
    indent_guide = U.blend(fg, base, 0.12),
    indent_guide_active = U.blend(fg, base, 0.26),

    sel = sel,
    sel_highlight = sel_highlight,

    pmenu_bg = float_bg,
    pmenu_sel = U.blend(accent, float_bg, 0.22),
    pmenu_border = float_border_hi,

    warn = scale.yellow[3],
    warn_bg = U.blend(scale.yellow[3], base, 0.12),
    err = scale.red[4],
    err_bg = U.blend(scale.red[5], base, 0.22),
    hint = scale.blue[2],
    hint_bg = U.blend(scale.blue[5], base, 0.15),
    info = scale.blue[3],
    info_bg = U.blend(scale.blue[5], base, 0.12),

    ok = scale.green[3],
    ok_bg = U.blend(scale.green[5], base, 0.18),

    diff_add = U.blend(scale.green[3], base, 0.22),
    diff_del = U.blend(scale.red[3], base, 0.22),
    diff_chg = U.blend(scale.yellow[3], base, 0.15),

    git_add = scale.green[3],
    git_change = scale.yellow[3],
    git_delete = scale.red[4],

    rainbow = {
      scale.blue[2],
      scale.green[2],
      scale.yellow[2],
      scale.red[2],
      scale.pink[2],
      scale.purple[2],
    },

    term = {
      black = "#484f58",
      red = scale.red[3],
      green = scale.green[3],
      yellow = scale.yellow[3],
      blue = scale.blue[3],
      magenta = "#bc8cff",
      cyan = "#56d4dd",
      white = "#b1bac4",
      bright_black = "#6e7681",
      bright_red = scale.red[2],
      bright_green = scale.green[2],
      bright_yellow = scale.yellow[2],
      bright_blue = scale.blue[2],
      bright_magenta = scale.purple[2],
      bright_cyan = "#76e3ea",
      bright_white = fg,
    },
  }

  return P
end

return M
