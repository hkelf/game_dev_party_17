configuration = {
    max=100,
    min=-100,
    initial_pression=5,
    initial_stress=0,
    initial_exhaustion=0,
    initial_debt=0,
    initial_unhappiness=0,
    initial_wrath=0,
    number_of_ennemies=2,
    ennemies={
        {
            id="breakup",
            image="dummy.png",
            stress={from=0, to=0},
            exhaustion={from=0, to=10},
            debt={from=0, to=10},
            unhappiness={from=0, to=10},
            wrath={from=0, to=10},
            pression={from=0, to=1},
            health=150,
            drops={
                "SALARY", "NAP"
            },
            fleeable=true
        },
        {
            id="finance",
            image="dummy.png",
            stress={from=0, to=0},
            exhaustion={from=0, to=10},
            debt={from=0, to=10},
            unhappiness={from=0, to=10},
            wrath={from=0, to=10},
            pression={from=0, to=1},
            health=200,
            drops={
                "SALARY", "NAP"
            },
            fleeable=true
        },
        {
            id="mourn",
            image="dummy.png",
            stress={from=0, to=0},
            exhaustion={from=0, to=10},
            debt={from=0, to=10},
            unhappiness={from=0, to=10},
            wrath={from=0, to=10},
            pression={from=0, to=1},
            health=120,
            drops={
                "SALARY", "NAP"
            },
            fleeable=true
        },    
        {
            id="neighbour",
            image="dummy.png",
            stress={from=0, to=0},
            exhaustion={from=0, to=10},
            debt={from=0, to=10},
            unhappiness={from=0, to=10},
            wrath={from=0, to=10},
            pression={from=0, to=1},
            health=120,
            drops={
                "SALARY", "NAP"
            },
            fleeable=true
        },
        {
            id="work",
            image="dummy.png",
            stress={from=0, to=0},
            exhaustion={from=0, to=10},
            debt={from=0, to=10},
            unhappiness={from=0, to=10},
            wrath={from=0, to=10},
            pression={from=0, to=1},
            health=120,
            drops={
                "SALARY", "NAP"
            },
            fleeable=true
        },
    },
    flee_items={
        "SALARY", "NAP", "MEDITATION", "LAUGH"
    },
    items={
        {
            id="SALARY",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="NAP",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="MEDITATION",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="LAUGH",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="EXERCISE",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="VIDEO_GAME",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="DRINKING",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="SEXY_TIME",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="DRUGS",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="MEET_FRIENDS",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="FOOD",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="CHILLING",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        },
        {
            id="MUSIC",
            stress={from=-10, to=0},
            exhaustion={from=0, to=0},
            debt={from=5, to=5},
            unhappiness={from=-10, to=10},
            wrath={from=0, to=0},
        }
    },
    skills={
        {
            id="ATTACK",
            damages={from=0, to=100},
            self_damages={
                stress={from=0, to=0},
                exhaustion={from=0, to=0},
                debt={from=5, to=5},
                unhappiness={from=10, to=10},
                wrath={from=0, to=0},
            }
        },
        {
            id="DEFEND",
            damages={from=0, to=0},
            buff="resistance",
            self_damages={
                stress={from=10, to=0},
                exhaustion={from=0, to=0},
                debt={from=5, to=5},
                unhappiness={from=10, to=10},
                wrath={from=0, to=0},
            }
        },
        {
            id="FIREBALL",
            damages={from=0, to=100},
            self_damages={
                stress={from=10, to=0},
                exhaustion={from=0, to=0},
                debt={from=5, to=5},
                unhappiness={from=10, to=10},
                wrath={from=0, to=0},
            }
        },
        {
            id="OMNISLASH",
            damages={from=0, to=100},
            self_damages={
                stress={from=10, to=0},
                exhaustion={from=0, to=0},
                debt={from=5, to=5},
                unhappiness={from=10, to=10},
                wrath={from=0, to=0},
            }
        },
        {
            id="BERSERK",
            damages={from=0, to=0},
            buff="berserk",
            self_damages={
                stress={from=0, to=0},
                exhaustion={from=0, to=0},
                debt={from=0, to=0},
                unhappiness={from=0, to=0},
                wrath={from=0, to=0},
            }
        },
        {
            id="BLEED",
            damages={from=0, to=100},
            self_damages={
                stress={from=10, to=0},
                exhaustion={from=0, to=0},
                debt={from=5, to=5},
                unhappiness={from=10, to=10},
                wrath={from=0, to=0},
            }
        },
    },
    buff={
        {
            id="resistance",
            rounds=3,
            -- percentages 
            resistance=90,
            damage_boost=0,
        },
        {
            id="berserk",
            rounds=3,
            -- percentages 
            resistance=0,
            damage_boost=10,
        },
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
        ATTACK_PHASE=1, 
        ENNEMY_ATTACK_PHASE=1,
        ENNEMY_DEATH_PHASE=2,
        PLAYER_FLEE_PHASE=1,
        PLAYER_DEATH_FIGHT_PHASE=5,
    },
    corridor_phase_timeouts={
        WALK_PHASE=4,
        ITEM_SELECTION_PHASE=2,
    },
}