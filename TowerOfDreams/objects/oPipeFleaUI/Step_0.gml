/// @description Move

if(oBonusItem.selected)
{
	hsp += 0.1;
	x += hsp;
}

if(x > 0 && !soundPlayed)
{
	audio_play_sound(snd_Flea,5,true);	
	soundPlayed = true;
}

// Eat item
if(x >= 124 && !oBonusItem.itemEaten)
{
	oBonusItem.itemEaten = true;
	audio_play_sound(snd_Gulp,5,false);
	audio_play_sound(snd_Item,5,false);
	alarm[0] = room_speed * 0.5;
	instance_create_layer(x,y,"UI",oItemVFX);
}