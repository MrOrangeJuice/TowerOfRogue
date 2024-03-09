/// @description Explode

if(!array_contains(enemies,other))
{
	if(!other.invincible)
	{
		// Add hit enemy to list so they aren't hit again
		array_push(enemies,other);
		other.hp -= damage;
		ScreenShake(2,10);
	}
}