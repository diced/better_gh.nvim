--- nvim-notify
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("notify") then
		return {}
	end
	local float_bg = ctx.float_bg
	return {
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
	}
end
