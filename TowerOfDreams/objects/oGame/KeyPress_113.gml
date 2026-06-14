/// @description Dev cheat to get full save file

if(global.debug)
{
	if(room == rTitle)
	{
		if(!global.tutorialCompleted)
		{
			audio_play_sound(snd_SwordGet,5,false);
			global.tutorialCompleted = true;
			global.best1_1 = "F";
			global.best1_2 = "F";
			global.best1_3 = "F";
			global.best1_4 = "F";
			global.best1_5 = "F";
			global.best2_1 = "F";
			global.best2_2 = "F";
			global.best2_3 = "F";
			Save();
		}
		else if(global.seen1_1 = false)
		{	
			audio_play_sound(snd_SwordGet,5,false);
			global.itemsFound = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
			global.enemiesFound = [1,1,1,1,1,1,1,1,1,1,1,1,1,1];
            global.seen1_1 = true;
            global.seen1_2 = true;
            global.seen1_3 = true;
            global.seen1_4 = true;
            global.seen1_5 = true;
            global.seen1_6 = true;
            global.seen2_1 = true;
            global.seen2_2 = true;
            global.seen2_3 = true;
            global.seen2_4 = true;
            global.seen2_5 = true;
            global.seen3_1 = true;
            global.seen3_2 = true;
            global.seen3_3 = true;
            global.seen3_4 = true;
            global.seen4_1 = true;
            global.seen4_2 = true;
            global.seen4_3 = true;
			Save();
		}
		else
		{
			audio_play_sound(snd_SwordGet,5,false);
			global.itemsFound = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
			global.enemiesFound = [1,1,1,1,1,1,1,1,1,1,1,1,1,1];
            global.seen1_1 = true;
            global.seen1_2 = true;
            global.seen1_3 = true;
            global.seen1_4 = true;
            global.seen1_5 = true;
            global.seen1_6 = true;
            global.seen2_1 = true;
            global.seen2_2 = true;
            global.seen2_3 = true;
            global.seen2_4 = true;
            global.seen2_5 = true;
            global.seen3_1 = true;
            global.seen3_2 = true;
            global.seen3_3 = true;
            global.seen3_4 = true;
            global.seen4_1 = true;
            global.seen4_2 = true;
            global.seen4_3 = true;
			
			// Level Time Medals
			global.timeMedalSilver1_1 = true;
			global.timeMedalGold1_1 = true;
			global.timeMedalSilver1_2 = true;
			global.timeMedalGold1_2 = true;
			global.timeMedalSilver1_3 = true;
			global.timeMedalGold1_3 = true;
			global.timeMedalSilver1_4 = true;
			global.timeMedalGold1_4 = true;
			global.timeMedalSilver1_5 = true;
			global.timeMedalGold1_5 = true;
			global.timeMedalSilver1_6 = true;
			global.timeMedalGold1_6 = true;
			global.timeMedalSilver2_1 = true;
			global.timeMedalGold2_1 = true;
			global.timeMedalSilver2_2 = true;
			global.timeMedalGold2_2 = true;
			global.timeMedalSilver2_3 = true;
			global.timeMedalGold2_3 = true;
			global.timeMedalSilver2_4 = true;
			global.timeMedalGold2_4 = true;
			global.timeMedalSilver2_5 = true;
			global.timeMedalGold2_5 = true;
			global.timeMedalSilver3_1 = true;
			global.timeMedalGold3_1 = true;
			global.timeMedalSilver3_2 = true;
			global.timeMedalGold3_2 = true;
			global.timeMedalSilver3_3 = true;
			global.timeMedalGold3_3 = true;
			global.timeMedalSilver3_4 = true;
			global.timeMedalGold3_4 = true;
			global.timeMedalSilver4_1 = true;
			global.timeMedalGold4_1 = true;
			global.timeMedalSilver4_2 = true;
			global.timeMedalGold4_2 = true;
			global.timeMedalSilver4_3 = true;
			global.timeMedalGold4_3 = true;
		}
	}
}