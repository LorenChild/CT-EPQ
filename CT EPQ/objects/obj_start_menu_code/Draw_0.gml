/// @description Insert description here
// You can write your code in this editor

// drawing options
// play
if optionSelected = 0{
	draw_set_color(c_yellow);
} else draw_set_color(c_white);
draw_text_transformed(450, 100, "Play", 10, 10, 0);
// quit
if optionSelected = 1{
	draw_set_color(c_yellow);
} else draw_set_color(c_white);
draw_text_transformed(450, 400, "Quit", 10, 10, 0);