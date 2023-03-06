/// @description End Level

if(room == rHub)
{
	SlideTransition(TRANS_MODE.GOTO,rTutorial);	
}
else if(room == rTutorial)
{
	SlideTransition(TRANS_MODE.NEXT);
}
else if(room == rTutorial2)
{
	SlideTransition(TRANS_MODE.NEXT);	
}
instance_destroy();