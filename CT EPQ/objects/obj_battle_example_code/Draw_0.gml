/// @description Insert description here
// You can write your code in this editor

// drawing first character
draw_sprite(characterList[0][7], 0, 320, 576);
// 2nd chara
draw_sprite(characterList[1][7], 0, 576, 576);
// 3rd chara
draw_sprite(characterList[2][7], 0, 832, 576);
// enemy - using different sprite than for dialogue so have written it in rather than taking from list
draw_sprite(spr_battle_enemy_example, 0, 640, 320);