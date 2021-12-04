function init_ennemy_attack_phase()
    game_state.scene.phase = "PLAYER_TURN"
    broker_send("fight_phase", {sender="player_turn", body={phase=game_state.scene.phase}})
end

function update_ennemy_attack_phase(dt)
    -- update_pression()
    -- update_health()
    if game_state.selected and game_state.selected.type == "SKILL" then
        init_attack_phase()
        return
    end
end