/// @description Check for continue button

key_select_pressed = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space);
key_select = keyboard_check(ord("Z")) || keyboard_check(ord("P")) || keyboard_check(vk_space);

if(key_select_pressed || key_select)
{
	global.controller = 0;	
}

if(gamepad_button_check_pressed(0,gp_face1))
{
	key_select_pressed = true;
	global.controller = 1;
}
if(gamepad_button_check_pressed(4,gp_face1))
{
	key_select_pressed = true;
	global.controller = 2;
}

if(gamepad_button_check(0,gp_face1))
{
	key_select = true;
	global.controller = 1;
}
if(gamepad_button_check(4,gp_face1))
{
	key_select = true;
	global.controller = 2;
}

if(key_select_pressed && !levelProgressed)
{
	// Save medals
	switch(global.timeLevel)
	{
		case rFloor1_1:
			if(global.time < global.timeMedalSilver1_1Target)
				global.timeMedalSilver1_1 = true;
			if(global.time < global.timeMedalGold1_1Target)
				global.timeMedalGold1_1 = true;
			global.time1_1 = global.time;
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
	
	Save();
	
	audio_play_sound(snd_MenuSelect,5,false);
	audio_stop_sound(snd_GemLoop);
	audio_stop_sound(msc_BonusItem);
	SlideTransition(TRANS_MODE.GOTO,rMemoryZoo);
	// Prevent mashing to increment level more than once
	levelProgressed = true;
	global.timeTrial = false;
	global.timeIncrement = true;
}