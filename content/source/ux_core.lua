
require('source/ux_hero')

--

local UX_HEIGHT = 1080

local UX_WIDTH = 1920

--

local canvas = nil

local pos = { x = 0, y = 0 }

local safe = { x = 0, y = 0, w = 1920, h = 1080 }

local scale = { x = 1, y = 1 }

--

function ux_core_draw()

	love.graphics.setCanvas(canvas)

	love.graphics.clear(0.2, 0.2, 0.2)

	ux_hero_draw(safe.x + 450, safe.h - 200)

	-- ...

	love.graphics.setCanvas()

	love.graphics.draw(canvas, pos.x, pos.y, 0, scale.x, scale.y)

end

--

function ux_core_load()

	canvas = love.graphics.newCanvas(UX_WIDTH, UX_HEIGHT)

	ux_core_resize(love.graphics.getWidth(), love.graphics.getHeight())

	ux_hero_load()

end

--

function ux_core_resize(width, height)

	scale.x = width / UX_WIDTH

	scale.y = height / UX_HEIGHT

	local max_scale = math.max(scale.x, scale.y)

	scale.x, scale.y = max_scale, max_scale

	pos.x = (width - UX_WIDTH * scale.x) * 0.5

	pos.y = (height - UX_HEIGHT * scale.y) * 0.5

	safe.x = -pos.x * scale.x

	safe.y = -pos.y * scale.y

	safe.w = UX_WIDTH - safe.x * 2

	safe.h = UX_HEIGHT - safe.y * 2

end

--

function ux_core_update(dt)

	ux_hero_update(dt)

end
