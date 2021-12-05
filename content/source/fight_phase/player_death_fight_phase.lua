function init_player_death_fight_phase()
    game_state.scene.phase="PLAYER_DEATH_FIGHT_PHASE"
    game_state.scene.timeout=configuration.fight_phase_timeouts.PLAYER_DEATH_FIGHT_PHASE
    broker_send("fight_phase", {sender="player_death_fight_phase", body={phase="PLAYER_DEATH_FIGHT_PHASE"}})
end

function update_player_death_fight_phase(dt)
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        broker_send("game_over", {})
    end
end