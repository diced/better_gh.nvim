--- nvim-treesitter-context
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("treesitter_context") then
		return {}
	end
	local bg = ctx.bg
	return {
		TreesitterContext = { bg = P.mantle },
		TreesitterContextLineNumber = { fg = P.line_nr, bg = P.mantle },
		TreesitterContextBottom = { bg = P.mantle },
		TreesitterContextLineNumberBottom = { fg = P.line_nr, bg = P.mantle },
		TreesitterContextSeparator = { fg = P.float_border, bg = bg },
	}
end
