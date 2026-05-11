--- snacks.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("snacks") then
		return {}
	end
	local float_bg = ctx.float_bg
	return {
		SnacksNormal = { fg = P.fg, bg = float_bg },
		SnacksBorder = { fg = P.float_border_hi, bg = float_bg },
		SnacksTitle = { fg = P.title, bg = float_bg, bold = true },
		SnacksPickerMatch = { fg = P.accent, bold = true },
		SnacksPickerPrompt = { fg = P.accent },
		SnacksPickerDirectory = { fg = P.accent },
		SnacksPickerFile = { fg = P.fg },
		SnacksPickerGitStatusAdded = { fg = P.git_add },
		SnacksPickerGitStatusDeleted = { fg = P.git_delete },
		SnacksPickerGitStatusModified = { fg = P.warn },
		SnacksIndent = { fg = P.indent_guide },
		SnacksIndentScope = { fg = P.indent_guide_active },
	}
end
