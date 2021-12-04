
local UX_HEIGHT = 1080

local UX_WIDTH = 1920

--

local canvas = nil

local pos_x = 0

local pos_y = 0

local scale_x = 1

local scale_y = 1

--

function ux_core_draw()

	love.graphics.setCanvas(canvas)

	love.graphics.clear(1, 1, 1)

	-- ...

	love.graphics.setCanvas()

	love.graphics.draw(canvas, pos_x, pos_y, 0, scale_x, scale_y)

end

--

function ux_core_load()

	canvas = love.graphics.newCanvas(UX_WIDTH, UX_HEIGHT)

	ux_core_resize(love.graphics.getWidth(), love.graphics.getHeight())

end

--

function ux_core_resize(width, height)

	scale_x = width / UX_WIDTH

	scale_y = height / UX_HEIGHT

	scale = math.max(scale_x, scale_y)

	scale_x, scale_y = scale, scale

	pos_x = (width - UX_WIDTH * scale_x) * 0.5

	pos_y = (height - UX_HEIGHT * scale_y) * 0.5

end

--

function ux_core_update(dt)

end
