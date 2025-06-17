/// @description Init

display_set_gui_size(256,144);
global.controller = 0;
global.paused = false;

global.dreamBoy = false;
global.dreamBoyYTarget = 192;
global.dreamBoyY = global.dreamBoyYTarget;
global.dreamBoyOn = false;
global.dreamBoyTurnedOn = false;
global.blockSprites = [sBlockathan3D,sGravitro3D,sExtras3D];
global.blockScales = [0,0,0];
global.UIBarY = 0;
global.UIBarYTarget = 0;
global.dreamBoyState = 0;
global.targetBlockScales = [0,0,0];
global.currentApp = 0;
global.labelSprites = [sItemLabel,sFoesLabel,sExtrasLabel];
global.labelY = [0,0,0];
global.labelYTarget = [0,0,0];
global.blockXTarget = [0,0,0];
global.blockX = [0,0,0];

// DB Items
global.dbItemSprites = [tile000,tile001,tile002,tile003,tile004,tile005,tile006,tile007,tile008,tile009,tile010,tile011,tile012,tile013,tile014,tile015,tile016,tile017,tile018,tile019,tile020,tile021,tile022,tile023,tile024,tile025,tile026,tile027,tile028,tile029,tile030,tile031,tile032,tile033,tile034,tile035];
global.dbIds = [23,7,32,14,18,12,9,21,35,29,25,1,6,13,2,10,24,31,20,16,24,17,5,19,3,28,22,15,30,8,4,0,33,27,11,26];
global.itemWindowY = 0;
global.itemWindowYTarget = 0;
global.currentItem = 0;
global.floppyY = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
global.floppyYTarget = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
global.floppyX = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
global.floppyXTarget = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
global.itemFileNames = ["ARMOR TROPHY","BOUNCING AXE","BAG OF WINDS","REMOTE SURPRISE","BLOCKATHAN","JESTER BOMB","DOOMERANG","WINGED BOOTS","GEM CANNON","REWARDS CARD","CHARGE BLADE","SPEED CITRUS","RAGE COLA","CRIT PB","CRIT JELLY","DIMAOND DYNAMITE","FUZZY DICE","GHOST IN A JAR","GOBLET OF BLOOD","SMITH HAMMER","HEART MAGNET","HEART TROPHY","HEAVY BOOTS","KUNAI","LIGHTNING BOTTLE","GEM MAGNET","MITOSIS MARACAS","NINJA STAR","THE PEPPER","LUCKY PICKAXE","WERE RABBIT FOOT","ENCHANTED SHIELD","SHOCK BRACELET","CHAOS SHOVEL","SPRAY N PRAY","WAX WINGS"];
global.itemFileDescriptions =
["ENEMIES HAVE A HIGHER CHANCE TO DROP ARMOR",
"BOUNCES OFF ENEMIES AND GAINS POWER WHEN IT DOES",
"SOAR HIGHER WHEN STRIKING THE GROUND",
"DEPLOY A MINE AND PRESS AGAIN TO DETONATE",
"PLACE A BLOCK RIGHT UNDER YOU",
"THROW A BOMB STRAIGHT DOWN",
"GETS STRONGER ON THE WAY BACK",
"HOLD TO RUN",
"FIRES STRONG PROJECTILES BUT USES GEMS",
"20 PERCENT OFF IN THE SHOP",
"EVERY THIRD HIT DOES DOUBLE DAMAGE",
"STRIKE THE GROUND TO GAIN A BURST OF SPEED",
"DOUBLE DAMAGE ON ONE HEART",
"CRITICAL HITS DO MORE DAMAGE AND HEAL YOU",
"HIGHER CHANCE FOR CRITICAL HITS",
"GILDED FOES EXPLODE INTO WAY MORE GEMS",
"REROLLS ARE 10 GEMS OFF IN THE SHOP",
"STAY INVINCIBLE LONGER AFTER GETTING HIT",
"HEAL AFTER EVERY 6 KILLS",
"WHEN YOU GAIN 1 ARMOR GAIN 2 INSTEAD",
"ATTRACTS HEARTS",
"ENEMIES HAVE A HIGHER CHANCE TO DROP HEARTS",
"SPAWN SHOCKWAVES WHEN LANDING",
"THROW A QUICK KNIFE",
"GRANTS A SHORT INVINCIBLE DASH",
"ATTRACTS GEMS",
"GET 2 OF EVERY THIRD PASSIVE ITEM",
"PRESS TWICE TO TELEPORT TO NINJA STAR",
"ALL YOUR PROJECTILES EXPLODE",
"20 PERCENT CHANCE FOR GEMS TO BE WORTH MORE",
"GILDED ENEMIES APPEAR MORE OFTEN",
"GAIN 1 ARMOR AT THE START OF EVERY LEVEL",
"STRIKE THE GROUND TO SPAWN SHOCKWAVES",
"STRIKE THE GROUND TO SPAWN DIRT",
"SHOOTS SMALL PROJECTILES IN ALL DIRECTIONS",
"GRANTS AN EXTRA JUMP"];

// DB Foes
global.dbFoeSprites = [sSlimeGB,sCannonGB,sGravityGB,sBallGB,sFlyingGB,sWrenchGB,sTankGB,sTankStationaryGB,sSawbladeGB,sCloudGB,sFirePlantGB];
global.dbFoeBigSprites = [sSlimeGBBig,sCannonGBBig,sGravityGBBig,sBallGBBig,sFlyingGBBig,sWrenchGBBig,sTankGBBig,sTankStationaryGBBig,sSawbladeGBBig,sCloudGBBig,sFirePlantGBBig];
global.foeWindowY = 0;
global.foeWindowYTarget = 0;
global.currentFoe = 0;
global.floppyFoeY = [0,0,0,0,0,0,0,0,0,0,0];
global.floppyFoeYTarget = [0,0,0,0,0,0,0,0,0,0,0];
global.floppyFoeX = [0,0,0,0,0,0,0,0,0,0,0];
global.floppyFoeXTarget = [0,0,0,0,0,0,0,0,0,0,0];
global.foeFileNames = ["COMMON SLIME","GIZMO CANNON","GRAVITY JACK","BARROLLO","FLAP DEMON","GIZMO WRENCH", "GIZMO TREADS", "GIZMO SENTRY","SAWBLADE","CANNON CLOUD","CALIENTE SHRUB"];
global.foeFileDescriptions =
["A COMMON ENEMY THAT WALKS BACK AND FORTH",
"WINDS UP AND SHOOTS CANNON BALLS",
"SWITCHES GRAVITY BETWEEN UP AND DOWN",
"ROLLS AND BOUNCES OFF WALLS",
"A DEMON THAT FLIES BACK AND FORTH",
"WINDS UP AND LOBS WRENCHES",
"A MOVING TANK THAT SHOOTS MISSLES",
"A ROOTED SENTRY THAT SHOOTS MISSLES",
"A DEADLY SHARP ENEMY THAT CLINGS TO WALLS",
"A CLOUD THAT SHOOTS VERTICALLY",
"A PLANT THAT SHOOTS FOUR TIMES"];

// DB Extras
global.extraSprites = [sPostcard];
global.extraSpriteY = 0;
global.extraSpriteYTarget = 0;

// DB Unlocks
global.itemsFound = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
global.enemiesFound = [0,0,0,0,0,0,0,0,0,0,0];

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
global.timeTrial = false;
global.time = 0;
global.timeIncrement = true;
global.timeLevel = 0;
global.sideRoomArray = [rTreasureRoom,rTreasureRoom2];
global.sideRoomArray2 = [rTreasureRoomFloor2,rTreasureRoom2Floor2];
global.sideRoomArray3 = [rTreasureRoomFloor3,rTreasureRoom2Floor3];
global.shopRoomArray = [rShop,rShop2];
global.shopRoomArray2 = [rShopFloor2,rShop2Floor2];
global.shopRoomArray3 = [rShopFloor3,rShop2Floor3];
global.levelArray = [rFloor1_1,rFloor1_2,rFloor1_3,rFloor1_4,rFloor1_5,rFloor1_6];
global.levelArray2 = [rFloor2_1,rFloor2_2,rFloor2_3,rFloor2_4,rFloor2_5];
global.levelArray3 = [rFloor3_1,rFloor3_2,rFloor3_3,rFloor3_4];
global.levelArray4 = [rFloor4_1,rFloor4_2,rFloor4_3];
global.usedArray = [false,false,false,false,false,false,false,false,false,false];
global.usedArray2 = [false,false,false,false,false,false,false,false,false,false];
global.usedArray3 = [false,false,false,false,false,false,false,false,false,false];
global.usedArray4 = [false,false,false,false,false,false,false,false,false,false];
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
global.hubTestMusic = false;
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
global.arrowSprite = sArrowGremlinIdle;
global.doorSprite = sDoorGremlinIdle;

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
global.best4_1 = "F";
global.best4_2 = "F";
global.best4_3 = "F";
global.bestOverall = "F";

// Levels Seen
global.seen1_1 = false;
global.seen1_2 = false;
global.seen1_3 = false;
global.seen1_4 = false;
global.seen1_5 = false;
global.seen1_6 = false;
global.seen2_1 = false;
global.seen2_2 = false;
global.seen2_3 = false;
global.seen2_4 = false;
global.seen2_5 = false;
global.seen3_1 = false;
global.seen3_2 = false;
global.seen3_3 = false;
global.seen3_4 = false;
global.seen4_1 = false;
global.seen4_2 = false;
global.seen4_3 = false;

// Level Times
global.time1_1 = 0;
global.time1_2 = 0;
global.time1_3 = 0;
global.time1_4 = 0;
global.time1_5 = 0;
global.time1_6 = 0;
global.time2_1 = 0;
global.time2_2 = 0;
global.time2_3 = 0;
global.time2_4 = 0;
global.time2_5 = 0;
global.time3_1 = 0;
global.time3_2 = 0;
global.time3_3 = 0;
global.time3_4 = 0;
global.time4_1 = 0;
global.time4_2 = 0;
global.time4_3 = 0;

// Level Time Medals
global.timeMedalSilver1_1 = false;
global.timeMedalGold1_1 = false;
global.timeMedalSilver1_2 = false;
global.timeMedalGold1_2 = false;
global.timeMedalSilver1_3 = false;
global.timeMedalGold1_3 = false;
global.timeMedalSilver1_4 = false;
global.timeMedalGold1_4 = false;
global.timeMedalSilver1_5 = false;
global.timeMedalGold1_5 = false;
global.timeMedalSilver1_6 = false;
global.timeMedalGold1_6 = false;
global.timeMedalSilver2_1 = false;
global.timeMedalGold2_1 = false;
global.timeMedalSilver2_2 = false;
global.timeMedalGold2_2 = false;
global.timeMedalSilver2_3 = false;
global.timeMedalGold2_3 = false;
global.timeMedalSilver2_4 = false;
global.timeMedalGold2_4 = false;
global.timeMedalSilver2_5 = false;
global.timeMedalGold2_5 = false;
global.timeMedalSilver3_1 = false;
global.timeMedalGold3_1 = false;
global.timeMedalSilver3_2 = false;
global.timeMedalGold3_2 = false;
global.timeMedalSilver3_3 = false;
global.timeMedalGold3_3 = false;
global.timeMedalSilver3_4 = false;
global.timeMedalGold3_4 = false;
global.timeMedalSilver4_1 = false;
global.timeMedalGold4_1 = false;
global.timeMedalSilver4_2 = false;
global.timeMedalGold4_2 = false;
global.timeMedalSilver4_3 = false;
global.timeMedalGold4_3 = false;

global.timeTargetGold = 600;
global.timeTargetSilver = 700;

global.timeMedalSilver1_1Target = 700;
global.timeMedalGold1_1Target = 600;
global.timeMedalSilver1_2Target = 7000;
global.timeMedalGold1_2Target = 6000;
global.timeMedalSilver1_3Target = 7000;
global.timeMedalGold1_3Target = 6000;
global.timeMedalSilver1_4Target = 7000;
global.timeMedalGold1_4Target = 6000;
global.timeMedalSilver1_5Target = 7000;
global.timeMedalGold1_5Target = 6000;
global.timeMedalSilver1_6Target = 7000;
global.timeMedalGold1_6Target = 6000;
global.timeMedalSilver2_1Target = 7000;
global.timeMedalGold2_1Target = 6000;
global.timeMedalSilver2_2Target = 7000;
global.timeMedalGold2_2Target = 6000;
global.timeMedalSilver2_3Target = 7000;
global.timeMedalGold2_3Target = 6000;
global.timeMedalSilver2_4Target = 7000;
global.timeMedalGold2_4Target = 6000;
global.timeMedalSilver2_5Target = 7000;
global.timeMedalGold2_5Target = 6000;
global.timeMedalSilver3_1Target = 7000;
global.timeMedalGold3_1Target = 6000;
global.timeMedalSilver3_2Target = 7000;
global.timeMedalGold3_2Target = 6000;
global.timeMedalSilver3_3Target = 7000;
global.timeMedalGold3_3Target = 6000;
global.timeMedalSilver3_4Target = 7000;
global.timeMedalGold3_4Target = 6000;
global.timeMedalSilver4_1Target = 7000;
global.timeMedalGold4_1Target = 6000;
global.timeMedalSilver4_2Target = 7000;
global.timeMedalGold4_2Target = 6000;
global.timeMedalSilver4_3Target = 7000;
global.timeMedalGold4_3Target = 6000;

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

// Floor 4
global.graveX4_1 = 0;
global.graveY4_1 = 0;
global.graveItem4_1 = -1;

global.graveX4_2 = 0;
global.graveY4_2 = 0;
global.graveItem4_2 = -1;

global.graveX4_3 = 0;
global.graveY4_3 = 0;
global.graveItem4_3 = -1;

// Armor sets
global.palette = 0;
global.essence = 0;
global.zombieRevive = true;
global.redUnlocked = false;
global.greenUnlocked = false;
global.zombieUnlocked = false;
global.goldUnlocked = false;

// Determine default resolution
if(display_get_width() / display_get_height() <= 1.25)
{
	global.displayMode = 2;
}
else if(display_get_width() / display_get_height() <= 1.6)
{
	global.displayMode = 1;
}
else
{
	global.displayMode = 0;
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
timeTextScale = 1;
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