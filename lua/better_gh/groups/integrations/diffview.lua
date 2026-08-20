--- diffview.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("diffview") then
		return {}
	end

	local U = ctx.U
	local bg = ctx.bg
	local solid_bg = bg == P.none and P.base or bg
	local filler = U.blend(P.muted, solid_bg, 0.45)

	return {
		DiffviewNormal = { fg = P.fg, bg = bg },
		DiffviewSignColumn = { fg = P.muted, bg = bg },
		DiffviewWinSeparator = { fg = P.border, bg = bg },
		DiffviewEndOfBuffer = { fg = P.subtle, bg = bg },

		DiffviewFilePanelTitle = { fg = P.title, bold = true },
		DiffviewFilePanelCounter = { fg = P.muted },
		DiffviewFilePanelRootPath = { fg = P.muted },
		DiffviewFilePanelFileName = { fg = P.fg },
		DiffviewFilePanelSelected = { fg = P.accent, bold = true },
		DiffviewFilePanelPath = { fg = P.comment },
		DiffviewFilePanelInsertions = { fg = P.git_add },
		DiffviewFilePanelDeletions = { fg = P.git_delete },
		DiffviewFilePanelConflicts = { fg = P.warn },
		DiffviewFolderName = { fg = P.accent },
		DiffviewFolderSign = { fg = P.muted },
		DiffviewHash = { fg = P.muted },
		DiffviewReference = { fg = P.func },
		DiffviewReflogSelector = { fg = P.accent },

		DiffviewStatusAdded = { fg = P.git_add },
		DiffviewStatusUntracked = { fg = P.git_add },
		DiffviewStatusModified = { fg = P.git_change },
		DiffviewStatusRenamed = { fg = P.git_change },
		DiffviewStatusCopied = { fg = P.git_change },
		DiffviewStatusTypeChange = { fg = P.git_change },
		DiffviewStatusUnmerged = { fg = P.warn },
		DiffviewStatusUnknown = { fg = P.git_delete },
		DiffviewStatusDeleted = { fg = P.git_delete },
		DiffviewStatusBroken = { fg = P.git_delete },
		DiffviewStatusIgnored = { fg = P.comment },

		DiffviewDiffAdd = { link = "DiffAdd" },
		DiffviewDiffChange = { link = "DiffChange" },
		DiffviewDiffText = { link = "DiffText" },
		DiffviewDiffAddAsDelete = { link = "DiffDelete" },

		-- DiffDelete marks alignment filler, not deleted source. Keeping its
		-- slash neutral makes large hunks much easier to scan.
		DiffviewDiffDelete = { fg = filler, bg = bg },
		DiffviewDiffDeleteDim = { fg = filler, bg = bg },
	}
end
