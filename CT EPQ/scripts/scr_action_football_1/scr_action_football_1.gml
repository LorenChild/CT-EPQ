// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_action_football_1(){
	// "Do a little dance" - lowers enemy's attack according to charisma and does small amount of damage
	// AT SOME POINT DO THE ABOVE for now am justs seeing if damage works
	// global.damage defined first in persistent obj and then changed in battle code object
	global.damage = characterList[characterSelected1][3]; // = base attack of character taking main action
}