/// @description Insert description here
// You can write your code in this editor

// which part of battle are we in? state machine
currentState = 0;

// things only happen with dialogue when its even! odd numbers are holders inbetween
currentDialogueNumber = 0;
// order: 0 name, 1 max HP, 2 current HP, 3 base attack, 4 base defence, 
// 5 base charisma, 6 item equipped, 7 character face sprite, 8 main options, 9 support options
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
// 1st menu option selected for character selected 1
menuOptionSelected1 = 0;
// 2nd menu option selected for character selected 1
menuOption2Selected1 = 0;
//12/06/24
// 1st menu option selected for character selected 2
menuOptionSelected2 = 0;
// 2nd menu option selected for character selected 2
menuOption2Selected2 = 0;

// 2nd character selected
characterSelected2 = 0;

//variable to decide if enter can be pressed
enterAllowed = 1;

stateMenu = function()
{
	if (!instance_exists(obj_battle_example_system_text)){
		// creates the object for system text if it doesn't already exist
		instance_create_layer(x, y, "Instances", obj_battle_example_system_text)
	}
	
	// controls - going back and forth - select for forwards, shift for back
	if (keyboard_check_pressed(vk_enter)) and (enterAllowed = 1) global.menuText += 1;
	if (keyboard_check_pressed(vk_shift)) and (global.menuText>0){
		global.menuText -= 1;
		enterAllowed = 1;
	}
	
	// fist bit of menu - select character to take main action
	if (global.menuText = 0){
		if (keyboard_check_pressed(vk_right)) characterSelected1 += 1;
		if (keyboard_check_pressed(vk_left)) characterSelected1 -= 1;
		// since there are only 3 character (variable set to 0, 1 and 2), switching back round to other side it it gets too big or small
		if (characterSelected1 = 3) characterSelected1 = 0;
		if (characterSelected1 = -1) characterSelected1 = 2;
		// see draw for this being show on screen.
		
		// 12/06/24
		menuOptionSelected1 = 0;
	}
	
	// in second menu bit need to be able to switch between options
	else if (global.menuText = 1){
		if (keyboard_check_pressed(vk_down)) menuOptionSelected1 += 1;
		if (keyboard_check_pressed(vk_up)) menuOptionSelected1 -= 1;
		// since there are only 3 options
		if (menuOptionSelected1 = 3) menuOptionSelected1 = 0;
		if (menuOptionSelected1 = -1) menuOptionSelected1 = 2;
		// see draw for this being show on screen.
		
		// 12/06/24
		menuOption2Selected1 = 0;
		// so you can't select flee or item
		if (menuOptionSelected1 = 1) or (menuOptionSelected1 = 2){
			enterAllowed = 0;
		} else{
			enterAllowed = 1;
		}
	}
	
	// third menu bit! 2nd menu option but for 1st character selected
	else if (global.menuText = 2){
		if (keyboard_check_pressed(vk_down)) menuOption2Selected1 += 1;
		if (keyboard_check_pressed(vk_up)) menuOption2Selected1 -= 1;
		// BASED ON ARRAY LENGTH! switching back round to other side it it gets too big or small
		if (menuOption2Selected1 = array_length(characterList[characterSelected1][8])) menuOption2Selected1 = 0;
		if (menuOption2Selected1 = -1) menuOption2Selected1 = (array_length(characterList[characterSelected1][8]) - 1);
		// see draw for this being show on screen.
		
		// CODE NOT ADDED!!!! 12/06/24
		// 2nd character select - can't be same as first (aka character selected 1)
	} else if (global.menuText = 3){
		if (keyboard_check_pressed(vk_right)) characterSelected2 += 1;
		if (keyboard_check_pressed(vk_left)) characterSelected2 -= 1;
		// since there are only 3 character (variable set to 0, 1 and 2), switching back round to other side it it gets too big or small
		if (characterSelected2 = 3) characterSelected2 = 0;
		if (characterSelected2 = -1) characterSelected2 = 2;
		// see draw for this being show on screen.
		
		// so enter can't be selected when character selected 2 is same as first character selected
		if (characterSelected1 = characterSelected2){
			enterAllowed = 0;
		} else{
			enterAllowed = 1;
		}
		
		menuOptionSelected2 = 0;
	} else if (global.menuText = 4){
		// COPIED OVER FROM 1!
		if (keyboard_check_pressed(vk_down)) menuOptionSelected2 += 1;
		if (keyboard_check_pressed(vk_up)) menuOptionSelected2 -= 1;
		// since there are only 2 options
		if (menuOptionSelected2 = 2) menuOptionSelected2 = 0;
		if (menuOptionSelected2 = -1) menuOptionSelected2 = 1;
		// see draw for this being show on screen.
		
		menuOption2Selected2 = 0;
		// so you can't select item
		if (menuOptionSelected2 = 1){
			enterAllowed = 0;
		} else{
			enterAllowed = 1;
		}
	} else if (global.menuText = 5){
		// COPIED OVER FROM 2
		if (keyboard_check_pressed(vk_down)) menuOption2Selected2 += 1;
		if (keyboard_check_pressed(vk_up)) menuOption2Selected2 -= 1;
		// BASED ON ARRAY LENGTH! switching back round to other side it it gets too big or small
		if (menuOption2Selected2 = array_length(characterList[characterSelected2][9])) menuOption2Selected2 = 0;
		if (menuOption2Selected2 = -1) menuOption2Selected2 = (array_length(characterList[characterSelected2][9]) - 1);
		// see draw for this being show on screen.
	}
}
