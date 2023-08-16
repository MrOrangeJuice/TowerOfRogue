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