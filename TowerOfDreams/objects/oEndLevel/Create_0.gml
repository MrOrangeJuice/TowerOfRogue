/// @description Init

audio_play_sound(snd_LevelIntro1,5,false);
levelFinished = true;
gems = false;
gemNum = 0;
totalGemNum = oLevelInfo.totalGems;
damageNum = global.localDamage;
damageDisplay = false;
gemsEnded = false;
perfectGems = false;
damage = false;
perfectDamage = false;
rank = false;
rankLetter = false;
perfectRank = false;
continutePrompt = false;

levelProgressed = false;

// Determine rank
rankScore = 20;
yourRank = "B";

// Gems
rankScore -= floor((oLevelInfo.totalGems - global.localCoins) / 5);

// Make sure rank score doesn't lose more than 5 from gems
if(rankScore < 10) rankScore = 10;

// Damage
rankScore -= global.localDamage;

// Figure out rank
if(rankScore == 20)
{
	yourRank = "S";	
}
else if(rankScore >= 15)
{
	yourRank = "A";	
}
else if(rankScore >= 10)
{
	yourRank = "B";	
}
else if(rankScore >= 5)
{
	yourRank = "C";	
}
else
{
	yourRank = "D";	
}

// Add rank to array
global.ranks[global.levelCount] = yourRank;

// Save rank
switch(room)
{
	case rFloor1_1:
		global.best1_1 = yourRank;
		break;
	case rFloor1_2:
		global.best1_2 = yourRank;
		break;
	case rFloor1_3:
		global.best1_3 = yourRank;
		break;
	case rFloor1_4:
		global.best1_4 = yourRank;
		break;
	case rFloor1_5:
		global.best1_5 = yourRank;
		break;
	case rFloor1_6:
		global.best1_6 = yourRank;
		break;
	case rFloor2_1:
		global.best2_1 = yourRank;
		break;
	case rFloor2_2:
		global.best2_2 = yourRank;
		break;
	case rFloor2_3:
		global.best2_3 = yourRank;
		break;
	case rFloor2_4:
		global.best2_4 = yourRank;
		break;
}

Save();


// Gem alarm
alarm[0] = room_speed * 0.3;