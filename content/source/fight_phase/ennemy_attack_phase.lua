local resolve_damages = function() 
    local coef = 1

    if game_state.buff then
        coef = (100 - game_state.buff.resistance) / 100
    end

    game_state.stress = math.floor(math.min(configuration.max, game_state.stress + coef * rnd_in_range(game_state.current_ennemy.stress)))
    game_state.exhaustion = math.floor(math.min(configuration.max, game_state.exhaustion + coef * rnd_in_range(game_state.current_ennemy.exhaustion)))
    game_state.debt = math.floor(math.min(configuration.max, game_state.debt + coef * rnd_in_range(game_state.current_ennemy.debt)))
    game_state.unhappiness = math.floor(math.min(configuration.max, game_state.unhappiness + coef * rnd_in_range(game_state.current_ennemy.unhappiness)))
    game_state.wrath = math.floor(math.min(configuration.max, game_state.wrath + coef * rnd_in_range(game_state.current_ennemy.wrath)))
    broker_send("player_health_update", {sender="ennemy_attack_phase", body={state=game_state}})
end

function init_ennemy_attack_phase()
    game_state.scene.phase="ENNEMY_ATTACK_PHASE"
    game_state.scene.timeout=configuration.fight_phase_timeouts.ENNEMY_ATTACK_PHASE
    broker_send("fight_phase", {sender="ennemy_attack_phase", body={phase="ENNEMY_ATTACK_PHASE"}})
end

function update_ennemy_attack_phase(dt)    
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        resolve_damages()
        if game_state.stress == configuration.max 
            or game_state.exhaustion == configuration.max or game_state.debt == configuration.max 
            or game_state.unhappiness == configuration.max or game_state.wrath == configuration.max 
        then
            init_player_death_fight_phase()
        else
            init_player_turn_phase()
        end
    end
end