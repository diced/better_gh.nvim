--- nvim-scrollbar
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("scrollbar") then
		return {}
	end
	return {
		ScrollbarHandle = { fg = P.none, bg = P.subtle },
		ScrollbarCursorHandle = { fg = P.none, bg = P.accent },
		ScrollbarCursor = { fg = P.none, bg = P.accent },
		ScrollbarSearchHandle = { fg = P.none, bg = P.warn },
		ScrollbarErrorHandle = { fg = P.none, bg = P.err },
		ScrollbarWarnHandle = { fg = P.none, bg = P.warn },
		ScrollbarInfoHandle = { fg = P.none, bg = P.info },
		ScrollbarMiscHandle = { fg = P.none, bg = P.muted },
		ScrollbarGitAdd = { fg = P.git_add },
		ScrollbarGitChange = { fg = P.git_change },
		ScrollbarGitDelete = { fg = P.git_delete },
	}
end
