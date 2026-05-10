# better_gh.nvim

Dark Neovim colorscheme heavily based on **GitHub Dark Default** (Primer + VS Code token mapping) and custom colors: `#161616` editor surface, `#111111` inset areas, and slightly lifted floating UI.

Requires **Neovim 0.9+** with `termguicolors`.

## Why?
The popular github-nvim-theme has been largely unmaintained for a few years, and doesn't seem to have any signs of life left.
A lot of plugins are unsupported with it, and for the time being, I've been using a super jank catppuccin config (worked well since it supports tons of plugins and it *just* worked).
I got tired of this as some of the catppuccin colors did leak through even after I spent time trying to make them go away, but it would break stuff, leaving me with my only option, just make the theme myself, and by myself I mean AI 😭.
Thanks to cursor and an hour of prompting, a fully working theme that looks good and suits my needs is here and I can get back to work!

---

## Supported plugins

`better_gh` supports tons of plugins, you can enable or disable them as you wish, and they are all on by default:

| Key | Plugin |
|----------------|----------------|
| `treesitter` | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`@highlights`) |
| `indent_blankline` | [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) |
| `rainbow_delimiters` | [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) |
| `nvim_tree` | [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) |
| `neo_tree` | [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) |
| `gitsigns` | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) |
| `telescope` | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) |
| `fzf_lua` | [fzf-lua](https://github.com/ibhagwan/fzf-lua) |
| `which_key` | [which-key.nvim](https://github.com/folke/which-key.nvim) |
| `lazy` | [lazy.nvim](https://github.com/folke/lazy.nvim) |
| `mason` | [mason.nvim](https://github.com/williamboman/mason.nvim) |
| `neogit` | [Neogit](https://github.com/NeogitOrg/neogit) |
| `trouble` | [trouble.nvim](https://github.com/folke/trouble.nvim) |
| `notify` | [nvim-notify](https://github.com/rcarriga/nvim-notify) |
| `noice` | [noice.nvim](https://github.com/folke/noice.nvim) |
| `dap` | [nvim-dap](https://github.com/mfussenegger/nvim-dap) / UI: [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) |
| `hop` | [hop.nvim](https://github.com/smoka7/hop.nvim) |
| `flash` | [flash.nvim](https://github.com/folke/flash.nvim) |
| `leap` | [leap.nvim](https://github.com/ggandor/leap.nvim) |
| `bufferline` | [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) |
| `dashboard` | [alpha-nvim](https://github.com/goolord/alpha-nvim), [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim), etc. |
| `treesitter_context` | [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) |
| `illuminate` | [vim-illuminate](https://github.com/RRethy/vim-illuminate) |
| `navic` | [nvim-navic](https://github.com/SmiteshP/nvim-navic) |
| `scrollbar` | [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) |
| `oil` | [oil.nvim](https://github.com/stevearc/oil.nvim) |
| `snacks` | [snacks.nvim](https://github.com/folke/snacks.nvim) |
| `mini` | [mini.nvim](https://github.com/echasnovski/mini.nvim) |
| `blink_cmp` | [blink.cmp](https://github.com/Saghen/blink.cmp) |
| `copilot` | [copilot.lua](https://github.com/zbirenbaum/copilot.lua) / [copilot.vim](https://github.com/github/copilot.vim) |

**Extras**

- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** — `require('lualine').setup({ options = { theme = 'better_gh' } })`
- **[fzf-lua](https://github.com/ibhagwan/fzf-lua) + treesitter** in the results pane — merge `require('better_gh').fzf_lua_treesitter_fzf_colors()` into `winopts.treesitter.fzf_colors` if reversed fuzzy-match highlights look harsh.

---

## Screenshots

![ss][.github/ss.png]

---

## Configuration

Made to be super configurable:

### Custom colors

Pass **`colors`** into **`setup()`** to override pallete (syntax scales are unchanged). Omit a field to keep the default. If you do **not** set `float_bg`, it is still derived as a light lift from `base`.

| Key | Role |
|-----|------|
| `base` | Main editor background |
| `mantle` | Inset / sidebar-style panels |
| `float_bg` | Floats, popups, menus |
| `surface_hover` | Hover row / quickfix line |
| `border` | Split borders (`WinSeparator`) |
| `float_border` | Border around floating windows |
| `fg` | Default text |
| `muted` | Dimmed UI text |
| `accent` | Accent / links |
| `comment` | Comment foreground |

After changing options, run **`colorscheme better_gh`** again (or call **`require("better_gh").load()`**). **`require("better_gh").get_palette()`** reflects the same overrides for **lualine** or scripts.

```lua
require("better_gh").setup({
  colors = {
    base = "#0d1117",
    mantle = "#010409",
    -- float_bg = … -- optional; default recomputed from `base`
    border = "#30363d",
    float_border = "#656c76",
  },
})
vim.cmd.colorscheme("better_gh")
```

---

## Installing

### [lazy.nvim](https://github.com/folke/lazy.nvim)

Add the repo to your plugin spec (adjust `dir` / `url` to match how you install). Load the colorscheme early so UI plugins pick up highlights.

```lua
{
  "diced/better_gh.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("better_gh").setup({
      -- colors = { base = "#0d1117", mantle = "#010409" },
      -- transparent_background = false,
      -- integrations = { neogit = true, fzf_lua = true },
    })
    vim.cmd.colorscheme("better_gh")
  end,
}
```

Calling `setup()` before `colorscheme` applies your options; `colors/better_gh.lua` ultimately runs `require("better_gh").load()`.

---

### [nvf](https://github.com/NotAShelf/nvf) (for nix users)

I use [nvf](https://github.com/NotAShelf/nvf), so I want it to work well with it. Simply, just add it as a lazy plugin:

```nix
{ pkgs, lib, ... }:

let
  betterGh = pkgs.vimUtils.buildVimPlugin {
    pname = "better_gh";
    version = "0.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "diced";
      repo = "better_gh.nvim";
      rev = "main";
      hash = lib.fakeHash; # replace after prefetch (nix-prefetch-github, etc.)
    };
  };
in
{
  vim.lazy.plugins."${betterGh.pname}" = {
    package = betterGh;
    setupModule = "better_gh";
    setupOpts = {
      transparent_background = false;
      # colors = { base = "#0d1117"; mantle = "#010409"; };
      # integrations = { neogit = true; fzf_lua = true; };
    };
    lazy = false;
    priority = 1000;
    after = ''
      vim.cmd.colorscheme("better_gh")
    '';
  };
}
```
