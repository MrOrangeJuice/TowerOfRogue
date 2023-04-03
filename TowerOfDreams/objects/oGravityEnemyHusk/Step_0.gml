/// @description Move

event_inherited();
	
// Animation
if(landing)
{
	if(sign(grv) > 0)
	{
		sprite_index = sGravityEnemyHuskLand;	
		image_index = 0;
	}
	else
	{
		sprite_index = sGravityEnemyHuskLandUp;	
		image_index = 0;
	}
}
else
{
	if(hitWall)
	{
		sprite_index = sGravityEnemyHusk;
	}
	else
	{
		if(sign(grv) > 0)
		{
			sprite_index = sGravityEnemyHuskFall;	
		}
		else
		{
			sprite_index = sGravityEnemyHuskFallUp;	
		}
	}
}