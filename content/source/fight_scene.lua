require("source/broker")
require("source/utils")
require("source/fight_phase/player_turn_phase")
require("source/fight_phase/attack_phase")
require("source/fight_phase/ennemy_attack_phase")
require("source/fight_phase/player_flee_phase")
require("source/fight_phase/ennemy_death_phase")

local select_ennemy = function() 
    shuffle(game_state.ennemy_pool)

    game_state.current_ennemy = table.remove(game_state.ennemy_pool, 1)
    if not game_state.current_ennemy.initial_health then  
        game_state.current_ennemy.initial_health = game_state.current_ennemy.health
    end

    print("SELECTED ENNEMY:")
    print("\n")

    broker_send("ennemy_created", {sender="fight", body=game_state.current_ennemy})
end

function init_fight() 
    if #game_state.ennemy_pool == 0 then return end

    game_state.scene = {
        type="FIGHT"
    }
    select_ennemy()
    print("FIGHT_STARTED\n")
    print("\n")
    broker_send("fight_started", { sender="fight", body={ennemy=game_state.current_ennemy}})
    init_player_turn_phase()
end

function update_fight(dt)
    if game_state.scene.phase == "PLAYER_TURN_PHASE" then
        update_player_turn_phase(dt)
    elseif game_state.scene.phase == "ATTACK_PHASE" then
        update_attack_phase(dt)
    elseif game_state.scene.phase == "ENNEMY_ATTACK_PHASE" then
        update_ennemy_attack_phase(dt)
    elseif game_state.scene.phase == "PLAYER_FLEE_PHASE" then
        update_player_flee_phase(dt)
    elseif game_state.scene.phase == "ENNEMY_DEATH_PHASE" then
        update_ennemy_death_phase(dt)
    elseif game_state.scene.phase == "PLAYER_DEATH_FIGHT_PHASE" then
        update_player_death_fight_phase(dt)
    end
end

