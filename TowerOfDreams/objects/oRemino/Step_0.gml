/// @description Check for state change

if(!global.paused)
{
    image_speed = 1;
    
    if(reminoState == state.Idle)
    {
        if(instance_exists(oPlayer))
        {
            if(place_meeting(x,y,oPlayer))
            {
                reminoState = state.Grow;
                image_index = 0;
            }
        }
        sound1Played = false;
        sound2Played = false;
        sound3Played = false;
        sound4Played = false;
        sound5Played = false;  
        
        soundInfoPlayed = false;
        soundInfoOutPlayed = false;
    }
    
    if(reminoState == state.Grow)
    {
        if(!(place_meeting(x,y,oPlayer)) && image_index <= 11)
        {
            reminoState = state.AllTheWay;
        }
    }
    
    // Animate
    switch(reminoState)
    {
        case state.Idle:
            sprite_index = sMemoryGremlin;
            break;
        case state.Grow:
            sprite_index = sMemoryGremlinGrow;
            break;
        case state.Portal:
            sprite_index = sMemoryGremlinPortal;
            break;
        case state.AllTheWay:
            sprite_index = sMemoryGremlinAllTheWay;
            break;
        case state.Shrink:
            sprite_index = sMemoryGremlinShrink;
            break;
        case state.Sleep:
            sprite_index = sMemoryGremlinSleep;
            break;
    }
    
    // Sounds
    
    if(reminoState == state.Grow || reminoState == state.AllTheWay)
    {
        if(image_index >= 4 && !sound1Played)
        {
            audio_play_sound(snd_Remino1,5,false);
            audio_stop_sound(snd_Remino4);
            audio_stop_sound(snd_Remino5);
            sound1Played = true;
        }
        if(image_index >= 8 && !sound2Played)
        {
            audio_play_sound(snd_Remino2,5,false); 
            audio_stop_sound(snd_Remino4);
            audio_stop_sound(snd_Remino5);
            sound2Played = true;
        }
    }
    
    if(reminoState == state.Grow)
    {
        if(image_index >= 12 && !sound3Played)
        {
            audio_play_sound(snd_Remino3,5,false);
            sound3Played = true;
        }
    }
    
    if(reminoState == state.Shrink)
    {
        if(image_index >= 4 && !sound4Played)
        {
            audio_play_sound(snd_Remino4,5,false);
            sound4Played = true;
        }
        if(image_index >= 8 && !sound5Played)
        {
            audio_play_sound(snd_Remino5,5,false);
            sound5Played = true;
        }
    }
    
    if(reminoState == state.AllTheWay)
    {
        if(image_index >= 11 && !sound4Played)
        {
            audio_play_sound(snd_Remino4,5,false);
            sound4Played = true;
        }
        if(image_index >= 15 && !sound5Played)
        {
            audio_play_sound(snd_Remino5,5,false);
            sound5Played = true;
        }
    }
}
else 
{
    image_speed = 0;    
}
