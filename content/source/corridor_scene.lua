require("source/corridor_phase/corridor_item_selection_phase")
require("source/corridor_phase/corridor_walk_phase")

function init_corridor(boss_loot) 
    game_state.scene = {
        type="CORRIDOR"
    }
    print("corridor started\n")
    print("\n")
    broker_send("corridor_started", { sender="corridor_scene" })
    init_item_selection_phase(boss_loot)
end

function update_corridor(dt)
    if game_state.scene.phase == "ITEM_SELECTION_PHASE" then
        update_item_selection_phase(dt)
    elseif game_state.scene.phase == "WALK_PHASE" then
        update_walk_phase(dt)
    end
end