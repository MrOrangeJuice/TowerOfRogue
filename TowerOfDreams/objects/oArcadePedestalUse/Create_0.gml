/// @description Init

switch(global.palette)
{
    case 0:
        sprite_index = sArcadePedestalUse;
        break;
    case 1:
        sprite_index = sArcadePedestalUseRed;
        break;
    case 2:
        sprite_index = sArcadePedestalUseGreen;
        break;
    case 3:
        sprite_index = sArcadePedestalUseZombie;
        break;
    case 4:
        sprite_index = sArcadePedestalUseGold;
        break;
}


colliding = false;
analogUpPrev = false;
analogUpPrevD = false;
analogDownPrev = false;
analogDownPrevD = false;
analogLeftPrev = false;
analogLeftPrevD = false;
analogRightPrev = false;
analogRightPrevD = false;

startingXNear = x + 12;
startingXFar = x + 28;
startingYNear = y - 12;
startingYFar = y - 28;

// Cursor stuff
cursorTopLeftX = startingXNear;
cursorTopLeftXTarget = startingXNear;
cursorTopRightX = startingXFar;
cursorTopRightXTarget = startingXFar;
cursorBottomLeftX = startingXNear;
cursorBottomLeftXTarget = startingXNear;
cursorBottomRightX = startingXFar;
cursorBottomRightXTarget = startingXFar;

cursorTopLeftY = startingYFar;
cursorTopLeftYTarget = startingYFar;
cursorTopRightY = startingYFar;
cursorTopRightYTarget = startingYFar;
cursorBottomLeftY = startingYNear;
cursorBottomLeftYTarget = startingYNear;
cursorBottomRightY = startingYNear;
cursorBottomRightYTarget = startingYNear;

lerpAmount = 0.3;
cursorMove = 8;

spawnX = ((cursorBottomLeftXTarget+cursorBottomRightX)/2)-4;
spawnY = ((cursorBottomLeftYTarget+cursorTopLeftY)/2)-4;

zoomedIn = false;
zoomedInB = false;
selectionConfirmed = false;
currentItem = 0;
displayArrows = true;
arrowPulse = 0.25;
alarm[0] = room_speed * arrowPulse;

// Create list of unlocked stuff
unlockedItems = [oComputerWall,oEraser,oDummySpawner];
itemNames = ["Wall","Eraser","Dummy"];

currentList = 0;

for(i = 0; i < array_length(global.dbIds); i++)
{
    // Push item to list if you've unlocked it in the database
    if(global.itemsFound[global.dbIds[i]]) 
    {
        array_push(unlockedItems,global.itemObjects[i]); 
        array_push(itemNames,global.itemNames[i]); 
    }
}
