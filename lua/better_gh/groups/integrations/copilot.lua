--- Copilot / ghost completions
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("copilot") then
		return {}
	end
	return {
		CopilotSuggestion = { fg = P.subtle, italic = true },
		CopilotAnnotation = { fg = P.muted, italic = true },
		CopilotLabel = { fg = P.subtle },
	}
end
