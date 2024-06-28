/// @description Insert description here
// You can write your code in this editor

// drawing self
draw_self();

// drawing inventory above
// getting inventory as array (so it can be indexed)
var _inventory_item = global.inventory.item_get();
if (inventoryOpen = 1) or (inventoryOpen = 2){
	// white outline (filled in box, other box drawn above) + black box
	draw_rectangle_color(1070, 460, 1330, 720, c_white, c_white, c_white, c_white, false);
	draw_rectangle_color(1075, 465, 1325, 715, c_black, c_black, c_black, c_black, false);
	// drawing text
	
	// so code only runs if player still has at least 1 item
	if (inventoryOptionSelected != -10){
		for (var i = 0; i < array_length(_inventory_item); i += 1){
			// drawing pink if option selected, else drawing white
			if (inventoryOptionSelected = i){
				draw_set_color(c_fuchsia);
			} else{
				draw_set_color(c_white);
			}
			draw_text(1085, 475 + (i*30), string((_inventory_item[i]).name));
		}
		// drawing description above
		// drawing boxes
		draw_rectangle_color(830, 400, 1330, 450, c_white, c_white, c_white, c_white, false);
		draw_rectangle_color(835, 405, 1325, 445, c_black, c_black, c_black, c_black, false);
		// drawing text
		draw_text_color(845, 415, string(_inventory_item[inventoryOptionSelected].name) + ": " + string(_inventory_item[inventoryOptionSelected].description), c_white, c_white, c_white, c_white, 1);
	} else{ // printing text saying inventory is empty when it is
		draw_text_colour(1085, 475, "(inventory empty)", c_grey, c_grey, c_grey, c_grey, 1);
	}
}

// during character select state drawing characters with health bars + the select box
if inventoryOpen = 2{
	draw_set_color(c_white); // so it defo draws in white
	// drawing healthbars - copied from obj_battle_example_code
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

	// drawing characters - a little section taken from the battle code w lots of stuff cut out
	// drawing first character
	draw_sprite(characterList[0][7], 0, 320, 576);
	// 2nd chara
	draw_sprite(characterList[1][7], 0, 576, 576);
	// 3rd chara
	draw_sprite(characterList[2][7], 0, 832, 576);
	
	// drawing select box - copied from battle code
	// makes box around character currently selected
	if (inventoryCharacterSelected = 0){
	// sprites are 144 by 144 pixels
	// colour arguments are for the 4 different quarters, 'true' is that it's an outline, not filled
		draw_rectangle_color(310, 566, (310+164), (566+164), c_yellow, c_aqua, c_fuchsia, c_lime, true);
	} else if (inventoryCharacterSelected = 1){
		draw_rectangle_color(566, 566, (566+164), (566+164), c_yellow, c_aqua, c_fuchsia, c_lime, true);
	} else if (inventoryCharacterSelected = 2){
		draw_rectangle_color(822, 566, (822+164), (566+164), c_yellow, c_aqua, c_fuchsia, c_lime, true);
	}
}
