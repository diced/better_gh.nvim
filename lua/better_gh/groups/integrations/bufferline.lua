--- bufferline.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("bufferline") then
		return {}
	end
	local bg = ctx.bg
	return {
		BufferLineIndicatorSelected = { fg = P.accent },
		BufferLineSeparator = { fg = P.border },
		BufferLineFill = { bg = P.mantle },
		BufferLineBackground = { fg = P.muted, bg = P.mantle },
		BufferLineBufferSelected = { fg = P.fg, bg = bg, bold = true },
		BufferLineBufferVisible = { fg = P.fg, bg = P.surface_hover },
		BufferLineCloseButtonVisible = { fg = P.muted },
		BufferLineCloseButton = { fg = P.subtle },
		BufferLineModified = { fg = P.warn },
		BufferLineModifiedSelected = { fg = P.warn },
		BufferLineDuplicate = { fg = P.subtle },
		BufferLinePick = { fg = P.warn },
		BufferLinePickSelected = { fg = P.warn, bold = true },
		BufferLineDiagnostic = { fg = P.subtle },
		BufferLineNumbers = { fg = P.line_nr },
		BufferLineNumbersSelected = { fg = P.line_nr_cur },
	}
end
