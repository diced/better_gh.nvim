--- noice.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("noice") then
		return {}
	end
	local bg = ctx.bg
	local float_bg = ctx.float_bg
	return {
		NoiceCmdline = { fg = P.fg, bg = bg },
		NoiceCmdlineIcon = { fg = P.info },
		NoiceCmdlineIconSearch = { fg = P.warn },
		NoiceCmdlinePrompt = { link = "Title" },
		NoiceCmdlinePopup = { fg = P.fg, bg = float_bg },
		NoiceCmdlinePopupBorder = { fg = P.float_border_hi, bg = float_bg },
		NoiceCmdlinePopupTitle = { fg = P.fg, bg = float_bg, bold = true },
		NoiceCmdlinePopupBorderSearch = { fg = P.warn, bg = float_bg },

		NoiceConfirm = { fg = P.fg, bg = float_bg },
		NoiceConfirmBorder = { fg = P.float_border_hi, bg = float_bg },

		NoiceCursor = { link = "Cursor" },
		NoiceMini = { fg = P.fg, bg = bg },

		NoicePopup = { fg = P.fg, bg = float_bg },
		NoicePopupBorder = { fg = P.float_border_hi, bg = float_bg },

		NoicePopupmenu = { fg = P.fg, bg = P.pmenu_bg },
		NoicePopupmenuBorder = { fg = P.float_border_hi, bg = P.pmenu_bg },
		NoicePopupmenuMatch = { fg = P.accent, bold = true },
		NoicePopupmenuSelected = { fg = P.fg, bg = P.pmenu_sel },

		NoiceScrollbar = { bg = P.mantle },
		NoiceScrollbarThumb = { bg = P.subtle },

		NoiceSplit = { fg = P.fg, bg = float_bg },
		NoiceSplitBorder = { fg = P.float_border_hi, bg = float_bg },

		NoiceVirtualText = { link = "DiagnosticVirtualTextInfo" },

		NoiceFormatProgressDone = { link = "Search" },
		NoiceFormatProgressTodo = { link = "CursorLine" },
		NoiceFormatEvent = { fg = P.muted },
		NoiceFormatKind = { fg = P.subtle },
		NoiceFormatDate = { fg = P.const },
		NoiceFormatConfirm = { link = "CursorLine" },
		NoiceFormatConfirmDefault = { link = "Visual" },
		NoiceFormatTitle = { fg = P.title, bold = true },

		NoiceFormatLevelDebug = { fg = P.subtle },
		NoiceFormatLevelTrace = { fg = P.subtle },
		NoiceFormatLevelOff = { fg = P.subtle },
		NoiceFormatLevelInfo = { link = "DiagnosticVirtualTextInfo" },
		NoiceFormatLevelWarn = { link = "DiagnosticVirtualTextWarn" },
		NoiceFormatLevelError = { link = "DiagnosticVirtualTextError" },

		NoiceLspProgressSpinner = { fg = P.const },
		NoiceLspProgressTitle = { fg = P.muted },
		NoiceLspProgressClient = { fg = P.title, bold = true },

		NoiceCompletionItemKindDefault = { fg = P.muted },
		NoiceCompletionItemKindColor = { link = "CmpItemKindColor" },
		NoiceCompletionItemKindFunction = { link = "CmpItemKindFunction" },
		NoiceCompletionItemKindClass = { link = "CmpItemKindClass" },
		NoiceCompletionItemKindMethod = { link = "CmpItemKindMethod" },
		NoiceCompletionItemKindConstructor = { link = "CmpItemKindConstructor" },
		NoiceCompletionItemKindInterface = { link = "CmpItemKindInterface" },
		NoiceCompletionItemKindModule = { link = "CmpItemKindModule" },
		NoiceCompletionItemKindStruct = { link = "CmpItemKindStruct" },
		NoiceCompletionItemKindKeyword = { link = "CmpItemKindKeyword" },
		NoiceCompletionItemKindValue = { link = "CmpItemKindValue" },
		NoiceCompletionItemKindProperty = { link = "CmpItemKindProperty" },
		NoiceCompletionItemKindConstant = { link = "CmpItemKindConstant" },
		NoiceCompletionItemKindSnippet = { link = "CmpItemKindSnippet" },
		NoiceCompletionItemKindFolder = { link = "CmpItemKindFolder" },
		NoiceCompletionItemKindText = { link = "CmpItemKindText" },
		NoiceCompletionItemKindEnumMember = { link = "CmpItemKindEnumMember" },
		NoiceCompletionItemKindUnit = { link = "CmpItemKindUnit" },
		NoiceCompletionItemKindField = { link = "CmpItemKindField" },
		NoiceCompletionItemKindFile = { link = "CmpItemKindFile" },
		NoiceCompletionItemKindVariable = { link = "CmpItemKindVariable" },
		NoiceCompletionItemKindEnum = { link = "CmpItemKindEnum" },

		NoiceHiddenCursor = { blend = 100, nocombine = true },
	}
end
