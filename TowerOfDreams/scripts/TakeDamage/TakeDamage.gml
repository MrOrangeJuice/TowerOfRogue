// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// damage, horizontal knockback, vertical knockback
function TakeDamage(argument0,argument1,argument2)
{
	if(instance_exists(oPlayer))
	{
		with (oPlayer)
		{
			audio_play_sound(snd_Damage,5,false);
			global.health -= argument0;
			vsp = -argument1;
			// Set hsp to the opposite of your current direction
			currentwalksp = -sign(image_xscale) * argument2;
			invulnerable = 100;
			hit = true;
			ScreenShake(2,10);
			hitStop = instance_create_layer(0,0,"Instances",oHitstop);
			hitStop.hitStopTime = 0.1;
		}
		with (oGame) healthTextScale = 1.15;
	}
}