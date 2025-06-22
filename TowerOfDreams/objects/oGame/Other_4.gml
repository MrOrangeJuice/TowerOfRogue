/// @description Take away sword for tutorial

if(room == rMemoryZoo)
{
	global.paused = false;
	menuOption = 0;
    global.canPause = true;
	global.timeIncrement = false;
	global.timeTrial = false;
	global.time = 0;
	
	// Determine time medals
	if(global.timeMedalGold1_1)
		global.timeMedals++;
	if(global.timeMedalSilver1_1)
		global.timeMedals++;
	if(global.timeMedalGold1_2) 
		global.timeMedals++;
	if(global.timeMedalSilver1_2)
		global.timeMedals++;
	if(global.timeMedalGold1_3)
		global.timeMedals++;
	if(global.timeMedalSilver1_3)
		global.timeMedals++;
	if(global.timeMedalGold1_4)
		global.timeMedals++;
	if(global.timeMedalSilver1_4)
		global.timeMedals++;
	if(global.timeMedalGold1_5)  
		global.timeMedals++;
	if(global.timeMedalSilver1_5) 
		global.timeMedals++;
	if(global.timeMedalGold1_6)  
		global.timeMedals++;
	if(global.timeMedalSilver1_6) 
		global.timeMedals++;
	if(global.timeMedalGold2_1)
		global.timeMedals++;
	if(global.timeMedalSilver2_1) 
		global.timeMedals++;
	if(global.timeMedalGold2_2)
		global.timeMedals++;
	if(global.timeMedalSilver2_2) 
		global.timeMedals++;
	if(global.timeMedalGold2_3)  
		global.timeMedals++;
	if(global.timeMedalSilver2_3) 
		global.timeMedals++;
	if(global.timeMedalGold2_4) 
		global.timeMedals++;
	if(global.timeMedalSilver2_4) 
		global.timeMedals++;
	if(global.timeMedalGold2_5) 
		global.timeMedals++;
	if(global.timeMedalSilver2_5)
		global.timeMedals++;
	if(global.timeMedalGold3_1)  
		global.timeMedals++;
	if(global.timeMedalSilver3_1) 
		global.timeMedals++;
	if(global.timeMedalGold3_2)  
		global.timeMedals++;
	if(global.timeMedalSilver3_2)
		global.timeMedals++;
	if(global.timeMedalGold3_3) 
		global.timeMedals++;
	if(global.timeMedalSilver3_3)
		global.timeMedals++;
	if(global.timeMedalGold3_4)  
		global.timeMedals++;
	if(global.timeMedalSilver3_4) 
		global.timeMedals++;
	if(global.timeMedalGold4_1)  
		global.timeMedals++;
	if(global.timeMedalSilver4_1) 
		global.timeMedals++;
	if(global.timeMedalGold4_2) 
		global.timeMedals++;
	if(global.timeMedalSilver4_2) 
		global.timeMedals++;
	if(global.timeMedalGold4_3)  
		global.timeMedals++;
	if(global.timeMedalSilver4_3)
		global.timeMedals++;
}
else
{
	global.timeMedals = 0;	
}

// Reset debug counter
global.debugCounter = 0;

// Spawn grave if needed
SpawnGrave();

if(global.displayMode == 2)
{
	window_set_size(1280,960);
	surface_resize(application_surface,1280,960);
	camera_set_view_size(view_camera[0],256,192);
	display_set_gui_size(256,192);
	oTransition.h = 192;
	oTransition.h_half = 96;
}
else if(global.displayMode == 1)
{
	window_set_size(1280,800);
	surface_resize(application_surface,1280,800);
	camera_set_view_size(view_camera[0],256,160);
	display_set_gui_size(256,160);
	oTransition.h = 160;
	oTransition.h_half = 80;
}
else if(global.displayMode == 0)
{
	window_set_size(1280,720);
	surface_resize(application_surface,1280,720);
	camera_set_view_size(view_camera[0],256,144);
	display_set_gui_size(256,144);
	oTransition.h = 144;
	oTransition.h_half = 72;
}

if(room == rTutorial)
{
	global.sword = false;
}

if(room == rFloor1_3 || room == rFloor2_3)
{
	global.bumperSwitch = true;	
}

if(room == rTitle)
{
	if(global.music) audio_play_sound(msc_TitleScreen,5,true);	
	global.paused = false;
	global.timeTrial = false;
	menuOption = 0;
}

if(global.timeTrial)
{
	global.paused = false;
	menuOption = 0;
}

if(room == rTutorial2 || room == rTutorial)
{
	global.infiniteHealth = true;	
}
else
{
	global.infiniteHealth = false;	
}

// Stop just in case
audio_stop_sound(snd_BoomerangReturn);
audio_stop_sound(snd_GemLoop);
global.armed = false;
global.arrowSprite = sArrowGremlinIdle;
global.doorSprite = sDoorGremlinIdle;

// Check for new enemies
if(instance_exists(oEnemy))
{
	for(i = 0; i < array_length(global.enemiesFound); i++)
	{
		if(!global.enemiesFound[oEnemy.dbId]) 
		{
			global.enemiesFound[oEnemy.dbId] = true;
			Save();
		}
	}
}
if(instance_exists(oTankEnemy))
{
    if(!global.enemiesFound[oTankEnemy.dbId]) 
    {
        global.enemiesFound[oTankEnemy.dbId] = true;
        Save();
    }
}

// Check for new levels
switch(room)
{
    case rFloor1_1:
        if(!global.seen1_1) 
        {
            global.seen1_1 = true;
            Save();
        }
        break;
    case rFloor1_2:
        if(!global.seen1_2) 
        {
            global.seen1_2 = true;
            Save();
        }
        break;
    case rFloor1_3:
        if(!global.seen1_3) 
        {
            global.seen1_3 = true;
            Save();
        }
        break;
    case rFloor1_4:
        if(!global.seen1_4) 
        {
            global.seen1_4 = true;
            Save();
        }
        break;
    case rFloor1_5:
        if(!global.seen1_5) 
        {
            global.seen1_5 = true;
            Save();
        }
        break;
    case rFloor1_6:
        if(!global.seen1_6) 
        {
            global.seen1_6 = true;
            Save();
        }
        break;
    case rFloor2_1:
        if(!global.seen2_1) 
        {
            global.seen2_1 = true;
            Save();
        }
        break;
    case rFloor2_2:
        if(!global.seen2_2) 
        {
            global.seen2_2 = true;
            Save();
        }
        break;
    case rFloor2_3:
        if(!global.seen2_3) 
        {
            global.seen2_3 = true;
            Save();
        }
        break;
    case rFloor2_4:
        if(!global.seen2_4) 
        {
            global.seen2_4 = true;
            Save();
        }
        break;
    case rFloor2_5:
        if(!global.seen2_5) 
        {
            global.seen2_5 = true;
            Save();
        }
        break;
    case rFloor3_1:
        if(!global.seen3_1) 
        {
            global.seen3_1 = true;
            Save();
        }
        break;
    case rFloor3_2:
        if(!global.seen3_2) 
        {
            global.seen3_2 = true;
            Save();
        }
        break;
    case rFloor3_3:
        if(!global.seen3_3) 
        {
            global.seen3_3 = true;
            Save();
        }
        break;
    case rFloor3_4:
        if(!global.seen3_4) 
        {
            global.seen3_4 = true;
            Save();
        }
        break;
    case rFloor4_1:
        if(!global.seen4_1) 
        {
            global.seen4_1 = true;
            Save();
        }
        break;
    case rFloor4_2:
        if(!global.seen4_2) 
        {
            global.seen4_2 = true;
            Save();
        }
        break;
    case rFloor4_3:
        if(!global.seen4_3) 
        {
            global.seen4_3 = true;
            Save();
        }
        break;
}
