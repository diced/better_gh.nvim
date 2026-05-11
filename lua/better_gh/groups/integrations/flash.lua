--- flash.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("flash") then
		return {}
	end
	return {
		FlashBackdrop = { fg = P.subtle },
		FlashLabel = { fg = P.base, bg = P.warn },
		FlashMatch = { fg = P.base, bg = P.accent },
		FlashCurrent = { fg = P.base, bg = P.func },
		FlashPrompt = { link = "MsgArea" },
		FlashPromptIcon = { fg = P.accent },
	}
end
