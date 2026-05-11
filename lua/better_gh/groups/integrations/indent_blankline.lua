--- IndentBlankline, snacks indent
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("indent_blankline") then
		return {}
	end
	return {
		IndentBlanklineChar = { fg = P.indent_guide, nocombine = true },
		IndentBlanklineSpaceChar = { link = "IndentBlanklineChar" },
		IndentBlanklineSpaceCharBlankline = { link = "IndentBlanklineChar" },
		IndentBlanklineContextChar = { fg = P.indent_guide_active, nocombine = true },
		IndentBlanklineContextStart = { sp = P.indent_guide_active, underline = true },
		IblIndent = { fg = P.indent_guide, nocombine = true },
		IblWhitespace = { fg = P.indent_guide, nocombine = true },
		IblScope = { fg = P.indent_guide_active, nocombine = true },
	}
end
