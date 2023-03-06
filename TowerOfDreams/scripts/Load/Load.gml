// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Load(){
	ini_open("savedata.ini");
	global.tutorialCompleted = ini_read_real("savegame", "tutorialCompleted", 0);
	ini_close();
}