
require('source/anim')

require('source/broker')

--

local STATE_STAND = 0x00

local STATE_WALK = 0x01

--

local aura = nil

local anim_aura = nil

local anim_stand = nil

local anim_walk = nil

local has_aura = false

local shadow = nil

local stand = nil

local state = STATE_STAND

local walk = nil

--

function ux_hero_anim()

	if state == STATE_STAND then

		return anim_stand

	end

	if state == STATE_WALK then

		return anim_walk

	end

end

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

	local anim = ux_hero_anim()

	local frame = anim_frame(anim)

	x = x - frame.w * 0.5

	y = y - frame.h

	anim_draw(anim, x, y)

end

--

function ux_hero_fight()

	state = STATE_STAND

	anim_play(anim_stand, 'base', 'loop')

end

--

function ux_hero_load()

	aura = love.graphics.newImage('image/hero_aura.png')

	shadow = love.graphics.newImage('image/hero_shadow.png')

	stand = love.graphics.newImage('image/hero_stand.png')

	walk = love.graphics.newImage('image/hero_walk.png')

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

	anim_stand = anim_new({

		base = {

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

	anim_walk = anim_new({

		base = {

			image = walk,

			frames = {

				{ x = 0, y = 0, w = 396, h = 454, t = 0.1 },
				{ x = 396, y = 0, w = 396, h = 454, t = 0.1 },
				{ x = 792, y = 0, w = 396, h = 454, t = 0.2 },
				{ x = 1188, y = 0, w = 396, h = 454, t = 0.1 },
				{ x = 0, y = 454, w = 396, h = 454, t = 0.1 },
				{ x = 396, y = 454, w = 396, h = 454, t = 0.1 }
			}
		}
	})

	anim_play(anim_aura, 'base', 'loop')

	anim_play(ux_hero_anim(), 'base', 'loop')

end

--

function ux_hero_update(dt)

	if has_aura then

		anim_update(anim_aura, dt)

	end

	anim_update(ux_hero_anim(), dt)

end

--

function ux_hero_walk()

	state = STATE_WALK

	anim_play(anim_walk, 'base', 'loop')

end
