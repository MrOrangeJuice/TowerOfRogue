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
	
	// Horizontal Collision
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	
	if(global.heartMagnet && object_index != oArmor) 
	{
		if(instance_exists(oPlayer))
		{
			if(point_distance(x+4,y+4,oPlayer.x,oPlayer.y) < 40 * global.heartMagnetNum)
			{
				angle = arctan2(oPlayer.y - y, oPlayer.x - x);
				hsp += cos(angle) * 1;
				vsp += sin(angle) * 1;
				
				if(hsp > 3)
				{
					hsp = 3;	
				}
				if(vsp > 3)
				{
					vsp = 3;	
				}
	
				if (abs(hsp) > 0) { hsp = (abs(hsp) - 0.3) * sign(hsp); }
				if (abs(vsp) > 0) { vsp = (abs(vsp) - 0.3) * sign(vsp); }
				if (abs (hsp) < 0.3) hsp = 0;
				if (abs (vsp) < 0.3) vsp = 0;
			}
		}
	}
	
			
	x += hsp;
	y += vsp;
}
else
{
	image_speed = 0;
}