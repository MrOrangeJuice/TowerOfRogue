/// @description Fire Cannon ball

if(sprite_index == sCannonFire)
{
	ball = instance_create_layer(x+(dir*8),y+1,"Enemies",oCannonBall);
	ball.dir = dir;
	sprite_index = sCannon;
	alarm[0] = room_speed * fireGap;
}