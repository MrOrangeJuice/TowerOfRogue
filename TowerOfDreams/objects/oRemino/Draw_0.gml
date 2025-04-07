/// @description Draw level label

draw_self();

// Lerp
if(reminoState == state.Portal)
{
    labelYTarget = 36;
}
else if(reminoState == state.Sleep && place_meeting(x,y,oPlayer))
{
    labelYTarget = 36;
}
else 
{
    labelYTarget = 0;
}

// Reset sound effect for sleep
if(reminoState == state.Sleep && !place_meeting(x,y,oPlayer))
{
    soundInfoPlayed = false;
}

labelY = lerp(labelY,labelYTarget,0.2);

if(labelYTarget == 36 && !soundInfoPlayed)
{
    audio_play_sound(snd_ReminoInfoIn,5,false);
    soundInfoPlayed = true;
}

if(unlocked)
{
    draw_sprite(sMemoryInfo,0,x-8,(y-64+labelY));
    draw_set_font(fDreamBoy);
    draw_set_halign(fa_center);
    draw_text_ext(x+20,(y-64+labelY)+7,levelDisplayName,5,44);
}
else
{
    draw_sprite(sMemoryInfoNotUnlocked,0,x-8,(y-64+labelY));
    draw_set_font(fDreamBoy);
    draw_set_halign(fa_center);
    draw_text_ext(x+20,(y-64+labelY)+7,"ASCEND HIGHER TO UNLOCK",5,44);
}