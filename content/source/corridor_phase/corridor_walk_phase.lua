function init_walk_phase()
    game_state.scene.phase="WALK_PHASE"
    game_state.scene.timeout=configuration.corridor_phase_timeouts.WALK_PHASE
    broker_send("corridor_phase", {sender="walk_phase", body={phase="WALK_PHASE"}})
end

function update_walk_phase(dt)
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        init_fight()
    end
end