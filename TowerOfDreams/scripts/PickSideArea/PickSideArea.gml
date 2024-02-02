// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PickSideArea(){
	
	levelChoice = 0;
	randomize();
	// Floor 1
	if(global.levelCount < 3)
	{
		levelChoice = irandom_range(0,array_length(global.sideRoomArray)-1);
				
		// Go to level we picked
		SlideTransition(TRANS_MODE.GOTO,global.sideRoomArray[levelChoice]);
	}
	// Floor 2
	else if(global.levelCount < 6)
	{
		levelChoice = irandom_range(0,array_length(global.sideRoomArray2)-1);
				
		// Go to level we picked
		SlideTransition(TRANS_MODE.GOTO,global.sideRoomArray2[levelChoice]);
	}
	// Floor 3
	else
	{
		levelChoice = irandom_range(0,array_length(global.sideRoomArray3)-1);
				
		// Go to level we picked
		SlideTransition(TRANS_MODE.GOTO,global.sideRoomArray3[levelChoice]);
	}
}