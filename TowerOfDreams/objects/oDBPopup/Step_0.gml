/// @description Move box


if(move)
{
    if(!moveBack)
    {
    	// Move left
    	if(xOffset < 72)
    	{
    		xOffset += 4;	
    	}
    	else
    	{
    		if(!hold)
    		{
    			hold = true;
    			alarm[0] = room_speed * 2;
    		}
    	}
    }
    else
    {
    	if(xOffset > 0)
    	{
    		xOffset -= 4;	
    	}
    	else
    	{
    		instance_destroy();	
    	}
    }
}