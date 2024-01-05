/// @description Insert description here
// You can write your code in this editor
// so dialogue is only drawn if its meant to be
if (showingDialogue == true){
	// default variables to make coding shorter (temporary variables)
	var _textX = 30;
	var _textY = 18;
	var _height = 32;
	var _border = 5;
	var _padding = 16;
	// figuring out height of message
	height = string_height(currentDialogue.message);
	// if text height greater than sprite height sets text height to sprite height
	if (sprite_get_height(currentDialogue.sprite) > height){
		height = sprite_get_height(currentDialogue.sprite);
	}
	// adding padding
	height += _padding*2;
	// working out starting position of text
	_textX = sprite_get_width(currentDialogue.sprite) + (_padding * 2);
	//setting alpha to current alpha
	draw_set_alpha(alpha);
	
	//drawing graphics
	//setting colour to black and drawing rectangle
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), height, false);
	//setting colour to white and drawing border
	draw_set_color(c_white);
	draw_rectangle(_border, _border, display_get_gui_width() - _border, height - _border, false);
	// drawing black rectangle so inside where dialogue displayed is black
	draw_set_colour(c_black);
	draw_rectangle((_border*2), (_border*2), display_get_gui_width() - (_border*2), height - (_border*2), false);

	//drawing sprite
	// checking value doesn't = -ve 1 so system doesn't fail
	if(currentDialogue.sprite != -1){
		// drawing sprite starting top left (with padding)
		draw_sprite(currentDialogue.sprite, 0, _border * 3, _border * 3);
	}
	
	// drawing white text 16 and next bit IS HOW MUCH THERE CAN B BETWEEN TOP AND BOTTOM, and then left and right
	draw_set_color(c_white);
	draw_text_ext(_textX, _textY, currentDialogue.message, 16, display_get_gui_width()-192);
	
	//changing alpha from 0 to 1 over time
	alpha = lerp(alpha, 1, 0.12);
}

draw_set_alpha(1);