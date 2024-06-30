/// @description Insert description here
// You can write your code in this editor

// drawing options
// play
if optionSelected = 0{
	draw_set_color(c_yellow);
} else draw_set_color(c_white);
draw_text_transformed(450, 100, "Play", 7, 7, 0);
// controls explained room
if optionSelected = 1{
	draw_set_color(c_yellow);
} else draw_set_color(c_white);
draw_text_transformed(450, 300, "Controls", 7, 7, 0);
// quit
if optionSelected = 2{
	draw_set_color(c_yellow);
} else draw_set_color(c_white);
draw_text_transformed(450, 500, "Quit", 7, 7, 0);