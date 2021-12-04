require("source/state")
require("source/utils")
math.randomseed(os.time())

function love.draw()

end

--

function love.load()
    initialize_state()
    print_table(game_state)
end

--

function love.update(dt)
end
