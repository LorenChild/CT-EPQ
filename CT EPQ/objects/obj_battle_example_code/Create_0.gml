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

// vairable for in damage state, tells you which damage dialogue has been displayed
damageDisplayed = 0;


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
		// so you can't select item
		if (menuOptionSelected1 = 1){
			enterAllowed = 0;
		} else{
			enterAllowed = 1;
		}
	}
	
	// third menu bit! 2nd menu option but for 1st character selected
	else if (global.menuText = 2){
		// 23/06/24 CHECKING IF YOU'VE PRESSED FLEE
		if (menuOptionSelected1 = 2){
			global.afterBattleDialogue = 3;
			room_goto(rm_open_world);
		}
		
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
	} else if (global.menuText = 6){
		global.menuText = 0;
		currentState = 2;
	}
}

stateDamage = function()
{
	//(this state would have to be changed to add damage minigames)
	// destroying menu system text
	if (object_exists(obj_battle_example_system_text)){
		instance_destroy(obj_battle_example_system_text);
	}
	// resetting damages to zero just in case
	global.damage = 0;
	global.enemyDamage = 0;
	
	// temp stats (to be edited by support options)
	var _atk = characterList[characterSelected1][3];
	var _def = characterList[characterSelected1][4];
	var _chr = characterList[characterSelected1][5];
	// enemy stats
	var _enemyAtk = enemyList[0][3];
	var _enemyDef = enemyList[0][4];
	var _enemyChr = enemyList[0][5];
	
	// HERE WOULD ADD STUFF FROM EQUIPPED ITEMS - add to temp stats!!
	// HERE ADD STUFF FOR SUPPORT OPTION - first so that temp stats are calculated then edited for this round by support options - (what does it do to you / enemy?)
	
	// calculating enemy damage first so I can edit it later
	global.enemyDamage = (_enemyAtk*15)/_def; //  calc based on enemy atk and your def
	// randomising enemy damage somewhat
	var _randomiser = random_range(-5, 5);
	global.enemyDamage += _randomiser;
	// rounding to nearest whole number
	global.enemyDamage = round(global.enemyDamage);
	
	// maths for your damage - later on, when more options (eg item) added, need to change maybe?
	// diff things happen based on what you selected to do - main action
	// MENU OPTION *2* SELECTED 1
	if (characterSelected1 = 0){
		if (menuOption2Selected1 = 0){
			// 'do a little dance'
			global.damage = _atk*1.5;
			if (global.enemyDamage >= 5){
				global.enemyDamage -= 5;
			} else{
				global.enemyDamage = 0;
			}
			
		} else if (menuOption2Selected1 = 1){
			// 'bounce'
			global.damage = _atk*1.5;
			
		}
	} else if (characterSelected1 = 1){
		if (menuOption2Selected1 = 0){
			// 'cry'
			global.damage = _chr;
			
		} else if (menuOption2Selected1 = 1){
			// 'scream'
			global.damage = _chr*1.5
			global.enemyDamage += 5;
			
		}
	} else if (characterSelected1 = 2){
		if (menuOption2Selected1 = 0){
			// 'existential thoughts'
			global.damage = _atk;
			
		} else if (menuOption2Selected1 = 1){
			// 'stare blankly'
			if (global.enemyDamage >= 10){
				global.enemyDamage -= 10;
			} else{
				global.enemyDamage = 0;
			}
		}
	}
	
	// first bit of damage calculation and being displayed
	if (damageDisplayed = 0){
		// picks only enemy for this battle
		// GETTING RID OF THIS var _tempE = enemyList[0][2] // so correct amount of damage dealt is displayed? (see below)
		enemyList[0][2] -= global.damage;
		// so hp can't be -ve
		if (enemyList[0][2] < 0){
			enemyList[0][2] = 0;
			// GETTING RID OF THIS global.damage = _tempE; // so correct amount of damage dealt is displayed? (at least the first time round)
		}
	
		// sending you to dialogue displaying how much damage you've done
		if (!instance_exists(obj_battle_example_dialogue_damage_yours)){
			currentState = 0; // sends you to state dialogue or HP keeps getting subtracted each step - on destroy sends you back to this state (2), and damageDisplayed is set to 1
			instance_create_layer(x, y, "Instances", obj_battle_example_dialogue_damage_yours);
		}
	}
	
	// 2nd bit - here sends you to win dialogue if you've won, without moving on to other stuff
	if (damageDisplayed = 1){
		if(enemyList[0][2] = 0){
			// creating win dialogue - on destroy sends you to open world
			if (!instance_exists(obj_battle_example_dialogue_win)){
				instance_create_layer(x, y, "Instances", obj_battle_example_dialogue_win);
			}
		} else damageDisplayed = 2;
	}
	
	// 3rd bit - calculating and displaying enemy damage against you if you haven't won
	if (damageDisplayed = 2){
		// subtracting damage (from current HP)
		// GETTING RID OF THIS var _tempC = characterList[characterSelected1][2] // so correct amount of damage dealt is displayed? (see below)
		characterList[characterSelected1][2] -= global.enemyDamage;
		// so hp can't be -ve
		if (characterList[characterSelected1][2] < 0){
			characterList[characterSelected1][2] = 0;
			// GETTING RID OF THIS global.enemyDamage = _tempC; // so correct amount of damage dealt is displayed? (at least the first time round)
		}
		
		// sending you to dialogue displaying how much damage enemy has done
		if (!instance_exists(obj_battle_example_dialogue_damage_enemys)){
			currentState = 0; // sends you to state dialogue or HP keeps getting subtracted each step - on destroy sends you back to this state (2), and damageDisplayed is set to 3
			instance_create_layer(x, y, "Instances", obj_battle_example_dialogue_damage_enemys);
		}
	}
	
	// 3rd bit - here sends you to lose dialogue if you've lost, without moving on to other stuff (back to start)
	if (damageDisplayed = 3){
		if (characterList[characterSelected1][2] = 0){
			// creating lose dialogue - on destroy sends you to open world
			if (!instance_exists(obj_battle_example_dialogue_lose)){
				instance_create_layer(x, y, "Instances", obj_battle_example_dialogue_lose);
			}
		} else {
			// resetting damage displayed to 0 and sending you back to menu state
			damageDisplayed = 0;
			currentState = 1;
		}
	}
	
}