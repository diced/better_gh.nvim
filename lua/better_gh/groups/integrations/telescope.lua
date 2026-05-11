--- telescope.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("telescope") then
		return {}
	end
	local float_bg = ctx.float_bg
	return {
		TelescopeNormal = { fg = P.fg, bg = float_bg },
		TelescopeBorder = { fg = P.float_border_hi, bg = float_bg },
		TelescopeTitle = { fg = P.fg, bg = float_bg, bold = true },
		TelescopePromptNormal = { fg = P.fg, bg = float_bg },
		TelescopePromptBorder = { fg = P.float_border_hi, bg = float_bg },
		TelescopePromptTitle = { fg = P.title, bg = float_bg, bold = true },
		TelescopePromptPrefix = { fg = P.accent },
		TelescopePromptCounter = { fg = P.muted },
		TelescopeMatching = { fg = P.accent, bold = true },
		TelescopeSelection = { fg = P.fg, bg = P.pmenu_sel },
		TelescopeSelectionCaret = { fg = P.accent },
		TelescopeMultiSelection = { fg = P.warn },
		TelescopePreviewNormal = { fg = P.fg, bg = float_bg },
		TelescopePreviewBorder = { fg = P.float_border_hi, bg = float_bg },
		TelescopePreviewTitle = { fg = P.fg, bg = float_bg, bold = true },
	}
end
