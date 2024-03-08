/// @description Insert description here
// You can write your code in this editor

// gets player input - temp variables

//var _up = keyboard_check(vk_up);
//var _down = keyboard_check(vk_down);
var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);

// working out if it should be going left/right, up/down or stationary, and how far
hsp = (_right-_left)*spd;
//vsp = (_down-_up)*spd; // down is positive

//collide and move - horizontal
if (place_meeting(x + hsp, y, obj_football_collision)) or (place_meeting(x + hsp, y, obj_football_ball)){
	while (abs(hsp) > 0.1){
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, obj_football_collision)) and (!place_meeting(x + hsp, y, obj_football_ball)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

//collide and move - vertical
if (place_meeting(x, y + vsp, obj_football_collision)) or (place_meeting(x, y + vsp, obj_football_ball)){
	while (abs(vsp) > 0.1){
		vsp *= 0.5;
		if (!place_meeting(x, y+vsp, obj_football_collision)) and (!place_meeting(x, y+vsp, obj_football_ball)) y += vsp;
	}
	vsp = 0;
}
y += vsp;


