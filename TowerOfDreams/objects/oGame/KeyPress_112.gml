/// @description Spawn Dev Item

if(global.debug)
{
	audio_play_sound(snd_BigGem,5,false);
	if(instance_exists(oPlayer))
	{
		instance_create_layer(oPlayer.x-4,oPlayer.y-64,"Walls",global.itemObjects[global.devItem]);
		global.drawDevItem = false;
	}
}