/// @description Update

if(!global.paused)
{	
	image_speed = 1;
	
	vsp += grv;
	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	if(hsp > 0)
	{
		hsp -= 0.01;	
	}
	else if(hsp < 0)
	{
		hsp += 0.01;
	}
	
	if(hsp < 0.01 && hsp > -0.01)
	{
		hsp = 0;
	}
	
	// Horizontal Collision
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	
	if(global.magnet)
	{
		if(instance_exists(oPlayer))
		{
			if(point_distance(x+4,y+4,oPlayer.x,oPlayer.y) < 20 * global.magnetNum)
			{
				magnetised = true;
			}
		}		
		else if(instance_exists(oBird))
		{
			if(point_distance(x+4,y+4,oBird.x,oBird.y) < 20 * global.magnetNum)
			{
				magnetised = true;
			}
		}
	}
	
	if(magnetised)
	{
		if(instance_exists(oPlayer))
		{
			angle = arctan2(oPlayer.y - y, oPlayer.x - x);
			hsp += cos(angle) * 1;
			vsp += sin(angle) * 1;
		}
		else if(instance_exists(oBird))
		{
			angle = arctan2(oBird.y - y, oBird.x - x);
			hsp += cos(angle) * 1;
			vsp += sin(angle) * 1;
		}
		
		if(hsp > 3)
		{
			hsp = 3;	
		}
		if(vsp > 3)
		{
			vsp = 3;	
		}

		x += hsp;
		y += vsp;
	
		if (abs(hsp) > 0) { hsp = (abs(hsp) - 0.3) * sign(hsp); }
		if (abs(vsp) > 0) { vsp = (abs(vsp) - 0.3) * sign(vsp); }
		if (abs (hsp) < 0.3) hsp = 0;
		if (abs (vsp) < 0.3) vsp = 0;
	}
	else
	{
		x += hsp;
		y += vsp;
	}
}
else
{
	image_speed = 0;
	alarm[0]++;
	alarm[1]++;
}