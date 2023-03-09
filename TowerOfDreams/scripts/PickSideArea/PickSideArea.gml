// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PickSideArea(){
	
	levelChoice = 0;
	randomize();
	levelChoice = irandom_range(0,array_length(global.sideRoomArray)-1);
		
	// Go to level we picked
	SlideTransition(TRANS_MODE.GOTO,global.sideRoomArray[levelChoice]);
}