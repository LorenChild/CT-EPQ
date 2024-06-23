/// @description Insert description here
// You can write your code in this editor

// switching between menu options
inputUp = keyboard_check_pressed(vk_up);
inputDown = keyboard_check_pressed(vk_down);

overallInput = inputDown - inputUp;

if (overallInput > 0){
	optionSelected += 1;
} else if (overallInput < 0) optionSelected -= 1;

if (optionSelected = 2){
	optionSelected = 0;
} else if (optionSelected = -1) optionSelected = 1;


// doing what menu option says if enter pressed
if keyboard_check_pressed(vk_enter){
	if (optionSelected = 0){
		room_goto_next();
	} else if (optionSelected = 1) game_end();
}