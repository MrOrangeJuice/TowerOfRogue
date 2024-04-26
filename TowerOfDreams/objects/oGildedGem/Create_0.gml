/// @description Init

vsp = 0;
grv = 0.1;
hsp = 0;
canGrab = false;
alarm[0] = room_speed * 0.2;

value = 1;

// Check for gem items
pickaxe = false;
pickaxeNum = 0;
for(i = 0; i < array_length(global.passiveItems); i++)
{
	if(global.passiveItems[i] == 6)
	{
		pickaxe = true;
		pickaxeNum++;
	}
}

if(pickaxe)
{
	// Chance to double gem value
	gemChance = irandom_range(1,5);
	if(gemChance <= pickaxeNum)
	{
		sprite_index = sDoubleGem;	
		value = 2;
	}
}

// Magnetism
magnetised = false;

alarm[1] = room_speed * 0.3;
