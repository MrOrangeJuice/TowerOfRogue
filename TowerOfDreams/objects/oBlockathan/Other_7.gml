/// @description Destroy

if(sprite_index == sBlockathanAppear)
{
	sprite_index = sBlockathan;
}
else if(sprite_index == sBlockDissapear)
{
	instance_destroy();	
}