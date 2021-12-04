local resolve_damages = function() {
    local skill = find_by_id(game_state.selected.id, configuration.skills)
    game_state.current_ennemy.health = min(0, game_state.current_ennemy.health - rnd_in_range(skill.get_damages) )
    broker_send("ennemy_health_update", {sender="attack_phase", body={health=game_state.current_ennemy.health}})
}

-- 

function init_attack_phase()
    game_state.scene.phase="ATTACK_PHASE"
    game_state.scene.timeout=configuration.fight_phase_timeouts.ATTACK_PHASE
    broker_send("fight_phase", {sender="ATTACK_PHASE", body={phase="ATTACK_PHASE"}})
end

function update_attack_phase(dt)
    game_state.scene.timeout = min(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        resolve_damages()
    end
end