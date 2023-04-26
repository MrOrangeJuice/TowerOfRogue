// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PickShopArea(){
	
	levelChoice = 0;
	randomize();
	levelChoice = irandom_range(0,array_length(global.shopRoomArray)-1);
		
	// Go to level we picked
	SlideTransition(TRANS_MODE.GOTO,global.shopRoomArray[levelChoice]);
}