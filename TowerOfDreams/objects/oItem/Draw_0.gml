/// @description Draw outline for gold essence

if(global.essence == 4 && itemPassiveId == -1)
{
	shader_set(shHit);
	draw_sprite_ext(sprite_index,0,x,y+1,1,1,image_angle,#f0d7b1,image_alpha);
	draw_sprite_ext(sprite_index,0,x,y-1,1,1,image_angle,#f0d7b1,image_alpha);
	draw_sprite_ext(sprite_index,0,x-1,y,1,1,image_angle,#f0d7b1,image_alpha);
	draw_sprite_ext(sprite_index,0,x+1,y,1,1,image_angle,#f0d7b1,image_alpha);
	/*
	draw_sprite_ext(sprite_index,0,x+1,y+1,1,1,image_angle,#f0d7b1,image_alpha);
	draw_sprite_ext(sprite_index,0,x+1,y-1,1,1,image_angle,#f0d7b1,image_alpha);
	draw_sprite_ext(sprite_index,0,x-1,y+1,1,1,image_angle,#f0d7b1,image_alpha);
	draw_sprite_ext(sprite_index,0,x-1,y-1,1,1,image_angle,#f0d7b1,image_alpha);
	*/
	shader_reset();
}

draw_self();