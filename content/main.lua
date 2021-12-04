require("source/state")
require("source/utils")
require('source/ux_core')
math.randomseed(os.time())

function love.draw()
    ux_core_draw()
    debug_console()
end

--

function love.load()
    initialize_state()
    print_table(game_state)
    ux_core_load()
end

--

function love.resize(width, height)
    ux_core_resize(width, height)
end

--

function love.update(dt)
    debug_events()
    update_state(dt)
    ux_core_update(dt)
end


-- debug
function debug_events()
    if love.keyboard.isDown("1") then
        broker_send("button_pressed", {body={type="ATTACK"}})
    end
    if love.keyboard.isDown("2") then
        broker_send("button_pressed", {body={type="DEFEND"}})
    end
    if love.keyboard.isDown("3") then
        broker_send("button_pressed", {body={type="FIREBALL"}})
    end
    if love.keyboard.isDown("4") then
        broker_send("button_pressed", {body={type="OMNISLASH"}})
    end
    if love.keyboard.isDown("5") then
        broker_send("button_pressed", {body={type="BERSERK"}})
    end
    if love.keyboard.isDown("6") then
        broker_send("button_pressed", {body={type="BLEED"}})
    end
    if love.keyboard.isDown("f") then
        broker_send("button_pressed", {body={type="FLEE"}})
    end
end

function debug_console()
    love.graphics.print( 
        "pression : " .. game_state.pression .. "\n" ..
        "stress : " .. game_state.stress .. "\n" ..
        "exhaustion : " .. game_state.exhaustion .. "\n" ..
        "debt : " .. game_state.debt .. "\n" ..
        "unhappiness : " .. game_state.unhappiness .. "\n" ..
        "wrath : " .. game_state.wrath .. "\n" ..
        "scene : " .. game_state.scene.type .. "\n"
    )
    if game_state.scene.type == 'FIGHT' then 
        love.graphics.print( 
            "current ennemy hp : " .. game_state.current_ennemy.health .. "\n" ..
            "fight phase : " .. game_state.scene.phase .. "\n"
            , 0, 100
        )
        if game_state.scene.timeout then
            love.graphics.print( 
                "fight phase timeout : " .. game_state.scene.timeout .. "\n"
                , 0, 150
            )
        end
        if game_state.current_skill then
            love.graphics.print(
                "selected : " .. game_state.current_skill.id
                , 0, 200
            )
        end
    end
end
