/// @description Draw info

if(levelFinished)
{
	draw_sprite(sLevelCompleteStatic,0,128,display_get_gui_height()/2 - 40);
}

if(continutePrompt)
{
	if(global.controller)
	{
		if(key_select)
		{
			draw_sprite(sContinueController,1,128,display_get_gui_height()/2 + 40);	
		}
		else
		{
			draw_sprite(sContinueController,0,128,display_get_gui_height()/2 + 40);	
		}
	}
	else
	{
		if(key_select)
		{
			draw_sprite(sContinue,1,128,display_get_gui_height()/2 + 40);	
		}
		else
		{
			draw_sprite(sContinue,0,128,display_get_gui_height()/2 + 40);	
		}
	}
}