--- blink.cmp
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("blink_cmp") then
		return {}
	end
	local float_bg = ctx.float_bg
	return {
		BlinkCmpMenu = { fg = P.fg, bg = float_bg },
		BlinkCmpMenuBorder = { fg = P.float_border_hi, bg = float_bg },
		BlinkCmpMenuSelection = { fg = P.fg, bg = P.pmenu_sel },
		BlinkCmpScrollBarThumb = { link = "PmenuThumb" },
		BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
		BlinkCmpGhostText = { fg = P.subtle, italic = true },
		BlinkCmpDoc = { fg = P.fg, bg = float_bg },
		BlinkCmpDocBorder = { fg = P.float_border_hi, bg = float_bg },
		BlinkCmpDocSeparator = { fg = P.float_border_hi, bg = float_bg },
		BlinkCmpDocCursorLine = { bg = P.sel },
		BlinkCmpSignatureHelp = { fg = P.fg, bg = float_bg },
		BlinkCmpSignatureHelpBorder = { fg = P.float_border_hi, bg = float_bg },
		BlinkCmpSignatureHelpActiveParameter = { link = "LspSignatureActiveParameter" },
		BlinkCmpKind = { fg = P.builtin },
		BlinkCmpLabel = { fg = P.fg },
		BlinkCmpLabelMatch = { fg = P.accent, bold = true },
		BlinkCmpLabelDeprecated = { fg = P.subtle, strikethrough = true },
		BlinkCmpLabelDetail = { fg = P.muted },
		BlinkCmpLabelDescription = { fg = P.muted },
		BlinkCmpSource = { fg = P.muted },
	}
end
