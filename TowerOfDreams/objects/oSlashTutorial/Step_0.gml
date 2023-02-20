/// @description Get Input

if(global.controller)
{
	sprite_index = sSlashController;	
}
else
{
	sprite_index = sSlash;	
}

key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z")) || keyboard_check(ord("P"));

if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	key_jump = 1;
	global.controller = 1;
}

if(!global.paused)
{
	if(key_jump)
	{
		image_index = 1;	
	}
	else
	{
		image_index = 0;	
	}
}
else
{
	
}