require("source/configuration")
require("source/utils")
require("source/init_state")
require("source/fight_scene")
require("source/corridor_scene")
require("source/title_scene")
require("source/fight_phase/player_death_fight_phase")

game_state = {
}

local init_player_death_fight_phase = function()
    if game_state.scene.type == "FIGHT" then
        init_player_death_fight_phase()
    elseif game_state.scene.type == "ITEM" then
    end
end

win = false

function update_state(dt) 
    
    if not game_state.scene.type then
        init_title()
    end
    if game_state.scene.type == "FIGHT" then 
        update_fight(dt)
    end
    if game_state.scene.type == "CORRIDOR" then
        update_corridor(dt)
    end
    if game_state.scene.type == "TITLE" then
        update_title(dt)
    end
end

broker_subscribe(
    "button_pressed", 
    function(payload)
        if payload.body.type == "FLEE" then
            game_state.selected = {type="FLEE"}
        elseif payload.body.type == "ITEM" then
            game_state.selected = payload.body
        else
            game_state.selected = {type="SKILL", id=payload.body.type}
        end
    end
)