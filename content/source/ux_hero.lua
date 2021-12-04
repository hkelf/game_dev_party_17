
require('source/anim')

require('source/sprite')

--

local aura = nil

local anim_aura = nil

local anim_hero = nil

local has_aura = false

local shadow = nil

local stand = nil

--

function ux_hero_draw(x, y)

	love.graphics.draw(shadow, x - 90, y - 40)

	if has_aura then

		ux_hero_draw_aura(x, y)

	end

	ux_hero_draw_hero(x, y)

end

--

function ux_hero_draw_aura(x, y)

	local frame = anim_frame(anim_aura)

	x = x - frame.w * 0.5 + 10

	y = y - frame.h + 50

	anim_draw(anim_aura, x, y)

end

--

function ux_hero_draw_hero(x, y)

	local frame = anim_frame(anim_hero)

	x = x - frame.w * 0.5

	y = y - frame.h

	anim_draw(anim_hero, x, y)

end

--

function ux_hero_load()

	aura = love.graphics.newImage('image/hero_aura.png')

	shadow = love.graphics.newImage('image/hero_shadow.png')

	stand = love.graphics.newImage('image/hero_stand.png')

	anim_aura = anim_new({

		base = {

			image = aura,

			frames = {

				{ x = 0, y = 0, w = 682, h = 510, t = 0.2 },
				{ x = 682, y = 0, w = 682, h = 510, t = 0.1 },
				{ x = 1364, y = 0, w = 682, h = 510, t = 0.2 },
				{ x = 0, y = 510, w = 682, h = 510, t = 0.2 },
				{ x = 682, y = 510, w = 682, h = 510, t = 0.25 },
				{ x = 1364, y = 510, w = 682, h = 510, t = 0.2 }
			}
		}
	})

	anim_hero = anim_new({

		stand = {

			image = stand,

			frames = {

				{ x = 0, y = 0, w = 284, h = 398, t = 0.2 },
				{ x = 284, y = 0, w = 284, h = 398, t = 0.1 },
				{ x = 568, y = 0, w = 284, h = 398, t = 0.2 },
				{ x = 852, y = 0, w = 284, h = 398, t = 0.2 },
				{ x = 1136, y = 0, w = 284, h = 398, t = 0.25 },
				{ x = 1420, y = 0, w = 284, h = 398, t = 0.2 }
			}
		}
	})

	anim_play(anim_aura, 'base', 'loop')

	anim_play(anim_hero, 'stand', 'loop')

end

--

function ux_hero_update(dt)

	if has_aura then

		anim_update(anim_aura, dt)

	end

	anim_update(anim_hero, dt)

end
