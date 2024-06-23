/// @description Insert description here
// You can write your code in this editor

// in draw end so its drawn above everything else
// drawing 'quitting' if escape held for more than a certain length of time
if escapePoints > 50{
	draw_text_transformed_color(1150, 20, "QUITTING...", 2, 2, 0, c_ltgrey, c_ltgrey, c_ltgrey, c_ltgrey, (escapePoints - 40) / 75);
}