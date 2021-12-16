configuration = {
    max=100,
    min=-100,
    initial_pression=5,
    initial_stress=0,
    initial_exhaustion=0,
    initial_debt=0,
    initial_unhappiness=0,
    initial_wrath=0,
    number_of_ennemies=5,
    ennemies={
        {
            id="breakup",
            image="dummy.png",
            stress={from=0, to=0},
            exhaustion={from=0, to=0},
            debt={from=2, to=4},
            unhappiness={from=0, to=0},
            wrath={from=7, to=9},
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
            stress={from=2, to=4},
            exhaustion={from=0, to=0},
            debt={from=7, to=9},
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
            unhappiness={from=7, to=9},
            wrath={from=2, to=4},
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
            exhaustion={from=7, to=9},
            debt={from=0, to=0},
            unhappiness={from=2, to=4},
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
            stress={from=7, to=9},
            exhaustion={from=2, to=4},
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
            stress={from=-12, to=-18},
            exhaustion={from=0, to=0},
            debt={from=-12, to=-18},
            unhappiness={from=-12, to=-18},
            wrath={from=0, to=0},
        },
        {
            id="NAP",
            stress={from=-12, to=-18},
            exhaustion={from=-12, to=-18},
            debt={from=0, to=0},
            unhappiness={from=0, to=0},
            wrath={from=-12, to=-18},
        },
        {
            id="MEDITATION",
            stress={from=-12, to=-18},
            exhaustion={from=-12, to=-18},
            debt={from=0, to=0},
            unhappiness={from=-12, to=-18},
            wrath={from=0, to=0},
        },
        {
            id="LAUGH",
            stress={from=-12, to=-18},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=-12, to=-18},
            wrath={from=-12, to=-18},
        },
        {
            id="EXERCISE",
            stress={from=-12, to=-18},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=-12, to=-18},
            wrath={from=-12, to=-18},
        },
        {
            id="MUSIC",
            stress={from=-12, to=-18},
            exhaustion={from=-12, to=-18},
            debt={from=0, to=0},
            unhappiness={from=-12, to=-18},
            wrath={from=0, to=0},
        },
        {
            id="FOOD",
            stress={from=-12, to=-18},
            exhaustion={from=-12, to=-18},
            debt={from=0, to=0},
            unhappiness={from=-12, to=-18},
            wrath={from=0, to=0},
        },
        {
            id="VIDEO_GAME",
            stress={from=0, to=0},
            exhaustion={from=-12, to=-18},
            debt={from=-12, to=-18},
            unhappiness={from=-12, to=-18},
            wrath={from=0, to=0},
        },
        {
            id="DRINKING",
            stress={from=-12, to=-18},
            exhaustion={from=0, to=0},
            debt={from=0, to=0},
            unhappiness={from=-12, to=-18},
            wrath={from=-12, to=-18},
        },
        {
            id="SEXY_TIME",
            stress={from=-12, to=-18},
            exhaustion={from=0, to=0},
            debt={from=-12, to=-18},
            unhappiness={from=-12, to=-18},
            wrath={from=0, to=0},
        },
        {
            id="DRUGS",
            stress={from=-6, to=-12},
            exhaustion={from=-6, to=-12},
            debt={from=12, to=18},
            unhappiness={from=-12, to=-18},
            wrath={from=-12, to=-18},
        },
        {
            id="MEET_FRIENDS",
            stress={from=0, to=0},
            exhaustion={from=-12, to=-18},
            debt={from=-12, to=-18},
            unhappiness={from=0, to=0},
            wrath={from=-12, to=-18},
        },
        {
            id="CHILLING",
            stress={from=-12, to=-18},
            exhaustion={from=-12, to=-18},
            debt={from=-12, to=-18},
            unhappiness={from=0, to=0},
            wrath={from=0, to=0},
        }
    },
    skills={
        {
            id="ATTACK",
            damages={from=8, to=12},
            self_damages={
                stress={from=1, to=3},
                exhaustion={from=1, to=3},
                debt={from=1, to=3},
                unhappiness={from=1, to=3},
                wrath={from=1, to=3},
            },
            label="ATTAQUE",
            description="Une attaque simple,\npeu coûteuse mais peu\npuissante."
        },
        {
            id="DEFEND",
            damages={from=0, to=0},
            buff="resistance",
            self_damages={
                stress={from=1, to=2},
                exhaustion={from=1, to=2},
                debt={from=1, to=2},
                unhappiness={from=1, to=2},
                wrath={from=1, to=2},
            },
            label="DEFENSE",
            description="Parfois, la défense reste\nla solution la plus\nadaptée."
        },
        {
            id="FIREBALL",
            damages={from=12, to=16},
            self_damages={
                stress={from=2, to=6},
                exhaustion={from=1, to=3},
                debt={from=1, to=3},
                unhappiness={from=2, to=6},
                wrath={from=1, to=3},
            },
            label="DEFERLANTE",
            description="Une vague d'énergie\nqui transperce votre\nennemi."
        },
        {
            id="OMNISLASH",
            damages={from=14, to=18},
            self_damages={
                stress={from=2, to=6},
                exhaustion={from=2, to=6},
                debt={from=1, to=3},
                unhappiness={from=1, to=3},
                wrath={from=2, to=6},
            },
            label="OMNISLASH",
            description="Un coup surpuissant,\nmais qui demande\ndes sacrifices."
        },
        {
            id="BERSERK",
            damages={from=0, to=0},
            buff="berserk",
            self_damages={
                stress={from=1, to=2},
                exhaustion={from=1, to=2},
                debt={from=1, to=2},
                unhappiness={from=1, to=2},
                wrath={from=2, to=6},
            },
            label="BERSERK",
            description="Canalisez votre rage\nintérieure pour mieux\nla libérer."
        },
        {
            id="BLEED",
            damages={from=0, to=0},
            self_damages={
                stress={from=-2, to=-8},
                exhaustion={from=-2, to=-8},
                debt={from=-2, to=-8},
                unhappiness={from=-2, to=-8},
                wrath={from=-2, to=-8},
            },
            label="VAMPIRISME",
            description="Une méthode sang\npour sang naturelle\nde se ressourcer."
        },
    },
    buff={
        {
            id="resistance",
            rounds=4,
            -- percentages 
            resistance=45,
            damage_boost=0,
        },
        {
            id="berserk",
            rounds=2,
            -- percentages 
            resistance=0,
            damage_boost=20,
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
        stress={from=0, to=3},
        exhaustion={from=0, to=3},
        debt={from=0, to=3},
        unhappiness={from=0, to=3},
        wrath={from=0, to=3},
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