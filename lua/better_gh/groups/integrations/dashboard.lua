--- dashboard-nvim / alpha
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("dashboard") then
		return {}
	end
	return {
		DashboardHeader = { fg = P.accent },
		DashboardFooter = { fg = P.subtle },
		DashboardDesc = { fg = P.muted },
		DashboardIcon = { fg = P.accent },
		DashboardKey = { fg = P.warn },
		DashboardProjectTitle = { fg = P.title, bold = true },
		DashboardProjectIcon = { fg = P.accent },
		DashboardMruTitle = { fg = P.title, bold = true },
		DashboardMruIcon = { fg = P.hint },
		DashboardShortCut = { fg = P.func },
	}
end
