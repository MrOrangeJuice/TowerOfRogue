// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ChangeVolume(){
	// Actually change volume
	switch(global.volume)
	{
		case 0:
			audio_master_gain(0);
			break;
		case 1:
			audio_master_gain(0.17);
			break;
		case 2:
			audio_master_gain(0.33);
			break;
		case 3:
			audio_master_gain(0.5);
			break;
		case 4:
			audio_master_gain(0.67);
			break;
		case 5:
			audio_master_gain(0.83);
			break;
		case 6:
			audio_master_gain(1);
			break;
	}
}