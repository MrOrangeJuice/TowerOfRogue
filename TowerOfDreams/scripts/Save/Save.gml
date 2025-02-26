// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Save(){
	ini_open("savedata.ini");
	ini_write_real("savegame", "tutorialCompleted", global.tutorialCompleted);
	ini_write_real("savegame", "floor1Completed", global.floor1Completed);
	ini_write_real("savegame", "floor2Completed", global.floor2Completed);
	ini_write_real("savegame", "runCompleted", global.runCompleted);
    
	ini_write_string("savegame", "best1_1", global.best1_1);
	ini_write_string("savegame", "best1_2", global.best1_2);
	ini_write_string("savegame", "best1_3", global.best1_3);
	ini_write_string("savegame", "best1_4", global.best1_4);
	ini_write_string("savegame", "best1_5", global.best1_5);
	ini_write_string("savegame", "best1_6", global.best1_6);
	ini_write_string("savegame", "best2_1", global.best2_1);
	ini_write_string("savegame", "best2_2", global.best2_2);
	ini_write_string("savegame", "best2_3", global.best2_3);
	ini_write_string("savegame", "best2_4", global.best2_4);
	ini_write_string("savegame", "best2_5", global.best2_5);
	ini_write_string("savegame", "best3_1", global.best3_1);
	ini_write_string("savegame", "best3_2", global.best3_2);
	ini_write_string("savegame", "best3_3", global.best3_3);
	ini_write_string("savegame", "best3_4", global.best3_4);
	ini_write_string("savegame", "best4_1", global.best4_1);
	ini_write_string("savegame", "best4_2", global.best4_2);
	ini_write_string("savegame", "best4_3", global.best4_3);
    
    ini_write_string("savegame", "seen1_1", global.seen1_1);
    ini_write_string("savegame", "seen1_2", global.seen1_2);
    ini_write_string("savegame", "seen1_3", global.seen1_3);
    ini_write_string("savegame", "seen1_4", global.seen1_4);
    ini_write_string("savegame", "seen1_5", global.seen1_5);
    ini_write_string("savegame", "seen1_6", global.seen1_6);
    ini_write_string("savegame", "seen2_1", global.seen2_1);
    ini_write_string("savegame", "seen2_2", global.seen2_2);
    ini_write_string("savegame", "seen2_3", global.seen2_3);
    ini_write_string("savegame", "seen2_4", global.seen2_4);
    ini_write_string("savegame", "seen2_5", global.seen2_5);
    ini_write_string("savegame", "seen3_1", global.seen3_1);
    ini_write_string("savegame", "seen3_2", global.seen3_2);
    ini_write_string("savegame", "seen3_3", global.seen3_3);
    ini_write_string("savegame", "seen3_4", global.seen3_4);
    ini_write_string("savegame", "seen4_1", global.seen4_1);
    ini_write_string("savegame", "seen4_2", global.seen4_2);
    ini_write_string("savegame", "seen4_3", global.seen4_3);
    
	ini_write_real("savegame", "graveX1_1", global.graveX1_1);
	ini_write_real("savegame", "graveX1_2", global.graveX1_2);
	ini_write_real("savegame", "graveX1_3", global.graveX1_3);
	ini_write_real("savegame", "graveX1_4", global.graveX1_4);
	ini_write_real("savegame", "graveX1_5", global.graveX1_5);
	ini_write_real("savegame", "graveX1_6", global.graveX1_6);
	ini_write_real("savegame", "graveX2_1", global.graveX2_1);
	ini_write_real("savegame", "graveX2_2", global.graveX2_2);
	ini_write_real("savegame", "graveX2_3", global.graveX2_3);
	ini_write_real("savegame", "graveX2_4", global.graveX2_4);
	ini_write_real("savegame", "graveX2_5", global.graveX2_5);
	ini_write_real("savegame", "graveX3_1", global.graveX3_1);
	ini_write_real("savegame", "graveX3_2", global.graveX3_2);
	ini_write_real("savegame", "graveX3_3", global.graveX3_3);
	ini_write_real("savegame", "graveX3_4", global.graveX3_4);
	ini_write_real("savegame", "graveX4_1", global.graveX4_1);
	ini_write_real("savegame", "graveX4_2", global.graveX4_2);
	ini_write_real("savegame", "graveX4_3", global.graveX4_3);
	ini_write_real("savegame", "graveY1_1", global.graveY1_1);
	ini_write_real("savegame", "graveY1_2", global.graveY1_2);
	ini_write_real("savegame", "graveY1_3", global.graveY1_3);
	ini_write_real("savegame", "graveY1_4", global.graveY1_4);
	ini_write_real("savegame", "graveY1_5", global.graveY1_5);
	ini_write_real("savegame", "graveY1_6", global.graveY1_6);
	ini_write_real("savegame", "graveY2_1", global.graveY2_1);
	ini_write_real("savegame", "graveY2_2", global.graveY2_2);
	ini_write_real("savegame", "graveY2_3", global.graveY2_3);
	ini_write_real("savegame", "graveY2_4", global.graveY2_4);
	ini_write_real("savegame", "graveY2_5", global.graveY2_5);
	ini_write_real("savegame", "graveY3_1", global.graveY3_1);
	ini_write_real("savegame", "graveY3_2", global.graveY3_2);
	ini_write_real("savegame", "graveY3_3", global.graveY3_3);
	ini_write_real("savegame", "graveY3_4", global.graveY3_4);
	ini_write_real("savegame", "graveY4_1", global.graveY4_1);
	ini_write_real("savegame", "graveY4_2", global.graveY4_2);
	ini_write_real("savegame", "graveY4_3", global.graveY4_3);
	ini_write_real("savegame", "graveItem1_1", global.graveItem1_1);
	ini_write_real("savegame", "graveItem1_2", global.graveItem1_2);
	ini_write_real("savegame", "graveItem1_3", global.graveItem1_3);
	ini_write_real("savegame", "graveItem1_4", global.graveItem1_4);
	ini_write_real("savegame", "graveItem1_5", global.graveItem1_5);
	ini_write_real("savegame", "graveItem1_6", global.graveItem1_6);
	ini_write_real("savegame", "graveItem2_1", global.graveItem2_1);
	ini_write_real("savegame", "graveItem2_2", global.graveItem2_2);
	ini_write_real("savegame", "graveItem2_3", global.graveItem2_3);
	ini_write_real("savegame", "graveItem2_4", global.graveItem2_4);
	ini_write_real("savegame", "graveItem2_5", global.graveItem2_5);
	ini_write_real("savegame", "graveItem3_1", global.graveItem3_1);
	ini_write_real("savegame", "graveItem3_2", global.graveItem3_2);
	ini_write_real("savegame", "graveItem3_3", global.graveItem3_3);
	ini_write_real("savegame", "graveItem3_4", global.graveItem3_4);
	ini_write_real("savegame", "graveItem4_1", global.graveItem4_1);
	ini_write_real("savegame", "graveItem4_2", global.graveItem4_2);
	ini_write_real("savegame", "graveItem4_3", global.graveItem4_3);
    
	ini_write_string("savegame", "bestOverall", global.bestOverall);
	ini_write_real("savegame", "overallCoins", global.overallCoins);
	ini_write_real("savegame", "healthUpgrades", global.healthUpgrades);
	ini_write_real("savegame", "itemUpgrades", global.itemUpgrades);
	ini_write_real("savegame", "redUnlocked", global.redUnlocked);
	ini_write_real("savegame", "greenUnlocked", global.greenUnlocked);
	ini_write_real("savegame", "zombieUnlocked", global.zombieUnlocked);
	ini_write_real("savegame", "goldUnlocked", global.goldUnlocked);
	ini_write_real("savegame", "palette", global.palette);
	ini_write_real("savegame", "essence", global.essence);
	ini_write_real("savegame", "volume", global.volume);
	ini_write_real("savegame", "totalDeaths", global.totalDeaths);
	for(i = 0; i < array_length(global.itemsFound); i++)
	{
		ini_write_real("savegame","itemsFound"+string(i), global.itemsFound[i]);
	}
	for(i = 0; i < array_length(global.enemiesFound); i++)
	{
		ini_write_real("savegame","enemiesFound"+string(i), global.enemiesFound[i]);
	}
	ini_close();
}