// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PickShopArea(){
	
	levelChoice = 0;
	randomize();
	
	// Floor 1
	if(global.levelCount < 3)
	{
		levelChoice = irandom_range(0,array_length(global.shopRoomArray)-1);
		
		// Go to level we picked
		SlideTransition(TRANS_MODE.GOTO,global.shopRoomArray[levelChoice]);
	}
	// Floor 2
	else
	{
		levelChoice = irandom_range(0,array_length(global.shopRoomArray2)-1);
		
		// Go to level we picked
		SlideTransition(TRANS_MODE.GOTO,global.shopRoomArray2[levelChoice]);
	}
}