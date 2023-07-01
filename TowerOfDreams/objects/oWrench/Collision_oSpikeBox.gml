/// @description Destroy

if(IsOnScreen(y)) 
{
	audio_play_sound(snd_Impact,5,false);
}
instance_create_layer(x,y,"Enemies",oBallVFX);
instance_destroy();