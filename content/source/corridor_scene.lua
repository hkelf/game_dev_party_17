function init_corridor() 
    game_state.scene = {
        type="CORRIDOR"
    }
    select_ennemy()
    print("corridor started\n")
    print_table(game_state)
    print("\n")
    broker_send("corridor_started", { sender="corridor_scene" })
    init()
end

function update_corridor(dt)

    if game_state.scene.phase == "ITME_SELECTION_PHASE" then
        update_player_turn_phase(dt)
    elseif game_state.scene.phase == "ATTACK_PHASE" then
        update_attack_phase(dt)
        check_ennemy_state()
    elseif game_state.scene.phase == "ENNEMY_ATTACK_PHASE" then
        update_ennemy_attack_phase(dt)
    elseif game_state.scene.phase == "PLAYER_FLEE_PHASE" then
        update_player_flee_phase(dt)
    elseif game_state.scene.phase == "ENNEMY_DEATH_PHASE" then
        update_ennemy_death_phase(dt)
    elseif game_state.scene.phase == "PLAYER_DEATH_PHASE" then
        update_player_death_phase(dt)
    end
end