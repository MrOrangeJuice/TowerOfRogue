/// @description Init

global.timeIncrement = false;
audio_play_sound(snd_LevelIntro1,5,false);
audio_play_sound(msc_BonusItem,5,true);
levelFinished = true;
time = false;
timeNum = global.time + 1000;
timeEnded = false;
perfectTime = false;
silverTime = false;

timeGoldNum = 0;
timeSilverNum = 0;

continutePrompt = false;
interestPrompt = false;

levelProgressed = false;

Save();

// Time alarm
alarm[0] = room_speed * 0.3;

// Get time data
switch(global.timeLevel)
{
	case rFloor1_1:
		timeGoldNum = global.timeMedalGold1_1Target;
		timeSilverNum = global.timeMedalSilver1_1Target;
		break;
	case rFloor1_2:
		timeGoldNum = global.timeMedalGold1_2Target;
		timeSilverNum = global.timeMedalSilver1_2Target;
		break;
	case rFloor1_3:
		timeGoldNum = global.timeMedalGold1_3Target;
		timeSilverNum = global.timeMedalSilver1_3Target;
		break;
	case rFloor1_4:
		timeGoldNum = global.timeMedalGold1_4Target;
		timeSilverNum = global.timeMedalSilver1_5Target;
		break;
	case rFloor1_5:
		timeGoldNum = global.timeMedalGold1_5Target;
		timeSilverNum = global.timeMedalSilver1_5Target;
		break;
	case rFloor1_6:
		timeGoldNum = global.timeMedalGold1_6Target;
		timeSilverNum = global.timeMedalSilver1_6Target;
		break;
	case rFloor2_1:
		timeGoldNum = global.timeMedalGold2_1Target;
		timeSilverNum = global.timeMedalSilver2_1Target;
		break;
	case rFloor2_2:
		timeGoldNum = global.timeMedalGold2_2Target;
		timeSilverNum = global.timeMedalSilver2_2Target;
		break;
	case rFloor2_3:
		timeGoldNum = global.timeMedalGold2_3Target;
		timeSilverNum = global.timeMedalSilver2_3Target;
		break;
	case rFloor2_4:
		timeGoldNum = global.timeMedalGold2_4Target;
		timeSilverNum = global.timeMedalSilver2_4Target;
		break;
	case rFloor2_5:
		timeGoldNum = global.timeMedalGold2_5Target;
		timeSilverNum = global.timeMedalSilver2_5Target;
		break;
	case rFloor3_1:
		timeGoldNum = global.timeMedalGold3_1Target;
		timeSilverNum = global.timeMedalSilver3_1Target;
		break;
	case rFloor3_2:
		timeGoldNum = global.timeMedalGold3_2Target;
		timeSilverNum = global.timeMedalSilver3_2Target;
		break;
	case rFloor3_3:
		timeGoldNum = global.timeMedalGold3_3Target;
		timeSilverNum = global.timeMedalSilver3_3Target;
		break;
	case rFloor3_4:
		timeGoldNum = global.timeMedalGold3_4Target;
		timeSilverNum = global.timeMedalSilver3_4Target;
		break;
    case rFloor4_1:
		timeGoldNum = global.timeMedalGold4_1Target;
		timeSilverNum = global.timeMedalSilver4_1Target;
        break;
    case rFloor4_2:
		timeGoldNum = global.timeMedalGold4_2Target;
		timeSilverNum = global.timeMedalSilver4_2Target;
        break;
    case rFloor4_3:
		timeGoldNum = global.timeMedalGold4_3Target;
		timeSilverNum = global.timeMedalSilver4_3Target;
        break;
}