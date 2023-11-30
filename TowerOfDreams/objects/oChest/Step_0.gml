key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);

if(key_up)
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

if(place_meeting(x,y,oPlayer))
{
	colliding = true;	
	if(key_up && !opened)
	{
		randomize();
		// Generate new item
		newItemIndex = irandom_range(0,array_length(global.itemObjects)-1);
		// Reroll if item is current active item
		while(newItemIndex == global.item)
		{
			newItemIndex = irandom_range(0,array_length(global.itemObjects)-1);
		}
		// Spawn hearts and armor differently
		if(newItemIndex == array_length(global.itemObjects)-1 || newItemIndex == array_length(global.itemObjects)-2)
		{
			newItem = instance_create_layer(x+4,y+4,"Collectables",global.itemObjects[newItemIndex]);
			newItem2 = instance_create_layer(x+4,y+4,"Collectables",global.itemObjects[newItemIndex]);
			
			newItem.hsp = -0.9;
			newItem.vsp = -2;
			newItem2.hsp = 0.9;
			newItem2.vsp = -2;
		}
		else
		{
			newItem = instance_create_layer(x+4,y+4,"Collectables",global.itemObjects[newItemIndex]);
			newItem.vsp = -3;
		}
		opened = true;
		global.sideChestOpened = true;
		image_index = 1;
		audio_play_sound(snd_Door,5,false);
	}
}
else
{
	colliding = false;	
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