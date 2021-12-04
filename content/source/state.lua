require("source/configuration")
require("source/utils")
require("source/init_state")
require("source/fight")

game_state = {
}

local check_player_state = function()
    if stress == 1 or exhaustion == 1 or debt == 1 or unhappiness == 1 or wrath == 1 then
        init_player_death_phase()
    end
end

function update_state(dt) 
    check_player_state()
    if not game_state.scene.type then
        init_fight()
    end
    if (game_state.scene.type == "FIGHT") then 
        update_fight(dt)
    end
end

broker_subscribe("button_pressed", function(payload) 
    game_state.selected = payload.body 
end)