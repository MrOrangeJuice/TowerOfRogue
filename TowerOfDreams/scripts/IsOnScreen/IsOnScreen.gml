// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// y
function IsOnScreen(argument0)
{
	if(instance_exists(oCamera))
	{
		if(global.res1610)
		{
			if(argument0 > oCamera.y - 72 && argument0 < oCamera.y + 72)
			{
				return true;	
			}
			else
			{
				return false;	
			}
		}
		else
		{
			if(argument0 > oCamera.y - 80 && argument0 < oCamera.y + 80)
			{
				return true;	
			}
			else
			{
				return false;	
			}
		}
	}
	else if(instance_exists(oFullCamera))
	{
		if(global.res1610)
		{
			if(argument0 > oFullCamera.y - 72 && argument0 < oFullCamera.y + 72)
			{
				return true;	
			}
			else
			{
				return false;	
			}
		}
		else
		{
			if(argument0 > oFullCamera.y - 80 && argument0 < oFullCamera.y + 80)
			{
				return true;	
			}
			else
			{
				return false;	
			}
		}
	}
}