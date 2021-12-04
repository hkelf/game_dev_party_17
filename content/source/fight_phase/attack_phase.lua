local resolve_damages = function() 
    print("SKILL SELECTED :")
    print_table(game_state.current_skill)
    game_state.current_ennemy.health = math.min(1, game_state.current_ennemy.health + rnd_in_range(game_state.current_skill.damages) )
    broker_send("ennemy_health_update", {sender="attack_phase", body={health=game_state.current_ennemy.health}})
end

-- 

function init_attack_phase()
    game_state.scene.phase="ATTACK_PHASE"
    game_state.scene.timeout=configuration.fight_phase_timeouts.ATTACK_PHASE
    local skill = find_by_id(game_state.selected.id, configuration.skills)
    game_state.current_skill = skill
    broker_send("fight_phase", {sender="ATTACK_PHASE", body={phase="ATTACK_PHASE", skill=game_state.current_skill}})
end

function update_attack_phase(dt)
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        print("coucou")
        resolve_damages()
        init_ennemy_attack_phase()
    end
end