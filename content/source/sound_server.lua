require("source/utils")

local attack = love.audio.newSource("sound/ATTACK_01.wav", "static")
local life_steal = love.audio.newSource("sound/bleed.wav", "static")
local click = love.audio.newSource("sound/clic.wav", "static")
local defeat = love.audio.newSource("sound/defeat.wav", "static")
local ennemy_attack = love.audio.newSource("sound/ennemy_attack.wav", "static")
local fireball = love.audio.newSource("sound/Fireball.wav", "static")
local flee = love.audio.newSource("sound/fuite.wav", "static")
local main = love.audio.newSource("sound/main.ogg", "static")
local monster_death = love.audio.newSource("sound/monster_death.wav", "static")
local omnislash = love.audio.newSource("sound/OMNISLASH_01.wav", "static")
local berserk = love.audio.newSource("sound/Rage.wav", "static")
local shield = love.audio.newSource("sound/shield.wav", "static")
local victory = love.audio.newSource("sound/victoire.wav", "static")
local walk = love.audio.newSource("sound/walk.wav", "static")

function try_to_play(sound)
    if not sound:isPlaying( ) then
        love.audio.play(sound)
    end
end

broker_subscribe("button_pressed", 
    function(payload)
        if payload.body.type == "ITEM" and not click:isPlaying( ) then
            love.audio.play(click)
        end
    end
)

broker_subscribe("fight_phase", 
    function(payload)
        print("\n\nCOUCOUUUUUUUUUUU\n\n")
        print("\n\n".. payload.body.phase .. "\n\n")
        if payload.body.phase == "ATTACK_PHASE" then
            if payload.body.skill.id == "ATTACK" then
                try_to_play(attack)
            elseif payload.body.skill.id == "DEFEND" then
                try_to_play(shield)
            elseif payload.body.skill.id == "FIREBALL" then
                try_to_play(fireball)
            elseif payload.body.skill.id == "OMNISLASH" then
                try_to_play(omnislash)
            elseif payload.body.skill.id == "BERSERK" then
                try_to_play(berserk)
            elseif payload.body.skill.id == "BLEED" then
                try_to_play(life_steal)
            end
        elseif payload.body.phase == "ENNEMY_ATTACK_PHASE" then
        elseif payload.body.phase == "ENNEMY_DEATH_PHASE" then
        elseif payload.body.phase == "PLAYER_DEATH_FIGHT_PHASE" then
        elseif payload.body.phase == "PLAYER_FLEE_PHASE" then
        end
    end
)