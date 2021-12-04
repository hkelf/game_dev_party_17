# Game state
```
pression
stress
exhaustion
debt
unhappiness
wrath
scene 
    type // FIGHT - WALKING
    phase // in case of type fight PLAYER_PHASE, FLEE_PHASE, ATTACK_PHASE, ENNEMY_ATTACK_PHASE, PLAYER_DEATH_PHASE, ENNEMY_DEATH_PHASE
selected // last button selected during last frame
    type // SKILL FLEE
    id // If skill selected
current_ennemy
ennemy_pool
```

# Events
* game_initialized
* player_created
* fight_started 
```
body={ new_state= game_state.player_state.state } }
```
* ennemy_created `game_state.current_ennemy`
* fight_phase 
```
-- values: PLAYER_PHASE, FLEE_PHASE, ATTACK_PHASE, ENNEMY_ATTACK_PHASE, PLAYER_DEATH_PHASE, ENNEMY_DEATH_PHASE
{phase=game_state.scene.phase}
```