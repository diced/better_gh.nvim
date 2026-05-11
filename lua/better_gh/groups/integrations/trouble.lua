--- trouble.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("trouble") then
		return {}
	end
	local float_bg = ctx.float_bg
	return {
		TroubleNormal = { fg = P.fg, bg = float_bg },
		TroubleNormalNC = { fg = P.fg, bg = float_bg },
		TroubleText = { fg = P.fg },
		TroubleCount = { fg = P.base, bg = P.warn },
		TroubleIndentFoldClosed = { fg = P.subtle },
		TroubleIndentFoldOpen = { fg = P.muted },
		TroubleIndentWs = { fg = P.indent_guide },
		TroubleFile = { fg = P.accent },
		TroubleFoldIcon = { fg = P.muted },
		TroubleSource = { fg = P.comment },
		TroubleCode = { fg = P.func },
		TroubleLocation = { fg = P.muted },
		TroubleSignError = { fg = P.err },
		TroubleSignWarning = { fg = P.warn },
		TroubleSignInformation = { fg = P.info },
		TroubleSignHint = { fg = P.hint },
		TroubleSignOther = { fg = P.subtle },
		TroubleTextError = { fg = P.err },
		TroubleTextWarning = { fg = P.warn },
		TroubleTextInformation = { fg = P.info },
		TroubleTextHint = { fg = P.hint },
	}
end
