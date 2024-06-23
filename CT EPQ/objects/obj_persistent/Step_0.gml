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

// 23/06/24 making it so that if escape held in any room other than menu, goes back to menu
if (room != rm_start_menu){
	if keyboard_check(vk_escape){
		// adding to quit timer if escape held
		escapePoints += 1;
	} else{
		// otherwise, sending back to zero
		escapePoints = 0;
	}
}
// going back to menu!
if (escapePoints > 160){
	escapePoints = 0;
	room_goto(rm_start_menu);
}