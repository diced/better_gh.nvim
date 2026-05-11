--- gitsigns.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("gitsigns") then
		return {}
	end
	local bg = ctx.bg
	return {
		GitSignsAdd = { fg = P.git_add, bg = bg },
		GitSignsChange = { fg = P.git_change, bg = bg },
		GitSignsDelete = { fg = P.git_delete, bg = bg },
		GitSignsChangedelete = { fg = P.warn, bg = bg },
		GitSignsTopdelete = { fg = P.git_delete, bg = bg },
		GitSignsUntracked = { fg = P.hint, bg = bg },
	}
end
