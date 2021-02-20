// Get Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);

// Calculate Horizontal Movement
var move = key_right - key_left;
var on_land = true

hsp = move * wlksp;

// Calculate Vertical Movement
vsp += grv;
if(place_meeting(x,y+1,oLand))
{
	if(key_jump) {
		vsp = -6;
		on_land = false;
	}
	if(hsp != 0 and vsp == grv) {
		sprite_index = sPlayerR;
	} else {
		sprite_index = sPlayer;
	}
}

// Horizontal Collision
if(place_meeting(x+hsp,y,oLand))
{
	while(!place_meeting(x+sign(hsp),y,oLand))
	{
		x += sign(hsp);
	}
	hsp = 0;
} 
x += hsp;

// Vertival Collision
if(place_meeting(x,y+vsp,oLand))
{
	while(!place_meeting(x,y+sign(vsp),oLand))
	{
		y += sign(vsp);
	}
	vsp = 0;
	on_land = true;
} 

if (!on_land) sprite_index = sPlayerJ;

y += vsp;

if(hsp != 0) image_xscale = sign(hsp);