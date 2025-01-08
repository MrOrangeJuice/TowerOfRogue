/// @description Check for collision

if(place_meeting(x,y,oPlayer))
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
        talking = true;
        alarm[0] = room_speed * 1;
        image_index = 0;
        audio_play_sound(snd_Richard,5,false);
    }
}
else
{
    colliding = false;	
}

if(!global.paused)
{
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
}


// Animation

// Start talking animation
if(instance_exists(oPlayer))
{
    if(oPlayer.x > x+16)
    {
        if(talking)
        {
            sprite_index = sLesterTalkRight;
        }
        else 
        {
            sprite_index = sLesterRight;
        }
    }
    else 
    {
        if(talking)
        {
            sprite_index = sLesterTalk;
        }
        else 
        {
            sprite_index = sLester;
        }
    }
}
else 
{
    sprite_index = sLesterRight;
}
