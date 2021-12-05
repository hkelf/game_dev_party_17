function init_title()
    game_state.scene.type="TITLE"
    game_state.scene.timeout=configuration.fight_phase_timeouts.STARTUP_PHASE
    game_state.pression = configuration.initial_pression
end

function update_title(dt) 
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
    if game_state.scene.timeout == 0 then
        init_fight()
    end
end