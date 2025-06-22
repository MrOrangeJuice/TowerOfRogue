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
		else
		{	
			audio_play_sound(snd_SwordGet,5,false);
			global.itemsFound = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
			global.enemiesFound = [1,1,1,1,1,1,1,1,1,1,1];
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
	}
}