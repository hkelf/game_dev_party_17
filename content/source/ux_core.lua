
require('source/broker')

require('source/sprite')

require('source/ux_button')

require('source/ux_hero')

require('source/ux_levels')

require('source/ux_pressure')

--

local UX_HEIGHT = 1080

local UX_WIDTH = 1920

--

local canvas = nil

local flee_button = nil

local pos = { x = 0, y = 0 }

local room_boss = nil

local room_corridor = nil

local safe = { x = 0, y = 0, w = UX_WIDTH, h = UX_HEIGHT }

local scale = { x = 1, y = 1 }

local skill_buttons = nil

local skill_attack = nil

local skill_berserk = nil

local skill_bleed = nil

local skill_defend = nil

local skill_fireball = nil

local skill_omnislash = nil

local skin = nil

local unscale = { x = 1, y = 1 }

--

function ux_core_create_buttons()

	ux_core_create_flee_button()

	skill_attack = ux_core_create_skill_button(0)

	skill_defend = ux_core_create_skill_button(1)

	skill_fireball = ux_core_create_skill_button(2)

	skill_omnislash = ux_core_create_skill_button(3)

	skill_berserk = ux_core_create_skill_button(4)

	skill_bleed = ux_core_create_skill_button(5)

end

--

function ux_core_create_flee_button()

	local normal = { x = 205, y = 420, w = 138, h = 111 }

	local pressed = { x = 210, y = 301, w = 128, h = 103 }

	flee_button = ux_button_new(skin, normal, pressed)

end

--

function ux_core_create_skill_button(id)

	local offset = 8 + id * 198

	local normal = { x = offset, y = 6, w = 193, h = 181 }

	local pressed = { x = offset, y = 212, w = 193, h = 181 }

	return ux_button_new(skill_buttons, normal, pressed)

end

--

function ux_core_draw()

	love.graphics.setCanvas(canvas)

	love.graphics.draw(room_boss, 0, 0)

	ux_hero_draw(safe.x + 400, safe.h * 0.6)

	ux_levels_draw(safe.w - 1451, safe.h - 223)

	ux_core_draw_skillbar()

	ux_pressure_draw(safe.x + 124, safe.h * 0.5 - 350)

	ux_core_draw_buttons()

	love.graphics.setCanvas()

	love.graphics.draw(canvas, pos.x, pos.y, 0, scale.x, scale.y)

end

--

function ux_core_draw_buttons()

	ux_button_draw(flee_button, safe.x + 150, safe.h - 120)

	ux_button_draw(skill_attack, safe.w - 1121, safe.h - 120)

	ux_button_draw(skill_defend, safe.w - 923, safe.h - 120)

	ux_button_draw(skill_fireball, safe.w - 725, safe.h - 120)

	ux_button_draw(skill_omnislash, safe.w - 527, safe.h - 120)

	ux_button_draw(skill_berserk, safe.w - 329, safe.h - 120)

	ux_button_draw(skill_bleed, safe.w - 131, safe.h - 120)

end

--

function ux_core_draw_skillbar()

	local skillbar = sprite_clip(skin, 612, 373, 1198, 203)

	love.graphics.draw(skin, skillbar, safe.w - 1228, safe.h - 223)

end

--

function ux_core_load()

	canvas = love.graphics.newCanvas(UX_WIDTH, UX_HEIGHT)

	ux_core_resize(love.graphics.getWidth(), love.graphics.getHeight())

	room_boss = love.graphics.newImage('image/decor_boss.png')

	room_corridor = love.graphics.newImage('image/corridor.png')

	skin = love.graphics.newImage('image/final_ui.png')

	skill_buttons = love.graphics.newImage('image/skill_buttons.png')

	ux_hero_load()

	ux_pressure_load(skin)

	ux_levels_load(skin)

	ux_core_create_buttons()

end

--

function ux_core_resize(width, height)

	scale.x = width / UX_WIDTH

	scale.y = height / UX_HEIGHT

	local max_scale = math.max(scale.x, scale.y)

	scale.x, scale.y = max_scale, max_scale

	unscale.x, unscale.y = 1 / scale.x, 1 / scale.y

	pos.x = (width - UX_WIDTH * scale.x) * 0.5

	pos.y = (height - UX_HEIGHT * scale.y) * 0.5

	safe.x = -pos.x * unscale.x

	safe.y = -pos.y * unscale.y

	safe.w = UX_WIDTH - safe.x

	safe.h = UX_HEIGHT - safe.y

end

--

function ux_core_update(dt)

	local mx, my = love.mouse.getPosition()

	mx = (mx - pos.x) * unscale.x

	my = (my - pos.y) * unscale.y

	ux_hero_update(dt)

	if ux_button_update(flee_button, mx, my) then

		broker_send('button_pressed', {

			sender = 'ux_core',

			body = { type = 'FLEE' }
		})

	end

	if ux_button_update(skill_attack, mx, my) then

		broker_send('button_pressed', {

			sender = 'ux_core',

			body = { type = 'ATTACK' }
		})

	end

	if ux_button_update(skill_defend, mx, my) then

		broker_send('button_pressed', {

			sender = 'ux_core',

			body = { type = 'DEFEND' }
		})

	end

	if ux_button_update(skill_fireball, mx, my) then

		broker_send('button_pressed', {

			sender = 'ux_core',

			body = { type = 'FIREBALL' }
		})

	end

	if ux_button_update(skill_omnislash, mx, my) then

		broker_send('button_pressed', {

			sender = 'ux_core',

			body = { type = 'OMNISLASH' }
		})

	end

	if ux_button_update(skill_berserk, mx, my) then

		broker_send('button_pressed', {

			sender = 'ux_core',

			body = { type = 'BERSERK' }
		})

	end

	if ux_button_update(skill_bleed, mx, my) then

		broker_send('button_pressed', {

			sender = 'ux_core',

			body = { type = 'BLEED' }
		})

	end

end
