/// @description Spawn Bubbles

randomize();
if(!global.paused)
{
	for(i = 0; i < image_xscale*image_yscale; i++)
	{
		if(irandom_range(1,100) > 98)
		{
			instance_create_layer(random_range(x+4,x+8*image_xscale-4),random_range(y+4,y+8*image_yscale-4),"Pipes",oLavaBubble);
		}
	}
}