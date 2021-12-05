function init_startup_phase()
    game_state.scene.phase="STARTUP_PHASE"
    game_state.scene.timeout=configuration.fight_phase_timeouts.STARTUP_PHASE
    game_state.pression = configuration.initial_pression
    broker_send("fight_phase", {sender="startup_phase", body={phase="STARTUP_PHASE"}})
    broker_send("pression_updated", {sender="player_turn", body={pression=game_state.pression, max=configuration.initial_pression}})
end

function update_startup_phase(dt) 
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        init_player_turn_phase()
    end
end