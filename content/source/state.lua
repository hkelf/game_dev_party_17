require("source/configuration")
require("source/utils")
require("source/init_state")
require("source/fight_scene")
require("source/corridor_scene")
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
    if game_state.scene.type == "FIGHT" then 
        update_fight(dt)
    end
    if game_state.scene.type == "CORRIDOR" then
        update_corridor(dt)
    end
end

broker_subscribe(
    "button_pressed", 
    function(payload)
        if payload.body.type == "FLEE" then
            game_state.selected = {type="FLEE"}
        elseif payload.body.type == "ITEM" then
            game_state.selected = payload.body
            print_table(game_state.selected)
        else
            game_state.selected = {type="SKILL", id=payload.body.type}
        end
    end
)