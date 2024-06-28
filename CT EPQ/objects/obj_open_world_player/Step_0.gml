/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

// displaying after battle dialogue if we're meant to
if (global.afterBattleDialogue = 1){ // if lose
	// setting it so inputs don't work and creating dialogue object
	canMove = false;
	instance_create_layer(10, 10, "dialogue_layer", obj_open_world_dialogue_lose);
	// setting after battle dialogue variable back to not doing it (so only 1 dialogue instance created)
	global.afterBattleDialogue = 0;
	// canMove will be reset when object destroyed
} else if (global.afterBattleDialogue = 2){ //  if win
	// setting it so inputs don't work and creating dialogue object
	canMove = false;
	instance_create_layer(10, 10, "dialogue_layer", obj_open_world_dialogue_win);
	// setting after battle dialogue variable back to not doing it (so only 1 dialogue instance created)
	global.afterBattleDialogue = 0;
	// canMove will be reset when object destroyed
} else if (global.afterBattleDialogue = 3){ //  if you flee
	// setting it so inputs don't work and creating dialogue object
	canMove = false;
	instance_create_layer(10, 10, "dialogue_layer", obj_open_world_dialogue_flee);
	// setting after battle dialogue variable back to not doing it (so only 1 dialogue instance created)
	global.afterBattleDialogue = 0;
	// canMove will be reset when object destroyed
} else if (global.afterBattleDialogue = 4){ //  AFTER FOOTBALL MINIGAME
	// setting it so inputs don't work and creating dialogue object
	canMove = false;
	instance_create_layer(10, 10, "dialogue_layer", obj_open_world_dialogue_football_score);
	// setting after battle dialogue variable back to not doing it (so only 1 dialogue instance created)
	global.afterBattleDialogue = 0;
	// canMove will be reset when object destroyed
}

// variables for keys (inputs update each step) - move with WASD
// only works if canMove variable is true
if canMove = true{
	keyLeft = keyboard_check(ord("A")) or keyboard_check(vk_left);
	keyRight = keyboard_check(ord("D")) or keyboard_check(vk_right);
	keyUp = keyboard_check(ord("W")) or keyboard_check(vk_up);
	keyDown = keyboard_check(ord("S")) or keyboard_check(vk_down);
	keyEnter = keyboard_check_pressed(vk_enter); // for selecting objects etc
} else{
	keyLeft = false;
	keyRight = false;
	keyUp = false;
	keyDown = false;
	keyEnter = false;
}

// getting direction (angle) character should be facing and moving
inputDirection = point_direction(0, 0, keyRight-keyLeft, keyDown-keyUp);
// checking if magnitude is't zero aka player should be moving - returns true or false
inputMagnitude = (keyRight-keyLeft != 0) or (keyDown-keyUp != 0);

// movement
// lengthdir_x gives horizontal component of vector from magnitude and direction
hSpeed = lengthdir_x(inputMagnitude*speedWalk, inputDirection);
// same for vertical
vSpeed = lengthdir_y(inputMagnitude*speedWalk, inputDirection);

// COLLISION (with ONLY barrier object) from my platformer
//horizontal collision
if place_meeting(x + hSpeed, y, obj_open_world_barrier){
	while (abs(hSpeed) > 0.1){
		hSpeed *= 0.5;
		if (!place_meeting(x + hSpeed, y, obj_open_world_barrier)) x += hSpeed;
	}
	hSpeed = 0;
}
// vertical collision
if place_meeting(x, y + vSpeed, obj_open_world_barrier){
	while (abs(vSpeed) > 0.1){
		vSpeed *= 0.5;
		if (!place_meeting(x, y + vSpeed, obj_open_world_barrier)) y += vSpeed;
	}
	vSpeed = 0;
}

// actually moving
x += hSpeed;
y += vSpeed;

// update sprite index
var _oldSprite = sprite_index; // storing current sprite so we can know if it's changed
// turning direction of sprite (only if you start moving in a direction)
if (inputMagnitude != 0){
	direction = inputDirection; //  variable to store direction - because inputDirection resets to zero when there's no input
	// direction variable especially good because it wraps angles aka 400 would = 40
	sprite_index = spr_open_world_player_run; // changing to running sprite based on input (not movement)
} else sprite_index = spriteIdle; // if no input, standing sprite
if (_oldSprite != sprite_index) localFrame = 0; // resetting frame if sprite changed 

// update image index (using script)
scr_player_animate_sprite();

// interacting w objects - use invisible barrier for collision
// making function beacuse code repeated a lot
pressCheck = function(object, dialogueObject){
	// if place meeting and sprite is facing the correct way
	// facing right
	if (place_meeting(x + 5, y, object)) and (round(direction/90) = 0){
		// so you can't move
		canMove = false;
		// creating dialogue object if it doesn't already exist
		if !instance_exists(dialogueObject) instance_create_layer(x, y, "dialogue_layer", dialogueObject);
	} else if (place_meeting(x - 5, y, object)) and (round(direction/90) = 2){
		// facing left
		// so you can't move
		canMove = false;
		// creating dialogue object if it doesn't already exist
		if !instance_exists(dialogueObject) instance_create_layer(x, y, "dialogue_layer", dialogueObject);
	} else if (place_meeting(x, y - 5, object)) and (round(direction/90) = 1){
		// facing up
		// so you can't move
		canMove = false;
		// creating dialogue object if it doesn't already exist
		if !instance_exists(dialogueObject) instance_create_layer(x, y, "dialogue_layer", dialogueObject);
	} else if (place_meeting(x, y + 5, object)) and (round(direction/90) = 3){
		// facing down
		// so you can't move
		canMove = false;
		// creating dialogue object if it doesn't already exist
		if !instance_exists(dialogueObject) instance_create_layer(x, y, "dialogue_layer", dialogueObject);
	}
}

// running fuction for various things if enter pressed
if (keyEnter = true){
	// plant object
	pressCheck(obj_open_world_plant, obj_open_world_dialogue_plant);
	// spider - asks yes no question, then creates further dialogue object depending on answer (they change canMove back when destroyed)
	pressCheck(obj_open_world_spider, obj_open_world_dialogue_question_spider);
	// enemy example - takes you to battle if yes
	pressCheck(obj_open_world_enemy_example, obj_open_world_dialogue_question_enemy_example);
	// football object - to take you to question and if yes, football minigame
	pressCheck(obj_open_world_football, obj_open_world_dialogue_question_football);
	// if egg pressed, opens question of pick it up or no
	pressCheck(obj_open_world_egg, obj_open_world_dialogue_question_egg);
}

// opening and closing inventory if shift pressed
if keyboard_check_pressed(vk_shift){
	// if canMove = true so can only open inventory if dialogue not open
	if (inventoryOpen = 0) and (canMove = true){
		inventoryOpen = 1;
		canMove = false;
	} else if (inventoryOpen = 1){
		inventoryOpen = 0;
		canMove = true;
	} else if (inventoryOpen = 2){
		// going back from character select to item select
		inventoryOpen = 1;
	}
}
// changing inventory selected value
// getting inventory as array (so I can get its length)
var _inventory_item = global.inventory.item_get();

if (inventoryOptionSelected = -10) and (array_length(_inventory_item) > 0){ // so its set back to 0 if another item is picked up
	inventoryOptionSelected = 0;
}

if (inventoryOpen = 1) or (inventoryOpen = 2){ // so you can use up down arrow keys to change item selected even while characters are showing
		
	// so code only runs if player still has at least 1 item
	if (inventoryOptionSelected != -10){
		inventoryInputUp = keyboard_check_pressed(vk_up);
		inventoryInputDown = keyboard_check_pressed(vk_down);
		inventoryInput = inventoryInputDown - inventoryInputUp;
		if inventoryInput > 0{
			inventoryOptionSelected += 1;
		} else if inventoryInput < 0{
			inventoryOptionSelected -= 1;
		}
		// so it wraps round
		if inventoryOptionSelected = -1{
			inventoryOptionSelected = array_length(_inventory_item) - 1;
		} else if inventoryOptionSelected = array_length(_inventory_item){
			inventoryOptionSelected = 0;
		}
	}
}
if (inventoryOpen = 1) and (keyboard_check_pressed(vk_enter)){ // because otherwise would set enterJustPressed to be true every time you press enter when inventoryOpen = 2 as well
	
	// so code only runs if player still has at least 1 item
	if (inventoryOptionSelected != -10){
		inventoryOpen = 2;
		enterJustPressed = true; // so it can't immediately select in next stage
	}
}

if inventoryOpen = 2{
	// item selected state - picking which character to use the item on
	// draw in draw event
	// 3 selectable characters from characterList in create event
	inventoryInputLeft = keyboard_check_pressed(vk_left);
	inventoryInputRight = keyboard_check_pressed(vk_right);
	inventoryInput = inventoryInputRight - inventoryInputLeft;
	if inventoryInput > 0{
		inventoryCharacterSelected += 1;
	} else if inventoryInput < 0{
		inventoryCharacterSelected -= 1;
	}
	// so it wraps round
	if inventoryCharacterSelected = -1{
		inventoryCharacterSelected = (array_length(characterList) - 1);
	} else if inventoryCharacterSelected = array_length(characterList){
		inventoryCharacterSelected = 0;
	}
	// selecting a character
	if keyboard_check_pressed(vk_enter) and enterJustPressed = false{ // to make sure enter is different fromthe enter that made you enter character select menu
		// adding relevant HP to selected character (IF HP NOT ALREADY FULL)
		if (characterList[inventoryCharacterSelected][2] != characterList[inventoryCharacterSelected][1]){
			
			// so code only runs if player still has at least 1 item
			if (inventoryOptionSelected != -10){
				characterList[inventoryCharacterSelected][2] += _inventory_item[inventoryOptionSelected].hpChange;
				// so it doesn't go over max HP - if over, sets to max
				if (characterList[inventoryCharacterSelected][2] > characterList[inventoryCharacterSelected][1]){
					characterList[inventoryCharacterSelected][2] = characterList[inventoryCharacterSelected][1];
				}
				// removing item from inventory - arguments are name and quantity
				global.inventory.item_subtract(_inventory_item[inventoryOptionSelected].name, 1);
				// subtracting 1
				inventoryOptionSelected -=1;
				// if it now = -1, setting it to 0
				if (inventoryOptionSelected = -1) inventoryOptionSelected = 0;
			}
			
			// if no items left
			var _newInventoryItem = global.inventory.item_get(); //  getting current length of inventory
			if (array_length(_newInventoryItem) = 0){
				inventoryOptionSelected = -10; // if variabe = -10 draw code and option select code and adding HP code and select to go to character select code doesn't run
			}
		}
	}
	// resetting enter just pressed variable
	if (enterJustPressed = true) enterJustPressed = false;
}

