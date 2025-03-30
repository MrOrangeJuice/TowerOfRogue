/// @description Draw level label

draw_self();

// Lerp
if(reminoState == state.Portal)
{
    labelYTarget = 36;
}
else 
{
    labelYTarget = 0;
}

labelY = lerp(labelY,labelYTarget,0.2);

if(labelYTarget == 36 && !soundInfoPlayed)
{
    audio_play_sound(snd_ReminoInfoIn,5,false);
    soundInfoPlayed = true;
}

draw_sprite(sMemoryInfo,0,x-8,(y-64+labelY));
draw_set_font(fDreamBoy);
draw_set_halign(fa_center);
draw_text_ext(x+20,(y-64+labelY)+7,levelName,5,44);
