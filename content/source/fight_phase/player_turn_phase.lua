local update_pression = function(dt)
    local pression = game_state.current_ennemy.pression
    local rnd = math.random(pression.from, pression.to)
    game_state.pression = math.max(game_state.pression - rnd * dt, 0)
    broker_send("pression_updated", {sender="player_turn", body={pression=game_state.pression, max=configuration.initial_pression}})
end

local update_health = function(dt)
    if pression == configuration.max then
        game_state.stress = math.max(0, game_state.stress + rnd_in_range(game_state.current_skill.self_damages.stress))
        game_state.exhaustion = math.max(0, game_state.exhaustion + rnd_in_range(game_state.current_skill.self_damages.exhaustion))
        game_state.debt = math.max(0, game_state.debt + rnd_in_range(game_state.current_skill.self_damages.debt))
        game_state.unhappiness = math.max(0, game_state.unhappiness + rnd_in_range(game_state.current_skill.self_damages.unhappiness))
        game_state.wrath = math.max(0, game_state.wrath + rnd_in_range(game_state.current_skill.self_damages.wrath))
        broker_send("player_health_update", {sender="player_turn_phase", body={state=game_state}})
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

    if pression == 0 then
        if game_state.pression_timeout == nil then
            game_state.pression_timeout = configuration.pression_penalty.timeout
        end
        game_state.pression_timeout = math.max(0, game_state.pression_timeout - dt)
        if game_state.pression_timeout == 0 then
            game_state.pression_timeout = configuration.pression_penalty.timeout
            game_state.stress = math.max(0, game_state.stress + rnd_in_range(game_state.pression_penalty.stress))
            game_state.exhaustion = math.max(0, game_state.exhaustion + rnd_in_range(game_state.pression_penalty.exhaustion))
            game_state.debt = math.max(0, game_state.debt + rnd_in_range(game_state.pression_penalty.debt))
            game_state.unhappiness = math.max(0, game_state.unhappiness + rnd_in_range(game_state.pression_penalty.unhappiness))
            game_state.wrath = math.max(0, game_state.wrath + rnd_in_range(game_state.pression_penalty.wrath))
            broker_send("player_health_update", {sender="player_turn_phase", body={state=game_state}})
        end

    end

    if game_state.selected and game_state.selected.type == "SKILL" then
        init_attack_phase()
        return
    elseif game_state.selected and game_state.selected.type == "FLEE" then
        init_player_flee_phase()
    end
end