/// @description Init

event_inherited();

win = false;
lose = false;

// Check how many items the player has unlocked
locked = true;
numUnlocked = 0;

for(i = 0; i < array_length(global.itemsFound); i++)
{
    if(global.itemsFound[i]) numUnlocked++;
}

if(numUnlocked >= 3)
{
    locked = false;
}

if(locked)
{
    sprite_index = sArcadeLocked;
}
else 
{
    sprite_index = sArcade;
}