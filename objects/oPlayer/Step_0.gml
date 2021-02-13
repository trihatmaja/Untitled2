// Get Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);

// Calculate Horizontal Movement
var move = key_right - key_left;

hsp = move * wlksp;

// Calculate Vertical Movement
vsp = vsp + grv;
if(place_meeting(x,y+1,oWall))
{
	if(key_jump) {
		vsp = -6;
	}
	if (hsp != 0) {
		sprite_index = sPlayerR;
	} else {
		sprite_index = sPlayer;
	}
} else if(!place_meeting(x,y+1,oWall)) {
	sprite_index = sPlayerJ;
	// if(sign(vsp) < 0) sprite_index = sPlayerJ;	else sprite_index = sPlayer;
}

// Horizontal Collision
if(place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x+sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// Vertival Collision
if(place_meeting(x,y+vsp,oWall))
{
	while(!place_meeting(x,y+vsp,oWall))
	{
		y = y+sign(vsp);
	}
	vsp = 0;
} 
y = y + vsp;

if(hsp != 0) image_xscale = sign(hsp);