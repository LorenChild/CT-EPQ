/// @description Insert description here
// You can write your code in this editor

// drawing first character
if (((global.menuText = 1) or (global.menuText = 2)) and (characterSelected1 = 0)){
	// drawing it higher if its the character currently selected
	draw_sprite(characterList[0][7], 0, 320, 546);
} else{
	draw_sprite(characterList[0][7], 0, 320, 576);
}
// 2nd chara
draw_sprite(characterList[1][7], 0, 576, 576);
// 3rd chara
draw_sprite(characterList[2][7], 0, 832, 576);
// enemy - using different sprite than for dialogue so have written it in rather than taking from list
draw_sprite(spr_battle_enemy_example, 0, 640, 320);


// drawing menu when menu mode tm enabled
if (currentState = 1){
	// different menus drawn depending on which bit of selection process and system text we're on
	if (global.menuText = 0){
		// makes box around chcacter currently selected
		if (characterSelected1 = 0){
			// sprites are 144 by 144 pixels
			// colour arguments are for the 4 different quarters, 'true' is that it's an outline, not filled
			draw_rectangle_color(310, 566, (310+164), (566+164), c_yellow, c_aqua, c_fuchsia, c_lime, true);
		} else if (characterSelected1 = 1){
			draw_rectangle_color(566, 566, (566+164), (566+164), c_yellow, c_aqua, c_fuchsia, c_lime, true);
		} else if (characterSelected1 = 2){
			draw_rectangle_color(822, 566, (822+164), (566+164), c_yellow, c_aqua, c_fuchsia, c_lime, true);
		}
	}
}