require("source/broker")
require("source/utils")
require("source/fight_player_turn")

local select_ennemy = function() 
    local rnd = math.random(#game_state.ennemy_pool)
    print(game_state.ennemy_pool[rnd].id)
    game_state.current_ennemy = table.clone(game_state.ennemy_pool[rnd])
    print(game_state.current_ennemy)
    if not game_state.already_fought_ennemies 
    then 
        game_state.already_fought_ennemies = {} 
    end
    print("SELECTED ENNEMY:")
    print_table(game_state.current_ennemy)
    game_state.already_fought_ennemies[game_state.current_ennemy.id] = true

    broker_send("ennemy_created", {sender="fight", payload=game_state.current_ennemy})
end

function init_fight() 
    game_state.scene = {
        type="FIGHT",
        phase="PLAYER_TURN"
    }
    game_state.player_state.state = "IDLE"

    select_ennemy()
    print("FIGHT_STARTED\n")
    print_table(game_state)
    print("\n")
    broker_send("fight_started", {sender="fight"})
    broker_send("player_state")
end

function update_fight()
    if game_state.scene.phase == "PLAYER_TURN" then
        process_player_turn()
    end
end

