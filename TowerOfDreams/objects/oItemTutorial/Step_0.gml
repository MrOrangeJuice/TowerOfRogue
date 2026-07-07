/// @description Get Input

if(global.controller == 1)
{
	sprite_index = sUseItemController;
}
else
{
	sprite_index = sUseItem;	
}

key_item = keyboard_check(ord("X")) || keyboard_check(ord("O")) || keyboard_check(vk_lshift);

if (gamepad_button_check(global.ControllerId,gp_face1) || gamepad_button_check(global.ControllerId,gp_face4))
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