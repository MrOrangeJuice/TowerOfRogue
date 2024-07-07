/// @description Destroy

pepperInItems = false;
for(i = 0; i < array_length(global.passiveItems); i++)
{
	if(global.passiveItems[i] == 16)
	{
		pepperInItems = true;
	}
}
if(!pepperInItems)
{
	instance_create_layer(x+2,y+2,"Enemies",oDirtExplosionVFX);
}
else
{
	SpawnPepperExplosion(x+2,y+2);
}
audio_play_sound(snd_Impact,5,false);
instance_destroy();