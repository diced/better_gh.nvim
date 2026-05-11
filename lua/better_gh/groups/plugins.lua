local U = require("better_gh.util")

local function inactive_sidebar_bg(opts, pal)
	return opts.transparent_background and pal.none or pal.mantle
end

local INTEGRATIONS = {
	require("better_gh.groups.integrations.indent_blankline"),
	require("better_gh.groups.integrations.rainbow_delimiters"),
	require("better_gh.groups.integrations.nvim_tree"),
	require("better_gh.groups.integrations.neo_tree"),
	require("better_gh.groups.integrations.gitsigns"),
	require("better_gh.groups.integrations.neogit"),
	require("better_gh.groups.integrations.telescope"),
	require("better_gh.groups.integrations.fzf_lua"),
	require("better_gh.groups.integrations.which_key"),
	require("better_gh.groups.integrations.lazy"),
	require("better_gh.groups.integrations.mason"),
	require("better_gh.groups.integrations.trouble"),
	require("better_gh.groups.integrations.notify"),
	require("better_gh.groups.integrations.noice"),
	require("better_gh.groups.integrations.dap"),
	require("better_gh.groups.integrations.hop"),
	require("better_gh.groups.integrations.flash"),
	require("better_gh.groups.integrations.leap"),
	require("better_gh.groups.integrations.bufferline"),
	require("better_gh.groups.integrations.dashboard"),
	require("better_gh.groups.integrations.treesitter_context"),
	require("better_gh.groups.integrations.illuminate"),
	require("better_gh.groups.integrations.navic"),
	require("better_gh.groups.integrations.scrollbar"),
	require("better_gh.groups.integrations.oil"),
	require("better_gh.groups.integrations.snacks"),
	require("better_gh.groups.integrations.mini"),
	require("better_gh.groups.integrations.copilot"),
	require("better_gh.groups.integrations.blink_cmp"),
}

---@param P table
---@param O table
---@return table<string, vim.api.keyset.highlight>
return function(P, O)
	local bg = O.transparent_background and P.none or P.base
	local float_bg = O.transparent_background and P.none or P.float_bg
	local blend_bg = (bg == P.none) and P.base or bg

	local function pick_integration(key)
		local v = O.integrations[key]
		return v == nil or v
	end

	---@class BetterGhIntegrationCtx
	---@field U table
	---@field bg string
	---@field float_bg string
	---@field blend_bg string
	---@field pick fun(key: string): boolean
	---@field inactive_sidebar_bg fun(opts: table, pal: table): string
	local ctx = {
		U = U,
		bg = bg,
		float_bg = float_bg,
		blend_bg = blend_bg,
		pick = pick_integration,
		inactive_sidebar_bg = inactive_sidebar_bg,
	}

	local h = {}
	for _, mod in ipairs(INTEGRATIONS) do
		local chunk = mod(P, O, ctx)
		for name, opts in pairs(chunk) do
			h[name] = opts
		end
	end

	return h
end
