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


// menu text variable - controls which bit of menu selection process and system text we're in
// 0: character select, 1: menu 1 select, 2: menu 2 select, etc w dif charas
// go back and forth with enter and shift
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

// variables for menu system
// first character selected
characterSelected1 = 0;

stateMenu = function()
{
	if (!instance_exists(obj_battle_example_system_text)){
		// creates the object for system text if it doesn't already exist
		instance_create_layer(x, y, "Instances", obj_battle_example_system_text)
	}
	
	// controls - going back and forth - select for forwards, shift for back
	if (keyboard_check_pressed(vk_enter)) global.menuText += 1;
	if (keyboard_check_pressed(vk_shift)) global.menuText -= 1;
	
	// fist bit of menu - select character to take main action
	if (global.menuText = 0){
		if (keyboard_check_pressed(vk_right)) characterSelected1 += 1;
		if (keyboard_check_pressed(vk_left)) characterSelected1 -= 1;
		// since there are only 3 character (variable set to 0, 1 and 2), switching back round to other side it it gets too big or small
		if (characterSelected1 = 3) characterSelected1 = 0;
		if (characterSelected1 = -1) characterSelected1 = 2;
		// see draw for this being show on screen.
	}
	
}
