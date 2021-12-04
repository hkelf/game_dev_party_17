
local skin = nil

--

function ux_levels_draw(x, y)

	local base = sprite_clip(skin, 360, 369, 196, 203)

	love.graphics.draw(skin, base, x, y)

end

--

function ux_levels_load(ui_skin)

	skin = ui_skin

end
