--- rainbow-delimiters.nvim
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("rainbow_delimiters") then
		return {}
	end
	local r = P.rainbow
	return {
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
	}
end
