/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_right){
	global.menuText += 1;
} else if keyboard_check_pressed(vk_left){
	global.menuText -= 1;
}