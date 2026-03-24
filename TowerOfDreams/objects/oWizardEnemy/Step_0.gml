event_inherited();

if(!global.paused && !global.hitStop)
{
	image_speed = 1;
	
	if(image_index > 28 && sprite_index == sWizardSpawn && !spawned)
	{
		if(IsOnScreen(y)) 
		{
			audio_play_sound(snd_Spawn,5,false);
		}
		enemy = instance_create_layer(x+(dir*46),y,"Enemies",oGravityEnemy);
		enemy.givesHealth = false;
		spawned = true;
	}
}
else
{
	image_speed = 0;
	// Extend alarm
	alarm[0]++;
	alarm[1]++;
}