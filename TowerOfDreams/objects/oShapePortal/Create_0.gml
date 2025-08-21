regularSprite = sCircle;
smallSprite = sCircleShrink;
bigSprite = sCircleGrow;

otherId = id;

// Find other portal
for(i = 0; i < instance_number(object_index); i++)
{
	inst = instance_find(object_index, i);
	if(inst != id)
	{
		otherId = inst;
	}
}