
require('source/anim')

--

local anim = nil

local stand = nil

--

function ux_hero_draw(x, y)

	anim_draw(anim, x, y)

end

--

function ux_hero_load()

	stand = love.graphics.newImage('image/hero_stand.png')

	anim = anim_new({

		stand = {

			image = stand,

			frames = {

				{ x = 0, y = 0, w = 284, h = 398, t = 0.2 },
				{ x = 284, y = 0, w = 284, h = 398, t = 0.1 },
				{ x = 568, y = 0, w = 284, h = 398, t = 0.2 },
				{ x = 852, y = 0, w = 284, h = 398, t = 0.2 },
				{ x = 1136, y = 0, w = 284, h = 398, t = 0.3 },
				{ x = 1420, y = 0, w = 284, h = 398, t = 0.3 }
			}
		}
	})

	anim_play(anim, 'stand', 'loop')

end

--

function ux_hero_update(dt)

	anim_update(anim, dt)

end
