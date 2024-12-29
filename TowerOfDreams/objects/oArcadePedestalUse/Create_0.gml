/// @description Init

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

spawnX = ((cursorBottomLeftX+cursorBottomRightX)/2)-4;
spawnY = ((cursorBottomLeftY+cursorTopLeftY)/2)-4;

zoomedIn = false;
zoomedInB = false;
selectionConfirmed = false;
currentItem = 0;
displayArrows = true;
arrowPulse = 0.25;
alarm[0] = room_speed * arrowPulse;

// Create list of unlocked stuff
unlockedItems = [];
unlockedEnemies = [];
unlockedTools = [oComputerWall,oEraser];

for(i = 0; i < array_length(global.dbIds); i++)
{
	// Push item to list if you've unlocked it in the database
	if(global.itemsFound[global.dbIds[i]]) array_push(unlockedItems,global.itemObjects[i]);
}