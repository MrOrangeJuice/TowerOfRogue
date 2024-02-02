// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ChangeBirdSkin()
{
	if(instance_exists(oBird))
	{
		switch(global.palette)
		{
			case 0:
				oBird.idle = sBird;
				oBird.flap = sBirdFlap;
				break;
			case 1:
				oBird.idle = sBirdRed;
				oBird.flap = sBirdFlapRed;
				break;
			case 2:
				oBird.idle = sBirdGreen;
				oBird.flap = sBirdFlapGreen;
				break;
			case 3:
				oBird.idle = sBirdZombie;
				oBird.flap = sBirdFlapZombie;
				break;
			case 4:
				oBird.idle = sBirdGold;
				oBird.flap = sBirdFlapGold;
				break;
		}
		
		oBird.sprite_index = oBird.idle;
	}
}