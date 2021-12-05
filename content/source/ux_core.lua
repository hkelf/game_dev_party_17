
require('source/broker')

require('source/sprite')

require('source/ux_boss')

require('source/ux_button')

require('source/ux_hero')

require('source/ux_levels')

require('source/ux_pressure')

--

local STATE_FIGHT = 0x00

local STATE_ITEMSEL = 0x01

local STATE_WALK = 0x02

local UX_HEIGHT = 1080

local UX_WIDTH = 1920

--

local ITEM_COORDS = {

	SALARY = { x = 8, y = 16 },

	NAP = { x = 149, y = 16 },

	MEDITATION = { x = 291, y = 16 },

	LAUGH = { x = 433, y = 16 },

	EXERCISE = { x = 8, y = 157 },

	VIDEO_GAME = { x = 149, y = 157 },

	DRINKING = { x = 291, y = 157 },

	SEXY_TIME = { x = 433, y = 157 },

	DRUGS = { x = 10, y = 298 },

	MEET_FRIENDS = { x = 150, y = 298 },

	FOOD = { x = 292, y = 298 },

	CHILLING = { x = 434, y = 298 },

	MUSIC = { x = 10, y = 439 }
}

--

local buttons = { }

local can_flee = true

local canvas = nil

local corridor_x = 0

local flee_button = nil

local items = nil

local item_left = nil

local item_right = nil

local pos = { x = 0, y = 0 }

local room_boss = nil

local room_corridor = nil

local safe = { x = 0, y = 0, w = UX_WIDTH, h = UX_HEIGHT }

local scale = { x = 1, y = 1 }

local skills = nil

local skin = nil

local state = STATE_FIGHT

local unscale = { x = 1, y = 1 }

--

function ux_core_corridor(payload)

	local phase = payload.body.phase

	if phase == 'ITEM_SELECTION_PHASE' then

		state = STATE_ITEMSEL

		corridor_x = 0

		ux_boss_hide()

		ux_core_create_item_buttons(payload.body.items)

	elseif phase == 'WALK_PHASE' then

		state = STATE_WALK

		ux_hero_walk()

	end

end

--

function ux_core_create_buttons()

	ux_core_create_flee_button()

	table.insert(buttons, ux_core_create_skill_button(0, 'ATTACK'))

	table.insert(buttons, ux_core_create_skill_button(1, 'DEFEND'))

	table.insert(buttons, ux_core_create_skill_button(2, 'FIREBALL'))

	table.insert(buttons, ux_core_create_skill_button(3, 'OMNISLASH'))

	table.insert(buttons, ux_core_create_skill_button(4, 'BERSERK'))

	table.insert(buttons, ux_core_create_skill_button(5, 'BLEED'))

end

--

function ux_core_create_flee_button()

	local normal = { x = 205, y = 420, w = 138, h = 111 }

	local pressed = { x = 210, y = 301, w = 128, h = 103 }

	flee_button = ux_button_new(skin, normal, pressed)

end

--

function ux_core_create_item_buttons(choice)

	local lpos = ITEM_COORDS[choice[1]]

	local left = { x = lpos.x, y = lpos.y, w = 125, h = 125 }

	item_left = ux_button_new(items, left, left)

	local rpos = ITEM_COORDS[choice[2]]

	local right = { x = rpos.x, y = rpos.y, w = 125, h = 125 }

	item_right = ux_button_new(items, right, right)

end

--

function ux_core_create_skill_button(id, name)

	local offset = 8 + id * 198

	local normal = { x = offset, y = 6, w = 193, h = 181 }

	local pressed = { x = offset, y = 212, w = 193, h = 181 }

	return {

		button = ux_button_new(skills, normal, pressed),

		type = name, offset = 1121 - 198 * id
	}

end

--

function ux_core_draw()

	love.graphics.setCanvas(canvas)

	if state == STATE_FIGHT then

		love.graphics.draw(room_boss, 0, 0)

	elseif state == STATE_ITEMSEL or state == STATE_WALK then

		love.graphics.draw(room_corridor, corridor_x, 0)

	end

	ux_hero_draw(safe.x + 400, safe.h * 0.6)

	ux_boss_draw(safe.w * 0.5, safe.h * 0.1)

	ux_levels_draw(safe.w - 1451, safe.h - 223)

	ux_core_draw_skillbar()

	ux_pressure_draw(safe.x + 124, safe.h * 0.5 - 350)

	ux_core_draw_buttons()

	love.graphics.setCanvas()

	love.graphics.draw(canvas, pos.x, pos.y, 0, scale.x, scale.y)

end

--

function ux_core_draw_buttons()

	if can_flee then

		ux_button_draw(flee_button, safe.x + 150, safe.h - 120)

	end

	for _, button in ipairs(buttons) do

		ux_button_draw(button.button, safe.w - button.offset, safe.h - 120)

	end

	if state == STATE_ITEMSEL then

		ux_button_draw(item_left, safe.w * 0.5 - 150, safe.h * 0.4)

		ux_button_draw(item_right, safe.w * 0.5 + 150, safe.h * 0.4)

	end

end

--

function ux_core_draw_skillbar()

	local skillbar = sprite_clip(skin, 612, 373, 1198, 203)

	love.graphics.draw(skin, skillbar, safe.w - 1228, safe.h - 223)

end

--

function ux_core_fight(payload)

	state = STATE_FIGHT

	ux_hero_fight()

	ux_boss_fight(payload.body.ennemy.id)

	can_flee = payload.body.ennemy.fleeable

end

--

function ux_core_fight_phase(payload)

	local phase = payload.body.phase

	if phase == 'PLAYER_TURN_PHASE' then

		ux_hero_fight()

	elseif phase == 'ATTACK_PHASE' then

		ux_hero_attack()

	elseif phase == 'ENNEMY_ATTACK_PHASE' then

		ux_hero_hit()

	else

		ux_hero_fight()

	end

end

--

function ux_core_load()

	canvas = love.graphics.newCanvas(UX_WIDTH, UX_HEIGHT)

	ux_core_resize(love.graphics.getWidth(), love.graphics.getHeight())

	items = love.graphics.newImage('image/item_icons.png')

	room_boss = love.graphics.newImage('image/decor_boss.png')

	room_corridor = love.graphics.newImage('image/corridor.png')

	skin = love.graphics.newImage('image/final_ui.png')

	skills = love.graphics.newImage('image/skill_buttons.png')

	ux_hero_load()

	ux_boss_load(skin)

	ux_pressure_load(skin)

	ux_levels_load(skin)

	ux_core_create_buttons()

	broker_subscribe('corridor_phase', ux_core_corridor)

	broker_subscribe('fight_started', ux_core_fight)

	broker_subscribe('fight_phase', ux_core_fight_phase)

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

	ux_hero_update(dt)

	ux_boss_update(dt)

	if state == STATE_WALK then

		corridor_x = corridor_x - 750 * dt

	end

	local mx, my = love.mouse.getPosition()

	mx = (mx - pos.x) * unscale.x

	my = (my - pos.y) * unscale.y

	if state == STATE_FIGHT then

		if can_flee and ux_button_update(flee_button, mx, my) then

			broker_send('button_pressed', {

				sender = 'ux_core',

				body = { type = 'FLEE' }
			})

		end

		for _, button in ipairs(buttons) do

			if ux_button_update(button.button, mx, my) then

				broker_send('button_pressed', {

					sender = 'ux_core',

					body = { type = button.type }
				})

			end

		end

	elseif state == STATE_ITEMSEL then

		if ux_button_update(item_left, mx, my) then

			broker_send('button_pressed', {

				sender = 'ux_core',

				body = { type = 'ITEM', index = 1 }
			})

		end

		if ux_button_update(item_right, mx, my) then

			broker_send('button_pressed', {

				sender = 'ux_core',

				body = { type = 'ITEM', index = 2 }
			})

		end

	end

end
