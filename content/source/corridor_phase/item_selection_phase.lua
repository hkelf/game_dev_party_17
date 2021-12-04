function init_item_selection_phase()
    game_state.scene.phase="ITEM_SELECTION_PHASE"
    broker_send("corridor_phase", {sender="item_selection_phase", body={phase="ITEM_SELECTION_PHASE"}})
end

function update_item_selection_phase(dt)
    print("coucou")
end