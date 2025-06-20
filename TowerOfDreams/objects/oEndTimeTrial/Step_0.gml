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
			if(global.time < global.time1_1 || global.time1_1 == 0)
				global.time1_1 = global.time;
			break;
		case rFloor1_2:
			if(global.time < global.timeMedalSilver1_2Target)
				global.timeMedalSilver1_2 = true;
			if(global.time < global.timeMedalGold1_2Target)
				global.timeMedalGold1_2 = true;
			if(global.time < global.time1_2 || global.time1_2 == 0)
				global.time1_2 = global.time;
			break;
		case rFloor1_3:
			if(global.time < global.timeMedalSilver1_3Target)
				global.timeMedalSilver1_3 = true;
			if(global.time < global.timeMedalGold1_3Target)
				global.timeMedalGold1_3 = true;
			if(global.time < global.time1_3 || global.time1_3 == 0)
				global.time1_3 = global.time;
			break;
		case rFloor1_4:
			if(global.time < global.timeMedalSilver1_4Target)
				global.timeMedalSilver1_4 = true;
			if(global.time < global.timeMedalGold1_4Target)
				global.timeMedalGold1_4 = true;
			if(global.time < global.time1_4 || global.time1_4 == 0)
				global.time1_4 = global.time;
			break;
		case rFloor1_5:
			if(global.time < global.timeMedalSilver1_5Target)
				global.timeMedalSilver1_5 = true;
			if(global.time < global.timeMedalGold1_5Target)
				global.timeMedalGold1_5 = true;
			if(global.time < global.time1_5 || global.time1_5 == 0)
				global.time1_5 = global.time;
			break;
		case rFloor1_6:
			if(global.time < global.timeMedalSilver1_6Target)
				global.timeMedalSilver1_6 = true;
			if(global.time < global.timeMedalGold1_6Target)
				global.timeMedalGold1_6 = true;
			if(global.time < global.time1_6 || global.time1_6 == 0)
				global.time1_6 = global.time;
			break;
		case rFloor2_1:
			if(global.time < global.timeMedalSilver2_1Target)
				global.timeMedalSilver2_1 = true;
			if(global.time < global.timeMedalGold2_1Target)
				global.timeMedalGold2_1 = true;
			if(global.time < global.time2_1 || global.time2_1 == 0)
				global.time2_1 = global.time;
			break;
		case rFloor2_2:
			if(global.time < global.timeMedalSilver2_2Target)
				global.timeMedalSilver2_2 = true;
			if(global.time < global.timeMedalGold2_2Target)
				global.timeMedalGold2_2 = true;
			if(global.time < global.time2_2 || global.time2_2 == 0)
				global.time2_2 = global.time;
			break;
		case rFloor2_3:
			if(global.time < global.timeMedalSilver2_3Target)
				global.timeMedalSilver2_3 = true;
			if(global.time < global.timeMedalGold2_3Target)
				global.timeMedalGold2_3 = true;
			if(global.time < global.time2_3 || global.time2_3 == 0)
				global.time2_3 = global.time;
			break;
		case rFloor2_4:
			if(global.time < global.timeMedalSilver2_4Target)
				global.timeMedalSilver2_4 = true;
			if(global.time < global.timeMedalGold2_4Target)
				global.timeMedalGold2_4 = true;
			if(global.time < global.time2_4 || global.time2_4 == 0)
				global.time2_4 = global.time;
			break;
		case rFloor2_5:
			if(global.time < global.timeMedalSilver2_5Target)
				global.timeMedalSilver2_5 = true;
			if(global.time < global.timeMedalGold2_5Target)
				global.timeMedalGold2_5 = true;
			if(global.time < global.time2_5 || global.time2_5 == 0)
				global.time2_5 = global.time;
			break;
		case rFloor3_1:
			if(global.time < global.timeMedalSilver3_1Target)
				global.timeMedalSilver3_1 = true;
			if(global.time < global.timeMedalGold3_1Target)
				global.timeMedalGold3_1 = true;
			if(global.time < global.time3_1 || global.time3_1 == 0)
				global.time3_1 = global.time;
			break;
		case rFloor3_2:
			if(global.time < global.timeMedalSilver3_2Target)
				global.timeMedalSilver3_2 = true;
			if(global.time < global.timeMedalGold3_2Target)
				global.timeMedalGold3_2 = true;
			if(global.time < global.time3_2 || global.time3_2 == 0)
				global.time3_2 = global.time;
			break;
		case rFloor3_3:
			if(global.time < global.timeMedalSilver3_3Target)
				global.timeMedalSilver3_3 = true;
			if(global.time < global.timeMedalGold3_3Target)
				global.timeMedalGold3_3 = true;
			if(global.time < global.time3_3 || global.time3_3 == 0)
				global.time3_3 = global.time;
			break;
		case rFloor3_4:
			if(global.time < global.timeMedalSilver3_4Target)
				global.timeMedalSilver3_4 = true;
			if(global.time < global.timeMedalGold3_4Target)
				global.timeMedalGold3_4 = true;
			if(global.time < global.time3_4 || global.time3_4 == 0)
				global.time3_4 = global.time;
			break;
		case rFloor4_1:
			if(global.time < global.timeMedalSilver4_1Target)
				global.timeMedalSilver4_1 = true;
			if(global.time < global.timeMedalGold4_1Target)
				global.timeMedalGold4_1 = true;
			if(global.time < global.time4_1 || global.time4_1 == 0)
				global.time4_1 = global.time;
			break;
		case rFloor4_2:
			if(global.time < global.timeMedalSilver4_2Target)
				global.timeMedalSilver4_2 = true;
			if(global.time < global.timeMedalGold4_2Target)
				global.timeMedalGold4_2 = true;
			if(global.time < global.time4_2 || global.time4_2 == 0)
				global.time4_2 = global.time;
			break;
		case rFloor4_3:
			if(global.time < global.timeMedalSilver4_3Target)
				global.timeMedalSilver4_3 = true;
			if(global.time < global.timeMedalGold4_3Target)
				global.timeMedalGold4_3 = true;
			if(global.time < global.time4_3 || global.time4_3 == 0)
				global.time4_3 = global.time;
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
	global.health = global.maxHealth;
	global.time = 0;
}