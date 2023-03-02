/// @description End Level

if(room == rTutorial)
{
	SlideTransition(TRANS_MODE.NEXT);
}
else
{
	SlideTransition(TRANS_MODE.RESTART);	
}
instance_destroy();