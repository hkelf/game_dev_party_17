
require('source/broker')

require('source/sprite')

--

local debt = 0

local exhaustion = 0

local skin = nil

local stress = 0

local unhap = 0

local wrath = 0

--

function ux_levels_change(payload)

	local state = payload.body.state

	local max = configuration.max

	debt = state.debt / max

	exhaustion = state.exhaustion / max

	stress = state.stress / max

	unhap = state.unhappiness / max

	wrath = state.wrath / max

end

--

function ux_levels_draw(x, y)

	local base = sprite_clip(skin, 360, 369, 196, 203)

	love.graphics.draw(skin, base, x, y)

	ux_levels_draw_value(stress, x, y, 360)

	ux_levels_draw_value(exhaustion, x + 42, y, 402)

	ux_levels_draw_value(debt, x + 85, y, 445)

	ux_levels_draw_value(unhap, x + 127, y, 487)

	ux_levels_draw_value(wrath, x + 169, y, 529)

end

--

function ux_levels_draw_value(scale, x, y, rect_x)

	local offset = 203 * (1 - scale)

	local clip = sprite_clip(skin, rect_x, 155 + offset, 27, 203 - offset)

	love.graphics.draw(skin, clip, x, y + offset)

end

--

function ux_levels_load(ui_skin)

	skin = ui_skin

	broker_subscribe('player_health_update', ux_levels_change)

end
