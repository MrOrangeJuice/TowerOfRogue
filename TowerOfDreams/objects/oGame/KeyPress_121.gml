/// @description Toggle show collision

if(room != rTitle)
{
	if(global.showCollision)
	{
		audio_play_sound(snd_Gulp,5,false);
		global.showCollision = false;
		oWall.visible = false;
		layer_set_visible("Tiles",true);
	}
	else if(!global.showCollision)
	{
		audio_play_sound(snd_SwordGet,5,false);
		global.showCollision = true;	
		oWall.visible = true;
		layer_set_visible("Tiles",false);
	}
}