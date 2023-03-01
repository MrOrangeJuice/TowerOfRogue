/// @description Update

if(hp <= 0)
{
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