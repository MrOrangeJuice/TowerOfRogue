/// @description Spawn giant gem

gem = instance_create_layer(x+2,y-4,"Collectables",oGiantGem);
gem.value = global.itemPrices[item] / 2;