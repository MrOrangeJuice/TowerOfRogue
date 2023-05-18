/// @description Update

event_inherited();

if(instance_exists(oPlayer))
{
	if(oPlayer.hsp > 0.1)
	{
		x = oPlayer.x + 1;
	}
	else if(oPlayer.hsp < -0.1)
	{
		x = oPlayer.x - 1;
	}
	else
	{
		x = oPlayer.x;	
	}
	y = oPlayer.y;
}