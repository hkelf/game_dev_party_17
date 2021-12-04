local update_pression = function(dt)
    local pression = game_state.current_ennemy.pression
    local rnd = math.random(pression.from, pression.to)
    game_state.pression = math.max(game_state.pression + rnd, configuration.max)
end

local update_health = function(dt)
    if pression == configuration.max then
        
    end
end

local set_pression = function() 
    pression = 0
end

function init_player_turn_phase()
    game_state.scene.phase = "PLAYER_TURN"
    broker_send("fight_phase", {sender="player_turn", body={phase=game_state.scene.phase}})
end

function update_player_turn(dt)
    -- update_pression()
    -- update_health()
    if game_state.selected and game_state.selected.type == "SKILL" then
        init_attack_phase()
        return
    end
end