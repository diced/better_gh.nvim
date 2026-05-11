--- lazy.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("lazy") then
		return {}
	end
	local float_bg = ctx.float_bg
	return {
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
	}
end
