/// @description Init

display_set_gui_size(256,144);
global.controller = 0;
global.paused = false;
global.hitStop = false;
global.canPause = false;
global.coins = 0;
global.maxHealth = 6;
global.health = 6;
global.infiniteHealth = false;
global.item = -1;
global.itemSprites = [sKunaiUI,sBootsUI,sShockUI,sCritUI,sGobletUI,sColaUI,sCardUI,sHeartTrophyUI,sWingsUI,sPickaxeUI,sMagnetUI,sAxeUI,sHeart];
global.itemObjects = [oKunaiItem,oBootsItem,oShockItem,oCritItem,oGobletItem,oColaItem,oCardItem,oHeartTrophyItem,oWingsItem,oPickaxeItem,oMagnetItem,oAxeItem,oHeart];
global.itemPrices = [120,120,80,100,120,100,100,120,150,100,120,120,50];
global.itemNames = ["Kunai","Winged Boots","Shock Bracelet","Crit Jelly","Goblet of Blood","Rage Cola","Rewards Card","Heart Trophy","Wax Wings","Lucky Pickaxe","Gem Magnet","Throwing Axe","Heart"];
global.passiveItems = [];
global.passiveItemSprites = [sShockUI,sCritUI,sGobletUI,sColaUI,sCardUI,sHeartTrophyUI,sPickaxeUI,sMagnetUI];
global.sword = true;
global.tutorialCompleted = false;
global.runCompleted = false;
global.inARun = false;
global.sideRoomArray = [rTreasureRoom,rTreasureRoom2];
global.sideRoomArray2 = [rTreasureRoomFloor2,rTreasureRoom2Floor2];
global.shopRoomArray = [rShop,rShop2];
global.shopRoomArray2 = [rShopFloor2,rShop2Floor2];
global.levelArray = [rFloor1_1,rFloor1_2,rFloor1_3,rFloor1_4];
global.levelArray2 = [rFloor2_1,rFloor2_2,rFloor2_3];
global.usedArray = [false,false,false,false,false];
global.usedArray2 = [false,false,false,false,false];
global.levelCount = 0;
global.pipeCount = 0;
global.shopPipeCount = 0;
global.originalRoom = room;
global.sideRoom = rTitle;
global.sideChestOpened = false;
global.pipeSpawned = false;
global.shopRoom = rTitle;
global.shopSpawned = false;
global.pipeY = 0;
global.shopY = 0;
global.gobletCombo = 0;
global.gobletVFX = [o1,o2,o3,o4,o5,oHealthGetVFX];
global.tutorialMusic = false;
global.floor1Music = false;
global.shopMusic = false;
global.hubMusic = false;
global.bumperSwitch = true;
global.bumpersSwitching = false;
global.lavaId = 0;

// Passive items
global.magnet = false;
global.magnetNum = 0;

// Determine default resolution
if(display_get_width() / display_get_height() == 1.6)
{
	global.res1610 = true;
}
else
{
	global.res1610 = false;
}

global.coinArray = ds_list_create();
global.enemyArray = ds_list_create();
menuOption = 0;
analogUpPrev = false;
analogDownPrev = false;
analogUpPrevD = false;
analogDownPrevD = false;
coinTextScale = 1;
healthTextScale = 1;
itemTextScale = 1;
passiveItemTextScale = 1;
options = false;
deleted = false;
UIOffset = 0;

Load();