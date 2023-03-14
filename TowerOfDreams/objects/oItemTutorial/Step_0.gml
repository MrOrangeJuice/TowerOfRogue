/// @description Get Input

if(global.controller)
{
	sprite_index = sUseItemController;	
}
else
{
	sprite_index = sUseItem;	
}

key_item = keyboard_check(ord("X")) || keyboard_check(ord("O")) || keyboard_check(vk_lshift);

if (gamepad_button_check(0,gp_face2) || gamepad_button_check(0,gp_face3) || gamepad_button_check(4,gp_face2) || gamepad_button_check(4,gp_face3))
{
	key_item = 1;
	global.controller = 1;
}

if(!global.paused)
{
	if(key_item)
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