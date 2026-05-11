--- nvim-tree.lua
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, O, ctx)
	if not ctx.pick("nvim_tree") then
		return {}
	end
	local U = ctx.U
	local float_bg = ctx.float_bg
	local blend_bg = ctx.blend_bg
	local side_bg = ctx.inactive_sidebar_bg(O, P)
	local side_sep = side_bg ~= P.none and side_bg or U.blend(P.border, blend_bg, 0.12)
	local side_cursor = O.transparent_background and P.none or U.blend(P.fg, side_bg, 0.09)
	local side_cursor_col = O.transparent_background and P.none or U.blend(P.fg, side_bg, 0.05)
	local indent_base = side_bg ~= P.none and side_bg or blend_bg
	local indent_soft = U.blend(P.indent_guide, indent_base, 0.42)
	return {
		NvimTreeNormal = { fg = P.fg, bg = side_bg },
		NvimTreeNormalNC = { fg = P.fg, bg = side_bg },
		NvimTreeNormalFloat = { fg = P.fg, bg = float_bg },
		NvimTreePopup = { fg = P.fg, bg = float_bg },
		NvimTreeEndOfBuffer = { fg = side_bg, bg = side_bg },
		NvimTreeLineNr = { fg = P.line_nr, bg = side_bg },
		NvimTreeCursorLineNr = { fg = P.line_nr_cur, bg = side_cursor, bold = true },
		NvimTreeSignColumn = { fg = P.line_nr, bg = side_bg },
		NvimTreeCursorLine = { bg = side_cursor },
		NvimTreeCursorColumn = { bg = side_cursor_col },
		NvimTreeStatusLine = { fg = P.muted, bg = side_bg },
		NvimTreeStatusLineNC = { fg = P.subtle, bg = side_bg },
		NvimTreeWinSeparator = { fg = side_sep, bg = side_bg },
		NvimTreeVertSplit = { fg = side_sep, bg = side_bg },

		NvimTreeRootFolder = { fg = P.accent, bold = true },
		NvimTreeSymlink = { fg = P.hint },
		NvimTreeSymlinkIcon = { fg = P.hint },
		NvimTreeExecFile = { fg = P.git_add },
		NvimTreeOpenedFile = { fg = P.fg, bold = true },
		NvimTreeOpenedHL = { fg = P.fg, bold = true },
		NvimTreeModifiedFile = { fg = P.warn },
		NvimTreeSpecialFile = { fg = P.warn },
		NvimTreeImageFile = { fg = P.func },
		NvimTreeFileIcon = { fg = P.subtle },
		NvimTreeIndentMarker = { fg = indent_soft },
		NvimTreeFolderArrowClosed = { fg = indent_soft },
		NvimTreeFolderArrowOpen = { fg = indent_soft },
		NvimTreeGitDirty = { fg = P.warn },
		NvimTreeGitStaged = { fg = P.git_add },
		NvimTreeGitMerge = { fg = P.accent },
		NvimTreeGitRenamed = { fg = P.info },
		NvimTreeGitNew = { fg = P.git_add },
		NvimTreeGitDeleted = { fg = P.git_delete },
		NvimTreeFolderIcon = { fg = P.accent },
		NvimTreeOpenedFolderIcon = { fg = P.accent },
		NvimTreeClosedFolderIcon = { fg = P.accent },
		NvimTreeFolderName = { fg = P.fg },
		NvimTreeOpenedFolderName = { fg = P.fg },
		NvimTreeSymlinkFolderName = { fg = P.hint },
		NvimTreeEmptyFolderName = { fg = P.muted },
	}
end
