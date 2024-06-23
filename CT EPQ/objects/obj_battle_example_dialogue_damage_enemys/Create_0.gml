/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

// this is dodgy code and will only work for this fight
with (obj_battle_example_code){
	var _charaAttacked = characterList[characterSelected1][0]; // 0 is the character name as a string
	var _enemy = enemyList[0][0];
}
//dialogue.add(spr_blank, "You dealt " + string(global.damage) + " damage against " + _enemy);
dialogue.add(spr_blank, _enemy + " dealt " + string(global.enemyDamage) + " damage against " + _charaAttacked);