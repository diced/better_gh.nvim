--- which-key.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("which_key") then
		return {}
	end
	local float_bg = ctx.float_bg
	return {
		WhichKey = { fg = P.accent },
		WhichKeyGroup = { fg = P.func },
		WhichKeySeparator = { fg = P.subtle },
		WhichKeyDesc = { fg = P.fg },
		WhichKeyValue = { fg = P.muted },
		WhichKeyFloat = { fg = P.fg, bg = float_bg },
		WhichKeyBorder = { fg = P.float_border_hi, bg = float_bg },
	}
end
