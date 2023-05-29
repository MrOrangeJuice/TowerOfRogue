/// @description Die

if(place_meeting(x,y,oLava))
{
	global.lavaId = other;
	instance_create_layer(x,y,"Instances",oPlayerLava);
	instance_destroy();
}