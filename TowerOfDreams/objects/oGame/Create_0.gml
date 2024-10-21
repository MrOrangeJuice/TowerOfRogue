/// @description Init

display_set_gui_size(256,144);
global.controller = 0;
global.paused = false;
global.dreamBoy = false;
global.dreamBoyYTarget = 192;
global.dreamBoyY = global.dreamBoyYTarget;
global.dreamBoyOn = false;
global.dreamBoyTurnedOn = false;
global.hitStop = false;
global.canPause = false;
global.coins = 0;
global.overallCoins = 0;
global.coinsThisRun = 0;
global.localCoins = 0;
global.localDamage = 0;
global.healthUpgrades = 0;
global.itemUpgrades = 0;
global.maxHealth = 6;
global.health = 6;
global.armor = 0;
global.infiniteHealth = false;
global.item = -1;
global.itemSprites = [sKunaiUI,sBootsUI,sShockUI,sCritUI,sGobletUI,sColaUI,sCardUI,sHeartTrophyUI,sWingsUI,sPickaxeUI,sMagnetUI,sAxeUI,sBoomerangUI,sCritPBUI,sBagUI,sChargeUI,sLightUI,sShieldUI,sHeartMagnetUI,sFuzzyDiceUI,sSprayUI,sGhostJarUI,sBombUI,sHammerUI,sBirthdayUI,sPepperUI,sHeavyBootsUI,sDynamiteUI,sRabbitUI,sCannonUI,sBlockUI,sArmorTrophyUI,sShovelUI,sNinjaUI,sCitrusUI,sMaracasUI,sArmor,sHeart];
global.itemObjects = [oKunaiItem,oBootsItem,oShockItem,oCritItem,oGobletItem,oColaItem,oCardItem,oHeartTrophyItem,oWingsItem,oPickaxeItem,oMagnetItem,oAxeItem,oBoomerangItem,oCritPBItem,oBagItem,oChargeItem,oLightItem,oShieldItem,oHeartMagnetItem,oFuzzyDiceItem,oSprayItem,oGhostJarItem,oBombItem,oHammerItem,oBirthdayItem,oPepperItem,oHeavyBootsItem,oDynamiteItem,oRabbitItem,oCannonItem,oBlockItem,oArmorTrophyItem,oShovelItem,oNinjaItem,oCitrusItem,oMaracasItem,oArmor,oHeart];
global.passiveItemObjects = [oShockItem,oCritItem,oGobletItem,oColaItem,oCardItem,oHeartTrophyItem,oPickaxeItem,oMagnetItem,oCritPBItem,oBagItem,oChargeItem,oShieldItem,oHeartMagnetItem,oFuzzyDiceItem,oGhostJarItem,oHammerItem,oPepperItem,oHeavyBootsItem,oDynamiteItem,oRabbitItem,oArmorTrophyItem,oShovelItem,oCitrusItem,oMaracasItem];
global.itemPrices = [120,100,100,100,120,80,100,150,150,100,120,120,120,100,120,120,150,120,80,80,100,100,150,100,120,80,100,80,100,120,120,120,100,120,100,120,50,50];
global.itemNames = ["Kunai","Winged Boots","Shock Bracelet","Crit Jelly","Goblet of Blood","Rage Cola","Rewards Card","Heart Trophy","Wax Wings","Lucky Pickaxe","Gem Magnet","Bouncing Axe","Doomerang","Crit Peanut Butter","Bag of Winds","Charge Blade","Lightning in a Bottle","Enchanted Shield","Heart Magnet","Fuzzy Dice","The Spray N' Pray","Ghost in a Jar","Jester Bomb","Blacksmith's Hammer","Remote Birthday Surprise","Scoville Screamer","Heavy Boots","Diamond Dynamite","Were-Rabbit's Foot","Gem Cannon","Blockathan","Armor Trophy","Chaos Shovel","Ninja Star","Speed Citrus","Mitosis Maracas","Armor","Heart"];
global.itemTypes = ["Active","Active","Passive","Passive","Passive","Passive","Passive","Passive","Active","Passive","Passive","Active","Active","Passive","Passive","Passive","Active","Passive","Passive","Passive","Active","Passive","Active","Passive","Active","Passive","Passive","Passive","Passive","Active","Active","Passive","Passive","Active","Passive","Passive","Pickup","Pickup"];
global.passiveItems = [];
global.passiveUIWrap = 20;
global.passiveItemSprites = [sShockUI,sCritUI,sGobletUI,sColaUI,sCardUI,sHeartTrophyUI,sPickaxeUI,sMagnetUI,sCritPBUI,sBagUI,sChargeUI,sShieldUI,sHeartMagnetUI,sFuzzyDiceUI,sGhostJarUI,sHammerUI,sPepperUI,sHeavyBootsUI,sDynamiteUI,sRabbitUI,sArmorTrophyUI,sShovelUI,sCitrusUI,sMaracasUI];
global.itemDescriptions = 
["A quick throwing knife",
"Hold to run",
"Strike the earth to spawn shockwaves",
"Critical hit chance up by 25%",
"Get 6 kills to get a heart",
"Double damage on 1 heart",
"20% off in the shop",
"Hearts drop more often",
"Grants an extra jump",
"Gems have a 20% chance to be worth double",
"Attracts gems",
"Bounces and increases damage when hitting an enemy",
"Does double damage on the way back",
"Critical hits heal you for half a heart",
"Get a bigger bounce when striking the ground",
"Every third sword strike does double damage",
"Grants a quick invincible dash",
"Get a piece of armor every level",
"Attracts hearts",
"Rerolls are 10 gems cheaper in the shop",
"Shoots small projectiles in all directions",
"More invincibility when hit",
"Throw a bomb straight down, use on the ground to soar",
"Anytime you gain 1 armor, gain 2 instead",
"Press once to set a remote mine, press again to detonate",
"Your projectiles EXPLODE",
"Spawn shockwaves when you land",
"Gilded enemies spawn WAY more gems when killed",
"Gilded enemies appear more often",
"Shoots strong projectiles but uses gems as ammo",
"Spawn a block under you",
"Armor drops more often",
"Strike the ground to spawn dirt projectiles",
"Throw a ninja star and press again to teleport to it",
"Strike the ground for a huge burst of momentum",
"Get 2 of every third passive item you pick up"];
global.sword = true;
global.tutorialCompleted = false;
global.floor1Completed = false;
global.floor2Completed = false;
global.runCompleted = false;
global.inARun = false;
global.sideRoomArray = [rTreasureRoom,rTreasureRoom2];
global.sideRoomArray2 = [rTreasureRoomFloor2,rTreasureRoom2Floor2];
global.sideRoomArray3 = [rTreasureRoomFloor3,rTreasureRoom2Floor3];
global.shopRoomArray = [rShop,rShop2];
global.shopRoomArray2 = [rShopFloor2,rShop2Floor2];
global.shopRoomArray3 = [rShopFloor3,rShop2Floor3];
global.levelArray = [rFloor1_1,rFloor1_2,rFloor1_3,rFloor1_4,rFloor1_5,rFloor1_6];
global.levelArray2 = [rFloor2_1,rFloor2_2,rFloor2_3,rFloor2_4,rFloor2_5];
global.levelArray3 = [rFloor3_1,rFloor3_2,rFloor3_3,rFloor3_4];
global.usedArray = [false,false,false,false,false,false,false,false,false,false];
global.usedArray2 = [false,false,false,false,false,false,false,false,false,false];
global.usedArray3 = [false,false,false,false,false,false,false,false,false,false];
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
global.maracasCombo = 0;
global.gobletVFX = [o1,o2,o3,o4,o5,oHealthGetVFX];
global.maracasVFX = [o1,o2,oItemx2VFX];
global.tutorialMusic = false;
global.floor1Music = false;
global.shopMusic = false;
global.treasureMusic = false;
global.hubMusic = false;
global.hubShopMusic = false;
global.bumperSwitch = true;
global.bumpersSwitching = false;
global.lavaId = 0;
global.displayLC = false;
global.volume = 6;
global.music = true;
global.HUD = true;
global.controllerDebug = false;
global.showCollision = false;
global.hardMode = false;
global.dropItemHold = 0;
global.totalDeaths = 0;
global.armed = false;
global.blockSpawning = false;
global.debug = false;
global.debugCounter = 0;
global.debugDisplay = 0;

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
global.heartMagnet = false;
global.heartMagnetNum = 0;

global.devItem = 0;
global.drawDevItem = false;

// Overall run ranks
global.ranks = ["D","D","D","D","D","D","D","D","D"];

// Best Ranks
global.best1_1 = "F";
global.best1_2 = "F";
global.best1_3 = "F";
global.best1_4 = "F";
global.best1_5 = "F";
global.best1_6 = "F";
global.best2_1 = "F";
global.best2_2 = "F";
global.best2_3 = "F";
global.best2_4 = "F";
global.best2_5 = "F";
global.best3_1 = "F";
global.best3_2 = "F";
global.best3_3 = "F";
global.best3_4 = "F";
global.bestOverall = "F";

// Grave data
// Floor 1
global.graveX1_1 = 0;
global.graveY1_1 = 0;
global.graveItem1_1 = -1;

global.graveX1_2 = 0;
global.graveY1_2 = 0;
global.graveItem1_2 = -1;

global.graveX1_3 = 0;
global.graveY1_3 = 0;
global.graveItem1_3 = -1;

global.graveX1_4 = 0;
global.graveY1_4 = 0;
global.graveItem1_4 = -1;

global.graveX1_5 = 0;
global.graveY1_5 = 0;
global.graveItem1_5 = -1;

global.graveX1_6 = 0;
global.graveY1_6 = 0;
global.graveItem1_6 = -1;

// Floor 2
global.graveX2_1 = 0;
global.graveY2_1 = 0;
global.graveItem2_1 = -1;

global.graveX2_2 = 0;
global.graveY2_2 = 0;
global.graveItem2_2 = -1;

global.graveX2_3 = 0;
global.graveY2_3 = 0;
global.graveItem2_3 = -1;

global.graveX2_4 = 0;
global.graveY2_4 = 0;
global.graveItem2_4 = -1;

global.graveX2_5 = 0;
global.graveY2_5 = 0;
global.graveItem2_5 = -1;

// Floor 3
global.graveX3_1 = 0;
global.graveY3_1 = 0;
global.graveItem3_1 = -1;

global.graveX3_2 = 0;
global.graveY3_2 = 0;
global.graveItem3_2 = -1;

global.graveX3_3 = 0;
global.graveY3_3 = 0;
global.graveItem3_3 = -1;

global.graveX3_4 = 0;
global.graveY3_4 = 0;
global.graveItem3_4 = -1;

// Armor sets
global.palette = 0;
global.essence = 0;
global.zombieRevive = true;
global.redUnlocked = false;
global.greenUnlocked = false;
global.zombieUnlocked = false;
global.goldUnlocked = false;

// Determine default resolution
if(display_get_width() / display_get_height() <= 1.6)
{
	global.res1610 = true;
}
else
{
	global.res1610 = false;
}

global.coinArray = ds_list_create();
global.enemyArray = ds_list_create();
global.slimeArray = ds_list_create();

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
ChangeVolume();

// Change max health depending on what was loaded
global.maxHealth += (global.healthUpgrades * 2);
global.health += (global.healthUpgrades * 2);