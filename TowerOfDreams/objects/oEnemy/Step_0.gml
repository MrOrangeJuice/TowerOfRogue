/// @description Update

if(hp <= 0)
{
	if(givesHealth)
	{
		randomize();
		if(irandom_range(1,4) == 2)
		{

			heart = instance_create_layer(x-4,y-4,"Collectables",oHeart);	
			heart.vsp = -2;
		}
	}
	if (elite)
	{
		instance_create_layer(x,y,"Enemies",oEnemyEliteDeath);
	}
	else
	{
		instance_create_layer(x,y,"Enemies",oEnemyDeath);
	}
	instance_destroy();	
}