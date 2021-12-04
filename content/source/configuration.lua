configuration = {
    max=1,
    min=-1,
    initial_pression=0,
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
            stress={from=0, to=0.1},
            exhaustion={from=0, to=0.1},
            debt={from=0, to=0.1},
            unhappiness={from=0, to=0.1},
            wrath={from=0, to=0.1},
            pression={from=0, to=0.05},
            health=1,
            drops={
                "psychologist"
            },
            fleeable=true
        },
        {
            id="test2",
            image="dummy.png",
            stress={from=0, to=0.1},
            exhaustion={from=0, to=0.1},
            debt={from=0, to=0.1},
            unhappiness={from=0, to=0.1},
            wrath={from=0, to=0.1},
            pression={from=0, to=0.05},
            health=1,
            drops={
                "psychologist"
            },
            fleeable=true
        },
        {
            id="test3",
            image="dummy.png",
            stress={from=0, to=0.1},
            exhaustion={from=0, to=0.1},
            debt={from=0, to=0.1},
            unhappiness={from=0, to=0.1},
            wrath={from=0, to=0.1},
            pression={from=0, to=0.05},
            health=1,
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
            damages={from=0, to=0.2},
            buff={"motivation"},
            debuff={"bleed"},
            self_damages={
                stress={from=-10, to=0},
                exhaustion={from=0, to=0},
                debt={from=-5, to=-5},
                unhappiness={from=-10, to=-10},
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
        timeout=5, -- seconds
        stress={from=-10, to=0},
        exhaustion={from=0, to=0},
        debt={from=-5, to=-5},
        unhappiness={from=-10, to=-10},
        wrath={from=0, to=0},
    },
    fight_phase_timeouts={
        ATTACK_PHASE=2, 
        ENNEMY_ATTACK_PHASE=2,
        ENNEMY_DEATH_PHASE=2,
        PLAYER_FLEE_PHASE=2,
    }
}