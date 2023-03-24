/// @description Reset

// Reset run
global.usedArray = [false,false,false,false,false];
global.inARun = false;
global.runCompleted = true;
global.health = global.maxHealth;
global.coins = 0;
global.item = -1;
global.levelCount = 0;
global.sideRoom = rTitle;
global.sideChestOpened = false;
global.pipeSpawned = false;
global.pipeY = 0;
Save();

SlideTransition(TRANS_MODE.GOTO,rHub);