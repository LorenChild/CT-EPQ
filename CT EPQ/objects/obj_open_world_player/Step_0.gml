/// @description Insert description here
// You can write your code in this editor

// variables for keys (inputs update each step) - move with WASD
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
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