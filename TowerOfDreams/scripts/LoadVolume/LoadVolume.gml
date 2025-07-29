// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadVolume(){
	ini_open("savedata.ini");
	global.volume = ini_read_real("savegame", "volume", 6);
	ini_close();
}