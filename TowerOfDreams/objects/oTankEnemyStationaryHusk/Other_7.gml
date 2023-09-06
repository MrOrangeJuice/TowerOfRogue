/// @description Fire Cannon ball

if(sprite_index == sTankEnemyStationaryHuskFire)
{
	if(IsOnScreen(y))
	{
		audio_play_sound(snd_Cannon,5,false);
	}
	missile = instance_create_layer(x+(dir*-16),y+3,"Enemies",oMissile);
	if(dir == 1) missile.dir = "left";
	if(dir == -1) missile.dir = "right";
	sprite_index = sTankEnemyStationaryHusk;
	alarm[0] = room_speed * fireGap;
}