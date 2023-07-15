/// @description Get Gem

// Update spot in array
listSize = ds_list_size(global.coinArray);
for(i = 0; i < listSize; i++)
{
	// Get array of [id,collected] from list of coins
	coinData = array_create(2);
	coinData = global.coinArray[| i];
	if(coinData[0] == other.id && coinData[1] == true)
	{
		// Update back in list
		global.coinArray[| i] = [coinData[0],false];	
	}
}

// Determine VFX based on value
if(other.value == 2)
{
	instance_create_layer(other.x,other.y,"CoinVFX",oItemVFX);
}
else
{
	instance_create_layer(other.x,other.y,"CoinVFX",oCoinVFX);
}
global.coins += other.value;
global.localCoins++;
audio_play_sound(snd_Gem,5,false);
with (oGame) coinTextScale = 1.15;
instance_destroy(other);