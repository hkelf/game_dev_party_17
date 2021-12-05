configuration = {
    max=100,
    min=-100,
    initial_pression=5,
    initial_stress=0,
    initial_exhaustion=0,
    initial_debt=0,
    initial_unhappiness=0,
    initial_wrath=0,
    number_of_ennemies=3,
    ennemies={
        {
            id="breakup",
            image="dummy.png",
            stress={from=0, to=0},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=0, to=0},
            wrath={from=10, to=20},
            pression={from=0, to=1},
            health=75,
            drops={
                "FOOD", "MEDITATION"
            },
            fleeable=true
        },
        {
            id="finance",
            image="dummy.png",
            stress={from=0, to=0},
            exhaustion={from=0, to=0},
            debt={from=10, to=20},
            unhappiness={from=0, to=0},
            wrath={from=0, to=0},
            pression={from=0, to=1},
            health=75,
            drops={
                "EXERCISE", "NAP"
            },
            fleeable=true
        },
        {
            id="mourn",
            image="dummy.png",
            stress={from=0, to=0},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=10, to=20},
            wrath={from=0, to=0},
            pression={from=0, to=1},
            health=75,
            drops={
                "MEDITATION", "EXERCISE"
            },
            fleeable=true
        },    
        {
            id="neighbour",
            image="dummy.png",
            stress={from=0, to=0},
            exhaustion={from=10, to=20},
            debt={from=0, to=0},
            unhappiness={from=0, to=0},
            wrath={from=0, to=0},
            pression={from=0, to=1},
            health=75,
            drops={
                "MUSIC", "LAUGH"
            },
            fleeable=true
        },
        {
            id="work",
            image="dummy.png",
            stress={from=10, to=20},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=0, to=0},
            wrath={from=0, to=0},
            pression={from=0, to=1},
            health=75,
            drops={
                "SALARY", "NAP"
            },
            fleeable=true
        },
    },
    flee_items={
        "VIDEO_GAME", "DRINKING", "SEXY_TIME", "DRUGS", "MEET_FRIENDS", "CHILLING",
    },
    items={
        {
            id="SALARY",
            stress={from=0, to=0},
            exhaustion={from=0, to=0},
            debt={from=-50, to=-50},
            unhappiness={from=0, to=0},
            wrath={from=0, to=0},
        },
        {
            id="NAP",
            stress={from=0, to=0},
            exhaustion={from=-50, to=-50},
            debt={from=0, to=0},
            unhappiness={from=0, to=0},
            wrath={from=0, to=0},
        },
        {
            id="MEDITATION",
            stress={from=-50, to=-50},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=0, to=0},
            wrath={from=0, to=0},
        },
        {
            id="LAUGH",
            stress={from=0, to=0},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=-50, to=-50},
            wrath={from=0, to=0},
        },
        {
            id="EXERCISE",
            stress={from=0, to=0},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=0, to=0},
            wrath={from=-50, to=-50},
        },
        {
            id="MUSIC",
            stress={from=-25, to=-25},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=-25, to=-25},
            wrath={from=0, to=0},
        },
        {
            id="FOOD",
            stress={from=0, to=0},
            exhaustion={from=-25, to=-25},
            debt={from=0, to=0},
            unhappiness={from=-25, to=-25},
            wrath={from=0, to=0},
        },
        {
            id="VIDEO_GAME",
            stress={from=0, to=0},
            exhaustion={from=-40, to=-40},
            debt={from=-40, to=-40},
            unhappiness={from=-40, to=-40},
            wrath={from=0, to=0},
        },
        {
            id="DRINKING",
            stress={from=-40, to=-40},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=-40, to=-40},
            wrath={from=-40, to=-40},
        },
        {
            id="SEXY_TIME",
            stress={from=-40, to=-40},
            exhaustion={from=-40, to=-40},
            debt={from=-40, to=-40},
            unhappiness={from=0, to=0},
            wrath={from=0, to=0},
        },
        {
            id="DRUGS",
            stress={from=-40, to=-40},
            exhaustion={from=-40, to=-40},
            debt={from=40, to=40},
            unhappiness={from=-40, to=-40},
            wrath={from=-40, to=-40},
        },
        {
            id="MEET_FRIENDS",
            stress={from=0, to=0},
            exhaustion={from=-40, to=-40},
            debt={from=-40, to=-40},
            unhappiness={from=0, to=0},
            wrath={from=-40, to=-40},
        },
        {
            id="CHILLING",
            stress={from=-40, to=-40},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=-40, to=-40},
            wrath={from=-40, to=-40},
        }
    },
    skills={
        {
            id="ATTACK",
            damages={from=10, to=10},
            self_damages={
                stress={from=0, to=0},
                exhaustion={from=0, to=0},
                debt={from=0, to=0},
                unhappiness={from=0, to= 0},
                wrath={from=0, to=0},
            }
        },
        {
            id="DEFEND",
            damages={from=0, to=0},
            buff="resistance",
            self_damages={
                stress={from=5, to=5},
                exhaustion={from=0, to=0},
                debt={from=0, to=0},
                unhappiness={from=0, to=0},
                wrath={from=0, to=0},
            }
        },
        {
            id="FIREBALL",
            damages={from=20, to=20},
            self_damages={
                stress={from=0, to=0},
                exhaustion={from=5, to=5},
                debt={from=0, to=0},
                unhappiness={from=0, to=0},
                wrath={from=0, to=0},
            }
        },
        {
            id="OMNISLASH",
            damages={from=35, to=70},
            self_damages={
                stress={from=25, to=25},
                exhaustion={from=0, to=0},
                debt={from=0, to=0},
                unhappiness={from=0, to=0},
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
                wrath={from=15, to=15},
            }
        },
        {
            id="BLEED",
            damages={from=8, to=8},
            self_damages={
                stress={from=0, to=-5},
                exhaustion={from=0, to=-5},
                debt={from=0, to=-5},
                unhappiness={from=0, to=-5},
                wrath={from=0, to=-5},
            }
        },
    },
    buff={
        {
            id="resistance",
            rounds=3,
            -- percentages 
            resistance=50,
            damage_boost=0,
        },
        {
            id="berserk",
            rounds=4,
            -- percentages 
            resistance=0,
            damage_boost=50,
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
        PLAYER_FLEE_PHASE=2,
        PLAYER_DEATH_FIGHT_PHASE=5,
        STARTUP_PHASE=5
    },
    corridor_phase_timeouts={
        WALK_PHASE=4,
        ITEM_SELECTION_PHASE=2,
    },
}