--- leap.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("leap") then
		return {}
	end
	return {
		LeapBackdrop = { fg = P.subtle },
		LeapMatch = { fg = P.accent, bold = true },
		LeapLabelPrimary = { fg = P.base, bg = P.warn, bold = true },
		LeapLabelSecondary = { fg = P.base, bg = P.hint, bold = true },
		LeapLabelSelected = { fg = P.base, bg = P.func },
	}
end
