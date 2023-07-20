/// @description Init

vsp = 0;
acceleration = 0.01;

// Determine item
switch(bubbleNum)
{
	case 1:
		if(global.item1Bought) instance_destroy();
		if(global.shopItem1 == -1)
		{
			item = irandom_range(0,array_length(global.itemObjects)-1);
			global.shopItem1 = item;
		}
		else
		{
			item = global.shopItem1;	
		}
		break;
	case 2:
		if(global.item2Bought) instance_destroy();
		if(global.shopItem2 == -1)
		{
			item = irandom_range(0,array_length(global.itemObjects)-1);
			global.shopItem2 = item;
		}
		else
		{
			item = global.shopItem2;	
		}
		break;
	case 3:
		if(global.item3Bought) instance_destroy();
		if(global.shopItem3 == -1)
		{
			item = irandom_range(0,array_length(global.itemObjects)-1);
			global.shopItem3 = item;
		}
		else
		{
			item = global.shopItem3;	
		}
		break;
}