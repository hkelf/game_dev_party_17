require("source/configuration")
require("source/utils")
require("source/init_state")
require("source/fight")

game_state = {
}

function update_state() 
    if not game_state.scene.type then
        init_fight()
    end
end