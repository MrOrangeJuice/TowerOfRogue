/// @description Move

event_inherited();
	
// Animation
if(landing)
{
	if(sign(grv) > 0)
	{
		sprite_index = sGravityEnemyEliteLand;	
		image_index = 0;
	}
	else
	{
		sprite_index = sGravityEnemyEliteLandUp;	
		image_index = 0;
	}
}
else
{
	if(hitWall)
	{
		sprite_index = sGravityEnemyElite;
	}
	else
	{
		if(sign(grv) > 0)
		{
			sprite_index = sGravityEnemyEliteFall;	
		}
		else
		{
			sprite_index = sGravityEnemyEliteFallUp;	
		}
	}
}