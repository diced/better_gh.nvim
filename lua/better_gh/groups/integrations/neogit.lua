--- Neogit
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, O, ctx)
	if not ctx.pick("neogit") then
		return {}
	end
	local U = ctx.U
	local float_bg = ctx.float_bg
	local neo_bg = O.transparent_background and P.none or P.base
	local neo_solid = neo_bg == P.none and P.base or neo_bg
	local neo_panel = (float_bg == P.none) and neo_bg or float_bg
	local neo_panel_solid = neo_panel == P.none and P.base or neo_panel
	local neo_ctx = O.transparent_background and P.none or U.blend(P.fg, neo_solid, 0.038)
	local neo_ctx_hi = O.transparent_background and P.none or U.blend(P.fg, neo_solid, 0.072)
	local neo_sel = O.transparent_background and P.none or U.blend(P.accent, neo_solid, 0.2)

	return {
		NeogitSignColumn = { link = "SignColumn" },
		NeogitFold = { link = "Normal" },
		NeogitFoldColumn = { link = "FoldColumn" },
		NeogitChangeUntrackeduntracked = { fg = P.subtle },
		NeogitChangeUntrackedunstaged = { fg = P.subtle },
		NeogitChangeUntrackedstaged = { fg = P.subtle },
		NeogitSectionHeaderCount = { fg = P.muted },
		NeogitStatusHEAD = { fg = P.fg, bold = true },

		NeogitNormal = { fg = P.fg, bg = neo_bg },
		NeogitNormalFloat = { fg = P.fg, bg = neo_panel },
		NeogitFloatBorder = { fg = P.float_border_hi, bg = neo_bg },
		NeogitWinSeparator = { fg = P.border, bg = neo_bg },

		NeogitFloatHeader = { fg = P.fg, bg = neo_bg, bold = true },
		NeogitFloatHeaderHighlight = { fg = P.accent, bg = neo_panel, bold = true },

		NeogitCursorLine = { link = "CursorLine" },
		NeogitCursorLineNr = { link = "CursorLineNr" },

		NeogitSectionHeader = { fg = P.title, bold = true },
		NeogitBranch = { fg = P.accent, bold = true },
		NeogitBranchHead = { fg = P.accent, bold = true, underline = true },
		NeogitRemote = { fg = P.git_add, bold = true },
		NeogitTagName = { fg = P.warn },
		NeogitTagDistance = { fg = P.hint },

		NeogitPopupSwitchKey = { fg = P.accent },
		NeogitPopupOptionKey = { fg = P.accent },
		NeogitPopupConfigKey = { fg = P.accent },
		NeogitPopupActionKey = { fg = P.accent },

		NeogitActiveItem = { fg = P.fg, bg = neo_sel, bold = true },

		NeogitCommitViewHeader = { fg = P.fg, bg = U.blend(P.hint, neo_panel_solid, 0.32), bold = true },

		NeogitDiffHeader = { fg = P.accent, bg = neo_panel, bold = true },
		NeogitDiffHeaderHighlight = { fg = P.warn, bg = neo_panel, bold = true },

		NeogitHunkHeader = { fg = P.fg, bg = P.mantle, bold = true },
		NeogitHunkHeaderHighlight = { fg = P.fg, bg = U.blend(P.accent, neo_solid, 0.14), bold = true },
		NeogitHunkHeaderCursor = { link = "NeogitHunkHeaderHighlight" },
		NeogitHunkMergeHeader = { fg = P.fg, bg = P.mantle, bold = true },
		NeogitHunkMergeHeaderHighlight = { fg = neo_solid, bg = P.hint, bold = true },
		NeogitHunkMergeHeaderCursor = { link = "NeogitHunkMergeHeaderHighlight" },

		NeogitDiffContext = { bg = neo_ctx },
		NeogitDiffContextHighlight = { bg = neo_ctx_hi },
		NeogitDiffContextCursor = { bg = neo_ctx },

		NeogitDiffAdditions = { fg = P.git_add },
		NeogitDiffDeletions = { fg = P.git_delete },
		NeogitDiffAdd = { bg = P.diff_add, fg = P.git_add },
		NeogitDiffDelete = { bg = P.diff_del, fg = P.git_delete },
		NeogitDiffAddHighlight = { bg = P.diff_add, fg = P.git_add },
		NeogitDiffDeleteHighlight = { bg = P.diff_del, fg = P.git_delete },
		NeogitDiffAddCursor = { fg = P.git_add, bg = neo_ctx },
		NeogitDiffDeleteCursor = { fg = P.git_delete, bg = neo_ctx },

		NeogitDiffAddInline = { bg = U.blend(P.git_add, neo_solid, 0.22), fg = P.git_add, bold = true },
		NeogitDiffDeleteInline = { bg = U.blend(P.git_delete, neo_solid, 0.26), fg = P.fg, bold = true },

		NeogitChangeModified = { fg = P.info, bold = true, italic = true },
		NeogitChangeAdded = { fg = P.git_add, bold = true, italic = true },
		NeogitChangeDeleted = { fg = P.git_delete, bold = true, italic = true },
		NeogitChangeRenamed = { fg = P.func, bold = true, italic = true },
		NeogitChangeUpdated = { fg = P.warn, bold = true, italic = true },
		NeogitChangeCopied = { fg = P.hint, bold = true, italic = true },
		NeogitChangeUnmerged = { fg = P.warn, bold = true, italic = true },
		NeogitChangeNewFile = { fg = P.git_add, bold = true, italic = true },

		NeogitUnmergedInto = { fg = P.func, bold = true },
		NeogitUnpushedTo = { fg = P.func, bold = true },
		NeogitUnpulledFrom = { fg = P.func, bold = true },
	}
end
