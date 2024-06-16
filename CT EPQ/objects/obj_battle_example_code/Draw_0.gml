/// @description Insert description here
// You can write your code in this editor

// drawing health bars
// character 1
hpChara1 = characterList[0][2];
hpMaxChara1 = characterList[0][1];
hpPercentChara1 = hpChara1/hpMaxChara1;
// drawing health bar
healthBarMaxLength = 124; // 20 less than width of sprite so number HP value can be drawn to right
healthBarLength1 = hpPercentChara1 * healthBarMaxLength;
draw_rectangle_color(320-10, 740, (320-10+healthBarLength1), 750, c_red, c_red, c_red, c_red, false);
// drawing number value
draw_text((320-5+healthBarMaxLength), 740-5, string(hpChara1)+"/"+string(hpMaxChara1));
// character 2
hpChara2 = characterList[1][2];
hpMaxChara2 = characterList[1][1];
hpPercentChara2 = hpChara2/hpMaxChara2;
// drawing health bar
healthBarLength2 = hpPercentChara2 * healthBarMaxLength;
draw_rectangle_color(576-10, 740, (576-10+healthBarLength2), 750, c_red, c_red, c_red, c_red, false);
// drawing number value
draw_text((576-5+healthBarMaxLength), 740-5, string(hpChara2)+"/"+string(hpMaxChara2));
// character 3
hpChara3 = characterList[2][2];
hpMaxChara3 = characterList[2][1];
hpPercentChara3 = hpChara3/hpMaxChara3;
// drawing health bar
healthBarLength3 = hpPercentChara3 * healthBarMaxLength;
draw_rectangle_color(832-10, 740, (832-10+healthBarLength3), 750, c_red, c_red, c_red, c_red, false);
// drawing number value
draw_text((832-5+healthBarMaxLength), 740-5, string(hpChara3)+"/"+string(hpMaxChara3));
// enemy
healthBarMaxLengthEnemy = 350;
hpEnemy1 = enemyList[0][2];
hpMaxEnemy1 = enemyList[0][1];
hpPercentEnemy1 = hpEnemy1/hpMaxEnemy1;
// drawing health bar
healthBarLengthEnemy1 = hpPercentEnemy1 * healthBarMaxLengthEnemy;
draw_rectangle_color(640-360/2+5, 320+360/2, (640-360/2+5+healthBarLengthEnemy1), 320+360/2+10, c_red, c_red, c_red, c_red, false);


// drawing first character
if (((global.menuText = 1) or (global.menuText = 2)) and (characterSelected1 = 0)){
	// drawing it higher if its the character currently selected during 2nd and 3rd menu stages
	draw_sprite(characterList[0][7], 0, 320, 546);
} else if (((global.menuText = 4) or (global.menuText = 5)) and (characterSelected2 = 0)){
	// drawing it higher if its the character currently selected during 2nd and 3rd menu stages
	draw_sprite(characterList[0][7], 0, 320, 546);
} else{
	draw_sprite(characterList[0][7], 0, 320, 576);
}
// 2nd chara
if (((global.menuText = 1) or (global.menuText = 2)) and (characterSelected1 = 1)){
	// drawing it higher if its the character currently selected during 2nd and 3rd menu stages
	draw_sprite(characterList[1][7], 0, 576, 546);
} else if (((global.menuText = 4) or (global.menuText = 5)) and (characterSelected2 = 1)){
	// drawing it higher if its the character currently selected during 2nd and 3rd menu stages
	draw_sprite(characterList[1][7], 0, 576, 546);
} else{
	draw_sprite(characterList[1][7], 0, 576, 576);
}
// 3rd chara
if (((global.menuText = 1) or (global.menuText = 2)) and (characterSelected1 = 2)){
	// drawing it higher if its the character currently selected during 2nd and 3rd menu stages
	draw_sprite(characterList[2][7], 0, 832, 546);
} else if (((global.menuText = 4) or (global.menuText = 5)) and (characterSelected2 = 2)){
	// drawing it higher if its the character currently selected during 2nd and 3rd menu stages
	draw_sprite(characterList[2][7], 0, 832, 546);
} else{
	draw_sprite(characterList[2][7], 0, 832, 576);
}
// enemy - using different sprite than for dialogue so have written it in rather than taking from list
draw_sprite(spr_battle_enemy_example, 0, 640, 320);


// drawing menu when menu mode tm enabled
if (currentState = 1){
	// different menus drawn depending on which bit of selection process and system text we're on
	if (global.menuText = 0){
		// makes box around character currently selected
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
	
	// in this stage box and first option menu text needs to appear, and selected text must be coloured
	else if (global.menuText = 1) or (global.menuText = 2){// also 2 so it keeps showing menu but can't change selection in 3rd stage
		// drawing filled in rectange for text to be drawn over
		draw_rectangle_colour(100, 150, 350, 475, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
		// drawing not-filled-in rectange as outline
		draw_rectangle_colour(105, 155, 345, 470, c_aqua, c_aqua, c_aqua, c_aqua, true);
		// drawing text above
		for (var i = 0; i < array_length(global.firstMenu); i += 1){
			// drawing pink if option selected, else drawing white
			if (menuOptionSelected1 = i){
				draw_set_color(c_fuchsia);
			} else{
				draw_set_color(c_white);
			}
			draw_text(135, 175 + (i*30), global.firstMenu[i]);
		}
	}
	
	// wasn't working before because i put else if
	// in this stage box and 2nd option menu text needs to appear, and selected text must be coloured
	if (global.menuText = 2) {
		// drawing filled in rectange for text to be drawn over
		draw_rectangle_colour((1366-100), 150, (1366-350), 475, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
		// drawing not-filled-in rectange as outline
		draw_rectangle_colour((1366-105), 155, (1366-345), 470, c_aqua, c_aqua, c_aqua, c_aqua, true);
		// drawing text above
		for (var i = 0; i < array_length(characterList[characterSelected1][8]); i += 1){
			// drawing pink if option selected, else drawing white
			if (menuOption2Selected1 = i){
				draw_set_color(c_yellow);
			} else{
				draw_set_color(c_white);
			}
			draw_text((1366-325), 175 + (i*30), characterList[characterSelected1][8][i]);
		}
	}
	
	// NOT ADDED TO CODE YET - 12/06/24
	// selecting chacrater n. 2
	if (global.menuText = 3){
		// makes box around character currently selected - appears darker if character selected 2 = character selected 1
		if (characterSelected2 = 0) {
			// sprites are 144 by 144 pixels
			// colour arguments are for the 4 different quarters, 'true' is that it's an outline, not filled
			if (characterSelected1 != 0){
				draw_rectangle_color(310, 566, (310+164), (566+164), c_yellow, c_aqua, c_fuchsia, c_lime, true);
			} else{
				draw_rectangle_color(310, 566, (310+164), (566+164), c_grey, c_grey, c_grey, c_grey, true);
			}
		} else if (characterSelected2 = 1){
			if (characterSelected1 != 1){
				draw_rectangle_color(566, 566, (566+164), (566+164), c_yellow, c_aqua, c_fuchsia, c_lime, true);
			} else{
				draw_rectangle_color(566, 566, (566+164), (566+164), c_grey, c_grey, c_grey, c_grey, true);
			}
		} else if (characterSelected2 = 2){
			if (characterSelected1 != 2){
				draw_rectangle_color(822, 566, (822+164), (566+164), c_yellow, c_aqua, c_fuchsia, c_lime, true);
			} else{
				draw_rectangle_color(822, 566, (822+164), (566+164), c_grey, c_grey, c_grey, c_grey, true);
			}
		}
	}
	
	// COPIED OVER FROM 1 and 2!
	// in this stage box and first option menu text needs to appear, and selected text must be coloured
	else if (global.menuText = 4) or (global.menuText = 5){
		// drawing filled in rectange for text to be drawn over
		draw_rectangle_colour(100, 150, 350, 475, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
		// drawing not-filled-in rectange as outline
		draw_rectangle_colour(105, 155, 345, 470, c_aqua, c_aqua, c_aqua, c_aqua, true);
		// drawing text above
		for (var i = 0; i < array_length(global.firstMenuSupport); i += 1){
			// drawing pink if option selected, else drawing white
			if (menuOptionSelected2 = i){
				draw_set_color(c_fuchsia);
			} else{
				draw_set_color(c_white);
			}
			draw_text(135, 175 + (i*30), global.firstMenuSupport[i]);
		}
	}
	// COPIED OVER FROM 2
	// in this stage box and 2nd option menu text needs to appear, and selected text must be coloured
	if (global.menuText = 5) {
		// drawing filled in rectange for text to be drawn over
		draw_rectangle_colour((1366-100), 150, (1366-350), 475, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
		// drawing not-filled-in rectange as outline
		draw_rectangle_colour((1366-105), 155, (1366-345), 470, c_aqua, c_aqua, c_aqua, c_aqua, true);
		// drawing text above
		for (var i = 0; i < array_length(characterList[characterSelected2][9]); i += 1){
			// drawing pink if option selected, else drawing white
			if (menuOption2Selected2 = i){
				draw_set_color(c_yellow);
			} else{
				draw_set_color(c_white);
			}
			draw_text((1366-325), 175 + (i*30), characterList[characterSelected2][9][i]);
		}
	}
}