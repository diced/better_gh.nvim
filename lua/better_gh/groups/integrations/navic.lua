--- nvim-navic / barbecue
---@param P table
---@param O table
---@param ctx table
---@return table<string, vim.api.keyset.highlight>
return function(P, _O, ctx)
	if not ctx.pick("navic") then
		return {}
	end
	return {
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
	}
end
