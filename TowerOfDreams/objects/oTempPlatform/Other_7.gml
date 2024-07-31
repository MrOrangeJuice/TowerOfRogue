/// @description Destroy

if(sprite_index == sTempPlatformStand)
{
	instance_create_layer(x,y,"Walls",oTempPlatformDissappearVFX);	
	instance_destroy();
}