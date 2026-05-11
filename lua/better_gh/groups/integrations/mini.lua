--- mini.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("mini") then
		return {}
	end
	local bg = ctx.bg
	local float_bg = ctx.float_bg
	return {
		MiniAnimateCursor = { reverse = true, nocombine = true },
		MiniAnimateNormalFloat = { link = "NormalFloat" },

		MiniClueBorder = { link = "FloatBorder" },
		MiniClueDescGroup = { link = "DiagnosticFloatingWarn" },
		MiniClueDescSingle = { link = "NormalFloat" },
		MiniClueNextKey = { link = "DiagnosticFloatingHint" },
		MiniClueNextKeyWithPostkeys = { link = "DiagnosticFloatingError" },
		MiniClueSeparator = { link = "DiagnosticFloatingInfo" },
		MiniClueTitle = { link = "FloatTitle" },

		MiniCompletionActiveParameter = { underline = true },

		MiniCursorword = { underline = true },
		MiniCursorwordCurrent = { underline = true },

		MiniDepsChangeAdded = { link = "diffAdded" },
		MiniDepsChangeRemoved = { link = "diffRemoved" },
		MiniDepsHint = { link = "DiagnosticHint" },
		MiniDepsInfo = { link = "DiagnosticInfo" },
		MiniDepsMsgBreaking = { link = "DiagnosticWarn" },
		MiniDepsPlaceholder = { link = "Comment" },
		MiniDepsTitle = { link = "Title" },
		MiniDepsTitleError = { fg = P.base, bg = P.err, bold = true },
		MiniDepsTitleSame = { link = "DiffText" },
		MiniDepsTitleUpdate = { fg = P.base, bg = P.git_add, bold = true },

		MiniDiffSignAdd = { fg = P.git_add },
		MiniDiffSignChange = { fg = P.git_change },
		MiniDiffSignDelete = { fg = P.git_delete },
		MiniDiffOverAdd = { link = "DiffAdd" },
		MiniDiffOverChange = { link = "DiffText" },
		MiniDiffOverContext = { link = "DiffChange" },
		MiniDiffOverDelete = { link = "DiffDelete" },

		MiniFilesBorder = { link = "FloatBorder" },
		MiniFilesBorderModified = { link = "DiagnosticFloatingWarn" },
		MiniFilesCursorLine = { link = "CursorLine" },
		MiniFilesDirectory = { link = "Directory" },
		MiniFilesFile = { fg = P.fg },
		MiniFilesNormal = { link = "NormalFloat" },
		MiniFilesTitle = { link = "FloatTitle" },
		MiniFilesTitleFocused = { fg = P.base, bg = P.func, bold = true },

		MiniHipatternsFixme = { fg = P.base, bg = P.err, bold = true },
		MiniHipatternsHack = { fg = P.base, bg = P.warn, bold = true },
		MiniHipatternsNote = { fg = P.base, bg = P.hint, bold = true },
		MiniHipatternsTodo = { fg = P.base, bg = P.ok, bold = true },

		MiniIconsAzure = { fg = P.accent },
		MiniIconsBlue = { fg = P.accent },
		MiniIconsCyan = { fg = P.term.cyan },
		MiniIconsGreen = { fg = P.git_add },
		MiniIconsGrey = { fg = P.fg },
		MiniIconsOrange = { fg = P.field },
		MiniIconsPurple = { fg = P.func },
		MiniIconsRed = { fg = P.err },
		MiniIconsYellow = { fg = P.warn },

		MiniIndentscopeSymbol = { fg = P.indent_guide_active },

		MiniJump = { fg = P.muted, bg = P.warn },
		MiniJump2dDim = { fg = P.subtle },
		MiniJump2dSpot = { fg = P.field, bg = P.base, bold = true, underline = true },
		MiniJump2dSpotAhead = { fg = P.hint, bg = P.mantle },
		MiniJump2dSpotUnique = { fg = P.accent, bg = P.base, bold = true },

		MiniMapNormal = { link = "NormalFloat" },
		MiniMapSymbolCount = { link = "Special" },
		MiniMapSymbolLine = { link = "Title" },
		MiniMapSymbolView = { link = "Delimiter" },

		MiniNotifyBorder = { link = "FloatBorder" },
		MiniNotifyNormal = { link = "NormalFloat" },
		MiniNotifyTitle = { link = "FloatTitle" },

		MiniOperatorsExchangeFrom = { link = "IncSearch" },

		MiniPickBorder = { link = "FloatBorder" },
		MiniPickBorderBusy = { link = "DiagnosticFloatingWarn" },
		MiniPickBorderText = { fg = P.base, bg = P.func, bold = true },
		MiniPickIconDirectory = { link = "Directory" },
		MiniPickIconFile = { fg = P.fg },
		MiniPickHeader = { link = "DiagnosticFloatingHint" },
		MiniPickMatchCurrent = { fg = P.field, bg = P.surface_hover, bold = true },
		MiniPickMatchMarked = { link = "Visual" },
		MiniPickMatchRanges = { link = "DiagnosticFloatingHint" },
		MiniPickNormal = { link = "NormalFloat" },
		MiniPickPreviewLine = { link = "CursorLine" },
		MiniPickPreviewRegion = { link = "IncSearch" },
		MiniPickPrompt = { fg = P.fg, bg = float_bg },
		MiniPickPromptCaret = { fg = P.accent },

		MiniStarterCurrent = { fg = P.base, bg = P.accent, bold = true },
		MiniStarterFooter = { fg = P.subtle },
		MiniStarterHeader = { fg = P.accent, bold = true },
		MiniStarterInactive = { fg = P.muted },
		MiniStarterItem = { fg = P.fg },
		MiniStarterItemBullet = { fg = P.subtle },
		MiniStarterItemPrefix = { fg = P.warn },
		MiniStarterSection = { fg = P.func, bold = true },
		MiniStarterQuery = { fg = P.accent, bold = true },

		MiniStatuslineDevinfo = { fg = P.muted, bg = P.mantle },
		MiniStatuslineFilename = { fg = P.fg, bg = bg },
		MiniStatuslineFileinfo = { fg = P.muted, bg = P.mantle },
		MiniStatuslineModeCommand = { fg = P.base, bg = P.warn, bold = true },
		MiniStatuslineModeInsert = { fg = P.base, bg = P.git_add, bold = true },
		MiniStatuslineModeNormal = { fg = P.base, bg = P.accent, bold = true },
		MiniStatuslineModeOther = { fg = P.base, bg = P.hint, bold = true },
		MiniStatuslineModeReplace = { fg = P.base, bg = P.err, bold = true },
		MiniStatuslineModeVisual = { fg = P.base, bg = P.func, bold = true },

		MiniSurround = { fg = P.base, bg = P.warn },

		MiniTablineCurrent = { fg = P.fg, bg = bg, bold = true },
		MiniTablineFill = { bg = P.mantle },
		MiniTablineHidden = { fg = P.muted, bg = P.mantle },
		MiniTablineModifiedCurrent = { fg = P.warn, bg = bg, bold = true },
		MiniTablineModifiedHidden = { fg = P.warn, bg = P.mantle },
		MiniTablineModifiedVisible = { fg = P.warn, bg = P.surface_hover },
		MiniTablineVisible = { fg = P.fg, bg = P.surface_hover },

		MiniTestEmphasis = { bold = true },
		MiniTestFail = { fg = P.err, bold = true },
		MiniTestPass = { fg = P.git_add, bold = true },

		MiniTrailspace = { bg = P.err },
	}
end
