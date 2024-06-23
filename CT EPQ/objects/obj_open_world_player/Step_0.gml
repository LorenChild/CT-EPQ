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
}