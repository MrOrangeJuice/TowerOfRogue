if(instance_exists(oPlayer))
{
	instance_destroy(oPlayer);
	player = instance_create_layer(otherId.x+4,otherId.y+4,"Instances",oPlayer);
	player.vsp = -2;
}