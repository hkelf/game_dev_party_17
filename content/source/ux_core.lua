
require('source/broker')

require('source/ux_button')

require('source/ux_hero')

--

local UX_HEIGHT = 1080

local UX_WIDTH = 1920

--

local buttons = {}

local canvas = nil

local flee_button = nil

local pos = { x = 0, y = 0 }

local safe = { x = 0, y = 0, w = 1920, h = 1080 }

local scale = { x = 1, y = 1 }

local skin = nil

local unscale = { x = 1, y = 1 }

--

function ux_core_create_flee_button()

	local normal = { x = 210, y = 301, w = 128, h = 103 }

	local pressed = { x = 205, y = 420, w = 138, h = 111 }

	flee_button = ux_button_new(skin, normal, pressed)

end

--

function ux_core_draw()

	love.graphics.setCanvas(canvas)

	love.graphics.clear(0.45, 0.45, 0.45)

	ux_hero_draw(safe.x + 450, safe.h - 300)

	ux_button_draw(flee_button, safe.w * 0.25, safe.h - 100)

	love.graphics.setCanvas()

	love.graphics.draw(canvas, pos.x, pos.y, 0, scale.x, scale.y)

end

--

function ux_core_load()

	canvas = love.graphics.newCanvas(UX_WIDTH, UX_HEIGHT)

	ux_core_resize(love.graphics.getWidth(), love.graphics.getHeight())

	skin = love.graphics.newImage('image/final_ui.png')

	ux_hero_load()

	ux_core_create_flee_button()

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

	safe.x = -pos.x * scale.x

	safe.y = -pos.y * scale.y

	safe.w = UX_WIDTH - safe.x * 2

	safe.h = UX_HEIGHT - safe.y * 2

end

--

function ux_core_update(dt)

	local mx, my = love.mouse.getPosition()

	mx = mx * unscale.x + safe.x

	my = my * unscale.y + safe.y

	ux_hero_update(dt)

	if ux_button_update(flee_button, mx, my) then

		broker_send('button_pressed', {

			sender = 'ux_core',

			body = { type = 'FLEE' }
		})

	end

end
