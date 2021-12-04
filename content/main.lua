require("source/state")
require("source/utils")
require('source/ux_core')
math.randomseed(os.time())

function love.draw()
    ux_core_draw()
end

--

function love.load()
    initialize_state()
    print_table(game_state)
    ux_core_load()
end

--

function love.update(dt)
    update_state()
    ux_core_update(dt)
end
