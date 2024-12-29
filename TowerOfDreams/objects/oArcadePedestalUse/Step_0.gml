/// @description Update

key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
key_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
key_select_pressed = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
key_select = keyboard_check(ord("Z")) || keyboard_check(ord("P")) || keyboard_check(vk_space) || keyboard_check(vk_enter);
key_back = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("O")) || keyboard_check_pressed(vk_lshift);

if (key_up || key_down || key_left || key_right || key_select_pressed || key_select || key_back)
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
    key_select_pressed = 1;
    global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_face1))
{
    key_select_pressed = 1;
    global.controller = 2;
}

if (gamepad_button_check(0,gp_face1))
{
    key_select = 1;
    global.controller = 1;
}
if (gamepad_button_check(4,gp_face1))
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

// Lerp
cursorTopLeftX = lerp(cursorTopLeftX,cursorTopLeftXTarget,lerpAmount);
cursorTopLeftY = lerp(cursorTopLeftY,cursorTopLeftYTarget,lerpAmount);

cursorTopRightX = lerp(cursorTopRightX,cursorTopRightXTarget,lerpAmount);
cursorTopRightY = lerp(cursorTopRightY,cursorTopRightYTarget,lerpAmount);

cursorBottomLeftX = lerp(cursorBottomLeftX,cursorBottomLeftXTarget,lerpAmount);
cursorBottomLeftY = lerp(cursorBottomLeftY,cursorBottomLeftYTarget,lerpAmount);

cursorBottomRightX = lerp(cursorBottomRightX,cursorBottomRightXTarget,lerpAmount);
cursorBottomRightY = lerp(cursorBottomRightY,cursorBottomRightYTarget,lerpAmount);


if(!selectionConfirmed)
{
	// Select row and element
	if(key_left)
	{
		currentItem--;
		if(currentItem < 0) currentItem = array_length(unlockedItems) - 1;
	    audio_play_sound(snd_DreamBoyMenuMove,5,false);
	}

	if(key_right)
	{
		currentItem++;
		if(currentItem > array_length(unlockedItems) - 1) currentItem = 0;
	    audio_play_sound(snd_DreamBoyMenuMove,5,false);
	}
	
	if(key_up)
	{
	    audio_play_sound(snd_DreamBoyMenuMove,5,false);
	}

	if(key_down)
	{
	    audio_play_sound(snd_DreamBoyMenuMove,5,false);
	}
	
	
	// Spawn/Preview location
	spawnX = ((cursorBottomLeftX+cursorBottomRightX)/2)-4;
	spawnY = ((cursorBottomLeftY+cursorTopLeftY)/2)-4;

	// Select element
	if(key_select_pressed)
	{
	    selectionConfirmed = true;
	    audio_play_sound(snd_DreamBoySelect2,5,false);
	}
	
	// Exit
	if(key_back)
	{
		audio_play_sound(snd_DreamBoyMenuBack,5,false);
	    instance_create_layer(x,y,"Walls",oArcadePedestal);
	    instance_create_layer(x+8,y,"Instances",oPlayer);
	    instance_destroy();
	}
}
else
{
	// Move cursor
	if(key_left)
	{
	    cursorTopLeftXTarget -= cursorMove;
	    cursorTopRightXTarget -= cursorMove;
	    cursorBottomLeftXTarget -= cursorMove;
	    cursorBottomRightXTarget -= cursorMove;
    
	    audio_play_sound(snd_DreamBoyMenuMove,5,false);
	}

	if(key_right)
	{
	    cursorTopLeftXTarget += cursorMove;
	    cursorTopRightXTarget += cursorMove;
	    cursorBottomLeftXTarget += cursorMove;
	    cursorBottomRightXTarget += cursorMove;
    
	    audio_play_sound(snd_DreamBoyMenuMove,5,false);
	}
	if(key_up)
	{
	    cursorTopLeftYTarget -= cursorMove;
	    cursorTopRightYTarget -= cursorMove;
	    cursorBottomLeftYTarget -= cursorMove;
	    cursorBottomRightYTarget -= cursorMove;
    
	    audio_play_sound(snd_DreamBoyMenuMove,5,false);
	}

	if(key_down)
	{
	    cursorTopLeftYTarget += cursorMove;
	    cursorTopRightYTarget += cursorMove;
	    cursorBottomLeftYTarget += cursorMove;
	    cursorBottomRightYTarget += cursorMove;
    
	    audio_play_sound(snd_DreamBoyMenuMove,5,false);
	}
	
	// Spawn/Preview location
	spawnX = ((cursorBottomLeftX+cursorBottomRightX)/2)-4;
	spawnY = ((cursorBottomLeftY+cursorTopLeftY)/2)-4;

	// Place
	if(key_select_pressed)
	{
	    instance_create_layer(spawnX,spawnY,"Walls",global.itemObjects[currentItem]);
	    audio_play_sound(snd_DreamBoySelect2,5,false);
	}
	
	// Exit
	if(key_back)
	{
		selectionConfirmed = false;
	    audio_play_sound(snd_DreamBoyMenuBack,5,false);
	}
}

if(key_select)
{
    if(!zoomedIn)
    {
        cursorBottomLeftXTarget += 2;
        cursorBottomRightXTarget -= 2;
        cursorTopLeftXTarget += 2;
        cursorTopRightXTarget -= 2;
        
        cursorBottomLeftYTarget -= 2;
        cursorBottomRightYTarget -= 2;
        cursorTopLeftYTarget += 2;
        cursorTopRightYTarget += 2;
        
        zoomedIn = true;
    }
}
else 
{
    if(zoomedIn)
    {
        cursorBottomLeftXTarget -= 2;
        cursorBottomRightXTarget += 2;
        cursorTopLeftXTarget -= 2;
        cursorTopRightXTarget += 2;
        
        cursorBottomLeftYTarget += 2;
        cursorBottomRightYTarget += 2;
        cursorTopLeftYTarget -= 2;
        cursorTopRightYTarget -= 2;
        
        zoomedIn = false;
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
