/// @description Init

particleSystem = part_system_create();

particleTypeAxeFade = part_type_create();

part_type_sprite(particleTypeAxeFade,sAxe,0,0,1);
part_type_size(particleTypeAxeFade,1,1,0,0);

part_type_life(particleTypeAxeFade,20,20);
part_type_alpha3(particleTypeAxeFade, 0.5, 0.3, 0.1);