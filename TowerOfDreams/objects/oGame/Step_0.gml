/// @description Update

key_restart = keyboard_check_pressed(ord("R"));
key_pause = keyboard_check_pressed(vk_escape);
key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
key_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
key_select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);

if (key_restart || key_pause || key_up || key_down || key_left || key_right || key_select)
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
	key_restart = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_select))
{
	key_restart = 1;
	global.controller = 2;
}

if(key_pause)
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
				global.best3_1 = "F";
				global.best3_2 = "F";
				global.best3_3 = "F";
				global.bestOverall = "F";
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