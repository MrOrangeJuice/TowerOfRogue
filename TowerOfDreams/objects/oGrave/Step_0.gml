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

if(key_select_pressed)
{
	audio_play_sound(snd_MenuSelect,5,false);
	// Reset run
	global.usedArray = [false,false,false,false,false];
	global.usedArray2 = [false,false,false,false,false];
	global.inARun = false;
	global.health = global.maxHealth;
	global.armor = 0;
	global.coins = 0;
	global.localCoins = 0;
	global.overallCoins += global.coinsThisRun;
	global.coinsThisRun = 0;
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
	global.floor1Music = false;
	global.tutorialMusic = false;
	global.shopItem1 = -1;
	global.shopItem2 = -1;
	global.shopItem3 = -1;
	global.item1Bought = false;
	global.item2Bought = false;
	global.item3Bought = false;
	global.rerollTax = 0;
	global.ranks = ["D","D","D","D","D","D"];
	// Reset instance lists
	global.coinArray = ds_list_create();
	global.enemyArray = ds_list_create();
	Save();
	SlideTransition(TRANS_MODE.GOTO,rHub);
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
		endSpawned = true;
		audio_play_sound(snd_Grave,5,false);
		alarm[0] = room_speed * 1;
		alarm[1] = room_speed * 2;
	}
}
	
y = y + vsp;