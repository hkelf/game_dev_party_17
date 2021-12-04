function init_ennemy_death_phase()
    game_state.scene.phase="ENNEMY_DEATH_PHASE"
    game_state.scene.timeout=configuration.fight_phase_timeouts.ENNEMY_DEATH_PHASE
    broker_send("fight_phase", {sender="ennemy_death_phase", body={phase="ENNEMY_DEATH_PHASE"}})
end

function update_ennemy_death_phase(dt)    
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        init_player_turn_phase()
    end
end