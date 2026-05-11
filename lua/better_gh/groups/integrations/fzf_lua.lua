--- fzf-lua
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("fzf_lua") then
		return {}
	end
	local U = ctx.U
	local blend_bg = ctx.blend_bg
	local fzf_backdrop = U.blend("#000000", blend_bg, 0.72)
	return {
		FzfLuaNormal = { link = "NormalFloat" },
		FzfLuaBorder = { link = "FloatBorder" },
		FzfLuaTitle = { link = "FloatTitle" },
		FzfLuaBackdrop = { fg = fzf_backdrop, bg = fzf_backdrop },

		FzfLuaHeaderBind = { fg = P.warn },
		FzfLuaHeaderText = { fg = P.field },
		FzfLuaDirPart = { link = "NonText" },
		FzfLuaFzfMatch = { fg = P.accent, bold = true },
		FzfLuaFzfPrompt = { fg = P.accent },
		FzfLuaPathColNr = { fg = P.accent },
		FzfLuaPathLineNr = { fg = P.git_add },
		FzfLuaBufName = { fg = P.func },
		FzfLuaBufNr = { fg = P.warn },
		FzfLuaBufFlagCur = { fg = P.field },
		FzfLuaBufFlagAlt = { fg = P.accent },
		FzfLuaTabTitle = { fg = P.hint },
		FzfLuaTabMarker = { fg = P.warn },
		FzfLuaLiveSym = { fg = P.field },
	}
end
