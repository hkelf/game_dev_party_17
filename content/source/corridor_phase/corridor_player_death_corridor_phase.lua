function init_player_death_corridor_phase()
    game_state.scene.phase="PLAYER_DEATH_CORRIDOR"
    game_state.scene.timeout=configuration.corridor_phase_timeouts.PLAYER_DEATH_CORRIDOR
    broker_send("corridor_phase", {sender="player_death_corridor", body={phase="PLAYER_DEATH_CORRIDOR"}})
end

function update_player_death_corridor_phase(dt)
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        print("LUL")
    end
end