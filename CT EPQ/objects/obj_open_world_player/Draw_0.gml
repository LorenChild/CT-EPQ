/// @description Insert description here
// You can write your code in this editor

// drawing self
draw_self();

// drawing inventory above
// getting inventory as array (so it can be indexed)
var _inventory_item = global.inventory.item_get();
if inventoryOpen = true{
	// white outline (filled in box, other box drawn above) + black box
	draw_rectangle_color(1070, 460, 1330, 720, c_white, c_white, c_white, c_white, false);
	draw_rectangle_color(1075, 465, 1325, 715, c_black, c_black, c_black, c_black, false);
	// drawing text
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
}