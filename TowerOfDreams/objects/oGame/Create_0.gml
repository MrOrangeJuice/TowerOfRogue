/// @description Init

display_set_gui_size(256,144);
global.controller = 0;
global.paused = false;
global.hitStop = false;
global.canPause = false;
global.coins = 0;
global.overallCoins = 0;
global.coinsThisRun = 0;
global.localCoins = 0;
global.localDamage = 0;
global.healthUpgrades = 0;
global.maxHealth = 6;
global.health = 6;
global.armor = 0;
global.infiniteHealth = false;
global.item = -1;
global.itemSprites = [sKunaiUI,sBootsUI,sShockUI,sCritUI,sGobletUI,sColaUI,sCardUI,sHeartTrophyUI,sWingsUI,sPickaxeUI,sMagnetUI,sAxeUI,sBoomerangUI,sCritPBUI,sBagUI,sChargeUI,sLightUI,sShieldUI,sArmor,sHeart];
global.itemObjects = [oKunaiItem,oBootsItem,oShockItem,oCritItem,oGobletItem,oColaItem,oCardItem,oHeartTrophyItem,oWingsItem,oPickaxeItem,oMagnetItem,oAxeItem,oBoomerangItem,oCritPBItem,oBagItem,oChargeItem,oLightItem,oShieldItem,oArmor,oHeart];
global.itemPrices = [120,120,80,100,120,100,100,120,150,100,120,120,120,80,120,120,150,120,50,50];
global.itemNames = ["Kunai","Winged Boots","Shock Bracelet","Crit Jelly","Goblet of Blood","Rage Cola","Rewards Card","Heart Trophy","Wax Wings","Lucky Pickaxe","Gem Magnet","Bouncing Axe","Doomerang","Crit Peanut Butter","Bag of Winds","Charge Blade","Lightning in a Bottle","Enchanted Shield","Armor","Heart"];
global.itemTypes = ["Active","Active","Passive","Passive","Passive","Passive","Passive","Passive","Active","Passive","Passive","Active","Active","Passive","Passive","Passive","Active","Passive","Pickup","Pickup"];
global.passiveItems = [];
global.passiveItemSprites = [sShockUI,sCritUI,sGobletUI,sColaUI,sCardUI,sHeartTrophyUI,sPickaxeUI,sMagnetUI,sCritPBUI,sBagUI,sChargeUI,sShieldUI];
global.sword = true;
global.tutorialCompleted = false;
global.runCompleted = false;
global.inARun = false;
global.sideRoomArray = [rTreasureRoom,rTreasureRoom2];
global.sideRoomArray2 = [rTreasureRoomFloor2,rTreasureRoom2Floor2];
global.shopRoomArray = [rShop,rShop2];
global.shopRoomArray2 = [rShopFloor2,rShop2Floor2];
global.levelArray = [rFloor1_1,rFloor1_2,rFloor1_3,rFloor1_4,rFloor1_5];
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
global.treasureMusic = false;
global.hubMusic = false;
global.bumperSwitch = true;
global.bumpersSwitching = false;
global.lavaId = 0;
global.displayLC = false;
global.volume = 6;

// Shop items
global.shopItem1 = -1;
global.shopItem2 = -1;
global.shopItem3 = -1;
global.item1Bought = false;
global.item2Bought = false;
global.item3Bought = false;
global.rerollTax = 0;

// Passive items
global.magnet = false;
global.magnetNum = 0;

// Overall run ranks
global.ranks = ["D","D","D","D","D","D"];

// Best Ranks
global.best1_1 = "F";
global.best1_2 = "F";
global.best1_3 = "F";
global.best1_4 = "F";
global.best1_5 = "F";
global.best2_1 = "F";
global.best2_2 = "F";
global.best2_3 = "F";
global.bestOverall = "F";

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
analogLeftPrev = false;
analogRightPrev = false;
analogLeftPrevD = false;
analogRightPrevD = false;
coinTextScale = 1;
healthTextScale = 1;
itemTextScale = 1;
armorTextScale = 1;
passiveItemTextScale = 1;
options = false;
deleted = false;
UIOffset = 0;
volumeArrows = true;

Load();

// Change max health depending on what was loaded
global.maxHealth += (global.healthUpgrades * 2);
global.health += (global.healthUpgrades * 2);

// If save file doesn't have new stuff, add them in
if(global.best1_1 == "0")
{
	global.best1_1 = "F";
	global.best1_2 = "F";
	global.best1_3 = "F";
	global.best1_4 = "F";
	global.best1_5 = "F";
	global.best2_1 = "F";
	global.best2_2 = "F";
	global.best2_3 = "F";
	global.bestOverall = "F";
	global.overallCoins = 0;
	global.healthUpgrades = 0;
	Save();
}