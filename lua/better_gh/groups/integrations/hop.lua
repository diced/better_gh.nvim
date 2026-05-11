--- hop.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("hop") then
		return {}
	end
	return {
		HopNextKey = { fg = P.warn, bold = true },
		HopNextKey1 = { fg = P.accent, bold = true },
		HopNextKey2 = { fg = P.hint, bold = true },
		HopUnmatched = { fg = P.subtle },
		HopPreview = { fg = P.warn },
	}
end
