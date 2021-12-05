
require('source/anim')

require('source/broker')

--

local STATE_ATTACK = 0x00

local STATE_HIT = 0x01

local STATE_STAND = 0x02

local STATE_TIRED = 0x03

local STATE_WALK = 0x04

--

local attack = nil

local aura = nil

local anim_attack = nil

local anim_aura = nil

local anim_kameha = nil

local anim_hit = nil

local anim_stand = nil

local anim_tired = nil

local anim_walk = nil

local has_aura = false

local hit = nil

local kameha = nil

local offset = 0

local shadow = nil

local show_kameha = false

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

	if state == STATE_HIT then

		return anim_hit

	end

	if state == STATE_ATTACK then

		return anim_attack

	end

	if state == STATE_TIRED then

		return anim_tired

	end

end

--

function ux_hero_attack(skill)

	state = STATE_ATTACK

	anim_static(anim_attack, skill)

	if skill == 'DEFEND' then

		offset = 20

	elseif skill == 'OMNISLASH' then

		offset = 40

	elseif skill == 'FIREBALL' then

		show_kameha = true

	end

end

--

function ux_hero_draw(x, y)

	love.graphics.draw(shadow, x - 90, y - 40)

	if has_aura and state == STATE_STAND then

		ux_hero_draw_aura(x, y)

	end

	ux_hero_draw_hero(x, y)

	if show_kameha then

		anim_draw(anim_kameha, x + 80, y - 220)

	end

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

	anim_draw(anim, x + offset, y)

end

--

function ux_hero_fight()

	state = STATE_STAND

	offset = 0

	show_kameha = false

	anim_play(anim_stand, 'base', 'loop')

end

--

function ux_hero_hit()

	if state ~= STATE_HIT then

		state = STATE_HIT

		offset = 0

		show_kameha = false

	end

end

--

function ux_hero_load()

	attack = love.graphics.newImage('image/hero_attack.png')

	aura = love.graphics.newImage('image/hero_aura.png')

	hit = love.graphics.newImage('image/hero_hit.png')

	kameha = love.graphics.newImage('image/kameha.png')

	shadow = love.graphics.newImage('image/hero_shadow.png')

	stand = love.graphics.newImage('image/hero_stand.png')

	walk = love.graphics.newImage('image/hero_walk.png')

	anim_attack = anim_new({

		ATTACK = {

			image = attack,

			frames = {

				{ x = 0, y = 0, w = 324, h = 384, t = 0 }
			}
		},

		DEFEND = {

			image = attack,

			frames = {

				{ x = 324, y = 0, w = 324, h = 384, t = 0 }
			}
		},

		FIREBALL = {

			image = attack,

			frames = {

				{ x = 648, y = 0, w = 324, h = 384, t = 0 }
			}
		},

		OMNISLASH = {

			image = attack,

			frames = {

				{ x = 972, y = 0, w = 324, h = 384, t = 0 }
			}
		},

		BERSERK = {

			image = attack,

			frames = {

				{ x = 1296, y = 0, w = 324, h = 384, t = 0 }
			}
		},

		BLEED = {

			image = attack,

			frames = {

				{ x = 1620, y = 0, w = 324, h = 384, t = 0 }
			}
		}
	})

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

	anim_hit = anim_new({

		base = {

			image = hit,

			frames = {

				{ x = 0, y = 0, w = 358, h = 358, t = 0 }
			}
		}
	})

	anim_kameha = anim_new({

		base = {

			image = kameha,

			frames = {

				{ x = 0, y = 0, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 196, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 392, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 588, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 784, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 980, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 1176, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 1372, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 1568, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 1764, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 1960, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 2156, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 2352, w = 1224, h = 196, t = 0.1 },
				{ x = 0, y = 2548, w = 1224, h = 196, t = 0.1 }
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

	anim_tired = anim_new({

		base = {

			image = stand,

			frames = {

				{ x = 0, y = 398, w = 284, h = 398, t = 0.2 },
				{ x = 284, y = 398, w = 284, h = 398, t = 0.2 },
				{ x = 568, y = 398, w = 284, h = 398, t = 0.2 },
				{ x = 852, y = 398, w = 284, h = 398, t = 0.2 },
				{ x = 1136, y = 398, w = 284, h = 398, t = 0.2 }
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

	anim_static(anim_attack, 'ATTACK')

	anim_static(anim_hit, 'base')

	anim_play(anim_kameha, 'base', 'loop')

	broker_subscribe('pression_updated', ux_hero_pressure_change)

	broker_subscribe('buff_added', function(_) has_aura = true end)

	broker_subscribe('buff_removed', function(_) has_aura = false end)

end

--

function ux_hero_pressure_change(payload)

	local value = payload.body.pression

	if value <= 0 and state ~= STATE_TIRED then

		state = STATE_TIRED

		anim_play(anim_tired, 'base', 'loop')

	end

end

--

function ux_hero_update(dt)

	if has_aura then

		anim_update(anim_aura, dt)

	end

	anim_update(ux_hero_anim(), dt)

	if state == STATE_HIT then

		offset = offset - 40 * dt

	end

	if show_kameha then

		anim_update(anim_kameha, dt)

	end

end

--

function ux_hero_walk()

	state = STATE_WALK

	anim_play(anim_walk, 'base', 'loop')

end
