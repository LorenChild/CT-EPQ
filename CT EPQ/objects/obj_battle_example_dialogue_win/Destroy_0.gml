/// @description Insert description here
// You can write your code in this editor

// resetting your and the enemy's HP - change later so your HP isn't reset
with obj_battle_example_code{
	for (var i = 0; i < array_length(enemyList); i += 1){
		// enemy's HP - current HP = max HP
		enemyList[i][2] = enemyList[i][1];
	}
	for (var i = 0; i < array_length(characterList); i += 1){
		// your character's HP - current HP = max HP
		characterList[i][2] = characterList[i][1];
	}
}

// so that open world player object displayes win dialogue
global.afterBattleDialogue = 2;
// sends you back to open world room
room_goto(rm_open_world);