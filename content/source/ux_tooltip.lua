
local UX_TOOLTIP_HEIGHT = 160

local UX_TOOLTIP_WIDTH = 280

--

local m_description = ''

local m_font = nil

local m_position = { x = 0, y = 0 }

local m_title = ''

local m_visible = false

--

function ux_tooltip_draw()

	if not m_visible then return end

	love.graphics.setColor(0, 0, 0, 0.8)

	love.graphics.rectangle('fill', m_position.x, m_position.y, UX_TOOLTIP_WIDTH, UX_TOOLTIP_HEIGHT)

	love.graphics.setFont(m_font)

	love.graphics.setColor(0.36, 0.72, 0.85)

	love.graphics.print(m_title, m_position.x + 16, m_position.y + 16)

	love.graphics.setColor(0.95, 0.95, 0.95)

	love.graphics.print(m_description, m_position.x + 16, m_position.y + 46)

	love.graphics.setColor(1, 1, 1)

end

--

function ux_tooltip_hide()

	m_visible = false

end

--

function ux_tooltip_load()

	m_font = love.graphics.newFont('opensans.ttf', 22)

end

--

function ux_tooltip_set_position(x, y)

	m_position.x = math.floor(x)

	m_position.y = math.floor(y)

end

--

function ux_tooltip_show(title, description)

	m_title = title

	m_description = description

	m_visible = true

end
