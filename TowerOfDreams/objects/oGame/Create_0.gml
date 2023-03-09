/// @description Init

display_set_gui_size(256,144);
global.controller = 0;
global.paused = false;
global.hitStop = false;
global.canPause = false;
global.coins = 0;
global.maxHealth = 6;
global.health = 6;
global.item = -1;
global.itemSprites = [sKunaiUI,sBootsUI];
global.itemObjects = [oKunaiItem,oBootsItem];
global.sword = true;
global.tutorialCompleted = false;
global.inARun = false;
global.sideRoomArray = [rTreasureRoom,rTreasureRoom2];
global.levelArray = [rRunTest,rRunTest2,rRunTest3,rRunTest4,rRunTest5];
global.usedArray = [false,false,false,false,false];
global.levelCount = 0;
global.pipeCount = 0;
global.originalRoom = room;
menuOption = 0;
analogUpPrev = false;
analogDownPrev = false;
analogUpPrevD = false;
analogDownPrevD = false;
coinTextScale = 1;
healthTextScale = 1;
itemTextScale = 1;
options = false;
deleted = false;

Load();