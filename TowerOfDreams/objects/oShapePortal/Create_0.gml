regularSprite = sCircle;
smallSprite = sCircleShrink;
bigSprite = sCircleGrow;
vfx = oCircleParticle;

otherId = id;

animSpeed = 0.075;
easeSpeed = 0.075;

imageSpeed = 1;

// Find other portal
for(i = 0; i < instance_number(object_index); i++)
{
	inst = instance_find(object_index, i);
	if(inst != id)
	{
		otherId = inst;
	}
}