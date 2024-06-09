/// @description Move

if(oBonusItem.selected)
{
	hsp += 0.1;
	x += hsp;
}

// Eat item
if(x >= 124 && !oBonusItem.itemEaten)
{
	oBonusItem.itemEaten = true;
	audio_play_sound(snd_Gulp,5,false);
	alarm[0] = room_speed * 0.5;
}