/// @description Draw


if(drawOverallRankText)
{
	draw_sprite(sOverallRank,0,128,display_get_gui_height()/2 - 16);
}

if(drawOverallRank)
{
	
	draw_sprite(rankSprite,0,128,display_get_gui_height()/2 + 8);
}

if(drawContinue)
{
	if(global.controller == 2 && !gamepad_is_connected(0))
	{
		if(key_select)
		{
			draw_sprite(sContinueControllerPS,1,128,display_get_gui_height()/2 + 48);	
		}
		else
		{
			draw_sprite(sContinueControllerPS,0,128,display_get_gui_height()/2 + 48);	
		}
	}
	else if(global.controller == 1 || global.controller == 2)
	{
		if(key_select)
		{
			draw_sprite(sContinueController,1,128,display_get_gui_height()/2 + 48);	
		}
		else
		{
			draw_sprite(sContinueController,0,128,display_get_gui_height()/2 + 48);	
		}
	}
	else
	{
		if(key_select)
		{
			draw_sprite(sContinue,1,128,display_get_gui_height()/2 + 48);	
		}
		else
		{
			draw_sprite(sContinue,0,128,display_get_gui_height()/2 + 48);	
		}
	}
}