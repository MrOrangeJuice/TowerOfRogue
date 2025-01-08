/// @description Insert description here
// You can write your code in this editor

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
    if(key_up && !locked)
    {
        image_speed = 0;
        if(image_index >= 0 && image_index < 3)
        {
            win = true;
            audio_play_sound(snd_Arcade,5,false);
            if(!steam_get_achievement("LESTERGAME"))
            {
                steam_set_achievement("LESTERGAME");
            }
        }
        else 
        {
            lose = true;
            audio_play_sound(snd_ArcadeBad,5,false);
        } 
           
        audio_play_sound(snd_Door,5,false);
        alarm[0] = room_speed * 0.1;
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
