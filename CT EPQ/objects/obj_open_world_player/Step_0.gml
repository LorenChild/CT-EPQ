/// @description Insert description here
// You can write your code in this editor

// variables for keys (inputs update each step) - move with WASD
keyLeft = keyboard_check(ord("A")) or keyboard_check(vk_left);
keyRight = keyboard_check(ord("D")) or keyboard_check(vk_right);
keyUp = keyboard_check(ord("W")) or keyboard_check(vk_up);
keyDown = keyboard_check(ord("S")) or keyboard_check(vk_down);
keyEnter = keyboard_check_pressed(vk_enter); // for selecting objects etc

// getting direction (angle) character should be facing and moving
inputDirection = point_direction(0, 0, keyRight-keyLeft, keyDown-keyUp);
// checking if magnitude is't zero aka player should be moving - returns true or false
inputMagnitude = (keyRight-keyLeft != 0) or (keyDown-keyUp != 0);

// movement
// lengthdir_x gives horizontal component of vector from magnitude and direction
hSpeed = lengthdir_x(inputMagnitude*speedWalk, inputDirection);
// same for vertical
vSpeed = lengthdir_y(inputMagnitude*speedWalk, inputDirection);
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