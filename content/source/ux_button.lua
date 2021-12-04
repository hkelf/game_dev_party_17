
require('source/anim')

--

local STATE_HOVERED = 0x00

local STATE_NORMAL = 0x01

local STATE_PRESSED = 0x02

--

function ux_button_draw(button, x, y)

	local frame = anim_frame(button.anim)

	anim_draw(button.anim, x - frame.w * 0.5, y - frame.h * 0.5)

	button.x, button.y = x, y

end

--

function ux_button_hovered(button, mx, my)

	local frame = anim_frame(button.anim)

	local w, h = frame.w, frame.h

	local x, y = button.x - w * 0.5, button.y - h * 0.5

	return mx >= x and mx <= x + w and my >= y and my <= y + h

end

--

function ux_button_new(image, normal, pressed, x, y)

	local button = {}

	normal.t = 0

	pressed.t = 0

	button.anim = anim_new({

		normal = { image = image, frames = { normal } },

		pressed = { image = image, frames = { pressed } }
	})

	button.x, button.y = 0, 0

	button.state = STATE_NORMAL

	anim_static(button.anim, 'normal')

	return button

end

--

function ux_button_update(button, mx, my)

	local pressed = false

	if ux_button_hovered(button, mx, my) then

		if love.mouse.isDown(1) then

			if button.state == STATE_HOVERED then

				button.state = STATE_PRESSED

				anim_static(button.anim, 'pressed')

			end

		else

			if button.state == STATE_PRESSED then

				pressed = true

			end

			if button.state ~= STATE_HOVERED then

				button.state = STATE_HOVERED

				anim_static(button.anim, 'normal')

			end

		end

	else

		if button.state ~= STATE_HOVERED then

			button.state = STATE_NORMAL

			anim_static(button.anim, 'normal')

		end

	end

	return pressed

end
