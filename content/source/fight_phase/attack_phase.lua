local resolve_damages = function() 
    game_state.current_ennemy.health = math.max(0, game_state.current_ennemy.health - rnd_in_range(game_state.current_skill.damages))
    broker_send("ennemy_health_update", {sender="attack_phase", body={health=game_state.current_ennemy.health}})
end

local resolve_self_damages = function() 
    game_state.stress = math.max(0, game_state.stress + rnd_in_range(game_state.current_skill.self_damages.stress))
    game_state.exhaustion = math.max(0, game_state.exhaustion + rnd_in_range(game_state.current_skill.self_damages.exhaustion))
    game_state.debt = math.max(0, game_state.debt + rnd_in_range(game_state.current_skill.self_damages.debt))
    game_state.unhappiness = math.max(0, game_state.unhappiness + rnd_in_range(game_state.current_skill.self_damages.unhappiness))
    game_state.wrath = math.max(0, game_state.wrath + rnd_in_range(game_state.current_skill.self_damages.wrath))
    broker_send("ennemy_health_update", {sender="attack_phase", body={health=game_state.current_ennemy.health}})
end

local resolve_buff = function() 
    game_state.current_ennemy.health = math.max(0, game_state.current_ennemy.health - rnd_in_range(game_state.current_skill.damages))
    broker_send("ennemy_health_update", {sender="attack_phase", body={health=game_state.current_ennemy.health}})
end

-- 

function init_attack_phase()
    game_state.scene.phase="ATTACK_PHASE"
    game_state.scene.timeout=configuration.fight_phase_timeouts.ATTACK_PHASE
    local skill = find_by_id(game_state.selected.id, configuration.skills)
    game_state.current_skill = skill
    print("SKILL SELECTED :")
    print_table(game_state.current_skill)
    broker_send("fight_phase", {sender="ATTACK_PHASE", body={phase="ATTACK_PHASE", skill=game_state.current_skill}})
end

function update_attack_phase(dt)
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        print("coucou")
        resolve_damages()
        resolve_buff()
        resolve_self_damages()
        init_ennemy_attack_phase()
    end
end