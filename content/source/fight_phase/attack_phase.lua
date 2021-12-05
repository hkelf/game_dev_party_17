local resolve_damages = function() 
    local coef = 1

    if game_state.buff then
        coef = (100 - game_state.buff.resistance) / 100
    end

    game_state.current_ennemy.health = math.floor(math.max(
        0, game_state.current_ennemy.health - coef * rnd_in_range(game_state.current_skill.damages)
    ))

    broker_send("ennemy_health_update", {sender="attack_phase", body=game_state.current_ennemy})
end

local resolve_self_damages = function() 
    game_state.stress = math.max(0, game_state.stress + rnd_in_range(game_state.current_skill.self_damages.stress))
    game_state.exhaustion = math.max(0, game_state.exhaustion + rnd_in_range(game_state.current_skill.self_damages.exhaustion))
    game_state.debt = math.max(0, game_state.debt + rnd_in_range(game_state.current_skill.self_damages.debt))
    game_state.unhappiness = math.max(0, game_state.unhappiness + rnd_in_range(game_state.current_skill.self_damages.unhappiness))
    game_state.wrath = math.max(0, game_state.wrath + rnd_in_range(game_state.current_skill.self_damages.wrath))
    broker_send("player_health_update", {sender="attack_phase", body={state=game_state}})
end

local resolve_buff = function()
    if game_state.current_skill.buff then
        local buff = find_by_id(game_state.current_skill.buff, configuration.buff)
        game_state.buff = table.clone(buff)
        broker_send("buff_added", {sender="attack_phase", body={buff=buff}})
    end

    if game_state.buff then
        game_state.buff.rounds = game_state.buff.rounds - 1
        
        if game_state.buff.rounds == 0 then
            game_state.buff = nil
            broker_send("buff_removed", {sender="attack_phase"})
        end
    end
end

-- 

function init_attack_phase()
    game_state.scene.phase="ATTACK_PHASE"
    game_state.scene.timeout=configuration.fight_phase_timeouts.ATTACK_PHASE
    -- game_state.
    local skill = find_by_id(game_state.selected.id, configuration.skills)
    game_state.current_skill = skill
    print("SKILL SELECTED :")
    print_table(game_state.current_skill)
    broker_send("fight_phase", {sender="ATTACK_PHASE", body={phase="ATTACK_PHASE", skill=game_state.current_skill}})
end

function update_attack_phase(dt)
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        resolve_damages()
        resolve_self_damages()
        resolve_buff()
        if game_state.stress == configuration.max 
            or game_state.exhaustion == configuration.max or game_state.debt == configuration.max 
            or game_state.unhappiness == configuration.max or game_state.wrath == configuration.max 
        then
            init_player_death_fight_phase()
        elseif game_state.current_ennemy.health <= 0 then
            print("LETZGO")
            init_ennemy_death_phase()
        else 
            init_ennemy_attack_phase()
        end
        game_state.current_skill = nil
    end
end