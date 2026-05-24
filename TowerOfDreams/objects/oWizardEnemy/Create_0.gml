/// @description Init

event_inherited();

alarm[0] = room_speed * (1 + delay);
image_xscale = dir * -1;
hp = 2;
spawned = false;

// Sprites
idle = sWizard;
spawn = sWizardSpawn;

// Spawn for hard mode
if(global.hardMode && object_index != oWizardEnemyElite)
{
	instance_change(oWizardEnemyElite,false);
	hp = 4;
	elite = true;
	
	// Sprites
	idle = sWizardElite;
	spawn = sWizardSpawnElite;
}