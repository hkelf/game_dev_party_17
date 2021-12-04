function init_player_flee_phase()
    game_state.scene.phase="PLAYER_FLEE_PHASE"
    game_state.scene.timeout=configuration.fight_phase_timeouts.PLAYER_FLEE_PHASE
    broker_send("fight_phase", {sender="player_flee_phase", body={phase="PLAYER_FLEE_PHASE"}})
end

function update_player_flee_phase(dt)    
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        init_corridor()
    end
end