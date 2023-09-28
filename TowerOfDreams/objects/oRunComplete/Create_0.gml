/// @description Init and start alarms

// Stop music just in case
audio_stop_sound(msc_Floor1);
audio_stop_sound(msc_Floor2);

lettersRemaining = 12;
drawOverallRankText = false;
drawOverallRank = false;
drawContinue = false;

// SFX alarm
alarm[0] = room_speed * 0.2;
// Overall rank text alarm
alarm[1] = room_speed * 3;
// Overall rank alarm
alarm[2] = room_speed * 6;
// Continue alarm
alarm[3] = room_speed * 9;

// Calculate rank
overallRank = "D";
rankSprite = sD;
overallScore = 0;
// Calculate overall score
for(i = 0; i < array_length(global.ranks); i++)
{
	switch(global.ranks[i])
	{
		case "S":
			overallScore += 5;
			break;
		case "A":
			overallScore += 4;
			break;
		case "B":
			overallScore += 3;
			break;
		case "C":
			overallScore += 2;
			break;
		case "D":
			overallScore += 1;
			break;
	}
}

if(overallScore >= 30)
{
	overallRank = "S";
	rankSprite = sS;
}
else if(overallScore >= 24)
{
	overallRank = "A";
	rankSprite = sA;
}
else if(overallScore >= 18)
{
	overallRank = "B";	
	rankSprite = sB;
}
else if(overallScore >= 12)
{
	overallRank = "C";	
	rankSprite = sC;
}
else if(overallScore >= 6)
{
	overallRank = "D";	
	rankSprite = sD;
}
else
{
	// Failsafe
	overallRank = "D";
	rankSprite = sD;
}

// Save rank

// Only save rank if it's better than current one
if(RankIsBetter(overallRank, global.bestOverall)) global.bestOverall = overallRank;

Save();