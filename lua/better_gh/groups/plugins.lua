local U = require("better_gh.util")

local function inactive_sidebar_bg(opts, pal)
	return opts.transparent_background and pal.none or pal.mantle
end

---@param P table
---@param O table
---@return table<string, vim.api.keyset.highlight>
return function(P, O)
	local bg = O.transparent_background and P.none or P.base
	local float_bg = O.transparent_background and P.none or P.float_bg
	--- Virtual highlights still need to tint against an opaque chroma when Normal is NONE.
	local blend_bg = (bg == P.none) and P.base or bg

	local function pick_integration(key)
		local v = O.integrations[key]
		return v == nil or v
	end

	local h = {}

	local function merge(t)
		for k, v in pairs(t) do
			h[k] = v
		end
	end

	-- Indent guides (indent-blankline, snacks indent, etc.)
	if pick_integration("indent_blankline") then
		merge({
			IndentBlanklineChar = { fg = P.indent_guide, nocombine = true },
			IndentBlanklineSpaceChar = { link = "IndentBlanklineChar" },
			IndentBlanklineSpaceCharBlankline = { link = "IndentBlanklineChar" },
			IndentBlanklineContextChar = { fg = P.indent_guide_active, nocombine = true },
			IndentBlanklineContextStart = { sp = P.indent_guide_active, underline = true },
			IblIndent = { fg = P.indent_guide, nocombine = true },
			IblWhitespace = { fg = P.indent_guide, nocombine = true },
			IblScope = { fg = P.indent_guide_active, nocombine = true },
		})
	end

	-- Rainbow brackets / delimiters
	if pick_integration("rainbow_delimiters") then
		local r = P.rainbow
		merge({
			RainbowDelimiterRed = { fg = r[4] },
			RainbowDelimiterYellow = { fg = r[3] },
			RainbowDelimiterBlue = { fg = r[1] },
			RainbowDelimiterOrange = { fg = P.field },
			RainbowDelimiterGreen = { fg = r[2] },
			RainbowDelimiterViolet = { fg = r[6] },
			RainbowDelimiterCyan = { fg = P.term.cyan },
			RainbowDelimiter1 = { fg = r[1] },
			RainbowDelimiter2 = { fg = r[2] },
			RainbowDelimiter3 = { fg = r[3] },
			RainbowDelimiter4 = { fg = r[4] },
			RainbowDelimiter5 = { fg = r[5] },
			RainbowDelimiter6 = { fg = r[6] },
		})
	end

	-- nvim-tree.lua
	if pick_integration("nvim_tree") then
		local side_bg = inactive_sidebar_bg(O, P)
		local side_cursor = O.transparent_background and P.none or U.blend(P.fg, side_bg, 0.07)
		local side_cursor_col = O.transparent_background and P.none or U.blend(P.fg, side_bg, 0.05)
		merge({
			NvimTreeNormal = { fg = P.fg, bg = side_bg },
			NvimTreeNormalNC = { fg = P.fg, bg = side_bg },
			NvimTreeNormalFloat = { fg = P.fg, bg = float_bg },
			NvimTreePopup = { fg = P.fg, bg = float_bg },
			NvimTreeEndOfBuffer = { fg = side_bg, bg = side_bg },
			NvimTreeLineNr = { fg = P.line_nr, bg = side_bg },
			NvimTreeCursorLineNr = { fg = P.line_nr_cur, bg = side_bg, bold = true },
			NvimTreeSignColumn = { fg = P.line_nr, bg = side_bg },
			NvimTreeCursorLine = { bg = side_cursor },
			NvimTreeCursorColumn = { bg = side_cursor_col },
			NvimTreeStatusLine = { fg = P.muted, bg = side_bg },
			NvimTreeStatusLineNC = { fg = P.subtle, bg = side_bg },

			NvimTreeRootFolder = { fg = P.accent, bg = side_bg, bold = true },
			NvimTreeSymlink = { fg = P.hint, bg = side_bg },
			NvimTreeExecFile = { fg = P.git_add, bg = side_bg },
			NvimTreeOpenedFile = { fg = P.fg, bg = side_bg, bold = true },
			NvimTreeModifiedFile = { fg = P.warn, bg = side_bg },
			NvimTreeSpecialFile = { fg = P.warn, bg = side_bg },
			NvimTreeImageFile = { fg = P.func, bg = side_bg },
			NvimTreeIndentMarker = { fg = P.indent_guide, bg = side_bg },
			NvimTreeGitDirty = { fg = P.warn, bg = side_bg },
			NvimTreeGitStaged = { fg = P.git_add, bg = side_bg },
			NvimTreeGitMerge = { fg = P.accent, bg = side_bg },
			NvimTreeGitRenamed = { fg = P.info, bg = side_bg },
			NvimTreeGitNew = { fg = P.git_add, bg = side_bg },
			NvimTreeGitDeleted = { fg = P.git_delete, bg = side_bg },
			NvimTreeFolderIcon = { fg = P.accent, bg = side_bg },
			NvimTreeOpenedFolderIcon = { fg = P.accent, bg = side_bg },
			NvimTreeClosedFolderIcon = { fg = P.accent, bg = side_bg },
			NvimTreeFolderName = { fg = P.accent, bg = side_bg },
			NvimTreeOpenedFolderName = { fg = P.accent, bg = side_bg },
			NvimTreeEmptyFolderName = { fg = P.muted, bg = side_bg },
			NvimTreeWinSeparator = { fg = P.border, bg = side_bg },
		})
	end

	-- neo-tree.nvim
	if pick_integration("neo_tree") then
		local side_bg = inactive_sidebar_bg(O, P)
		local side_cursor = O.transparent_background and P.none or U.blend(P.fg, side_bg, 0.07)
		merge({
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
		})
	end

	-- Gitsigns
	if pick_integration("gitsigns") then
		merge({
			GitSignsAdd = { fg = P.git_add, bg = bg },
			GitSignsChange = { fg = P.git_change, bg = bg },
			GitSignsDelete = { fg = P.git_delete, bg = bg },
			GitSignsChangedelete = { fg = P.warn, bg = bg },
			GitSignsTopdelete = { fg = P.git_delete, bg = bg },
			GitSignsUntracked = { fg = P.hint, bg = bg },
		})
	end

	-- Neogit
	if pick_integration("neogit") then
		local neo_bg = O.transparent_background and P.none or P.base
		local neo_solid = neo_bg == P.none and P.base or neo_bg
		local neo_panel = (float_bg == P.none) and neo_bg or float_bg
		local neo_panel_solid = neo_panel == P.none and P.base or neo_panel
		local neo_ctx = O.transparent_background and P.none or U.blend(P.fg, neo_solid, 0.038)
		local neo_ctx_hi = O.transparent_background and P.none or U.blend(P.fg, neo_solid, 0.072)
		local neo_sel = O.transparent_background and P.none or U.blend(P.accent, neo_solid, 0.2)

		merge({
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
		})
	end

	-- Telescope
	if pick_integration("telescope") then
		merge({
			TelescopeNormal = { fg = P.fg, bg = float_bg },
			TelescopeBorder = { fg = P.float_border_hi, bg = float_bg },
			TelescopeTitle = { fg = P.fg, bg = float_bg, bold = true },
			TelescopePromptNormal = { fg = P.fg, bg = float_bg },
			TelescopePromptBorder = { fg = P.float_border_hi, bg = float_bg },
			TelescopePromptTitle = { fg = P.title, bg = float_bg, bold = true },
			TelescopePromptPrefix = { fg = P.accent },
			TelescopePromptCounter = { fg = P.muted },
			TelescopeMatching = { fg = P.accent, bold = true },
			TelescopeSelection = { fg = P.fg, bg = P.pmenu_sel },
			TelescopeSelectionCaret = { fg = P.accent },
			TelescopeMultiSelection = { fg = P.warn },
			TelescopePreviewNormal = { fg = P.fg, bg = float_bg },
			TelescopePreviewBorder = { fg = P.float_border_hi, bg = float_bg },
			TelescopePreviewTitle = { fg = P.fg, bg = float_bg, bold = true },
		})
	end

	-- fzf-lua — outer nvim wins + embedded fzf `--color` (see fzf-lua `defaults.__HLS`, `create_fzf_colors`).
	-- Dim/info/prompt rows need explicit `bg = float_bg` or ansi dims render wrong on the panel.
	--
	-- Treesitter pane: fzf-lua defaults hl/hl+ = "-1:reverse" → fuzzy-match bg inherits TS fg (magenta bands).
	-- Override with `require("better_gh").fzf_lua_treesitter_fzf_colors()` in fzf-lua `setup`.
	if pick_integration("fzf_lua") then
		-- One surface for picker + preview; darker than generic floats so the picker reads as a denser overlay.
		local fzf_panel_bg = (float_bg == P.none) and P.base or U.blend(P.base, float_bg, 0.68)
		local fzf_preview_line = O.transparent_background and P.none or U.blend("#ffffff", fzf_panel_bg, 0.045)
		local fzf_list_sel = U.blend(P.accent, fzf_panel_bg, 0.26)
		local fzf_backdrop_mask = U.blend("#000000", P.base, 0.72)
		merge({
			FzfLuaNormal = { fg = P.fg, bg = fzf_panel_bg },
			FzfLuaBorder = { fg = P.float_border_hi, bg = fzf_panel_bg },
			FzfLuaTitle = { fg = P.fg, bg = fzf_panel_bg, bold = true },
			FzfLuaTitleFlags = { fg = P.muted, bg = fzf_panel_bg },
			-- fg = bg: uniform mask; init.lua extends backdrop `winhl` past Normal-only (fzf-lua default).
			FzfLuaBackdrop = { fg = fzf_backdrop_mask, bg = fzf_backdrop_mask },

			FzfLuaPreviewNormal = { fg = P.fg, bg = fzf_panel_bg },
			FzfLuaPreviewBorder = { fg = P.float_border_hi, bg = fzf_panel_bg },
			FzfLuaPreviewTitle = { fg = P.fg, bg = fzf_panel_bg, bold = true },

			FzfLuaCursor = { link = "Cursor" },
			-- Builtin preview: CursorLine blended on same plane as preview bg (not editor `P.line`).
			FzfLuaCursorLine = { bg = fzf_preview_line },
			-- Match CursorLine stripe; defaults preview winhl does not remap LineNr (uses core LineNr).
			FzfLuaCursorLineNr = { fg = P.line_nr, bg = fzf_preview_line },
			FzfLuaSearch = { link = "IncSearch" },

			FzfLuaScrollBorderEmpty = { fg = P.float_border, bg = fzf_panel_bg },
			FzfLuaScrollBorderFull = { fg = P.float_border_hi, bg = fzf_panel_bg },
			FzfLuaScrollFloatEmpty = { fg = P.subtle, bg = fzf_panel_bg },
			FzfLuaScrollFloatFull = { fg = P.muted, bg = fzf_panel_bg },

			FzfLuaHelpNormal = { fg = P.fg, bg = fzf_panel_bg },
			FzfLuaHelpBorder = { fg = P.float_border_hi, bg = fzf_panel_bg },

			FzfLuaHeaderBind = { fg = P.warn, bg = fzf_panel_bg },
			FzfLuaHeaderText = { fg = P.fg, bg = fzf_panel_bg },

			FzfLuaPathColNr = { fg = P.hint, bg = fzf_panel_bg },
			FzfLuaPathLineNr = { fg = P.line_nr, bg = fzf_panel_bg },

			FzfLuaBufName = { fg = P.accent, bg = fzf_panel_bg },
			FzfLuaBufId = { fg = P.muted, bg = fzf_panel_bg },
			FzfLuaBufNr = { fg = P.warn, bg = fzf_panel_bg },
			FzfLuaBufLineNr = { fg = P.line_nr, bg = fzf_panel_bg },
			FzfLuaBufFlagCur = { fg = P.warn, bg = fzf_panel_bg },
			FzfLuaBufFlagAlt = { fg = P.hint, bg = fzf_panel_bg },

			FzfLuaTabTitle = { fg = P.title, bg = fzf_panel_bg },
			FzfLuaTabMarker = { fg = P.muted, bg = fzf_panel_bg },

			FzfLuaDirIcon = { fg = P.accent, bg = fzf_panel_bg },
			FzfLuaDirPart = { fg = P.muted, bg = fzf_panel_bg },
			FzfLuaFilePart = { fg = P.fg, bg = fzf_panel_bg },

			FzfLuaLivePrompt = { fg = P.accent, bg = fzf_panel_bg },
			FzfLuaLiveSym = { fg = P.func, bg = fzf_panel_bg },

			FzfLuaCmdEx = { fg = P.keyword, bg = fzf_panel_bg },
			FzfLuaCmdBuf = { fg = P.git_add, bg = fzf_panel_bg },
			FzfLuaCmdGlobal = { fg = P.accent, bg = fzf_panel_bg },

			-- fzf terminal faces (fg/bg, fg+/bg+, hl, info, prompt, query, …)
			FzfLuaFzfNormal = { fg = P.fg, bg = fzf_panel_bg },
			FzfLuaFzfBorder = { fg = P.float_border_hi, bg = fzf_panel_bg },
			FzfLuaFzfScrollbar = { fg = P.muted, bg = fzf_panel_bg },
			FzfLuaFzfSeparator = { fg = P.subtle, bg = fzf_panel_bg },
			FzfLuaFzfGutter = { fg = P.none, bg = fzf_panel_bg },
			FzfLuaFzfHeader = { fg = P.title, bg = fzf_panel_bg, bold = true },
			FzfLuaFzfInfo = { fg = P.subtle, bg = fzf_panel_bg },
			FzfLuaFzfPointer = { fg = P.accent, bg = fzf_panel_bg },
			FzfLuaFzfMarker = { fg = P.accent, bg = fzf_panel_bg },
			FzfLuaFzfSpinner = { fg = P.accent, bg = fzf_panel_bg },
			FzfLuaFzfPrompt = { fg = P.accent, bg = fzf_panel_bg },
			FzfLuaFzfQuery = { fg = P.fg, bg = fzf_panel_bg },
			-- bg+ for selected row; keep chroma aligned with PmenuSel but slightly stronger on float_bg.
			FzfLuaFzfCursorLine = { fg = P.fg, bg = fzf_list_sel, bold = false },
			-- No bg: fzf composites hl/hl+ on top of normal / cursorline rows.
			FzfLuaFzfMatch = { fg = P.accent, bold = true },
		})
	end

	-- Which-key
	if pick_integration("which_key") then
		merge({
			WhichKey = { fg = P.accent },
			WhichKeyGroup = { fg = P.func },
			WhichKeySeparator = { fg = P.subtle },
			WhichKeyDesc = { fg = P.fg },
			WhichKeyValue = { fg = P.muted },
			WhichKeyFloat = { fg = P.fg, bg = float_bg },
			WhichKeyBorder = { fg = P.float_border_hi, bg = float_bg },
		})
	end

	-- Lazy.nvim
	if pick_integration("lazy") then
		merge({
			LazyNormal = { fg = P.fg, bg = float_bg },
			LazyButton = { fg = P.fg, bg = P.mantle },
			LazyButtonActive = { fg = P.base, bg = P.accent },
			LazyComment = { fg = P.comment },
			LazyCommit = { fg = P.muted },
			LazyCommitIssue = { fg = P.warn },
			LazyCommitType = { fg = P.keyword },
			LazyDimmed = { fg = P.subtle },
			LazyDir = { fg = P.accent },
			LazyH1 = { fg = P.title, bold = true },
			LazyH2 = { fg = P.func, bold = true },
			LazyProp = { fg = P.field },
			LazyReasonCmd = { fg = P.accent },
			LazyReasonEvent = { fg = P.warn },
			LazyReasonFt = { fg = P.type },
			LazyReasonImport = { fg = P.git_add },
			LazyReasonKeys = { fg = P.warn },
			LazyReasonPlugin = { fg = P.func },
			LazyReasonRuntime = { fg = P.builtin },
			LazyReasonSource = { fg = P.hint },
			LazySpecial = { fg = P.warn },
			LazyTaskError = { fg = P.err },
			LazyTaskOutput = { fg = P.fg },
			LazyUrl = { fg = P.link, underline = true },
			LazyValue = { fg = P.string },
		})
	end

	-- Mason
	if pick_integration("mason") then
		merge({
			MasonNormal = { fg = P.fg, bg = float_bg },
			MasonHeader = { fg = P.title, bg = float_bg, bold = true },
			MasonHighlight = { fg = P.accent },
			MasonHighlightBlock = { fg = P.base, bg = P.accent },
			MasonHighlightBlockBold = { fg = P.base, bg = P.accent, bold = true },
			MasonMuted = { fg = P.muted },
			MasonMutedBlock = { fg = P.fg, bg = P.mantle },
			MasonLink = { fg = P.link, underline = true },
			MasonError = { fg = P.err },
			MasonHeading = { fg = P.title, bold = true },
		})
	end

	-- Trouble
	if pick_integration("trouble") then
		merge({
			TroubleNormal = { fg = P.fg, bg = float_bg },
			TroubleNormalNC = { fg = P.fg, bg = float_bg },
			TroubleText = { fg = P.fg },
			TroubleCount = { fg = P.base, bg = P.warn },
			TroubleIndentFoldClosed = { fg = P.subtle },
			TroubleIndentFoldOpen = { fg = P.muted },
			TroubleIndentWs = { fg = P.indent_guide },
			TroubleFile = { fg = P.accent },
			TroubleFoldIcon = { fg = P.muted },
			TroubleSource = { fg = P.comment },
			TroubleCode = { fg = P.func },
			TroubleLocation = { fg = P.muted },
			TroubleSignError = { fg = P.err },
			TroubleSignWarning = { fg = P.warn },
			TroubleSignInformation = { fg = P.info },
			TroubleSignHint = { fg = P.hint },
			TroubleSignOther = { fg = P.subtle },
			TroubleTextError = { fg = P.err },
			TroubleTextWarning = { fg = P.warn },
			TroubleTextInformation = { fg = P.info },
			TroubleTextHint = { fg = P.hint },
		})
	end

	-- Notify
	if pick_integration("notify") then
		merge({
			NotifyBackground = { bg = float_bg },
			NotifyERRORBorder = { fg = P.err },
			NotifyWARNBorder = { fg = P.warn },
			NotifyINFOBorder = { fg = P.info },
			NotifyDEBUGBorder = { fg = P.subtle },
			NotifyTRACEBorder = { fg = P.accent },
			NotifyERRORIcon = { fg = P.err },
			NotifyWARNIcon = { fg = P.warn },
			NotifyINFOIcon = { fg = P.info },
			NotifyDEBUGIcon = { fg = P.subtle },
			NotifyTRACEIcon = { fg = P.accent },
			NotifyERRORTitle = { fg = P.err },
			NotifyWARNTitle = { fg = P.warn },
			NotifyINFOTitle = { fg = P.info },
			NotifyDEBUGTitle = { fg = P.subtle },
			NotifyTRACETitle = { fg = P.accent },
			NotifyERRORBody = { fg = P.fg },
			NotifyWARNBody = { fg = P.fg },
			NotifyINFOBody = { fg = P.fg },
			NotifyDEBUGBody = { fg = P.fg },
			NotifyTRACEBody = { fg = P.fg },
		})
	end

	-- Noice.nvim — groups match lua/noice/config/highlights.lua (`Noice` .. key)
	if pick_integration("noice") then
		merge({
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
		})
	end

	-- Nvim-dap-ui
	if pick_integration("dap") then
		merge({
			DapUIScope = { fg = P.accent },
			DapUIType = { fg = P.type },
			DapUIValue = { fg = P.const },
			DapUIModifiedValue = { fg = P.warn },
			DapUIDecoration = { fg = P.border },
			DapUIThread = { fg = P.func },
			DapUIStoppedThread = { fg = P.accent },
			DapUIFrameName = { fg = P.fg },
			DapUISource = { fg = P.keyword },
			DapUILineNumber = { fg = P.line_nr },
			DapUIFloatBorder = { fg = P.float_border_hi, bg = float_bg },
			DapUIWatchesEmpty = { fg = P.err },
			DapUIWatchesValue = { fg = P.const },
			DapUIWatchesError = { fg = P.err },
			DapUIBreakpointsPath = { link = "Directory" },
			DapUIBreakpointsInfo = { fg = P.info },
			DapUIBreakpointsCurrentLine = { fg = P.warn, bold = true },
			DapUIBreakpointsDisabledLine = { fg = P.subtle },
			DapUICurrentFrameName = { fg = P.warn, bold = true },
		})
	end

	-- Hop / Flash / Leap (common motion plugins)
	if pick_integration("hop") then
		merge({
			HopNextKey = { fg = P.warn, bold = true },
			HopNextKey1 = { fg = P.accent, bold = true },
			HopNextKey2 = { fg = P.hint, bold = true },
			HopUnmatched = { fg = P.subtle },
			HopPreview = { fg = P.warn },
		})
	end

	if pick_integration("flash") then
		merge({
			FlashBackdrop = { fg = P.subtle },
			FlashLabel = { fg = P.base, bg = P.warn },
			FlashMatch = { fg = P.base, bg = P.accent },
			FlashCurrent = { fg = P.base, bg = P.func },
			FlashPrompt = { link = "MsgArea" },
			FlashPromptIcon = { fg = P.accent },
		})
	end

	if pick_integration("leap") then
		merge({
			LeapBackdrop = { fg = P.subtle },
			LeapMatch = { fg = P.accent, bold = true },
			LeapLabelPrimary = { fg = P.base, bg = P.warn, bold = true },
			LeapLabelSecondary = { fg = P.base, bg = P.hint, bold = true },
			LeapLabelSelected = { fg = P.base, bg = P.func },
		})
	end

	-- Bufferline / barbar (tabs often pick up TabLine* — extra hooks)
	if pick_integration("bufferline") then
		merge({
			BufferLineIndicatorSelected = { fg = P.accent },
			BufferLineSeparator = { fg = P.border },
			BufferLineFill = { bg = P.mantle },
			BufferLineBackground = { fg = P.muted, bg = P.mantle },
			BufferLineBufferSelected = { fg = P.fg, bg = bg, bold = true },
			BufferLineBufferVisible = { fg = P.fg, bg = P.surface_hover },
			BufferLineCloseButtonVisible = { fg = P.muted },
			BufferLineCloseButton = { fg = P.subtle },
			BufferLineModified = { fg = P.warn },
			BufferLineModifiedSelected = { fg = P.warn },
			BufferLineDuplicate = { fg = P.subtle },
			BufferLinePick = { fg = P.warn },
			BufferLinePickSelected = { fg = P.warn, bold = true },
			BufferLineDiagnostic = { fg = P.subtle },
			BufferLineNumbers = { fg = P.line_nr },
			BufferLineNumbersSelected = { fg = P.line_nr_cur },
		})
	end

	-- Dashboard / Alpha
	if pick_integration("dashboard") then
		merge({
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
		})
	end

	-- Treesitter-context — avoid underline on Bottom when `separator` is set (double rule).
	if pick_integration("treesitter_context") then
		merge({
			TreesitterContext = { bg = P.mantle },
			TreesitterContextLineNumber = { fg = P.line_nr, bg = P.mantle },
			TreesitterContextBottom = { bg = P.mantle },
			TreesitterContextLineNumberBottom = { fg = P.line_nr, bg = P.mantle },
			TreesitterContextSeparator = { fg = P.float_border, bg = bg },
		})
	end

	-- Illuminate (RRethy)
	if pick_integration("illuminate") then
		merge({
			IlluminatedWordText = { bg = U.blend(P.fg, blend_bg, 0.08) },
			IlluminatedWordRead = { bg = U.blend(P.accent, blend_bg, 0.12) },
			IlluminatedWordWrite = { bg = U.blend(P.warn, blend_bg, 0.12) },
		})
	end

	-- Navic / barbecue winbar
	if pick_integration("navic") then
		merge({
			NavicIconsFile = { fg = P.fg },
			NavicIconsModule = { fg = P.builtin },
			NavicIconsNamespace = { fg = P.type },
			NavicIconsPackage = { fg = P.type },
			NavicIconsClass = { fg = P.type },
			NavicIconsMethod = { fg = P.method },
			NavicIconsProperty = { fg = P.fg },
			NavicIconsField = { fg = P.fg },
			NavicIconsConstructor = { fg = P.method },
			NavicIconsEnum = { fg = P.type },
			NavicIconsInterface = { fg = P.type },
			NavicIconsFunction = { fg = P.func },
			NavicIconsVariable = { fg = P.fg },
			NavicIconsConstant = { fg = P.const },
			NavicIconsString = { fg = P.string },
			NavicIconsNumber = { fg = P.number },
			NavicIconsBoolean = { fg = P.bool },
			NavicIconsArray = { fg = P.type },
			NavicIconsObject = { fg = P.type },
			NavicIconsKey = { fg = P.fg },
			NavicIconsNull = { fg = P.const },
			NavicIconsEnumMember = { fg = P.const },
			NavicIconsStruct = { fg = P.type },
			NavicIconsEvent = { fg = P.warn },
			NavicIconsOperator = { fg = P.keyword },
			NavicIconsTypeParameter = { fg = P.type },
			NavicText = { fg = P.muted },
			NavicSeparator = { fg = P.border },
		})
	end

	-- nvim-scrollbar
	if pick_integration("scrollbar") then
		merge({
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
		})
	end

	-- Oil.nvim
	if pick_integration("oil") then
		merge({
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
		})
	end

	-- Snacks.nvim (pickers borrow Telescope-like groups — define common ones)
	if pick_integration("snacks") then
		merge({
			SnacksNormal = { fg = P.fg, bg = float_bg },
			SnacksBorder = { fg = P.float_border_hi, bg = float_bg },
			SnacksTitle = { fg = P.title, bg = float_bg, bold = true },
			SnacksPickerMatch = { fg = P.accent, bold = true },
			SnacksPickerPrompt = { fg = P.accent },
			SnacksPickerDirectory = { fg = P.accent },
			SnacksPickerFile = { fg = P.fg },
			SnacksPickerGitStatusAdded = { fg = P.git_add },
			SnacksPickerGitStatusDeleted = { fg = P.git_delete },
			SnacksPickerGitStatusModified = { fg = P.warn },
			SnacksIndent = { fg = P.indent_guide },
			SnacksIndentScope = { fg = P.indent_guide_active },
		})
	end

	-- Mini.nvim family (subset aligned with Catppuccin-style coverage)
	if pick_integration("mini") then
		merge({
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
		})
	end

	-- Copilot / ghost completions (several plugins reuse these names)
	if pick_integration("copilot") then
		merge({
			CopilotSuggestion = { fg = P.subtle, italic = true },
			CopilotAnnotation = { fg = P.muted, italic = true },
			CopilotLabel = { fg = P.subtle },
		})
	end

	-- Blink.nvim explicit (defaults often link to Cmp*/Pmenu — keeps menu borders crisp)
	if pick_integration("blink_cmp") then
		merge({
			BlinkCmpMenu = { fg = P.fg, bg = float_bg },
			BlinkCmpMenuBorder = { fg = P.float_border_hi, bg = float_bg },
			BlinkCmpMenuSelection = { fg = P.fg, bg = P.pmenu_sel },
			BlinkCmpScrollBarThumb = { link = "PmenuThumb" },
			BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
			BlinkCmpGhostText = { fg = P.subtle, italic = true },
			BlinkCmpDoc = { fg = P.fg, bg = float_bg },
			BlinkCmpDocBorder = { fg = P.float_border_hi, bg = float_bg },
			BlinkCmpDocSeparator = { fg = P.float_border_hi, bg = float_bg },
			BlinkCmpDocCursorLine = { bg = P.sel },
			BlinkCmpSignatureHelp = { fg = P.fg, bg = float_bg },
			BlinkCmpSignatureHelpBorder = { fg = P.float_border_hi, bg = float_bg },
			BlinkCmpSignatureHelpActiveParameter = { link = "LspSignatureActiveParameter" },
			BlinkCmpKind = { fg = P.builtin },
			BlinkCmpLabel = { fg = P.fg },
			BlinkCmpLabelMatch = { fg = P.accent, bold = true },
			BlinkCmpLabelDeprecated = { fg = P.subtle, strikethrough = true },
			BlinkCmpLabelDetail = { fg = P.muted },
			BlinkCmpLabelDescription = { fg = P.muted },
			BlinkCmpSource = { fg = P.muted },
		})
	end

	return h
end
