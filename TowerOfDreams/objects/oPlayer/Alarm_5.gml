/// @description Activate stamper

if(instance_exists(oStamper)) 
{
	oStamper.bought = true;
	instance_create_layer(oStamper.x,oStamper.y,"Walls",oStamperTextVFX);
}