function init_item_selection_phase(boss_loot)
    game_state.scene.phase="ITEM_SELECTION_PHASE"
    game_state.scene.timeout=configuration.corridor_phase_timeouts.ITEM_SELECTION_PHASE
    if boss_loot then 
        game_state.selectable_items=table_clone(boss_loot)
    else
        local items = table_clone(configuration.flee_items)
        
        game_state.selectable_items=table_clone(configuration.flee_items)

    end
    broker_send("corridor_phase", {sender="item_selection_phase", body={phase="ITEM_SELECTION_PHASE"}})
end

function update_item_selection_phase(dt)
    game_state.scene.timeout = math.max(game_state.scene.timeout - dt, 0)
        if game_state.scene.timeout == 0 then
            if game_state.stress == configuration.max 
            or game_state.exhaustion == configuration.max or game_state.debt == configuration.max 
            or game_state.unhappiness == configuration.max or game_state.wrath == configuration.max 
        then
            init_player_death_corridor_phase()
        else
            init_walk_phase()
        end
    end
end