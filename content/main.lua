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
        broker_send("button_pressed", {body={id="slash", type="SKILL"}})
        print("The 1 key is held down!")
    end
    if love.keyboard.isDown("2") then
        print("The 1 key is held down!")
    end
    if love.keyboard.isDown("3") then
        print("The 1 key is held down!")
    end
    if love.keyboard.isDown("4") then
        print("The 1 key is held down!")
    end
    if love.keyboard.isDown("f") then
        broker_send("button_pressed", {body={type="FLEE"}})
        print("The f key is held down!")
    end
end

function debug_console()
    love.graphics.setColor( 0, 0, 0, 1 )
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
        if game_state.selected then
            love.graphics.print( 
                "selected : " .. game_state.selected.type .. "\n"
                , 0, 200
            )
        end
    end
    love.graphics.setColor( 1, 1, 1, 1 )

end
