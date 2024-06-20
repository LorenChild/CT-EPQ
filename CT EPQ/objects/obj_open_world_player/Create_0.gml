/// @description Insert description here
// You can write your code in this editor

image_speed = 0; // no animation running for player sprite at start
hSpeed = 0; // horizontal distance moved each step
vSpeed = 0; // vertical distance moved each step
speedWalk = 3.7; // total distance moved each step when moving

// storing sprites as variables - STORED AS VARIABLES SO YOU CAN CHANGE THEM TO BE DIFF SPRITE AT ANY TIME!!
spriteRun = spr_open_world_player_run;
spriteIdle = spr_open_world_player;

localFrame = 0; // frame relative to animation (since we have 4 animations in diff directions)

// variable to decide wether you can move
canMove = true;