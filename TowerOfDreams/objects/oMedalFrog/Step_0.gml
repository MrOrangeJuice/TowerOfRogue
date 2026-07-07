/// @description Check for item falling

key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);

if(key_up)
{
	global.controller = 0;	
}

if ((gamepad_axis_value(global.ControllerId,gp_axislv) < -0.4 && analogUpPrev == false) || gamepad_button_check_pressed(global.ControllerId,gp_padu))
{
	key_up = 1;
	global.controller = 1;
	analogUpPrev = true;
}

if(!global.paused)
{
	if(global.timeMedals > global.medalsFedToFrog) 
	{
		playerHasMedals = true;
	}
	else
	{
		playerHasMedals = false;	
	}
	
	// Spawn medal
	if(key_up && richColliding && playerHasMedals)
	{
		// Drop the item on the ground
		oldItem = instance_create_layer(oPlayer.x-4,oPlayer.y-8,"Collectables",oMedal);
		oldItem.vsp = -6;
			
		audio_play_sound(snd_Dropitem,5,false);
		global.medalsFedToFrog++;
		frogBusy = true;
	}
	
	image_speed = 1;
	// Look for item
	if(place_meeting(x,y-128,oMedal) && !tongue)
	{
		tongue = true;
		sprite_index = sMedalFrogTongue;
		alarm[0] = room_speed * 0.3;
		alarm[1] = room_speed * 1.2;
		alarm[2] = room_speed * 2.35;
		alarm[3] = room_speed * 2.15;
	}
	
	if(place_meeting(x,y,oPlayer) && !playerHasMedals && !frogBusy)
	{
		if(!colliding)
		{
			colliding = true;
			// Regenerate phrase
			signMessage = phrases[random_range(0,array_length(phrases))];	
			while(signMessage == prevPhrase)
			{
				signMessage = phrases[random_range(0,array_length(phrases))];		
			}
			prevPhrase = signMessage;
			// Start talking animation
			sprite_index = sMedalFrogTalk;
			image_index = 0;
			audio_play_sound(snd_Richard,5,false);
		}
	}
	else if(place_meeting(x,y,oPlayer) && playerHasMedals && !frogBusy)
	{
		if(!richColliding)
		{
			richColliding = true;
		}
	}
	else
	{
		richColliding = false;
		colliding = false;	
	}
	
	if(vsp > 0.2 || vsp < -0.2)
	{
		yAccel *= -1;	
	}
	vsp += yAccel;
	yOffset = yOffset + vsp;
}
else
{
	alarm[0]++;
	alarm[1]++;
	alarm[2]++;
	alarm[3]++;
	image_speed = 0;	
}

// Record analog inputs for this frame
if(gamepad_axis_value(global.ControllerId,gp_axislv) < -0.4)
{
	analogUpPrev = true;	
}
else
{
	analogUpPrev = false;	
}

if(gamepad_axis_value(global.ControllerId,gp_axislv) > 0.4)
{
	analogDownPrev = true;	
}
else
{
	analogDownPrev = false;	
}