function init_corridor() 
    game_state.scene = {
        type="CORRIDOR"
    }
    print("corridor started\n")
    print_table(game_state)
    print("\n")
    broker_send("corridor_started", { sender="corridor_scene" })
    init_item_selection_phase()
end

function update_corridor(dt)
    if game_state.scene.phase == "ITEM_SELECTION_PHASE" then
        update_item_selection_phase(dt)
        check_player_health()
    elseif game_state.scene.phase == "WALK_PHASE" then
        update_walk_phase(dt)
    end
end