
function anim_clip(image, frame)

	return love.graphics.newQuad(

		frame.x, frame.y, frame.w, frame.h,

		image:getWidth(), image:getHeight()
	)

end

--

function anim_draw(anim, x, y)

	if anim.image == nil then return end

	local frame = anim.frames[anim.cursor]

	local clip = anim_clip(anim.image, frame)

	love.graphics.draw(anim.image, clip, x, y)

end

--

function anim_frame(anim)

	return anim.frames[anim.cursor]

end

--

function anim_new(defs)

	local anim = {}

	anim.defs = defs

	anim.playing = false

	return anim

end

--

function anim_play(anim, name, mode)

	local def = anim.defs[name]

	anim.image = def.image

	anim.frames = def.frames

	anim.cursor = 1

	anim.mode = mode

	anim.time = 0

	anim.playing = true

end

--

function anim_pause(anim)

	anim.playing = false

end

--

function anim_static(anim, name)

	anim_play(anim, name, 'once')

	anim_update(anim, 999)

end

--

function anim_update(anim, dt)

	if not anim.playing then return end

	local target = anim.frames[anim.cursor].t

	anim.time = anim.time + dt

	if anim.time >= target then

		anim.time = 0

		if anim.cursor >= #anim.frames then

			if anim.mode == 'once' then

				anim.playing = false

			elseif anim.mode == 'loop' then

				anim.cursor = 1

			end

		else

			anim.cursor = anim.cursor + 1

		end

	end

end
