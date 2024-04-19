/// @description Insert description here
// You can write your code in this editor

// changing to and from fullscreen
fullscreen = true;

// variable for which battle state we're in
global.battleState = 0;
// varibale for which bit of menu system text we're in in a battle
global.menuText = 0;


// INFO ON CHARACTERS and enemies - later, get it to load info from save file
// order: 0 name, 1 max HP, 2 current HP, 3 base attack, 4 base defence, 
// 5 base charisma, 6 item equipped, 7 character face sprite
// base means stat value before things from items and effects are added
// atk range 0-100, def range 0-100, charisma range 0-100, HP range whatever feels righ
// if item equipped = 0, no item equipped
characterInfoFootball = ["Football", 50, 50, 20, 10, 20, 0, spr_chara_example_1] // character sprite temporary!
characterInfoTemp1 = ["Guy1", 30, 30, 30, 30, 30, 0, spr_chara_example_2]
characterInfoTemp2 = ["Guy2", 30, 30, 30, 30, 30, 0, spr_chara_not_alexia]
enemyInfoExample = ["Ex-ample", 200, 100, 10, 20, 30, 0, spr_chara_example]

// INFO ON ITEMS
