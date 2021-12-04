require("source/configuration")
require("source/utils")
require("source/init_state")
require("source/fight_scene")
require("source/fight_phase/player_death_fight_phase")

game_state = {
}

local init_player_death_fight_phase = function()
    if game_state.scene.type == "FIGHT" then
        init_player_death_fight_phase()
    elseif game_state.scene.type == "ITEM" then
    end
end

local check_player_state = function()
    if game_state.stress == configuration.max 
        or game_state.exhaustion == configuration.max or game_state.debt == configuration.max 
        or game_state.unhappiness == configuration.max or game_state.wrath == configuration.max 
    then
        init_player_death_fight_phase()
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