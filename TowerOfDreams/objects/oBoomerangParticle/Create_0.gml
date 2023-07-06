/// @description Init

particleSystem = part_system_create();

particleTypeBoomerangFade = part_type_create();

part_type_sprite(particleTypeBoomerangFade,sBoomerang,0,0,1);
part_type_size(particleTypeBoomerangFade,1,1,0,0);

part_type_life(particleTypeBoomerangFade,20,20);
part_type_alpha3(particleTypeBoomerangFade, 0.5, 0.3, 0.1);