--- mason.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("mason") then
		return {}
	end
	local float_bg = ctx.float_bg
	return {
		MasonNormal = { fg = P.fg, bg = float_bg },
		MasonHeader = { fg = P.title, bg = float_bg, bold = true },
		MasonHighlight = { fg = P.accent },
		MasonHighlightBlock = { fg = P.base, bg = P.accent },
		MasonHighlightBlockBold = { fg = P.base, bg = P.accent, bold = true },
		MasonMuted = { fg = P.muted },
		MasonMutedBlock = { fg = P.fg, bg = P.mantle },
		MasonLink = { fg = P.link, underline = true },
		MasonError = { fg = P.err },
		MasonHeading = { fg = P.title, bold = true },
	}
end
