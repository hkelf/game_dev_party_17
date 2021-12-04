require("source/broker")

local find_next_available = function(array, index, max)
    local i = index + 1
    while true do
        if i > max then 
            i = 1 
        end
        if i == index then
            return 0 
        end
        if not array[i] then 
            return i 
        end
        i = i+1
    end
end


local init_ennemy_pool = function(game_state)
    game_state.ennemy_pool = {}
    local selected_ennemy = {}
    
    local pool_size
    
    if table.getn(configuration.ennemies) < configuration.number_of_ennemies then 
        pool_size = table.getn(configuration.ennemies) 
    else 
        pool_size = configuration.number_of_ennemies 
    end

    for i = 1, pool_size do
        local to_be_selected = math.random(pool_size)
        print(selected_ennemy[to_be_selected], to_be_selected)
        if (selected_ennemy[to_be_selected]) then
            to_be_selected = find_next_available(selected_ennemy, to_be_selected, pool_size)
            if to_be_selected == 0 then break end
        end
        print_table(selected_ennemy)
        print(to_be_selected)
        selected_ennemy[to_be_selected] = true
        
        table.insert(game_state.ennemy_pool, configuration.ennemies[to_be_selected])
    end
end

function initialize_state() 
    game_state.pression=configuration.initial_pression
    game_state.stress=configuration.initial_stress
    game_state.exhaustion=configuration.initial_exhaustion
    game_state.debt=configuration.initial_debt
    game_state.unhappiness=configuration.initial_unhappiness
    game_state.wrath=configuration.initial_wrath
    game_state.scene={}
    game_state.selected={}
        
    init_ennemy_pool(game_state)

    broker_send("game_initialized", { sender="state" })

    broker_send("player_created", { sender="state", body= { x=200, y=300} })

    print("STATE INITIALIZED")
    print_table(game_state)
end

