local update_pression = function(dt)
    local pression = game_state.current_ennemy.pression
    local rnd = math.random(pression.from, pression.to)
    game_state.pression = math.max(game_state.pression - rnd * dt, 0)
    broker_send("pression_updated", {sender="player_turn", body={pression=game_state.pression, max=configuration.initial_pression}})
end

local update_health = function(dt)
    if pression == configuration.max then
        game_state.stress = math.min(configuration.max, game_state.stress + rnd_in_range(game_state.current_skill.self_damages.stress))
        game_state.exhaustion = math.min(configuration.max, game_state.exhaustion + rnd_in_range(game_state.current_skill.self_damages.exhaustion))
        game_state.debt = math.min(configuration.max, game_state.debt + rnd_in_range(game_state.current_skill.self_damages.debt))
        game_state.unhappiness = math.min(configuration.max, game_state.unhappiness + rnd_in_range(game_state.current_skill.self_damages.unhappiness))
        game_state.wrath = math.min(configuration.max, game_state.wrath + rnd_in_range(game_state.current_skill.self_damages.wrath))
        broker_send("player_health_update", {sender="player_turn_phase", body={state=game_state}})
    end
end

function init_player_turn_phase()
    game_state.selected = nil
    game_state.scene.phase = "PLAYER_TURN_PHASE"
    game_state.pression = configuration.initial_pression
    broker_send("fight_phase", {sender="player_turn", body={phase=game_state.scene.phase}})
    broker_send("pression_updated", {sender="player_turn", body={pression=game_state.pression, max=configuration.initial_pression}})
end

function update_player_turn_phase(dt)
    update_pression(dt)
    
    if game_state.pression == 0 then
        if game_state.pression_timeout == nil then
            game_state.pression_timeout = configuration.pression_penalty.timeout
        end
        game_state.pression_timeout = math.max(0, game_state.pression_timeout - dt)
        --print(game_state.pression_timeout)
        if game_state.pression_timeout == 0 then
            game_state.pression_timeout = configuration.pression_penalty.timeout
            game_state.stress = math.min(configuration.max, game_state.stress + rnd_in_range(configuration.pression_penalty.stress))
            game_state.exhaustion = math.min(configuration.max, game_state.exhaustion + rnd_in_range(configuration.pression_penalty.exhaustion))
            game_state.debt = math.min(configuration.max, game_state.debt + rnd_in_range(configuration.pression_penalty.debt))
            game_state.unhappiness = math.min(configuration.max, game_state.unhappiness + rnd_in_range(configuration.pression_penalty.unhappiness))
            game_state.wrath = math.min(configuration.max, game_state.wrath + rnd_in_range(configuration.pression_penalty.wrath))
            broker_send("player_health_update", {sender="player_turn_phase", body={state=game_state}})
        end

    end

    if game_state.selected and game_state.selected.type == "SKILL" then
        init_attack_phase()
    elseif game_state.selected and game_state.selected.type == "FLEE" and game_state.current_ennemy.fleeable == true then
        init_player_flee_phase()
        game_state.current_ennemy.fleeable = false
        table.insert(game_state.ennemy_pool, game_state.current_ennemy)
        game_state.current_ennemy = nil
    end
end