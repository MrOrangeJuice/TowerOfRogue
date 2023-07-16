/// @description Give armor

if (!armorGiven) global.armor++;
armorGiven = true;
audio_play_sound(snd_Armor,5,false);
with (oGame) armorTextScale = 1.15;