
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

local boss_x = 0

local boss_y = 0

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

		anim_draw(anim, x, y)

		love.graphics.setColor(1, 1, 1)

		local empty = sprite_clip(skin, 622, 282, 374, 57)

		love.graphics.draw(skin, empty, x + 150, y - 50)

		local offset = 374 * hpscale

		local filled = sprite_clip(skin, 622 + offset, 210, 374 - offset, 57)

		love.graphics.draw(skin, filled, x + 150 + offset, y - 50)

		boss_x, boss_y = x , y

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

				{ x = 0, y = 0, w = 624, h = 702, t = 0.5 },
				{ x = 624, y = 0, w = 624, h = 702, t = 0.5 }
			}
		},

		fast = {

			image = images.work,

			frames = {

				{ x = 0, y = 0, w = 624, h = 702, t = 0.2 },
				{ x = 624, y = 0, w = 624, h = 702, t = 0.2 }
			}
		}
	})

	anim_play(anim, 'base', 'loop')

	broker_subscribe('ennemy_health_update', ux_boss_hit)

end

--

function ux_boss_update(dt, mx, my)
	
	if visible then
		
		anim_update(anim, dt)
		
	end

	if hit < 10 then

		hit = hit + 10 * dt

	end

end

--

function ux_boss_hovered(mx, my)

	if not visible then return false end

	local w, h = 624, 702

	local x, y = boss_x - w * 0.5, boss_y - h * 0.5

	return mx >= boss_x and mx <= boss_x + w and my >= boss_y and my <= boss_y + h

end