/// @description Throw

if(IsOnScreen(y)) 
{
	audio_play_sound(snd_Wrench,5,false);
}
wrench = instance_create_layer(x+(dir*8),y-4,"Enemies",oWrench);
wrench.dir = dir;