/// @description Take away sword for tutorial

if(room == rMemoryZoo)
{
    global.canPause = true;
}

// Reset debug counter
global.debugCounter = 0;

// Spawn grave if needed
SpawnGrave();

if(global.res1610)
{
	window_set_size(1280,800);
	surface_resize(application_surface,1280,800);
	camera_set_view_size(view_camera[0],256,160);
	display_set_gui_size(256,160);
	oTransition.h = 160;
	oTransition.h_half = 80;
}
else if(!global.res1610)
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
