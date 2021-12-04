local init_flee = function()

end

local init_skill = function()

end

function process_player_turn() 
    if game_state.selected.flee then
        init_flee()
    elseif game_state.selected.skill then
        init_skill()
    end
end