require("source/configuration")
require("source/utils")
require("source/init_state")
require("source/fight")

game_state = {
}

function update_state(dt) 
    if not game_state.scene.type then
        init_fight()
    end
    if (game_state.scene.type == "FIGHT") then 
        update_fight(dt)
    end
end

broker_subscribe("button_skill_pressed", function(payload) 
    game_state.selected = payload 
end)