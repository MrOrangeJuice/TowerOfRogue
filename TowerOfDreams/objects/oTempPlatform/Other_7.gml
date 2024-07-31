/// @description Destroy

if(sprite_index == sTempPlatformStand || sprite_index == sTempPlatformStandPushLeft || sprite_index == sTempPlatformStandPushRight)
{
	instance_create_layer(x,y,"Walls",oTempPlatformDissappearVFX);	
	instance_destroy();
}