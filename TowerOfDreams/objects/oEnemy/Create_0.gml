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

if(gildRand < 1)
{
	gilded = true;	
}