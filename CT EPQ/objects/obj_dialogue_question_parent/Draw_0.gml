/// @description Insert description here
// You can write your code in this editor

// different as yes-no options need to be drawn

// so dialogue is only drawn if its meant to be
if (showingDialogue == true){
	// default variables to make coding shorter (temporary variables)
	var _textX = 30;
	var _textY = 18;
	var _height = 32;
	var _border = 5;
	var _padding = 16;
	// figuring out height of message
	height = string_height(currentDialogue.message) + 20;
	// adding to height of message to make up for yes-no option (height of 2 lines of text, one empty, one yes-no)
	height += (2*fontHeight);
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
	draw_text_ext(_textX, _textY, currentDialogue.message, 16, (display_get_gui_width() - (_textX+_padding)));
	// drawing yes / no
	draw_text(_textX + 200, _textY + (height - (2*fontHeight + 2*_padding)), "Yes");
	draw_text((display_get_gui_width() - (_textX+_padding)) - 200, _textY + (height - (2*fontHeight + 2*_padding)), "No");
	// drawing circle to show yes / no / in the middle
	draw_set_color(c_yellow);
	if (yesOrNo = 0){
		// if no option selected - x value right in middle, y same as others (same as text then bit below (+10) so its in line, with the way its drawn), radius 10, has an outline
		draw_circle(display_get_gui_width()/2, _textY + (height - (2*fontHeight + 2*_padding)) + 10, 10, true);
	} else if (yesOrNo = 1){
		// if yes, to left, just left of where yes is drawn (-20)
		draw_circle(_textX + 200 - 20, _textY + (height - (2*fontHeight + 2*_padding)) + 10, 10, true);
	} else if (yesOrNo = 2){
		// if no, to right, just left of where no is drawn (-20)
		draw_circle((display_get_gui_width() - (_textX+_padding)) - 200 - 20, _textY + (height - (2*fontHeight + 2*_padding)) + 10, 10, true);
	}
	
	//changing alpha from 0 to 1 over time
	alpha = lerp(alpha, 1, 0.12);
}

draw_set_alpha(1);