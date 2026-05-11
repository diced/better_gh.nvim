--- neo-tree.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, O, ctx)
	if not ctx.pick("neo_tree") then
		return {}
	end
	local U = ctx.U
	local float_bg = ctx.float_bg
	local side_bg = ctx.inactive_sidebar_bg(O, P)
	local side_cursor = O.transparent_background and P.none or U.blend(P.fg, side_bg, 0.07)
	return {
		NeoTreeNormal = { fg = P.fg, bg = side_bg },
		NeoTreeNormalNC = { fg = P.fg, bg = side_bg },
		NeoTreeEndOfBuffer = { fg = side_bg, bg = side_bg },
		NeoTreeSignColumn = { fg = P.line_nr, bg = side_bg },
		NeoTreeCursorLine = { bg = side_cursor },
		NeoTreeWinSeparator = { fg = P.border, bg = side_bg },
		NeoTreeVertSplit = { fg = P.border, bg = side_bg },
		NeoTreeStatusLine = { fg = P.muted, bg = side_bg },
		NeoTreeStatusLineNC = { fg = P.subtle, bg = side_bg },

		NeoTreeRootName = { fg = P.accent, bg = side_bg, bold = true },
		NeoTreeSymbolicLinkTarget = { fg = P.hint, bg = side_bg },
		NeoTreeDirectoryName = { fg = P.accent, bg = side_bg },
		NeoTreeDirectoryIcon = { fg = P.accent, bg = side_bg },
		NeoTreeFileIcon = { fg = P.muted, bg = side_bg },
		NeoTreeFileName = { fg = P.fg, bg = side_bg },
		NeoTreeFileNameOpened = { fg = P.fg, bg = side_bg, bold = true },
		NeoTreeIndentMarker = { fg = P.indent_guide, bg = side_bg },
		NeoTreeExpander = { fg = P.muted, bg = side_bg },
		NeoTreeDimText = { fg = P.subtle, bg = side_bg },
		NeoTreeGitAdded = { fg = P.git_add, bg = side_bg },
		NeoTreeGitConflict = { fg = P.err, bg = side_bg },
		NeoTreeGitDeleted = { fg = P.git_delete, bg = side_bg },
		NeoTreeGitIgnored = { fg = P.subtle, bg = side_bg },
		NeoTreeGitModified = { fg = P.warn, bg = side_bg },
		NeoTreeGitUntracked = { fg = P.hint, bg = side_bg },
		NeoTreeFloatBorder = { fg = P.float_border_hi, bg = float_bg },
		NeoTreeFloatTitle = { fg = P.fg, bg = float_bg, bold = true },
	}
end
