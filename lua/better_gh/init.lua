local M = {}

---@class BetterGhIntegrationOpts
---@field treesitter boolean?
---@field indent_blankline boolean?
---@field rainbow_delimiters boolean?
---@field nvim_tree boolean?
---@field neo_tree boolean?
---@field gitsigns boolean?
---@field telescope boolean?
---@field fzf_lua boolean?
---@field which_key boolean?
---@field lazy boolean?
---@field mason boolean?
---@field neogit boolean?
---@field trouble boolean?
---@field notify boolean?
---@field noice boolean?
---@field dap boolean?
---@field hop boolean?
---@field flash boolean?
---@field leap boolean?
---@field bufferline boolean?
---@field dashboard boolean?
---@field treesitter_context boolean?
---@field illuminate boolean?
---@field navic boolean?
---@field scrollbar boolean?
---@field oil boolean?
---@field snacks boolean?
---@field mini boolean?
---@field blink_cmp boolean?
---@field copilot boolean?

--- Chrome overrides (`setup({ colors = { ... } })`). Omitted keys stay at defaults.
---@class BetterGhColorOpts
---@field base? string
---@field mantle? string
---@field float_bg? string
---@field surface_hover? string
---@field border? string
---@field float_border? string
---@field float_border_hi? string
---@field fg? string
---@field muted? string
---@field accent? string
---@field comment? string

---@class BetterGhOpts
---@field transparent_background boolean?
---@field colors BetterGhColorOpts?
---@field integrations BetterGhIntegrationOpts?

local defaults = {
  transparent_background = false,
  colors = {},
  integrations = {
    treesitter = true,
    indent_blankline = true,
    rainbow_delimiters = true,
    nvim_tree = true,
    neo_tree = true,
    gitsigns = true,
    telescope = true,
    fzf_lua = true,
    which_key = true,
    lazy = true,
    mason = true,
    neogit = true,
    trouble = true,
    notify = true,
    noice = true,
    dap = true,
    hop = true,
    flash = true,
    leap = true,
    bufferline = true,
    dashboard = true,
    treesitter_context = true,
    illuminate = true,
    navic = true,
    scrollbar = true,
    oil = true,
    snacks = true,
    mini = true,
    blink_cmp = true,
    copilot = true,
  },
}

M.options = nil

--- fzf-lua backdrop sets `winhl = Normal:FzfLuaBackdrop` only (`win/backdrop.lua`), so LineNr,
--- EndOfBuffer, NonText, etc. keep global highlights and look torn under `winblend`.
local FZF_BACKDROP_WINHL = table.concat({
  "Normal:FzfLuaBackdrop",
  "NormalNC:FzfLuaBackdrop",
  "LineNr:FzfLuaBackdrop",
  "SignColumn:FzfLuaBackdrop",
  "FoldColumn:FzfLuaBackdrop",
  "EndOfBuffer:FzfLuaBackdrop",
  "NonText:FzfLuaBackdrop",
  "Whitespace:FzfLuaBackdrop",
  "WinSeparator:FzfLuaBackdrop",
  "VertSplit:FzfLuaBackdrop",
  "CursorLine:FzfLuaBackdrop",
  "CursorLineNr:FzfLuaBackdrop",
  "CursorColumn:FzfLuaBackdrop",
  "WinBar:FzfLuaBackdrop",
  "WinBarNC:FzfLuaBackdrop",
  "Folded:FzfLuaBackdrop",
  "MatchParen:FzfLuaBackdrop",
}, ",")

local function attach_fzf_backdrop_winhl(buf)
  vim.schedule(function()
    if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].filetype ~= "fzflua_backdrop" then
      return
    end
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == buf then
        vim.api.nvim_win_set_option(win, "winhighlight", FZF_BACKDROP_WINHL)
        return
      end
    end
  end)
end

---@param opts BetterGhOpts?
function M.setup(opts)
  opts = opts or {}
  local integrations = vim.tbl_deep_extend("force", vim.deepcopy(defaults.integrations), opts.integrations or {})
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts)
  M.options.integrations = integrations

  -- Drop leftover callbacks if Neogit backdrop was enabled in an older config/session.
  vim.api.nvim_create_augroup("BetterGhNeogitBackdrop", { clear = true })

  local aug = vim.api.nvim_create_augroup("BetterGhFzfBackdrop", { clear = true })
  if M.options.integrations.fzf_lua ~= false then
    vim.api.nvim_create_autocmd("FileType", {
      group = aug,
      pattern = "fzflua_backdrop",
      callback = function(ev)
        attach_fzf_backdrop_winhl(ev.buf)
      end,
    })
  end
end

local function apply_term_palette(P)
  local t = P.term
  vim.g.terminal_color_0 = t.black
  vim.g.terminal_color_1 = t.red
  vim.g.terminal_color_2 = t.green
  vim.g.terminal_color_3 = t.yellow
  vim.g.terminal_color_4 = t.blue
  vim.g.terminal_color_5 = t.magenta
  vim.g.terminal_color_6 = t.cyan
  vim.g.terminal_color_7 = t.white
  vim.g.terminal_color_8 = t.bright_black
  vim.g.terminal_color_9 = t.bright_red
  vim.g.terminal_color_10 = t.bright_green
  vim.g.terminal_color_11 = t.bright_yellow
  vim.g.terminal_color_12 = t.bright_blue
  vim.g.terminal_color_13 = t.bright_magenta
  vim.g.terminal_color_14 = t.bright_cyan
  vim.g.terminal_color_15 = t.bright_white
end

local function merge_groups(P, O)
  local all = {}

  local function extend(modname)
    local ok, mod = pcall(require, modname)
    if not ok then
      return
    end
    local g = mod(P, O)
    for name, opts in pairs(g) do
      all[name] = opts
    end
  end

  extend("better_gh.groups.core")
  if O.integrations.treesitter then
    extend("better_gh.groups.treesitter")
  end
  extend("better_gh.groups.plugins")

  return all
end

--- Palette for the current `setup()` options (respects `colors` overrides). Useful for lualine / custom UI.
function M.get_palette()
  if M.options == nil then
    M.setup({})
  end
  return require("better_gh.palette").build(M.options.colors)
end

--- `winopts.treesitter.fzf_colors` override for fzf-lua: disables `-1:reverse` fuzzy-match fills that pick up TS foreground as backgrounds (magenta/purple bands on paths).
---
--- Merge into your setup, for example:
--- ```lua
--- winopts = { treesitter = { fzf_colors = vim.tbl_extend("force", {}, require("better_gh").fzf_lua_treesitter_fzf_colors()) } }
--- ```
---@return table<string, string>
function M.fzf_lua_treesitter_fzf_colors()
  return {
    ["hl"] = "underline:-1",
    ["hl+"] = "underline:-1,bold",
  }
end

function M.load()
  if M.options == nil then
    M.setup({})
  end

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "better_gh"

  local O = M.options
  local P = require("better_gh.palette").build(O.colors)

  for name, opts in pairs(merge_groups(P, O)) do
    vim.api.nvim_set_hl(0, name, opts)
  end

  apply_term_palette(P)
end

return M
