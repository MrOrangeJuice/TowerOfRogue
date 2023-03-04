/// @description Get sword

if(!global.sword)
{
	global.sword = true;
	other.sprite_index = sSwordShrineSwordless;
	instance_create_layer(x,y,"Instances",oPlayerSwordGet);
	instance_destroy();
}