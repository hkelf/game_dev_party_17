function init_walk_phase()
    game_state.scene.phase="WALK_PHASE"
    game_state.scene.timeout=configuration.corridor_phase_timeouts.walk_phase
    broker_send("corridor_phase", {sender="walk_phase", body={phase="WALK_PHASE"}})
end

function update_walk_phase(dt)
    print("coucou")
end