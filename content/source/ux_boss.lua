
require('source/anim')

require('source/broker')

require('source/sprite')

--

local anim = nil

local hit = 999

local hpscale = 0

local images = { }

local skin = nil

local visible = false

--

function ux_boss_attack(attack)

	if attack then

		anim_play(anim, 'fast', 'loop')

	else

		anim_play(anim, 'base', 'loop')

	end

end

--

function ux_boss_draw(x, y)

	if visible then

		if hit < 10 and math.fmod(math.floor(hit), 2) == 0 then

			love.graphics.setColor(0.2, 0.2, 0.2)

		end

		anim_draw_scaled(anim, x, y, 0.65, 0.65)

		love.graphics.setColor(1, 1, 1)

		local empty = sprite_clip(skin, 622, 282, 374, 57)

		love.graphics.draw(skin, empty, x + 150, y - 50)

		local offset = 374 * hpscale

		local filled = sprite_clip(skin, 622 + offset, 210, 374 - offset, 57)

		love.graphics.draw(skin, filled, x + 150 + offset, y - 50)

	end

end

--

function ux_boss_fight(enemy)

	anim_reskin(anim, 'base', images[enemy])

	anim_reskin(anim, 'fast', images[enemy])

	anim_play(anim, 'base', 'loop')

	hpscale = 0

	visible = true

end

--

function ux_boss_hide()

	visible = false

end

--

function ux_boss_hit(payload)

	local health = payload.body.health

	local max = payload.body.initial_health

	hpscale = 1 - (health / max)

	hit = 0

end

--

function ux_boss_load(ui_skin)

	skin = ui_skin

	images.breakup = love.graphics.newImage('image/boss_breakup.png')

	images.finance = love.graphics.newImage('image/boss_finance.png')

	images.mourn = love.graphics.newImage('image/boss_mourn.png')

	images.neighbour = love.graphics.newImage('image/boss_neighbour.png')

	images.work = love.graphics.newImage('image/boss_work.png')

	anim = anim_new({

		base = {

			image = images.work,

			frames = {

				{ x = 0, y = 0, w = 960, h = 1080, t = 0.5 },
				{ x = 960, y = 0, w = 960, h = 1080, t = 0.5 }
			}
		},

		fast = {

			image = images.work,

			frames = {

				{ x = 0, y = 0, w = 960, h = 1080, t = 0.2 },
				{ x = 960, y = 0, w = 960, h = 1080, t = 0.2 }
			}
		}
	})

	anim_play(anim, 'base', 'loop')

	broker_subscribe('ennemy_health_update', ux_boss_hit)

end

--

function ux_boss_update(dt)

	if visible then

		anim_update(anim, dt)

	end

	if hit < 10 then

		hit = hit + 10 * dt

	end

end
