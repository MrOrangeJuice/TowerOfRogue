/// @description Init

hp = 0;
flash = 0;
elite = false;
invincible = false;
givesHealth = true;
noDamage = false;
gilded = false;

// Determine if gilded
randomize();
gildRand = irandom_range(0,19);

rabbitInItems = false;
rabbitNum = 0;
for(i = 0; i < array_length(global.passiveItems); i++)
{
	if(global.passiveItems[i] == 19)
	{
		rabbitInItems = true;
		rabbitNum++;
	}
}

if(gildRand < (1 + (rabbitNum * 3)))
{
	gilded = true;	
}