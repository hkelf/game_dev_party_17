
require('source/broker')

require('source/sprite')

--

local scale = 0

local skin = nil

--

function ux_pressure_change(payload)

	local value = payload.body.pression

	local max = payload.body.max

	scale = value / max

end

--

function ux_pressure_draw(x, y)

	local empty = sprite_clip(skin, 37, 19, 52, 546)

	love.graphics.draw(skin, empty, x, y)

	local offset = 546 * scale

	local filled = sprite_clip(skin, 126, 21 + offset, 52, 546 - offset)

	love.graphics.draw(skin, filled, x, y + offset)

end

--

function ux_pressure_load(ui_skin)

	skin = ui_skin

	broker_subscribe('pression_updated', ux_pressure_change)

end
