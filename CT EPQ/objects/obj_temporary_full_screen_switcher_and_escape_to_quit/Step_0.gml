/// @description Insert description here
// You can write your code in this editor

// switching to and from fullscreen
if keyboard_check_pressed(vk_f11){
	if fullscreen = true{
		fullscreen = false;
	} else{
		fullscreen = true;
	}
}

window_set_fullscreen(fullscreen);

if keyboard_check_pressed(vk_escape){
	
}
