require("source/configuration")
require("source/utils")
require("source/init_state")
require("source/fight_scene")
require("source/fight_phase/player_death_fight_phase")

game_state = {
}

local init_player_death_fight_phase = function()
    if scene.type == "FIGHT" then
        init_player_death_fight_phase()
    elseif scene.type == "ITEM" then
    end
end

local check_player_state = function()
    if stress == configuration.max or exhaustion == configuration.max or debt == configuration.max or unhappiness == configuration.max or wrath == configuration.max then
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