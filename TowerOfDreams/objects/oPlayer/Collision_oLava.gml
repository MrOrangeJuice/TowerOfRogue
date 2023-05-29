/// @description Die

if(place_meeting(x,y,oLava))
{
	global.lavaId = other;
	lavaPlayer = instance_create_layer(x,y,"Instances",oPlayerLava);
	lavaPlayer.image_xscale = image_xscale;
	instance_destroy();
}