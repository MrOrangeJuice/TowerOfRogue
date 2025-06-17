/// @description Update

/// @description Check for continue button

key_select_pressed = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space);
key_select = keyboard_check(ord("Z")) || keyboard_check(ord("P")) || keyboard_check(vk_space);

if(key_select_pressed || key_select)
{
	global.controller = 0;	
}

if(gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_select_pressed = true;
	global.controller = 1;
}

if(gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	key_select = true;
	global.controller = 1;
}

if(global.essence != 3 || (global.essence == 3 && !global.zombieRevive))
{
	if(key_select_pressed)
	{
	
		if(!graveDataSaved)
		{
			SaveGraveData(x,y);
			global.totalDeaths++;
			graveDataSaved = true;
		}
	
		if(!finishedShifting) global.overallCoins += global.coinsThisRun;
		finishedShifting = true;
	
		audio_play_sound(snd_MenuSelect,5,false);
		audio_stop_sound(snd_GemLoop);
		// Reset run
		global.usedArray = [false,false,false,false,false,false,false,false,false,false];
		global.usedArray2 = [false,false,false,false,false,false,false,false,false,false];
		global.usedArray3 = [false,false,false,false,false,false,false,false,false,false];
		global.inARun = false;
		global.health = global.maxHealth;
		global.armor = 0;
		global.zombieRevive = true;
		global.coins = 0;
		global.localCoins = 0;
		global.localDamage = 0;
		global.item = -1;
		global.passiveItems = [];
		global.levelCount = 0;
		global.sideRoom = rTitle;
		global.shopRoom = rTitle;
		global.sideChestOpened = false;
		global.pipeSpawned = false;
		global.shopSpawned = false;
		global.pipeY = 0;
		global.shopY = 0;
		global.gobletCombo = 0;
		global.maracasCombo = 0;
		global.floor1Music = false;
		global.tutorialMusic = false;
		global.shopItem1 = -1;
		global.shopItem2 = -1;
		global.shopItem3 = -1;
		global.item1Bought = false;
		global.item2Bought = false;
		global.item3Bought = false;
		global.rerollTax = 0;
		global.ranks = ["D","D","D","D","D","D","D","D","D"];
		// Reset instance lists
		global.coinArray = ds_list_create();
		global.enemyArray = ds_list_create();
		global.slimeArray = ds_list_create();
		Save();
		if(global.timeTrial)
		{
			SlideTransition(TRANS_MODE.GOTO,rMemoryZoo);
		}
		else
		{
			SlideTransition(TRANS_MODE.GOTO,rHub);
		}
	}
}

vsp += grv;
// Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
	if(!endSpawned)
	{
		// Revive
		if(global.essence == 3 && global.zombieRevive)
		{
			player = instance_create_layer(x+4,y+4,"Walls",oPlayer);
			player.vsp = -3;
			player.lavaBoost = true;
			player.invulnerable = 50;
			global.health = 2;
			global.floor1Music = false;
			global.zombieRevive = false;
			// Spawn bits
			instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
			instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
			instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
			instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
			
			// Spawn explosion
			audio_play_sound(snd_EnemyDeath,5,false);
			instance_create_layer(x+4,y+4,"Enemies",oEnemyEliteDeath);
			
			audio_play_sound(snd_Revive,5,false);
			instance_destroy();
		}
		// Spawn death data
		else
		{
			endSpawned = true;
			audio_play_sound(snd_Grave,5,false);
			alarm[0] = room_speed * 1;
			alarm[2] = room_speed * 1.5;
			alarm[3] = room_speed * 2;
			alarm[4] = room_speed * 2.5;
		}
	}
}
	
y = y + vsp;