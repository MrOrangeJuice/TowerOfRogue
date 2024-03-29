/// @description Destroy and reroll items

audio_play_sound(snd_Reroll,5,false);
ScreenShake(4,12);
instance_create_layer(x,y,"VFX",oItemVFX);
// Spawn new bubble
instance_create_layer(296,1520,"Walls",oDiceBubbleRegrow);

// Reroll
with(oItemBubble)
{
	if(object_index != oDiceBubble)
	{
		switch(bubbleNum)
		{
			case 1:
				if(!global.item1Bought)
				{
					item = irandom_range(0,array_length(global.itemObjects)-1);
					global.shopItem1 = item;
				}	
				break;
			case 2:
				if(!global.item2Bought)
				{
					item = irandom_range(0,array_length(global.itemObjects)-1);
					global.shopItem2 = item;
				}
				break;
			case 3:
				if(!global.item3Bought)
				{
					item = irandom_range(0,array_length(global.itemObjects)-1);
					global.shopItem3 = item;
				}
				break;
		}
	}
}

global.rerollTax += 10;
instance_destroy();