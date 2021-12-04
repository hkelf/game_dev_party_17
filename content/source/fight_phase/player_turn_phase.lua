local update_pression = function(dt)
    local pression = game_state.current_ennemy.pression
    local rnd = math.random(pression.from, pression.to)
    game_state.pression = math.max(game_state.pression - rnd * dt, 0)
    broker_send("pression_updated", {sender="player_turn", body={pression=game_state.pression, max=configuration.initial_pression}})
end

local update_health = function(dt)
    if pression == configuration.max then
        
    end
end

function init_player_turn_phase()
    game_state.selected = nil
    game_state.scene.phase = "PLAYER_TURN_PHASE"
    game_state.scene.pression = configuration.initial_pression
    broker_send("fight_phase", {sender="player_turn", body={phase=game_state.scene.phase}})
    broker_send("pression_updated", {sender="player_turn", body={pression=game_state.pression, max=configuration.initial_pression}})
end

function update_player_turn_phase(dt)
    update_pression(dt)
    -- update_health()
    if game_state.selected and game_state.selected.type == "SKILL" then
        init_attack_phase()
        return
    elseif game_state.selected and game_state.selected.type == "FLEE" then
        init_player_flee_phase()
    end
end