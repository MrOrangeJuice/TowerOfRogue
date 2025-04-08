/// @description Update

key_restart = keyboard_check_pressed(ord("R"));
key_pause = keyboard_check_pressed(vk_escape);
key_dreamBoy = keyboard_check_pressed(vk_tab);
key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
key_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
key_select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
key_back = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("O")) || keyboard_check_pressed(vk_lshift);

if (key_restart || key_pause || key_up || key_down || key_left || key_right || key_select || key_back || key_dreamBoy)
{
	global.controller = 0;
}

if ((gamepad_axis_value(0,gp_axislv) < -0.4 && analogUpPrev == false) || gamepad_button_check_pressed(0,gp_padu))
{
	key_up = 1;
	global.controller = 1;
	analogUpPrev = true;
}
if ((gamepad_axis_value(4,gp_axislv) < -0.4 && analogUpPrevD == false) || gamepad_button_check_pressed(4,gp_padu))
{
	key_up = 1;
	global.controller = 2;
	analogUpPrev = true;
}

if ((gamepad_axis_value(0,gp_axislv) > 0.4 && analogDownPrev == false) || gamepad_button_check_pressed(0,gp_padd))
{
	key_down = 1;
	global.controller = 1;
	analogDownPrev = true;
}
if ((gamepad_axis_value(4,gp_axislv) > 0.4 && analogDownPrevD == false) || gamepad_button_check_pressed(4,gp_padd))
{
	key_down = 1;
	global.controller = 2;
	analogDownPrev = true;
}

if ((gamepad_axis_value(0,gp_axislh) < -0.4 && analogLeftPrev == false) || gamepad_button_check_pressed(0,gp_padl))
{
	key_left = 1;
	global.controller = 1;
	analogLeftPrev = true;
}
if ( (gamepad_axis_value(4,gp_axislh) < -0.4 && analogLeftPrevD == false) || gamepad_button_check_pressed(4,gp_padl))
{
	key_left = 1;
	global.controller = 2;
	analogLeftPrev = true;
}

if ((gamepad_axis_value(0,gp_axislh) > 0.4 && analogRightPrev == false) || gamepad_button_check_pressed(0,gp_padr))
{
	key_right = 1;
	global.controller = 1;
	analogRightPrev = true;
}
if ((gamepad_axis_value(4,gp_axislh) > 0.4 && analogRightPrevD == false) || gamepad_button_check_pressed(4,gp_padr))
{
	key_right = 1;
	global.controller = 2;
	analogRightPrev = true;
}

if (gamepad_button_check_pressed(0,gp_face1))
{
	key_select = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
	global.controller = 2;
}

if (gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(0,gp_face3))
{
	key_back = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_face2) || gamepad_button_check_pressed(4,gp_face3))
{
	key_back = 1;
	global.controller = 2;
}

if (gamepad_button_check_pressed(0,gp_start))
{
	key_pause = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_start))
{
	key_pause = 1;
	global.controller = 2;
}

if (gamepad_button_check_pressed(0,gp_select))
{
	key_dreamBoy = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_select))
{
	key_dreamBoy = 1;
	global.controller = 2;
}

if (gamepad_button_check_pressed(0,gp_select))
{
	key_restart = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_select))
{
	key_restart = 1;
	global.controller = 2;
}

if(key_pause && !global.dreamBoy)
{
	if(global.paused)
	{
		audio_play_sound(snd_PauseOut,5,false);
		global.paused = false;
		// Reset pause menu
		menuOption = 0;
	}
	else if(!global.paused && global.canPause)
	{
		audio_play_sound(snd_PauseIn,5,false);
		global.paused = true;
	}
}

if(key_dreamBoy)
{
	if(!global.dreamBoy && global.canPause)
	{
		if(!global.paused)
		{
            audio_pause_all();
			audio_play_sound(snd_DreamBoyOpen,5,false);
			audio_play_sound(snd_DreamBoyTurnOn,5,false);
			global.dreamBoy = true;
			global.paused = true;
			global.dreamBoyYTarget = 0;
		}
	}
	else if(global.dreamBoy)
	{
		if(global.dreamBoyOn)
		{
			global.dreamBoyOn = false;
			alarm[2] = room_speed * 0.5;
            audio_stop_sound(msc_LesterGB);
			audio_play_sound(snd_DreamBoyShutDown,5,false);
		}
		else
		{
			// Start animation for dream boy exiting screen
			global.dreamBoy = false;
			global.dreamBoyTurnedOn = false;
			global.blockScales = [0,0,0];
			global.targetBlockScales = [0,0,0];
			global.paused = false;
			audio_stop_sound(snd_DreamBoyTurnOn);
			audio_play_sound(snd_DreamBoyClose,5,false);
			global.dreamBoyYTarget = 192;
			global.UIBarYTarget = 0;
			global.UIBarY = 0;
			global.labelY = [0,0,0];
			global.labelYTarget = [0,0,0];
			if(instance_exists(oPlayer))
			{
				oPlayer.canJump = true;	
			}
            audio_stop_sound(msc_LesterGB);
            audio_resume_all();
		}
	}
}

if(!global.dreamBoy)
{
	if(room == rTitle)
	{
		if(key_up)
		{
			audio_play_sound(snd_MenuMove,5,false);
			menuOption--;
			if(menuOption <= -1)
			{
				if(room == rTitle && options)
				{
					menuOption = 4;
				}
				else
				{
					menuOption = 2;	
				}
			}
		}

		if(key_down)
		{
			audio_play_sound(snd_MenuMove,5,false);
			menuOption++;
			if(room == rTitle && options)
			{
				if(menuOption >= 5)
				{
					menuOption = 0;	
				}
			}
			else
			{
				if(menuOption >= 3)
				{
					menuOption = 0;	
				}
			}
		}
	
		// Volume slider
		if(menuOption == 2 && options)
		{
			if(key_left)
			{
				audio_play_sound(snd_MenuMove,5,false);
				global.volume--;
				if(global.volume <= -1)
				{
					global.volume = 6;	
				}
				ChangeVolume();
			}
		
			if(key_right)
			{
				audio_play_sound(snd_MenuMove,5,false);
				global.volume++;
				if(global.volume >= 7)
				{
					global.volume = 0;	
				}
				ChangeVolume();
			}

		}
	
		if(key_select)
		{
			audio_play_sound(snd_MenuSelect,5,false);
			switch(menuOption)
			{
				case 0:
					if(!options)
					{
						menuOption = 0;
						audio_stop_sound(msc_TitleScreen);
						if(!global.tutorialCompleted)
						{
							SlideTransition(TRANS_MODE.GOTO,rTutorial);
						}
						else
						{
							SlideTransition(TRANS_MODE.GOTO,rHub);
						}
					}
					else
					{
						window_set_fullscreen(!window_get_fullscreen());
					}
					break;
				case 1:
					if(!options)
					{
						options = true;
						menuOption = 0;
						oTitle.visible = false;
						oOptionsTitle.visible = true;
					}
					else
					{
						if(!global.res1610)
						{
							window_set_size(1280,800);
							surface_resize(application_surface,1280,800);
							camera_set_view_size(view_camera[0],256,160);
							display_set_gui_size(256,160);
							oTransition.h = 160;
							oTransition.h_half = 80;
							global.res1610 = true;
						}
						else if(global.res1610)
						{
							window_set_size(1280,720);
							surface_resize(application_surface,1280,720);
							camera_set_view_size(view_camera[0],256,144);
							display_set_gui_size(256,144);
							oTransition.h = 144;
							oTransition.h_half = 72;
							global.res1610 = false;
						}
					}
					break;
				case 2:
					if(!options)
					{
						game_end();
					}
					else
					{
						global.volume++;
						if(global.volume >= 7)
						{
							global.volume = 0;
						}
						ChangeVolume();
					}
					break;
				case 3:
					deleted = true;
					// Delete Save
					if(file_exists("savedata.ini")){
						file_delete("savedata.ini");
					}
					global.tutorialCompleted = false;
					global.floor1Completed = false;
					global.floor2Completed = false;
					global.runCompleted = false;
					global.best1_1 = "F";
					global.best1_2 = "F";
					global.best1_3 = "F";
					global.best1_4 = "F";
					global.best1_5 = "F";
					global.best1_6 = "F";
					global.best2_1 = "F";
					global.best2_2 = "F";
					global.best2_3 = "F";
					global.best2_4 = "F";
					global.best2_5 = "F";
					global.best3_1 = "F";
					global.best3_2 = "F";
					global.best3_3 = "F";
					global.best3_4 = "F";
                    global.best4_1 = "F";
                    global.best4_2 = "F";
                    global.best4_3 = "F";
					global.bestOverall = "F";
                
                    global.seen1_1 = false;
                    global.seen1_2 = false;
                    global.seen1_3 = false;
                    global.seen1_4 = false;
                    global.seen1_5 = false;
                    global.seen1_6 = false;
                    global.seen2_1 = false;
                    global.seen2_2 = false;
                    global.seen2_3 = false;
                    global.seen2_4 = false;
                    global.seen2_5 = false;
                    global.seen3_1 = false;
                    global.seen3_2 = false;
                    global.seen3_3 = false;
                    global.seen3_4 = false;
                    global.seen4_1 = false;
                    global.seen4_2 = false;
                    global.seen4_3 = false;
                
                    // Levels Seen
                    global.seen1_1 = false;
                    global.seen1_2 = false;
                    global.seen1_3 = false;
                    global.seen1_4 = false;
                    global.seen1_5 = false;
                    global.seen1_6 = false;
                    global.seen2_1 = false;
                    global.seen2_2 = false;
                    global.seen2_3 = false;
                    global.seen2_4 = false;
                    global.seen2_5 = false;
                    global.seen3_1 = false;
                    global.seen3_2 = false;
                    global.seen3_3 = false;
                    global.seen3_4 = false;
                    global.seen4_1 = false;
                    global.seen4_2 = false;
                    global.seen4_3 = false;
                    
                    // Level Times
                    global.time1_1 = 0;
                    global.time1_2 = 0;
                    global.time1_3 = 0;
                    global.time1_4 = 0;
                    global.time1_5 = 0;
                    global.time1_6 = 0;
                    global.time2_1 = 0;
                    global.time2_2 = 0;
                    global.time2_3 = 0;
                    global.time2_4 = 0;
                    global.time2_5 = 0;
                    global.time3_1 = 0;
                    global.time3_2 = 0;
                    global.time3_3 = 0;
                    global.time3_4 = 0;
                    global.time4_1 = 0;
                    global.time4_2 = 0;
                    global.time4_3 = 0;
                    
                    // Level Time Medals
                    global.timeMedalSilver1_1 = false;
                    global.timeMedalGold1_1 = false;
                    global.timeMedalSilver1_2 = false;
                    global.timeMedalGold1_2 = false;
                    global.timeMedalSilver1_3 = false;
                    global.timeMedalGold1_3 = false;
                    global.timeMedalSilver1_4 = false;
                    global.timeMedalGold1_4 = false;
                    global.timeMedalSilver1_5 = false;
                    global.timeMedalGold1_5 = false;
                    global.timeMedalSilver1_6 = false;
                    global.timeMedalGold1_6 = false;
                    global.timeMedalSilver2_1 = false;
                    global.timeMedalGold2_1 = false;
                    global.timeMedalSilver2_2 = false;
                    global.timeMedalGold2_2 = false;
                    global.timeMedalSilver2_3 = false;
                    global.timeMedalGold2_3 = false;
                    global.timeMedalSilver2_4 = false;
                    global.timeMedalGold2_4 = false;
                    global.timeMedalSilver2_5 = false;
                    global.timeMedalGold2_5 = false;
                    global.timeMedalSilver3_1 = false;
                    global.timeMedalGold3_1 = false;
                    global.timeMedalSilver3_2 = false;
                    global.timeMedalGold3_2 = false;
                    global.timeMedalSilver3_3 = false;
                    global.timeMedalGold3_3 = false;
                    global.timeMedalSilver3_4 = false;
                    global.timeMedalGold3_4 = false;
                    global.timeMedalSilver4_1 = false;
                    global.timeMedalGold4_1 = false;
                    global.timeMedalSilver4_2 = false;
                    global.timeMedalGold4_2 = false;
                    global.timeMedalSilver4_3 = false;
                    global.timeMedalGold4_3 = false;
                
					// Grave data
					// Floor 1
					global.graveX1_1 = 0;
					global.graveY1_1 = 0;
					global.graveItem1_1 = -1;

					global.graveX1_2 = 0;
					global.graveY1_2 = 0;
					global.graveItem1_2 = -1;

					global.graveX1_3 = 0;
					global.graveY1_3 = 0;
					global.graveItem1_3 = -1;

					global.graveX1_4 = 0;
					global.graveY1_4 = 0;
					global.graveItem1_4 = -1;

					global.graveX1_5 = 0;
					global.graveY1_5 = 0;
					global.graveItem1_5 = -1;

					global.graveX1_6 = 0;
					global.graveY1_6 = 0;
					global.graveItem1_6 = -1;

					// Floor 2
					global.graveX2_1 = 0;
					global.graveY2_1 = 0;
					global.graveItem2_1 = -1;

					global.graveX2_2 = 0;
					global.graveY2_2 = 0;
					global.graveItem2_2 = -1;

					global.graveX2_3 = 0;
					global.graveY2_3 = 0;
					global.graveItem2_3 = -1;

					global.graveX2_4 = 0;
					global.graveY2_4 = 0;
					global.graveItem2_4 = -1;
                
                    global.graveX2_5 = 0;
                    global.graveY2_5 = 0;
                    global.graveItem2_5 = -1;

					// Floor 3
					global.graveX3_1 = 0;
					global.graveY3_1 = 0;
					global.graveItem3_1 = -1;

					global.graveX3_2 = 0;
					global.graveY3_2 = 0;
					global.graveItem3_2 = -1;

					global.graveX3_3 = 0;
					global.graveY3_3 = 0;
					global.graveItem3_3 = -1;
                
                    global.graveX3_4 = 0;
                    global.graveY3_4 = 0;
                    global.graveItem3_4 = -1;
                
                    // Floor 4
                    global.graveX4_1 = 0;
                    global.graveY4_1 = 0;
                    global.graveItem4_1 = -1;

                    global.graveX4_2 = 0;
                    global.graveY4_2 = 0;
                    global.graveItem4_2 = -1;

                    global.graveX4_3 = 0;
                    global.graveY4_3 = 0;
                    global.graveItem4_3 = -1;
				
					global.overallCoins = 0;
					global.healthUpgrades = 0;
					global.itemUpgrades = 0;
					global.redUnlocked = false;
					global.greenUnlocked = false;
					global.zombieUnlocked = false;
					global.goldUnlocked = false;
					global.palette = 0;
					global.essence = 0;
					global.maxHealth = 6;
					global.health = 6;
					global.hardMode = false;
					global.itemsFound = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
					global.enemiesFound = [0,0,0,0,0,0,0,0,0,0,0];
					// Make new default file
					Save();
					break;
				case 4:
					options = false;
					deleted = false;
					menuOption = 0;
					oTitle.visible = true;
					oOptionsTitle.visible = false;
					break;
				
			}
		}
	}

	if(global.paused)
	{
		if(key_up)
		{
			audio_play_sound(snd_MenuMove,5,false);
			menuOption--;
			if(menuOption <= -1)
			{
				if(options)
				{
					menuOption = 3;
				}
				else
				{
					menuOption = 2;	
				}
			}
		}

		if(key_down)
		{
			audio_play_sound(snd_MenuMove,5,false);
			menuOption++;
			if(options)
			{
				if(menuOption >= 4)
				{
					menuOption = 0;	
				}
			}
			else
			{
				if(menuOption >= 3)
				{
					menuOption = 0;	
				}
			}
		}
	
		// Volume slider
		if(menuOption == 2 && options)
		{
			if(key_left)
			{
				audio_play_sound(snd_MenuMove,5,false);
				global.volume--;
				if(global.volume <= -1)
				{
					global.volume = 6;	
				}
				ChangeVolume();
			}
		
			if(key_right)
			{
				audio_play_sound(snd_MenuMove,5,false);
				global.volume++;
				if(global.volume >= 7)
				{
					global.volume = 0;	
				}
				ChangeVolume();
			}
		}
	
		if(key_select)
		{
			audio_play_sound(snd_MenuSelect,5,false);
			switch(menuOption)
			{
				case 0:
					if(!options)
					{
						audio_play_sound(snd_PauseOut,5,false);
						// Reset pause menu
						if(instance_exists(oPlayer))
						{
							oPlayer.canJump = false;	
						}
						menuOption = 0;
						global.paused = false;	
					}
					else
					{
						window_set_fullscreen(!window_get_fullscreen());
					}
					break;
				case 1:
					if(!options)
					{
						options = true;
						menuOption = 0;	
					}
					else
					{
						if(!global.res1610)
						{
							window_set_size(1280,800);
							surface_resize(application_surface,1280,800);
							camera_set_view_size(view_camera[0],256,160);
							display_set_gui_size(256,160);
							oTransition.h = 160;
							oTransition.h_half = 80;
							global.res1610 = true;
						}
						else if(global.res1610)
						{
							window_set_size(1280,720);
							surface_resize(application_surface,1280,720);
							camera_set_view_size(view_camera[0],256,144);
							display_set_gui_size(256,144);
							oTransition.h = 144;
							oTransition.h_half = 72;
							global.res1610 = false;
						}
					}
					break;
				case 2:
					if(!options)
					{
						// Reset pause menu
						if(instance_exists(oPlayer))
						{
							oPlayer.canJump = false;	
						}
						global.sword = true;
						global.canPause = false;
						global.health = global.maxHealth;
						global.armor = 0;
						// Reset run
						global.usedArray = [false,false,false,false,false,false,false,false,false,false];
						global.usedArray2 = [false,false,false,false,false,false,false,false,false,false];
						global.usedArray3 = [false,false,false,false,false,false,false,false,false,false];
						global.inARun = false;
                        global.timeTrial = false;
						global.zombieRevive = true;
						global.coins = 0;
						global.coinsThisRun = 0;
						global.localCoins = 0;
						global.localDamage = 0;
						global.item = -1;
						global.passiveItems = [];
						global.levelCount = 0;
						global.sideRoom = rTitle;
						global.shopRoom = rTitle;
						global.sideChestOpened = false;
						global.pipeCount = 0;
						global.shopPipeCount = 0;
						global.pipeSpawned = false;
						global.shopSpawned = false;
						global.pipeY = 0;
						global.shopY = 0;
						global.gobletCombo = 0;
						global.maracasCombo = 0;
						global.shopItem1 = -1;
						global.shopItem2 = -1;
						global.shopItem3 = -1;
						global.rerollTax = 0;
						global.item1Bought = false;
						global.item2Bought = false;
						global.item3Bought = false;
						global.ranks = ["D","D","D","D","D","D","D","D","D"];
						// Reset instance lists
						global.coinArray = ds_list_create();
						global.enemyArray = ds_list_create();
						global.slimeArray = ds_list_create();
						instance_destroy(oItemPopup);
						SlideTransition(TRANS_MODE.GOTO, rTitle);
						audio_stop_sound(msc_TutorialV3);
						audio_stop_sound(msc_TutorialIntro);
						global.tutorialMusic = false;
						audio_stop_sound(msc_Floor1);
						audio_stop_sound(msc_Floor1Variant);
						audio_stop_sound(msc_Floor2);
						audio_stop_sound(msc_Floor2Variant);
						audio_stop_sound(msc_Floor3);
						audio_stop_sound(msc_Floor3Variant);
						global.floor1Music = false;
						audio_stop_sound(msc_Shop);
						global.shopMusic = false;
						audio_stop_sound(msc_Chest);
						global.treasureMusic = false;
						audio_stop_sound(msc_Hub);
						global.hubMusic = false;
						audio_stop_sound(msc_HubShop);
						global.hubShopMusic = false;
                        audio_stop_sound(msc_Lester); 
                        global.hubTestMusic = false;
					}
					else
					{
						global.volume++;
						if(global.volume >= 7)
						{
							global.volume = 0;
						}
						ChangeVolume();
					}
					break;
				case 3:
					if(options)
					{
						options = false;
						menuOption = 0;
					}
					break;
			}
		}
	}
}

// Get dream boy inputs
if(global.dreamBoyOn)
{
	if(key_left)
	{
		if(global.dreamBoyState == 0)
		{
			global.currentApp--;
			if(global.currentApp < 0) global.currentApp = 2;
			audio_play_sound(snd_DreamBoyMenuMove,5,false);
		}
		else if(global.dreamBoyState == 1)
		{
			global.currentItem--;
			if(global.currentItem < 0) global.currentItem = 35;
			audio_play_sound(snd_DreamBoyMenuMove,5,false);
		}
		else if(global.dreamBoyState == 2)
		{
			global.currentFoe--;
			if(global.currentFoe < 0) global.currentFoe = 10;
			audio_play_sound(snd_DreamBoyMenuMove,5,false);
		}
	}
	if(key_right)
	{
		if(global.dreamBoyState == 0)
		{
			global.currentApp++;
			if(global.currentApp > 2) global.currentApp = 0;
			audio_play_sound(snd_DreamBoyMenuMove,5,false);
		}
		else if(global.dreamBoyState == 1)
		{
			global.currentItem++;
			if(global.currentItem > 35) global.currentItem = 0;
			audio_play_sound(snd_DreamBoyMenuMove,5,false);
		}
		else if(global.dreamBoyState == 2)
		{
			global.currentFoe++;
			if(global.currentFoe > 10) global.currentFoe = 0;
			audio_play_sound(snd_DreamBoyMenuMove,5,false);
		}
	}
	if(key_select)
	{
		if(global.dreamBoyState == 0)
		{
			global.dreamBoyState = global.currentApp + 1;
		}
		audio_play_sound(snd_DreamBoySelect,5,false);
		audio_play_sound(snd_DreamBoySelect2,5,false);
	}
	if(key_back)
	{
		if(global.dreamBoyState != 0)
		{
			audio_play_sound(snd_DreamBoyMenuBack,5,false);
			global.dreamBoyState = 0;	
		}
	}
}

// Check for passive items
global.magnet = false;
global.magnetNum = 0;
global.heartMagnet = false;
global.heartMagnetNum = 0;
for(i = 0; i < array_length(global.passiveItems); i++)
{
	if(global.passiveItems[i] == 7)
	{
		global.magnet = true;
		global.magnetNum++;
	}
	
	if(global.passiveItems[i] == 12)
	{
		global.heartMagnet = true;
		global.heartMagnetNum++;
	}
}

// Record analog inputs for this frame
if(gamepad_axis_value(0,gp_axislv) < -0.4)
{
	analogUpPrev = true;	
}
else
{
	analogUpPrev = false;	
}

if(gamepad_axis_value(0,gp_axislv) > 0.4)
{
	analogDownPrev = true;	
}
else
{
	analogDownPrev = false;	
}

if(gamepad_axis_value(4,gp_axislv) < -0.4)
{
	analogUpPrevD = true;	
}
else
{
	analogUpPrevD = false;	
}

if(gamepad_axis_value(4,gp_axislv) > 0.4)
{
	analogDownPrevD = true;	
}
else
{
	analogDownPrevD = false;	
}

if(gamepad_axis_value(0,gp_axislh) < -0.4)
{
	analogLeftPrev = true;	
}
else
{
	analogLeftPrev = false;	
}

if(gamepad_axis_value(0,gp_axislh) > 0.4)
{
	analogRightPrev = true;	
}
else
{
	analogRightPrev = false;	
}

if(gamepad_axis_value(4,gp_axislh) < -0.4)
{
	analogLeftPrevD = true;	
}
else
{
	analogLeftPrevD = false;	
}

if(gamepad_axis_value(4,gp_axislh) > 0.4)
{
	analogRightPrevD = true;	
}
else
{
	analogRightPrevD = false;	
}