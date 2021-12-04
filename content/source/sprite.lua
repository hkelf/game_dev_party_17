
function sprite_clip(image, x, y, w, h)

	return love.graphics.newQuad(

		x, y, w, h, image:getWidth(), image:getHeight()
	)

end
