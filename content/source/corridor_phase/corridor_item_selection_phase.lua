local resolve_item = function() 
    print("----")
    print(game_state.selected.index)
    print("----")
    print_table(game_state.selectable_items)
    print("----")
    local id = game_state.selectable_items[game_state.selected.index]
    local item = find_by_id(id, configuration.items)
    game_state.stress = math.min(configuration.max, game_state.stress + rnd_in_range(item.stress))
    game_state.exhaustion = math.min(configuration.max, game_state.exhaustion + rnd_in_range(item.exhaustion))
    game_state.debt = math.min(configuration.max, game_state.debt + rnd_in_range(item.debt))
    game_state.unhappiness = math.min(configuration.max, game_state.unhappiness + rnd_in_range(item.unhappiness))
    game_state.wrath = math.min(configuration.max, game_state.wrath + rnd_in_range(item.wrath))
    broker_send("player_health_update", {sender="attack_phase", body={state=game_state}})
end

function init_item_selection_phase(boss_loot)
    game_state.scene.phase="ITEM_SELECTION_PHASE"
    game_state.scene.timeout=configuration.corridor_phase_timeouts.ITEM_SELECTION_PHASE
    if boss_loot then 
        game_state.selectable_items=table.clone(boss_loot)
    else
        local items = table.clone(configuration.flee_items)
        -- Random pick 2 items from flee items pool
        shuffle(items)
        while not #items == 2 do
            table.remove(1, items)
        end
        game_state.selectable_items=items
    end
    broker_send("corridor_phase", {sender="item_selection_phase", body={phase="ITEM_SELECTION_PHASE", items=game_state.selectable_items}})
end

function update_item_selection_phase(dt)
    if game_state.selected and game_state.selected.type == "ITEM" then
        resolve_item()
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