require("source/broker")
require("source/utils")
require("source/fight_phase/player_turn_phase")

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

    broker_send("ennemy_created", {sender="fight", body=game_state.current_ennemy})
end

function init_fight() 
    game_state.scene = {
        type="FIGHT"
    }
    select_ennemy()
    print("FIGHT_STARTED\n")
    print_table(game_state)
    print("\n")
    broker_send("fight_started", { sender="fight" })
    init_player_turn_phase()
end

function update_fight(dt)
    if game_state.scene.phase == "PLAYER_TURN_PHASE" then
        process_player_turn(dt)
    elseif game_state.scene.phase == "PLAYER_ATTACK_PHASE" then
        process_player_attack_phase(dt)
    elseif game_state.scene.phase == "ENNEMY_ATTACK_PHASE" then
        process_ennemy_attack_phase(dt)
    elseif game_state.scene.phase == "FLEE_PHASE" then
        process_player_flee_phase(dt)
    elseif game_state.scene.phase == "ENNEMY_DEATH_PHASE" then
        process_ennemy_death_phase(dt)
    elseif game_state.scene.phase == "PLAYER_DEATH_PHASE" then
        process_player_death_phase(dt)
    end
end

