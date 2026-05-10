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

return M
