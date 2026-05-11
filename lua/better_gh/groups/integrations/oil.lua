--- oil.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("oil") then
		return {}
	end
	return {
		OilDir = { fg = P.accent },
		OilDirIcon = { fg = P.accent },
		OilSocket = { fg = P.hint },
		OilLink = { fg = P.link },
		OilCreate = { fg = P.git_add },
		OilCopy = { fg = P.info },
		OilChange = { fg = P.warn },
		OilMove = { fg = P.func },
		OilDelete = { fg = P.git_delete },
		OilTrash = { fg = P.err },
		OilPerm = { fg = P.muted },
	}
end
