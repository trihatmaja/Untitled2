x = oPlayer.x;
y = oPlayer.y;

image_angle = point_direction(x,y,mouse_x, mouse_y);

firing_delay -= 1;
recoil = max(0,recoil - 1);

if(mouse_check_button(mb_left) and (firing_delay < 0)) {
	firing_delay = 5;
	recoild = 4;
	with(instance_create_layer(x,y,"Bullets", oBullets)){
		speed = 25;
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}

x -= lengthdir_x(recoil, image_angle) 
y -= lengthdir_y(recoil, image_angle)