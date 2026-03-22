/// @description Init

event_inherited();

alarm[0] = room_speed * (1 + delay);
image_xscale = dir * -1;
hp = 2;
spawned = false;

// Spawn for hard mode
if(global.hardMode && object_index != oWrenchEnemyElite)
{
	instance_change(oWizardEnemyElite,false);
	hp = 4;
	elite = true;
}

// Sprites
idle = sWizard;
spawn = sWizardSpawn;