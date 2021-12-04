configuration = {
    max=100,
    min=-100,
    initial_pression=5,
    initial_stress=0,
    initial_exhaustion=0,
    initial_debt=0,
    initial_unhappiness=0,
    initial_wrath=0,
    number_of_ennemies=1,
    ennemies={
        {
            id="test",
            image="dummy.png",
            stress={from=0, to=10},
            exhaustion={from=0, to=10},
            debt={from=0, to=10},
            unhappiness={from=0, to=10},
            wrath={from=0, to=10},
            pression={from=0, to=1},
            health=150,
            drops={
                "psychologist"
            },
            fleeable=true
        },
        {
            id="test2",
            image="dummy.png",
            stress={from=0, to=10},
            exhaustion={from=0, to=10},
            debt={from=0, to=10},
            unhappiness={from=0, to=10},
            wrath={from=0, to=10},
            pression={from=0, to=1},
            health=200,
            drops={
                "psychologist"
            },
            fleeable=true
        },
        {
            id="test3",
            image="dummy.png",
            stress={from=0, to=10},
            exhaustion={from=0, to=10},
            debt={from=0, to=10},
            unhappiness={from=0, to=10},
            wrath={from=0, to=10},
            pression={from=0, to=1},
            health=120,
            drops={
                "psychologist"
            },
            fleeable=true
        }    
    },
    items={
        {
            id="psychologist",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
    },
    skills={
        {
            id="slash",
            damages={from=0, to=100},
            buff="motivation",
            debuff="bleed",
            self_damages={
                stress={from=10, to=0},
                exhaustion={from=0, to=0},
                debt={from=5, to=5},
                unhappiness={from=10, to=10},
                wrath={from=0, to=0},
            }
        }
    },
    buff={
        {
            id="motivation",
            rounds={from=5, to=5},
            restauration={
                stress={from=-10, to=0},
                exhaustion={from=0, to=0},
                debt={from=-5, to=-5},
                unhappiness={from=-10, to=-10},
                wrath={from=0, to=0},
            },
            -- percentages 
            resistance={ 
                stress={from=30, to=40},
                exhaustion={from=10, to=10},
                debt={from=5, to=10},
                unhappiness={from=0, to=0},
                wrath={from=0, to=0},
            },
            damage_boost={from=5, to=10},
            flee_boost={from=5, to=10},
        }
    },
    debuff={
        id="bleed",
        rounds={from=5, to=5},
        dot={from=5, to=10},
        -- Percentage
        resistance={from=5, to=10}
    },
    pression_penalty= {
        timeout=1, -- seconds
        stress={from=0, to=2},
        exhaustion={from=0, to=3},
        debt={from=0, to=3},
        unhappiness={from=0, to=10},
        wrath={from=0, to=5},
    },
    fight_phase_timeouts={
        ATTACK_PHASE=2, 
        ENNEMY_ATTACK_PHASE=2,
        ENNEMY_DEATH_PHASE=2,
        PLAYER_FLEE_PHASE=2,
        PLAYER_DEATH_FIGHT_PHASE=5,
    },
    corridor_phase_timeouts={
        WALK_PHASE=2,
        ITEM_SELECTION_PHASE=2,
    },
}