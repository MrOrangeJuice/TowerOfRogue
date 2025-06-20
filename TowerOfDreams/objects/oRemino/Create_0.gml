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
levelName = "";
silverMedal = false;
goldMedal = false;

switch(levelDisplayName)
{
    case "CANNON CONUNDRUM":
        if(global.seen1_1)
        {
            unlocked = true;
            levelName = "rFloor1_1";
			if(global.timeMedalSilver1_1) silverMedal = true;
			if(global.timeMedalGold1_1) goldMedal = true;
        }
        break;
    case "GRAVITY GAUNTLET":
        if(global.seen1_2)
        {
            unlocked = true;
            levelName = "rFloor1_2";
			if(global.timeMedalSilver1_2) silverMedal = true;
			if(global.timeMedalGold1_2) goldMedal = true;
        }
        break;
    case "SWAP HOP":
        if(global.seen1_3)
        {
            unlocked = true;
            levelName = "rFloor1_3";
			if(global.timeMedalSilver1_3) silverMedal = true;
			if(global.timeMedalGold1_3) goldMedal = true;
        }
        break;
    case "BUMPER BUSTER":
        if(global.seen1_4)
        {
            unlocked = true;
            levelName = "rFloor1_4";
			if(global.timeMedalSilver1_4) silverMedal = true;
			if(global.timeMedalGold1_4) goldMedal = true;
        }
        break;
    case "ON A ROLL":
        if(global.seen1_5)
        {
            unlocked = true;
            levelName = "rFloor1_5";
			if(global.timeMedalSilver1_5) silverMedal = true;
			if(global.timeMedalGold1_5) goldMedal = true;
        }
        break;
    case "SHROOMS OF DOOM":
        if(global.seen1_6)
        {
            unlocked = true;
            levelName = "rFloor1_6";
			if(global.timeMedalSilver1_6) silverMedal = true;
			if(global.timeMedalGold1_6) goldMedal = true;
        }
        break;
    
    case "CONSTRUCTION CALAMITY":
        if(global.seen2_1)
        {
            unlocked = true;
            levelName = "rFloor2_1";
			if(global.timeMedalSilver2_1) silverMedal = true;
			if(global.timeMedalGold2_1) goldMedal = true;
        }
        break;
    case "VERTICAL VELOCITY":
        if(global.seen2_2)
        {
            unlocked = true;
            levelName = "rFloor2_2";
			if(global.timeMedalSilver2_2) silverMedal = true;
			if(global.timeMedalGold2_2) goldMedal = true;
        }
        break;
    case "BLOCK PARTY":
        if(global.seen2_3)
        {
            unlocked = true;
            levelName = "rFloor2_3";
			if(global.timeMedalSilver2_3) silverMedal = true;
			if(global.timeMedalGold2_3) goldMedal = true;
        }
        break;
    case "MISSILE MAYHEM":
        if(global.seen2_4)
        {
            unlocked = true;
            levelName = "rFloor2_4";
			if(global.timeMedalSilver2_4) silverMedal = true;
			if(global.timeMedalGold2_4) goldMedal = true;
        }
        break;
    case "SAWBLADE LEVEL":
        if(global.seen2_5)
        {
            unlocked = true;
            levelName = "rFloor2_5";
			if(global.timeMedalSilver2_5) silverMedal = true;
			if(global.timeMedalGold2_5) goldMedal = true;
        }
        break;
    
    case "CLOUDY CATASTOPHE":
        if(global.seen3_1)
        {
            unlocked = true;
            levelName = "rFloor3_1";
			if(global.timeMedalSilver3_1) silverMedal = true;
			if(global.timeMedalGold3_1) goldMedal = true;
        }
        break;
    case "DASH FRUIT SMOOTHIE":
        if(global.seen3_2)
        {
            unlocked = true;
            levelName = "rFloor3_2";
			if(global.timeMedalSilver3_2) silverMedal = true;
			if(global.timeMedalGold3_2) goldMedal = true;
        }
        break;
    case "LARRYS LIFTOFF":
        if(global.seen3_3)
        {
            unlocked = true;
            levelName = "rFloor3_3";
			if(global.timeMedalSilver3_3) silverMedal = true;
			if(global.timeMedalGold3_3) goldMedal = true;
        }
        break;
    case "WATCH YOUR STEP":
        if(global.seen3_4)
        {
            unlocked = true;
            levelName = "rFloor3_4";
			if(global.timeMedalSilver3_4) silverMedal = true;
			if(global.timeMedalGold3_4) goldMedal = true;
        }
        break;
    
    case "LIGHTS AND FRIGHTS":
        if(global.seen4_1)
        {
            unlocked = true;
            levelName = "rFloor4_1";
			if(global.timeMedalSilver4_1) silverMedal = true;
			if(global.timeMedalGold4_1) goldMedal = true;
        }
        break;
    case "HORIZONTAL HUSTLE":
        if(global.seen4_2)
        {
            unlocked = true;
            levelName = "rFloor4_2";
			if(global.timeMedalSilver4_2) silverMedal = true;
			if(global.timeMedalGold4_2) goldMedal = true;
        }
        break;
    case "CROSSOVER EPISODE":
        if(global.seen4_3)
        {
            unlocked = true;
            levelName = "rFloor4_3";
			if(global.timeMedalSilver4_3) silverMedal = true;
			if(global.timeMedalGold4_3) goldMedal = true;
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

portalSpawned = false;
portal = 0;