local M = {}

---@param hex string #RRGGBB
---@return integer, integer, integer
function M.hex_to_rgb(hex)
	hex = hex:gsub("^#", "")
	return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

---@param top string #RRGGBB foreground (“paint”) mixed toward background
---@param bottom string #RRGGBB background base
---@param alpha number 0..1 amount of `top`
---@return string
function M.blend(top, bottom, alpha)
	alpha = math.min(math.max(alpha, 0), 1)
	local tr, tg, tb = M.hex_to_rgb(top)
	local br, bg, bb = M.hex_to_rgb(bottom)
	local r = math.floor(br + (tr - br) * alpha + 0.5)
	local g = math.floor(bg + (tg - bg) * alpha + 0.5)
	local b = math.floor(bb + (tb - bb) * alpha + 0.5)
	return string.format("#%02x%02x%02x", r, g, b)
end

---@param hex string
---@param factor number multiplier applied to distance from black (simple brighten)
---@return string
function M.lighten(hex, factor)
	local r, g, b = M.hex_to_rgb(hex)
	r = math.min(255, math.floor(r * factor + 0.5))
	g = math.min(255, math.floor(g * factor + 0.5))
	b = math.min(255, math.floor(b * factor + 0.5))
	return string.format("#%02x%02x%02x", r, g, b)
end

--- Remove `bold` / `italic` from highlight defs according to theme options
---@param groups table<string, vim.api.keyset.highlight>
---@param opts { bold?: boolean, italic?: boolean }
function M.apply_style_toggles(groups, opts)
	local strip_bold = opts.bold == false
	local strip_italic = opts.italic ~= true
	if not strip_bold and not strip_italic then
		return
	end
	for _, hl in pairs(groups) do
		if type(hl) == "table" and hl.link == nil then
			if strip_bold then
				if hl.bold == true then
					hl.bold = nil
				end
				local cterm = hl.cterm
				if type(cterm) == "table" and cterm.bold == true then
					cterm.bold = nil
				end
			end
			if strip_italic then
				if hl.italic == true then
					hl.italic = nil
				end
				local cterm = hl.cterm
				if type(cterm) == "table" and cterm.italic == true then
					cterm.italic = nil
				end
			end
		end
	end
end

return M
