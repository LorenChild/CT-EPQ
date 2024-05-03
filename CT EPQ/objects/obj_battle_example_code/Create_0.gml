/// @description Insert description here
// You can write your code in this editor

// which part of battle are we in? state machine
currentState = 0;

// ADDED 26th (and all code within the state machines)
// things only happen with dialogue when its even! odd numbers are holders inbetween
currentDialogueNumber = 0;
// order: 0 name, 1 max HP, 2 current HP, 3 base attack, 4 base defence, 
// 5 base charisma, 6 item equipped, 7 character face sprite
// lists of info of chracters and enemies involved in fight
characterList = [global.characterInfoFootball, global.characterInfoTemp1, global.characterInfoTemp2];
enemyList = [global.enemyInfoExample];
global.menuText = 0;

stateDialogue = function()
{
	if (currentDialogueNumber = 0){
		// creates object for first dialogue (when dialogue variable = 0)
		instance_create_layer(x, y, "Instances", obj_battle_example_dialogue_0);
		currentDialogueNumber = 1;
		// after dialogue 0 is destroyed, it sets the state to = 1 (switches to menu mode)
	}
}

stateMenu = function()
{
	if (!instance_exists(obj_battle_example_system_text)){
		// creates the object for system text if it doesn't already exist
		instance_create_layer(x, y, "Instances", obj_battle_example_system_text)
	}
}
