/// @description Init

enum state {
    Idle,
    Grow,
    Portal,
    AllTheWay,
    Shrink,
    Sleep
}

unlocked = false;

switch(levelName)
{
    case "CANNON CONUNDRUM":
        if(global.seen1_1)
        {
            unlocked = true;
        }
        break;
    case "GRAVITY GAUNTLET":
        if(global.seen1_2)
        {
            unlocked = true;
        }
        break;
    case "SWAP HOP":
        if(global.seen1_3)
        {
            unlocked = true;
        }
        break;
    case "BUMPER BUSTER":
        if(global.seen1_4)
        {
            unlocked = true;
        }
        break;
    case "ON A ROLL":
        if(global.seen1_5)
        {
            unlocked = true;
        }
        break;
    case "SHROOMS OF DOOM":
        if(global.seen1_6)
        {
            unlocked = true;
        }
        break;
    
    case "CONSTRUCTION CALAMITY":
        if(global.seen2_1)
        {
            unlocked = true;
        }
        break;
    case "VERTICAL VELOCITY":
        if(global.seen2_2)
        {
            unlocked = true;
        }
        break;
    case "BLOCK PARTY":
        if(global.seen2_3)
        {
            unlocked = true;
        }
        break;
    case "MISSILE MAYHEM":
        if(global.seen2_4)
        {
            unlocked = true;
        }
        break;
    case "SAWBLADE LEVEL":
        if(global.seen2_5)
        {
            unlocked = true;
        }
        break;
    
    case "CLOUDY CATASTOPHE":
        if(global.seen3_1)
        {
            unlocked = true;
        }
        break;
    case "DASH FRUIT SMOOTHIE":
        if(global.seen3_2)
        {
            unlocked = true;
        }
        break;
    case "LARRYS LIFTOFF":
        if(global.seen3_3)
        {
            unlocked = true;
        }
        break;
    case "WATCH YOUR STEP":
        if(global.seen3_4)
        {
            unlocked = true;
        }
        break;
    
    case "LIGHTS AND FRIGHTS":
        if(global.seen4_1)
        {
            unlocked = true;
        }
        break;
    case "HORIZONTAL HUSTLE":
        if(global.seen4_2)
        {
            unlocked = true;
        }
        break;
    case "CROSSOVER EPISODE":
        if(global.seen4_3)
        {
            unlocked = true;
        }
        break;
        
}

if(unlocked)
{
    reminoState = state.Idle;
}
else 
{
    reminoState = state.Sleep;
}
range = 16;

labelY = 0;
labelYTarget = 0;

sound1Played = false;
sound2Played = false;
sound3Played = false;
sound4Played = false;
sound5Played = false;

soundInfoPlayed = false;
soundInfoOutPlayed = false;