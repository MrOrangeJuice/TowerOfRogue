/// @description Reset

// Reset run
global.usedArray = [false,false,false,false,false];
global.usedArray2 = [false,false,false,false,false];
global.inARun = false;
global.health = global.maxHealth;
global.armor = 0;
global.coins = 0;
global.localCoins = 0;
global.item = -1;
global.passiveItems = [];
global.levelCount = 0;
global.sideRoom = rTitle;
global.shopRoom = rTitle;
global.sideChestOpened = false;
global.pipeSpawned = false;
global.shopSpawned = false;
global.pipeY = 0;
global.shopY = 0;
global.gobletCombo = 0;
global.floor1Music = false;
global.tutorialMusic = false;
// Reset instance lists
global.coinArray = ds_list_create();
global.enemyArray = ds_list_create();

Save();

SlideTransition(TRANS_MODE.GOTO,rHub);