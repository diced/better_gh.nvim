--- vim-illuminate
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("illuminate") then
		return {}
	end
	local U = ctx.U
	local blend_bg = ctx.blend_bg
	return {
		IlluminatedWordText = { bg = U.blend(P.fg, blend_bg, 0.08) },
		IlluminatedWordRead = { bg = U.blend(P.accent, blend_bg, 0.12) },
		IlluminatedWordWrite = { bg = U.blend(P.warn, blend_bg, 0.12) },
	}
end
