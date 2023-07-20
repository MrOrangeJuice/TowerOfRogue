/// @description Init

audio_play_sound(snd_LevelIntro1,5,false);
levelFinished = true;
gems = false;
gemNum = 0;
totalGemNum = oLevelInfo.totalGems;
damageNum = global.localDamage;
damageDisplay = false;
gemsEnded = false;
perfectGems = false;
damage = false;
perfectDamage = false;
rank = false;
rankLetter = false;
perfectRank = false;
continutePrompt = false;

// Determine rank
rankScore = 20;
yourRank = "B";

// Gems
rankScore -= floor((oLevelInfo.totalGems - global.localCoins) / 5);

// Make sure rank score doesn't lose more than 5 from gems
if(rankScore < 10) rankScore = 10;

// Damage
rankScore -= global.localDamage;

// Figure out rank
if(rankScore == 20)
{
	yourRank = "S";	
}
else if(rankScore >= 15)
{
	yourRank = "A";	
}
else if(rankScore >= 10)
{
	yourRank = "B";	
}
else if(rankScore >= 5)
{
	yourRank = "C";	
}
else
{
	yourRank = "D";	
}



// Gem alarm
alarm[0] = room_speed * 0.3;