--- nvim-dap-ui
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("dap") then
		return {}
	end
	local float_bg = ctx.float_bg
	return {
		DapUIScope = { fg = P.accent },
		DapUIType = { fg = P.type },
		DapUIValue = { fg = P.const },
		DapUIModifiedValue = { fg = P.warn },
		DapUIDecoration = { fg = P.border },
		DapUIThread = { fg = P.func },
		DapUIStoppedThread = { fg = P.accent },
		DapUIFrameName = { fg = P.fg },
		DapUISource = { fg = P.keyword },
		DapUILineNumber = { fg = P.line_nr },
		DapUIFloatBorder = { fg = P.float_border_hi, bg = float_bg },
		DapUIWatchesEmpty = { fg = P.err },
		DapUIWatchesValue = { fg = P.const },
		DapUIWatchesError = { fg = P.err },
		DapUIBreakpointsPath = { link = "Directory" },
		DapUIBreakpointsInfo = { fg = P.info },
		DapUIBreakpointsCurrentLine = { fg = P.warn, bold = true },
		DapUIBreakpointsDisabledLine = { fg = P.subtle },
		DapUICurrentFrameName = { fg = P.warn, bold = true },
	}
end
