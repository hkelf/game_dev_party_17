
require('source/anim')

--

local anim = nil

local breakup = nil

local finance = nil

local mourn = nil

--

function ux_boss_draw(x, y)

	anim_draw_scaled(anim, x, y, 0.65, 0.65)

end

--

function ux_boss_load()

	breakup = love.graphics.newImage('image/boss_breakup.png')

	finance = love.graphics.newImage('image/boss_finance.png')

	mourn = love.graphics.newImage('image/boss_mourn.png')

	anim = anim_new({

		base = {

			image = breakup,

			frames = {

				{ x = 0, y = 0, w = 960, h = 1080, t = 0.5 },
				{ x = 960, y = 0, w = 960, h = 1080, t = 0.5 }
			}
		}
	})

	anim_play(anim, 'base', 'loop')

end

--

function ux_boss_update(dt)

	anim_update(anim, dt)

end
